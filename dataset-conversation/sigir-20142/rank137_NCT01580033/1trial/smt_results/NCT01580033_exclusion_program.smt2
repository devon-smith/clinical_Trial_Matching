;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_meningitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with meningitis at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with meningitis in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with meningitis.","meaning":"Boolean indicating whether the patient has ever been diagnosed with meningitis in their medical history."} ;; "has a medical history of meningitis."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_meningitis_inthehistory)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical history of meningitis."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergic_disposition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of allergic disposition at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of allergic disposition at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of allergic disposition.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of allergic disposition."} ;; "a medical history of allergies"
(declare-const patient_has_finding_of_seizure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of seizure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of seizure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of seizure.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of seizure."} ;; "a medical history of seizures"
(declare-const patient_has_finding_of_epilepsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of epilepsy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of epilepsy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of epilepsy.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of epilepsy."} ;; "a medical history of epilepsy"
(declare-const patient_has_finding_of_encephalopathy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of encephalopathy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of encephalopathy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of encephalopathy.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of encephalopathy."} ;; "a medical history of encephalopathy"
(declare-const patient_has_finding_of_similar_conditions_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of similar conditions (such as but not limited to allergies, seizures, epilepsy, encephalopathy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of similar conditions (such as but not limited to allergies, seizures, epilepsy, encephalopathy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of similar conditions (such as but not limited to allergies, seizures, epilepsy, encephalopathy).","meaning":"Boolean indicating whether the patient has ever had a clinical finding of similar conditions (such as but not limited to allergies, seizures, epilepsy, encephalopathy)."} ;; "a medical history of similar conditions with non-exhaustive examples (allergies, seizures, epilepsy, encephalopathy)"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_allergic_disposition_inthehistory
          patient_has_finding_of_seizure_inthehistory
          patient_has_finding_of_epilepsy_inthehistory
          patient_has_finding_of_encephalopathy_inthehistory)
    patient_has_finding_of_similar_conditions_inthehistory)
:named REQ1_AUXILIARY0)) ;; "a medical history of similar conditions with non-exhaustive examples (allergies, seizures, epilepsy, encephalopathy)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergic_disposition_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical history of allergies."

(assert
(! (not patient_has_finding_of_seizure_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical history of seizures."

(assert
(! (not patient_has_finding_of_epilepsy_inthehistory)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical history of epilepsy."

(assert
(! (not patient_has_finding_of_encephalopathy_inthehistory)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical history of encephalopathy."

(assert
(! (not patient_has_finding_of_similar_conditions_inthehistory)
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a medical history of similar conditions with non-exhaustive examples (allergies, seizures, epilepsy, encephalopathy)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_allergy_to_tetanus_toxoid_components Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented or known to be allergic to tetanus toxoid components.","when_to_set_to_false":"Set to false if the patient is documented or known not to be allergic to tetanus toxoid components.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is allergic to tetanus toxoid components.","meaning":"Boolean indicating whether the patient is allergic to tetanus toxoid components."} ;; "the patient is allergic to tetanus toxoid components."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_allergy_to_tetanus_toxoid_components)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is allergic to tetanus toxoid components."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_thrombocytopenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombocytopenia.","when_to_set_to_false":"Set to false if the patient currently does not have thrombocytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia.","meaning":"Boolean indicating whether the patient currently has thrombocytopenia."} ;; "the patient is suffering from thrombocytopenia"

(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder.","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder."} ;; "the patient is suffering from another coagulation disorder"

(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@may_lead_to_contraindication_to_intramuscular_injection Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood coagulation disorder may lead to contraindication to intramuscular injection.","when_to_set_to_false":"Set to false if the patient's current blood coagulation disorder does not lead to contraindication to intramuscular injection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current blood coagulation disorder may lead to contraindication to intramuscular injection.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder may lead to contraindication to intramuscular injection."} ;; "that may lead to contraindication to intramuscular injection"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@may_lead_to_contraindication_to_intramuscular_injection
       patient_has_finding_of_blood_coagulation_disorder_now)
   :named REQ3_AUXILIARY0)) ;; "the patient is suffering from another coagulation disorder that may lead to contraindication to intramuscular injection."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_thrombocytopenia_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is suffering from thrombocytopenia"

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now@@may_lead_to_contraindication_to_intramuscular_injection)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is suffering from another coagulation disorder that may lead to contraindication to intramuscular injection."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
;; No new variable declarations needed; all required variables are already declared.

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_allergic_disposition_inthehistory)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergic reactions."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_of_immune_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of any disorder of immune function.","when_to_set_to_false":"Set to false if the patient does not have a documented history of any disorder of immune function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of any disorder of immune function.","meaning":"Boolean indicating whether the patient has a disorder of immune function at any time in their history."} ;; "immunological dysfunction"
(declare-const patient_has_finding_of_disorder_of_immune_function_inthehistory@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disorder of immune function is known (confirmed and documented).","when_to_set_to_false":"Set to false if the patient's disorder of immune function is not known (not confirmed or only suspected).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disorder of immune function is known.","meaning":"Boolean indicating whether the patient's disorder of immune function is known (confirmed and documented)."} ;; "known immunological dysfunction"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_immune_function_inthehistory@@known
       patient_has_finding_of_disorder_of_immune_function_inthehistory)
   :named REQ5_AUXILIARY0)) ;; "known immunological dysfunction"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_disorder_of_immune_function_inthehistory@@known)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any known immunological dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_gamma_globulin_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to gamma globulin at any time within the past two weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to gamma globulin within the past two weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to gamma globulin within the past two weeks.","meaning":"Boolean indicating whether the patient has been exposed to gamma globulin within the past two weeks."} ;; "the patient has received gamma globulin in the past two weeks."
(declare-const patient_is_exposed_to_immune_globulin_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to immune globulin at any time within the past two weeks.","when_to_set_to_false":"Set to false if the patient has not been exposed to immune globulin within the past two weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to immune globulin within the past two weeks.","meaning":"Boolean indicating whether the patient has been exposed to immune globulin within the past two weeks."} ;; "the patient has received immune globulin in the past two weeks."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (or patient_is_exposed_to_gamma_globulin_inthepast2weeks
            patient_is_exposed_to_immune_globulin_inthepast2weeks))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has received gamma globulin in the past two weeks) OR (the patient has received immune globulin in the past two weeks)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@diagnosed_by_doctor Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current blood coagulation disorder is diagnosed by a doctor.","when_to_set_to_false":"Set to false if the patient's current blood coagulation disorder is not diagnosed by a doctor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current blood coagulation disorder is diagnosed by a doctor.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder is diagnosed by a doctor."} ;; "the patient has a bleeding disorder diagnosed by a doctor."
(declare-const patient_has_finding_of_significant_bruising_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has significant bruising.","when_to_set_to_false":"Set to false if the patient currently does not have significant bruising.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has significant bruising.","meaning":"Boolean indicating whether the patient currently has significant bruising."} ;; "the patient has significant bruising."
(declare-const patient_has_finding_of_bleeding_difficulties_now@@with_intramuscular_injection Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding difficulties that occur with intramuscular injections.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding difficulties that occur with intramuscular injections.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding difficulties that occur with intramuscular injections.","meaning":"Boolean indicating whether the patient currently has bleeding difficulties that occur with intramuscular injections."} ;; "the patient has bleeding difficulties with intramuscular injections."
(declare-const patient_has_finding_of_bleeding_difficulties_now@@with_blood_draw Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding difficulties that occur with blood draws.","when_to_set_to_false":"Set to false if the patient currently does not have bleeding difficulties that occur with blood draws.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bleeding difficulties that occur with blood draws.","meaning":"Boolean indicating whether the patient currently has bleeding difficulties that occur with blood draws."} ;; "the patient has bleeding difficulties with blood draws."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_blood_coagulation_disorder_now@@diagnosed_by_doctor
            patient_has_finding_of_significant_bruising_now
            patient_has_finding_of_bleeding_difficulties_now@@with_intramuscular_injection
            patient_has_finding_of_bleeding_difficulties_now@@with_blood_draw))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a bleeding disorder diagnosed by a doctor) OR (the patient has significant bruising) OR (the patient has bleeding difficulties with intramuscular injections) OR (the patient has bleeding difficulties with blood draws)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_acute_infection_count_inthepast_7_days Real) ;; {"when_to_set_to_value":"Set to the number of acute infections the patient has had within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many acute infections the patient has had within the past 7 days.","meaning":"Numeric value representing the count of acute infections the patient has had in the past 7 days."} ;; "number of acute infections the patient has had within the past 7 days."
(declare-const patient_has_finding_of_acute_infectious_disease_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had at least one acute infectious disease within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not had any acute infectious disease within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute infectious disease within the past 7 days.","meaning":"Boolean indicating whether the patient has had an acute infectious disease within the past 7 days."} ;; "has had at least one acute infection in the last seven days."

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Boolean variable is true iff count is at least 1
(assert
(! (= patient_has_finding_of_acute_infectious_disease_inthepast7days
    (>= patient_acute_infection_count_inthepast_7_days 1))
:named REQ8_AUXILIARY0)) ;; "has had at least one acute infection in the last seven days."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_acute_infectious_disease_inthepast7days)
:named REQ8_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had at least one acute infection in the last seven days."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_taken_immunodepressant_drug_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any immunodepressant drug within the past six months.","when_to_set_to_false":"Set to false if the patient has not taken any immunodepressant drug within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any immunodepressant drug within the past six months.","meaning":"Boolean indicating whether the patient has taken any immunodepressant drug within the past six months."} ;; "the patient has had any prior administration of immunodepressant drugs in the last six months."
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid derivative containing product within the past six months.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid derivative containing product within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any corticosteroid or corticosteroid derivative containing product within the past six months.","meaning":"Boolean indicating whether the patient has taken any corticosteroid or corticosteroid derivative containing product within the past six months."} ;; "the patient has had any prior administration of corticosteroids in the last six months."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_taken_immunodepressant_drug_inthepast6months)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any prior administration of immunodepressant drugs in the last six months."

