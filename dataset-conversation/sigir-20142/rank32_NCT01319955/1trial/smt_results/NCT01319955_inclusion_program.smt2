;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_is_de_jure_resident Bool) ;; "To be included, the patient must be a de jure resident." {"when_to_set_to_true":"Set to true if the patient is a de jure resident.","when_to_set_to_false":"Set to false if the patient is not a de jure resident.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a de jure resident.","meaning":"Boolean indicating whether the patient is a de jure resident."}

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_is_de_jure_resident
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be a de jure resident."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; "6 months old at the time of first dose vaccination OR 7 months old at the time of first dose vaccination OR 8 months old at the time of first dose vaccination OR 9 months old at the time of first dose vaccination OR 10 months old at the time of first dose vaccination OR 11 months old at the time of first dose vaccination OR 12 months old at the time of first dose vaccination OR 13 months old at the time of first dose vaccination OR 14 months old at the time of first dose vaccination OR 15 months old at the time of first dose vaccination OR 16 months old at the time of first dose vaccination OR 17 months old at the time of first dose vaccination OR 18 months old at the time of first dose vaccination OR 19 months old at the time of first dose vaccination OR 20 months old at the time of first dose vaccination OR 21 months old at the time of first dose vaccination OR 22 months old at the time of first dose vaccination OR 23 months old at the time of first dose vaccination" {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."}

(declare-const patient_has_undergone_active_immunization_now Bool) ;; "vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now.","when_to_set_to_false":"Set to false if the patient has not undergone active immunization (vaccination) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone active immunization (vaccination) now.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now."}

(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_6_months_old Bool) ;; "6 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 6 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 6 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 6 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 6 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_7_months_old Bool) ;; "7 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 7 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 7 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 7 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 7 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_8_months_old Bool) ;; "8 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 8 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 8 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 8 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 8 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_9_months_old Bool) ;; "9 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 9 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 9 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 9 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 9 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_10_months_old Bool) ;; "10 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 10 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 10 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 10 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 10 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_11_months_old Bool) ;; "11 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 11 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 11 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 11 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 11 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_12_months_old Bool) ;; "12 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 12 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 12 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 12 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 12 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_13_months_old Bool) ;; "13 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 13 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 13 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 13 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 13 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_14_months_old Bool) ;; "14 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 14 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 14 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 14 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 14 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_15_months_old Bool) ;; "15 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 15 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 15 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 15 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 15 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_16_months_old Bool) ;; "16 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 16 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 16 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 16 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 16 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_17_months_old Bool) ;; "17 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 17 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 17 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 17 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 17 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_18_months_old Bool) ;; "18 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 18 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 18 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 18 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 18 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_19_months_old Bool) ;; "19 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 19 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 19 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 19 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 19 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_20_months_old Bool) ;; "20 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 20 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 20 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 20 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 20 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_21_months_old Bool) ;; "21 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 21 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 21 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 21 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 21 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_22_months_old Bool) ;; "22 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 22 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 22 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 22 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 22 months old."}
(declare-const patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_23_months_old Bool) ;; "23 months old at the time of first dose vaccination" {"when_to_set_to_true":"Set to true if the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 23 months old.","when_to_set_to_false":"Set to false if the patient has undergone active immunization (vaccination) now but the procedure did not occur at the time of first dose when the patient was 23 months old.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurred at the time of first dose when the patient was 23 months old.","meaning":"Boolean indicating whether the patient has undergone active immunization (vaccination) now and the procedure occurred at the time of first dose when the patient was 23 months old."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Each qualifier variable implies the patient has undergone active immunization (vaccination) now
(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_6_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY0)) ;; "6 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_7_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY1)) ;; "7 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_8_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY2)) ;; "8 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_9_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY3)) ;; "9 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_10_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY4)) ;; "10 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_11_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY5)) ;; "11 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_12_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY6)) ;; "12 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_13_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY7)) ;; "13 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_14_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY8)) ;; "14 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_15_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY9)) ;; "15 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_16_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY10)) ;; "16 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_17_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY11)) ;; "17 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_18_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY12)) ;; "18 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_19_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY13)) ;; "19 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_20_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY14)) ;; "20 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_21_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY15)) ;; "21 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_22_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY16)) ;; "22 months old at the time of first dose vaccination"

(assert
  (! (=> patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_23_months_old
         patient_has_undergone_active_immunization_now)
     :named REQ1_AUXILIARY17)) ;; "23 months old at the time of first dose vaccination"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have received the first dose of vaccination at an age between 6 and 23 months (inclusive)
(assert
  (! (or patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_6_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_7_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_8_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_9_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_10_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_11_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_12_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_13_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_14_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_15_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_16_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_17_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_18_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_19_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_20_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_21_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_22_months_old
         patient_has_undergone_active_immunization_now@@at_time_of_first_dose_when_patient_is_23_months_old)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be ((6 months old at the time of first dose vaccination) OR ... OR (23 months old at the time of first dose vaccination))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_resides_in_household_under_surveillance_now Bool) ;; "To be included, the patient must reside in a household under surveillance." {"when_to_set_to_true":"Set to true if the patient currently resides in a household that is under surveillance.","when_to_set_to_false":"Set to false if the patient currently does not reside in a household that is under surveillance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides in a household under surveillance.","meaning":"Boolean indicating whether the patient currently resides in a household that is under surveillance."}

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_resides_in_household_under_surveillance_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must reside in a household under surveillance."
