;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_alcohol_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has alcohol dependence.","when_to_set_to_false":"Set to false if the patient currently does not have alcohol dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has alcohol dependence.","meaning":"Boolean indicating whether the patient currently has alcohol dependence."} ;; "alcohol dependence"
(declare-const patient_has_finding_of_psychoactive_substance_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has psychoactive substance dependence.","when_to_set_to_false":"Set to false if the patient currently does not have psychoactive substance dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has psychoactive substance dependence.","meaning":"Boolean indicating whether the patient currently has psychoactive substance dependence."} ;; "drug dependence"
(declare-const patient_has_finding_of_psychoactive_substance_dependence_now@@not_alcohol_dependence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current psychoactive substance dependence is not alcohol dependence.","when_to_set_to_false":"Set to false if the patient's current psychoactive substance dependence is alcohol dependence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current psychoactive substance dependence is not alcohol dependence.","meaning":"Boolean indicating whether the patient's current psychoactive substance dependence is not alcohol dependence."} ;; "any other active drug dependence"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_psychoactive_substance_dependence_now@@not_alcohol_dependence
      patient_has_finding_of_psychoactive_substance_dependence_now)
:named REQ0_AUXILIARY0)) ;; "any other active drug dependence" is a subset of "psychoactive substance dependence"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have BOTH (any other active drug dependence) AND (alcohol dependence)
(assert
(! (not (and patient_has_finding_of_psychoactive_substance_dependence_now@@not_alcohol_dependence
             patient_has_finding_of_alcohol_dependence_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (any other active drug dependence) AND (alcohol dependence)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding relating to alcohol drinking behavior (i.e., currently uses alcohol).","when_to_set_to_false":"Set to false if the patient currently does not have a finding relating to alcohol drinking behavior (i.e., does not use alcohol).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding relating to alcohol drinking behavior.","meaning":"Boolean indicating whether the patient currently has a finding relating to alcohol drinking behavior."} ;; "alcohol use"
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@unwilling_to_forgo_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to forgo alcohol use for the duration of the study.","when_to_set_to_false":"Set to false if the patient is willing to forgo alcohol use for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to forgo alcohol use for the duration of the study.","meaning":"Boolean indicating whether the patient is unwilling to forgo alcohol use for the duration of the study."} ;; "unwilling to forgo alcohol use for the duration of the study"
(declare-const patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@unable_to_forgo_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to forgo alcohol use for the duration of the study.","when_to_set_to_false":"Set to false if the patient is able to forgo alcohol use for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to forgo alcohol use for the duration of the study.","meaning":"Boolean indicating whether the patient is unable to forgo alcohol use for the duration of the study."} ;; "unable to forgo alcohol use for the duration of the study"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@unwilling_to_forgo_for_study_duration
      patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now)
:named REQ1_AUXILIARY0)) ;; "unwilling to forgo alcohol use for the duration of the study"

(assert
(! (=> patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@unable_to_forgo_for_study_duration
      patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now)
:named REQ1_AUXILIARY1)) ;; "unable to forgo alcohol use for the duration of the study"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@unwilling_to_forgo_for_study_duration
            patient_has_finding_of_finding_relating_to_alcohol_drinking_behavior_now@@unable_to_forgo_for_study_duration))
:named REQ1_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient is unwilling to forgo alcohol use for the duration of the study) OR (the patient is unable to forgo alcohol use for the duration of the study)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_taking_baclofen_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking (using) any baclofen-containing product at the time of study enrollment.","when_to_set_to_false":"Set to false if the patient is not currently taking any baclofen-containing product at the time of study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any baclofen-containing product at the time of study enrollment.","meaning":"Boolean indicating whether the patient is currently taking any baclofen-containing product."} ;; "baclofen"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_taking_baclofen_containing_product_now)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is using baclofen at the time of study enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_taking_benzodiazepine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking any benzodiazepine-containing product at the time of study enrollment, regardless of indication.","when_to_set_to_false":"Set to false if the patient is not currently taking any benzodiazepine-containing product at the time of study enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking any benzodiazepine-containing product at the time of study enrollment.","meaning":"Boolean indicating whether the patient is currently taking any benzodiazepine-containing product at the time of study enrollment."} ;; "benzodiazepine medications"
(declare-const patient_is_taking_benzodiazepine_containing_product_now@@indication_is_not_acute_alcohol_withdrawal_syndrome Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a benzodiazepine-containing product at the time of study enrollment and the indication for use is not acute alcohol withdrawal syndrome.","when_to_set_to_false":"Set to false if the patient is currently taking a benzodiazepine-containing product at the time of study enrollment and the indication for use is acute alcohol withdrawal syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the indication for benzodiazepine use is acute alcohol withdrawal syndrome.","meaning":"Boolean indicating that the indication for current benzodiazepine-containing product use at the time of study enrollment is not acute alcohol withdrawal syndrome."} ;; "for any reason other than acute alcohol withdrawal syndrome"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_taking_benzodiazepine_containing_product_now@@indication_is_not_acute_alcohol_withdrawal_syndrome
      patient_is_taking_benzodiazepine_containing_product_now)