(assert
(! (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast6months)
    :named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any prior administration of corticosteroids in the last six months."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const number_of_research_medicine_administrations_in_the_last_1_month Real) ;; {"when_to_set_to_value":"Set to the number of times the patient has received administration of research medicines within the last 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many times the patient has received administration of research medicines within the last 1 month.","meaning":"Numeric value indicating the number of times the patient has received administration of research medicines within the last 1 month."} ;; "number of times the patient has received administration of research medicines within the last 1 month."
(declare-const patient_has_administration_of_research_medicine_in_the_last_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any administration of research medicines within the last 1 month.","when_to_set_to_false":"Set to false if the patient has not had any administration of research medicines within the last 1 month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any administration of research medicines within the last 1 month.","meaning":"Boolean indicating whether the patient has had any administration of research medicines within the last 1 month."} ;; "any prior administration of other research medicines within the last 1 month."

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Link the Boolean to the numeric count
(assert
(! (= patient_has_administration_of_research_medicine_in_the_last_1_month
(> number_of_research_medicine_administrations_in_the_last_1_month 0))
:named REQ10_AUXILIARY0)) ;; "any prior administration of other research medicines within the last 1 month."

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_administration_of_research_medicine_in_the_last_1_month)
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has had any prior administration of other research medicines within the last 1 month."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const number_of_days_since_last_administration_of_attenuated_live_vaccine Real) ;; {"when_to_set_to_value":"Set to the number of days since the patient's most recent administration of attenuated live vaccine, if known.","when_to_set_to_null":"Set to null if the number of days since the patient's most recent administration of attenuated live vaccine is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the number of days since the patient's most recent administration of attenuated live vaccine."} ;; "number of days since the patient's most recent administration of attenuated live vaccine"
(declare-const patient_has_administration_of_attenuated_live_vaccine_within_last_28_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any administration of attenuated live vaccine within the last 28 days.","when_to_set_to_false":"Set to false if the patient has not had any administration of attenuated live vaccine within the last 28 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any administration of attenuated live vaccine within the last 28 days.","meaning":"Boolean indicating whether the patient has had any administration of attenuated live vaccine within the last 28 days."} ;; "any prior administration of attenuated live vaccine within the last 28 days"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definition: patient_has_administration_of_attenuated_live_vaccine_within_last_28_days is true iff number_of_days_since_last_administration_of_attenuated_live_vaccine < 28
(assert
(! (= patient_has_administration_of_attenuated_live_vaccine_within_last_28_days
    (< number_of_days_since_last_administration_of_attenuated_live_vaccine 28))
:named REQ11_AUXILIARY0)) ;; "has had any prior administration of attenuated live vaccine within the last 28 days."

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_administration_of_attenuated_live_vaccine_within_last_28_days)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any prior administration of attenuated live vaccine within the last 28 days."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_prior_administration_of_subunit_vaccine_within_last_14_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any prior administration of subunit vaccines within the last 14 days.","when_to_set_to_false":"Set to false if the patient has not had any prior administration of subunit vaccines within the last 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any prior administration of subunit vaccines within the last 14 days.","meaning":"Boolean indicating whether the patient has had any prior administration of subunit vaccines within the last 14 days."} ;; "any prior administration of subunit vaccines within the last 14 days"
(declare-const patient_has_prior_administration_of_inactivated_vaccine_within_last_14_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any prior administration of inactivated vaccines within the last 14 days.","when_to_set_to_false":"Set to false if the patient has not had any prior administration of inactivated vaccines within the last 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any prior administration of inactivated vaccines within the last 14 days.","meaning":"Boolean indicating whether the patient has had any prior administration of inactivated vaccines within the last 14 days."} ;; "any prior administration of inactivated vaccines within the last 14 days"
(declare-const patient_has_prior_administration_of_pneumococcal_vaccine_within_last_14_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had any prior administration of pneumococcal vaccine within the last 14 days.","when_to_set_to_false":"Set to false if the patient has not had any prior administration of pneumococcal vaccine within the last 14 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had any prior administration of pneumococcal vaccine within the last 14 days.","meaning":"Boolean indicating whether the patient has had any prior administration of pneumococcal vaccine within the last 14 days."} ;; "non-exhaustive examples (pneumococcal vaccine)"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Non-exhaustive example: pneumococcal vaccine implies subunit vaccine administration
(assert
(! (=> patient_has_prior_administration_of_pneumococcal_vaccine_within_last_14_days
      patient_has_prior_administration_of_subunit_vaccine_within_last_14_days)
    :named REQ12_AUXILIARY0)) ;; "non-exhaustive examples (pneumococcal vaccine)" for subunit vaccines

;; Non-exhaustive example: pneumococcal vaccine implies inactivated vaccine administration
(assert
(! (=> patient_has_prior_administration_of_pneumococcal_vaccine_within_last_14_days
      patient_has_prior_administration_of_inactivated_vaccine_within_last_14_days)
    :named REQ12_AUXILIARY1)) ;; "non-exhaustive examples (pneumococcal vaccine)" for inactivated vaccines

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_prior_administration_of_subunit_vaccine_within_last_14_days)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any prior administration of subunit vaccines within the last 14 days with non-exhaustive examples (pneumococcal vaccine)."

(assert
(! (not patient_has_prior_administration_of_inactivated_vaccine_within_last_14_days)
    :named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had any prior administration of inactivated vaccines within the last 14 days with non-exhaustive examples (pneumococcal vaccine)."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_congenital_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of congenital malformations.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of congenital malformations.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of congenital malformations.","meaning":"Boolean indicating whether the patient currently has congenital malformations."} ;; "the patient is suffering from congenital malformations"
(declare-const patient_has_finding_of_developmental_delay_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of developmental delay.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of developmental delay.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of developmental delay.","meaning":"Boolean indicating whether the patient currently has developmental delay."} ;; "the patient is suffering from developmental delay"
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of chronic disease.","meaning":"Boolean indicating whether the patient currently has chronic disease."} ;; "chronic disease"
(declare-const patient_has_finding_of_chronic_disease_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease is considered serious.","when_to_set_to_false":"Set to false if the patient's chronic disease is not considered serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic disease is serious.","meaning":"Boolean indicating whether the patient's chronic disease is serious."} ;; "serious chronic disease"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@serious
       patient_has_finding_of_chronic_disease_now)
   :named REQ13_AUXILIARY0)) ;; "serious chronic disease" implies "chronic disease"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_congenital_malformation_now)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from congenital malformations."

(assert
(! (not patient_has_finding_of_developmental_delay_now)
   :named REQ13_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from developmental delay."

(assert
(! (not patient_has_finding_of_chronic_disease_now@@serious)
   :named REQ13_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from serious chronic disease."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
;; patient_acute_infection_count_inthepast_7_days is already declared
;; {"when_to_set_to_value":"Set to the number of acute infections the patient has had within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many acute infections the patient has had within the past 7 days.","meaning":"Numeric value representing the count of acute infections the patient has had in the past 7 days."} ;; "number of acute infections the patient has had within the past 7 days."
;; patient_has_finding_of_acute_infectious_disease_inthepast7days is already declared
;; {"when_to_set_to_true":"Set to true if the patient has had at least one acute infectious disease within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not had any acute infectious disease within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute infectious disease within the past 7 days.","meaning":"Boolean indicating whether the patient has had an acute infectious disease within the past 7 days."} ;; "has had at least one acute infection in the last seven days."

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_acute_infectious_disease_inthepast7days)
    :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any acute infections."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "any condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@determined_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the presence of the disease, condition, or finding is determined in the opinion of the investigator.","when_to_set_to_false":"Set to false if the presence of the disease, condition, or finding is not determined in the opinion of the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator has determined the presence of the disease, condition, or finding.","meaning":"Boolean indicating whether the presence of the disease, condition, or finding is determined in the opinion of the investigator."} ;; "in the opinion of the investigator"

(declare-const patient_has_finding_of_disease_condition_finding_now@@may_interfere_with_evaluation_of_study_objectives Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or finding may interfere with the evaluation of study objectives.","when_to_set_to_false":"Set to false if the disease, condition, or finding does not interfere or is not expected to interfere with the evaluation of study objectives.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease, condition, or finding may interfere with the evaluation of study objectives.","meaning":"Boolean indicating whether the disease, condition, or finding may interfere with the evaluation of study objectives."} ;; "may interfere with the evaluation of study objectives"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@determined_in_opinion_of_investigator
      patient_has_finding_of_disease_condition_finding_now)
:named REQ15_AUXILIARY0)) ;; "in the opinion of the investigator"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_interfere_with_evaluation_of_study_objectives
      patient_has_finding_of_disease_condition_finding_now)
:named REQ15_AUXILIARY1)) ;; "may interfere with the evaluation of study objectives"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not (and patient_has_finding_of_disease_condition_finding_now@@determined_in_opinion_of_investigator
             patient_has_finding_of_disease_condition_finding_now@@may_interfere_with_evaluation_of_study_objectives))
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "any condition that, in the opinion of the investigator, may interfere with the evaluation of study objectives."
