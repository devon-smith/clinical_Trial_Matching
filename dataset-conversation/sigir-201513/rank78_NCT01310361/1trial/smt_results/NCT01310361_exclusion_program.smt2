;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than 6 years old OR the patient is older than 15 years old"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (< patient_age_value_recorded_now_in_years 6))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is younger than 6 years old."

(assert
(! (not (> patient_age_value_recorded_now_in_years 15))
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is older than 15 years old."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_clinical_signs_of_pharyngitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of pharyngitis.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of pharyngitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of pharyngitis.","meaning":"Boolean indicating whether the patient currently has clinical signs of pharyngitis."} ;; "pharyngitis"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_clinical_signs_of_pharyngitis_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient does NOT have signs of pharyngitis in the clinical examination."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const antibiotics_use_count_in_7_days_before_screening Real) ;; {"when_to_set_to_value":"Set to the number of times antibiotics were used by the patient during the 7 days before the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times antibiotics were used during the 7 days before the screening visit.","meaning":"Numeric value indicating the number of times antibiotics were used by the patient during the 7 days before the screening visit."} ;; "used antibiotics during the 7 days before screening"
(declare-const patient_has_used_antibiotics_in_7_days_before_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any antibiotics during the 7 days before the screening visit.","when_to_set_to_false":"Set to false if the patient has not used any antibiotics during the 7 days before the screening visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used antibiotics during the 7 days before the screening visit.","meaning":"Boolean indicating whether the patient has used antibiotics during the 7 days before the screening visit."} ;; "used antibiotics during the 7 days before screening"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Link boolean and numeric variable: any use implies boolean true
(assert
(! (= patient_has_used_antibiotics_in_7_days_before_screening
    (> antibiotics_use_count_in_7_days_before_screening 0))
:named REQ2_AUXILIARY0)) ;; "used antibiotics during the 7 days before screening"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_used_antibiotics_in_7_days_before_screening)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient used antibiotics during the 7 days before screening."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_throat_culture_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a throat culture at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a throat culture at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a throat culture.","meaning":"Boolean indicating whether the patient has ever undergone a throat culture in their history."} ;; "throat culture"
(declare-const patient_has_undergone_throat_culture_inthehistory@@performed_before_initiation_of_drug_administration Bool) ;; {"when_to_set_to_true":"Set to true if the patient's throat culture was performed before the initiation of drug administration.","when_to_set_to_false":"Set to false if the patient's throat culture was not performed before the initiation of drug administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the throat culture was performed before drug administration.","meaning":"Boolean indicating whether the patient's throat culture was performed before the initiation of drug administration."} ;; "throat culture performed before the initiation of drug administration"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_throat_culture_inthehistory@@performed_before_initiation_of_drug_administration
      patient_has_undergone_throat_culture_inthehistory)
:named REQ3_AUXILIARY0)) ;; "throat culture performed before the initiation of drug administration" implies "throat culture"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_throat_culture_inthehistory@@performed_before_initiation_of_drug_administration)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient did NOT have a throat culture performed before the initiation of drug administration."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_throat_swab_culture_negative_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a negative throat swab culture result.","when_to_set_to_false":"Set to false if the patient currently does not have a negative throat swab culture result.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a negative throat swab culture result.","meaning":"Boolean indicating whether the patient currently has a negative throat swab culture result."} ;; "negative throat culture"
(declare-const patient_has_undergone_throat_culture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a throat culture now.","when_to_set_to_false":"Set to false if the patient has not undergone a throat culture now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a throat culture now.","meaning":"Boolean indicating whether the patient has undergone a throat culture now."} ;; "throat culture"
(declare-const patient_has_undergone_throat_culture_now@@indicates_microorganism_other_than_group_a_beta_hemolytic_streptococcus Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a throat culture now and the result indicates a microorganism other than Group A β-hemolytic Streptococcus.","when_to_set_to_false":"Set to false if the patient has undergone a throat culture now and the result does not indicate a microorganism other than Group A β-hemolytic Streptococcus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the throat culture result indicates a microorganism other than Group A β-hemolytic Streptococcus.","meaning":"Boolean indicating whether the patient's throat culture result indicates a microorganism other than Group A β-hemolytic Streptococcus."} ;; "throat culture indicating a microorganism other than Group A β-hemolytic Streptococcus"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_throat_culture_now@@indicates_microorganism_other_than_group_a_beta_hemolytic_streptococcus
      patient_has_undergone_throat_culture_now)
   :named REQ4_AUXILIARY0)) ;; "throat culture indicating a microorganism other than Group A β-hemolytic Streptococcus"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_throat_swab_culture_negative_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a negative throat culture."

(assert
(! (not patient_has_undergone_throat_culture_now@@indicates_microorganism_other_than_group_a_beta_hemolytic_streptococcus)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a throat culture indicating a microorganism other than Group A β-hemolytic Streptococcus."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allergy_to_penicillin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented allergy to penicillin at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented allergy to penicillin at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had allergy to penicillin.","meaning":"Boolean indicating whether the patient has ever had allergy to penicillin in their history."} ;; "history of allergy to penicillin"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_has_finding_of_allergy_to_penicillin_inthehistory)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy to penicillin."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@context_of_having_second_culture_performed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to any drug or medicament occurred specifically in the context of having the second culture performed.","when_to_set_to_false":"Set to false if the patient's exposure to any drug or medicament did not occur in the context of having the second culture performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure to any drug or medicament occurred in the context of having the second culture performed.","meaning":"Boolean indicating whether the patient's exposure to any drug or medicament occurred in the context of having the second culture performed."} ;; "did NOT use drugs in the context of having the second culture performed"
(declare-const patient_has_followed_treatment_now@@context_of_having_second_culture_performed Bool) ;; {"when_to_set_to_true":"Set to true if the patient has followed the treatment specifically in the context of having the second culture performed.","when_to_set_to_false":"Set to false if the patient has not followed the treatment in the context of having the second culture performed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has followed the treatment in the context of having the second culture performed.","meaning":"Boolean indicating whether the patient has followed the treatment specifically in the context of having the second culture performed."} ;; "did NOT follow the treatment in the context of having the second culture performed"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for drug exposure
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@context_of_having_second_culture_performed
      patient_is_exposed_to_drug_or_medicament_now)
    :named REQ6_AUXILIARY0)) ;; "drugs in the context of having the second culture performed"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: If the patient did NOT use drugs OR did NOT follow the treatment in the context of having the second culture performed, the patient is excluded.
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_now@@context_of_having_second_culture_performed
             patient_has_followed_treatment_now@@context_of_having_second_culture_performed))
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient did NOT use drugs in the context of having the second culture performed) OR (the patient did NOT follow the treatment in the context of having the second culture performed))."