:named REQ3_AUXILIARY0)) ;; "among patients currently taking a benzodiazepine-containing product at the time of study enrollment, the indication for use is not acute alcohol withdrawal syndrome"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_taking_benzodiazepine_containing_product_now@@indication_is_not_acute_alcohol_withdrawal_syndrome)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is using benzodiazepine medications for any reason other than acute alcohol withdrawal syndrome at the time of study enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergy_to_baclofen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy or sensitivity to baclofen.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy or sensitivity to baclofen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy or sensitivity to baclofen.","meaning":"Boolean indicating whether the patient currently has an allergy or sensitivity to baclofen."} ;; "baclofen sensitivity"
(declare-const patient_has_finding_of_allergy_to_baclofen_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy or sensitivity to baclofen is known (i.e., documented or established).","when_to_set_to_false":"Set to false if the patient's allergy or sensitivity to baclofen is not known (i.e., not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergy or sensitivity to baclofen is known.","meaning":"Boolean indicating whether the patient's allergy or sensitivity to baclofen is known."} ;; "known baclofen sensitivity"
(declare-const patient_has_finding_of_allergy_to_benzodiazepine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergy or sensitivity to benzodiazepines.","when_to_set_to_false":"Set to false if the patient currently does not have an allergy or sensitivity to benzodiazepines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy or sensitivity to benzodiazepines.","meaning":"Boolean indicating whether the patient currently has an allergy or sensitivity to benzodiazepines."} ;; "benzodiazepine sensitivity"
(declare-const patient_has_finding_of_allergy_to_benzodiazepine_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy or sensitivity to benzodiazepines is known (i.e., documented or established).","when_to_set_to_false":"Set to false if the patient's allergy or sensitivity to benzodiazepines is not known (i.e., not documented or not established).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's allergy or sensitivity to benzodiazepines is known.","meaning":"Boolean indicating whether the patient's allergy or sensitivity to benzodiazepines is known."} ;; "known benzodiazepine sensitivity"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_baclofen_now@@known
       patient_has_finding_of_allergy_to_baclofen_now)
   :named REQ4_AUXILIARY0)) ;; "known baclofen sensitivity"

(assert
(! (=> patient_has_finding_of_allergy_to_benzodiazepine_now@@known
       patient_has_finding_of_allergy_to_benzodiazepine_now)
   :named REQ4_AUXILIARY1)) ;; "known benzodiazepine sensitivity"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergy_to_baclofen_now@@known)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known baclofen sensitivity."

(assert
(! (not patient_has_finding_of_allergy_to_benzodiazepine_now@@known)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known benzodiazepine sensitivity."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (i.e., able to take) any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (i.e., unable to take) any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to (able to take) any drug or medicament."} ;; "medications"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@route_oral Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to drug or medicament is specifically via the oral route.","when_to_set_to_false":"Set to false if the patient's exposure to drug or medicament is not via the oral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route of administration is oral.","meaning":"Boolean indicating whether the patient's exposure to drug or medicament is via the oral route."} ;; "oral medications"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for oral route implies general exposure to drug or medicament
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_now@@route_oral
       patient_is_exposed_to_drug_or_medicament_now)
   :named REQ5_AUXILIARY0)) ;; "oral medications" implies "medications"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_drug_or_medicament_now@@route_oral)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to take oral medications."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_able_to_complete_consenting_procedure_1 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to complete the first consenting procedure.","when_to_set_to_false":"Set to false if the patient is unable to complete the first consenting procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to complete the first consenting procedure.","meaning":"Boolean indicating whether the patient is able to complete the first consenting procedure."} ;; "able to complete the first consenting procedure"
(declare-const patient_is_able_to_complete_consenting_procedure_2 Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to complete the second consenting procedure.","when_to_set_to_false":"Set to false if the patient is unable to complete the second consenting procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to complete the second consenting procedure.","meaning":"Boolean indicating whether the patient is able to complete the second consenting procedure."} ;; "able to complete the second consenting procedure"
(declare-const patient_is_unable_to_complete_either_of_the_two_consenting_procedures Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to complete at least one of the two consenting procedures.","when_to_set_to_false":"Set to false if the patient is able to complete both consenting procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to complete both consenting procedures.","meaning":"Boolean indicating whether the patient is unable to complete at least one of the two required consenting procedures."} ;; "unable to complete either of the two consenting procedures"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: unable to complete either = unable to complete at least one
(assert
(! (= patient_is_unable_to_complete_either_of_the_two_consenting_procedures
     (or (not patient_is_able_to_complete_consenting_procedure_1)
         (not patient_is_able_to_complete_consenting_procedure_2)))
:named REQ6_AUXILIARY0)) ;; "unable to complete either of the two consenting procedures"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_unable_to_complete_either_of_the_two_consenting_procedures)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to complete either of the two consenting procedures."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breastfeeding"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Link alternate breastfeeding variable to main variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ7_AUXILIARY0)) ;; "breastfeeding"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
(assert
(! (not patient_is_breastfeeding_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's serum creatinine level is recorded now in milligrams per deciliter.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine level in milligrams per deciliter."} ;; "serum creatinine level greater than 2.0 milligrams per deciliter"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_milligrams_per_deciliter 2.0))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serum creatinine level greater than 2.0 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_history_of_non_alcoholic_withdrawal_seizures Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of non-alcoholic withdrawal seizures at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented history of non-alcoholic withdrawal seizures at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of non-alcoholic withdrawal seizures.","meaning":"Boolean indicating whether the patient has a history of non-alcoholic withdrawal seizures."} ;; "The patient is excluded if the patient has a history of non-alcoholic withdrawal seizures."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! (not patient_has_history_of_non_alcoholic_withdrawal_seizures)
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of non-alcoholic withdrawal seizures."
