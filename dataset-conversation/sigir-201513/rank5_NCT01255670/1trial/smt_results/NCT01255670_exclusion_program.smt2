;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to penicillin at any time in the past.","when_to_set_to_false":"Set to false if the patient has no documented history of allergy to penicillin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to penicillin.","meaning":"Boolean indicating whether the patient has ever had an allergy to penicillin documented in their medical history."} ;; "allergy to penicillin"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_penicillin_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to penicillin."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergy_to_metronidazole_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of allergy to metronidazole.","when_to_set_to_false":"Set to false if the patient does not have a documented history of allergy to metronidazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of allergy to metronidazole.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergy to metronidazole documented in their history."} ;; "allergy to metronidazole"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_metronidazole_inthehistory)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to metronidazole."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_used_metronidazole_within_preceding_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used metronidazole at any time within the preceding one month.","when_to_set_to_false":"Set to false if the patient has not used metronidazole within the preceding one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used metronidazole within the preceding one month.","meaning":"Boolean indicating whether the patient has used metronidazole within the preceding one month."} ;; "has used metronidazole within the preceding one month"

(declare-const patient_is_taking_metronidazole_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any product containing metronidazole.","when_to_set_to_false":"Set to false if the patient is not currently taking any product containing metronidazole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any product containing metronidazole.","meaning":"Boolean indicating whether the patient is currently taking any product containing metronidazole."} ;; "metronidazole"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_used_metronidazole_within_preceding_1_month)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used metronidazole within the preceding one month."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breast-feeding.","when_to_set_to_false":"Set to false if the patient is currently not breast-feeding.","when_to_set_to_null":"Set to null if the patient's current breast-feeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breast-feeding."} ;; "the patient is breast-feeding"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast-feeding."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_renal_insufficiency_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic failure (liver insufficiency).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic failure (liver insufficiency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure (liver insufficiency).","meaning":"Boolean indicating whether the patient currently has hepatic failure (liver insufficiency)."} ;; "liver insufficiency"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_hepatic_failure_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver insufficiency."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_alcohol_consumption_frequency_value_recorded_now_withunit_per_week Real) ;; {"when_to_set_to_value":"Set to the number of times per week the patient currently consumes alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times per week the patient currently consumes alcohol.","meaning":"Numeric value representing the frequency per week of the patient's current alcohol consumption."} ;; "the patient drinks alcohol at least once per week"

(declare-const patient_has_finding_of_alcoholism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding or diagnosis of alcoholism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding or diagnosis of alcoholism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcoholism.","meaning":"Boolean indicating whether the patient currently has alcoholism."} ;; "alcoholism"

(declare-const patient_is_exposed_to_alcohol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to alcohol (e.g., drinks alcohol now).","when_to_set_to_false":"Set to false if the patient is currently not exposed to alcohol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to alcohol.","meaning":"Boolean indicating whether the patient is currently exposed to alcohol."} ;; "drinks alcohol"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Definition: Alcoholism (per requirement) = drinks alcohol at least once per week
(assert
(! (= patient_has_finding_of_alcoholism_now
     (>= patient_alcohol_consumption_frequency_value_recorded_now_withunit_per_week 1))
:named REQ7_AUXILIARY0)) ;; "alcoholism (the patient drinks alcohol at least once per week)"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_alcoholism_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has alcoholism (the patient drinks alcohol at least once per week)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_undergoing_enrollment_in_clinical_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in (enrolled in and actively involved with) another clinical trial.","when_to_set_to_false":"Set to false if the patient is not currently participating in another clinical trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another clinical trial.","meaning":"Boolean indicating whether the patient is currently participating in another clinical trial."} ;; "participating in another clinical trial at the moment"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_undergoing_enrollment_in_clinical_trial_now)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is participating in another clinical trial at the moment."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_peritonsillar_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peritonsillar abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of peritonsillar abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of peritonsillar abscess.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peritonsillar abscess."} ;; "peritonsillar abscess"
(declare-const patient_has_diagnosis_of_peritonsillar_abscess_now@@treatment_requires_in_patient_care Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peritonsillar abscess and the treatment for this condition requires in-patient care.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of peritonsillar abscess but the treatment does not require in-patient care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the treatment of peritonsillar abscess requires in-patient care.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peritonsillar abscess and the treatment for this condition requires in-patient care."} ;; "the treatment of peritonsillar abscess of the patient requires in-patient care"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_peritonsillar_abscess_now@@treatment_requires_in_patient_care
       patient_has_diagnosis_of_peritonsillar_abscess_now)
   :named REQ9_AUXILIARY0)) ;; "the treatment of peritonsillar abscess of the patient requires in-patient care"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_peritonsillar_abscess_now@@treatment_requires_in_patient_care)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the treatment of peritonsillar abscess of the patient requires in-patient care."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_will_undergo_tonsillectomy_inthefuture30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled or planned to undergo tonsillectomy at any time within the next 30 days from now.","when_to_set_to_false":"Set to false if the patient is not scheduled or planned to undergo tonsillectomy within the next 30 days from now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo tonsillectomy within the next 30 days.","meaning":"Boolean indicating whether the patient will undergo tonsillectomy within the next 30 days."} ;; "tonsillectomy within the next thirty days"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_will_undergo_tonsillectomy_inthefuture30days)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient will undergo tonsillectomy within the next thirty days."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_army_recruit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an army recruit.","when_to_set_to_false":"Set to false if the patient is currently not an army recruit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an army recruit.","meaning":"Boolean indicating whether the patient is currently an army recruit."} ;; "The patient is excluded if the patient is an army recruit."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_army_recruit_now)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is an army recruit."
