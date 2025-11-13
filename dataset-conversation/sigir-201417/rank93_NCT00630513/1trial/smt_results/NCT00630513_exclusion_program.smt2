;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_perforation_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of perforation of the intestine (bowel perforation).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of perforation of the intestine (bowel perforation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of perforation of the intestine (bowel perforation).","meaning":"Boolean indicating whether the patient currently has a perforation of the intestine (bowel perforation)."} ;; "bowel perforation"
(declare-const patient_has_finding_of_perforation_of_intestine_now@@requires_surgery_within_twelve_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bowel perforation requires surgery within twelve hours.","when_to_set_to_false":"Set to false if the patient's current bowel perforation does not require surgery within twelve hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bowel perforation requires surgery within twelve hours.","meaning":"Boolean indicating whether the patient's current bowel perforation requires surgery within twelve hours."} ;; "traumatic bowel perforation requiring surgery within twelve hours"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_perforation_of_intestine_now@@requires_surgery_within_twelve_hours
      patient_has_finding_of_perforation_of_intestine_now)
:named REQ0_AUXILIARY0)) ;; "requires surgery within twelve hours" implies "bowel perforation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_perforation_of_intestine_now@@requires_surgery_within_twelve_hours)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a traumatic bowel perforation requiring surgery within twelve hours."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_perforation_of_gastroduodenal_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a perforation of gastroduodenal ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have a perforation of gastroduodenal ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a perforation of gastroduodenal ulcer.","meaning":"Boolean indicating whether the patient currently has a perforation of gastroduodenal ulcer."} ;; "perforation of gastroduodenal ulcer"

(declare-const patient_has_finding_of_perforation_of_gastroduodenal_ulcer_now@@requiring_surgery_within_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current perforation of gastroduodenal ulcer requires surgery within twenty-four hours.","when_to_set_to_false":"Set to false if the patient's current perforation of gastroduodenal ulcer does not require surgery within twenty-four hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current perforation of gastroduodenal ulcer requires surgery within twenty-four hours.","meaning":"Boolean indicating whether the patient's current perforation of gastroduodenal ulcer requires surgery within twenty-four hours."} ;; "perforation of gastroduodenal ulcer requiring surgery within twenty-four hours"

(declare-const patient_has_finding_of_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of ulcer.","meaning":"Boolean indicating whether the patient currently has an ulcer."} ;; "ulcer"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_perforation_of_gastroduodenal_ulcer_now@@requiring_surgery_within_24_hours
      patient_has_finding_of_perforation_of_gastroduodenal_ulcer_now)
:named REQ1_AUXILIARY0)) ;; "requiring surgery within twenty-four hours" implies "perforation of gastroduodenal ulcer"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_perforation_of_gastroduodenal_ulcer_now@@requiring_surgery_within_24_hours)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a perforation of gastroduodenal ulcer requiring surgery within twenty-four hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_intra_abdominal_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intra-abdominal process.","when_to_set_to_false":"Set to false if the patient currently does not have an intra-abdominal process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intra-abdominal process.","meaning":"Boolean indicating whether the patient currently has an intra-abdominal process."} ;; "has an intra-abdominal process"
(declare-const patient_has_finding_of_intra_abdominal_process_now@@primary_etiology_unlikely_infectious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal process has a primary etiology that is unlikely to be infectious.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal process has a primary etiology that is likely to be infectious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the primary etiology of the patient's current intra-abdominal process is unlikely to be infectious.","meaning":"Boolean indicating whether the patient's current intra-abdominal process has a primary etiology that is unlikely to be infectious."} ;; "primary etiology is unlikely to be an infectious etiology"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_intra_abdominal_process_now@@primary_etiology_unlikely_infectious
      patient_has_finding_of_intra_abdominal_process_now)
:named REQ2_AUXILIARY0)) ;; "intra-abdominal process in which the primary etiology is unlikely to be an infectious etiology"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_intra_abdominal_process_now@@primary_etiology_unlikely_infectious)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an intra-abdominal process in which the primary etiology is unlikely to be an infectious etiology."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is currently not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (or patient_is_lactating_now patient_is_pregnant_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is lactating) OR (the patient is pregnant)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_allergic_disposition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of allergic disposition (allergy) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of allergic disposition (allergy) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of allergic disposition (allergy).","meaning":"Boolean indicating whether the patient has ever had allergic disposition (allergy) at any time in the past."} ;; "the patient has a history of allergy"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of hypersensitivity condition at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of hypersensitivity condition at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of hypersensitivity condition.","meaning":"Boolean indicating whether the patient has ever had hypersensitivity condition at any time in the past."} ;; "the patient has a history of hypersensitivity"
(declare-const patient_has_finding_of_severe_reaction_to_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented history of severe reaction that occurred in the context of antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a documented history of severe reaction that occurred in the context of antibiotic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a history of severe reaction in the context of antibiotic therapy.","meaning":"Boolean indicating whether the patient has ever had a severe reaction in the context of antibiotic therapy at any time in the past."} ;; "the patient has a history of any severe reaction to antibiotic therapy"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_allergic_disposition_inthehistory)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of allergy."

(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity."

(assert
(! (not patient_has_finding_of_severe_reaction_to_antibiotic_therapy_inthehistory)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of any severe reaction to antibiotic therapy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has any illness."} ;; "illness"

(declare-const patient_has_finding_of_illness_now@@rapidly_progressive Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is rapidly progressive.","when_to_set_to_false":"Set to false if the patient's current illness is not rapidly progressive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is rapidly progressive.","meaning":"Boolean indicating whether the patient's current illness is rapidly progressive."} ;; "rapidly progressive illness"

(declare-const patient_has_finding_of_terminal_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a terminal illness.","when_to_set_to_false":"Set to false if the patient currently does not have a terminal illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a terminal illness.","meaning":"Boolean indicating whether the patient currently has a terminal illness."} ;; "terminal illness"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@rapidly_progressive
       patient_has_finding_of_illness_now)
   :named REQ5_AUXILIARY0)) ;; "the patient has a rapidly progressive illness"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_finding_of_illness_now@@rapidly_progressive
            patient_has_finding_of_terminal_illness_now))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a rapidly progressive illness) OR (the patient has a terminal illness)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatic (liver) disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatic (liver) disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatic (liver) disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatic (liver) disease in their history."} ;; "the patient has a history of hepatic disease"

(declare-const patient_has_diagnosis_of_kidney_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with renal (kidney) disease at any point in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with renal (kidney) disease at any point in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with renal (kidney) disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of renal (kidney) disease in their history."} ;; "the patient has a history of renal disease"

(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatic (liver) disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hepatic (liver) disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hepatic (liver) disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hepatic (liver) disease."} ;; "hepatic disease (current)"

(declare-const patient_has_diagnosis_of_disease_of_liver_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatic (liver) disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of hepatic (liver) disease and the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hepatic (liver) disease is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe hepatic (liver) disease."} ;; "severe hepatic disease"

(declare-const patient_has_diagnosis_of_kidney_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal (kidney) disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal (kidney) disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal (kidney) disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal (kidney) disease."} ;; "renal disease (current)"

(declare-const patient_has_diagnosis_of_kidney_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal (kidney) disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of renal (kidney) disease and the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the renal (kidney) disease is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of severe renal (kidney) disease."} ;; "severe renal disease"

(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine renal clearance in milliliters per minute per 1.73 square meters is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine renal clearance in milliliters per minute per 1.73 square meters."} ;; "creatinine clearance < 0.5 milliliters per minute per 1.73 square meters"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive example implies severe renal disease
(assert
(! (=> (< patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 0.5)
       patient_has_diagnosis_of_kidney_disease_now@@severe)
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (creatinine clearance < 0.5 milliliters per minute per 1.73 square meters)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@severe
       patient_has_diagnosis_of_disease_of_liver_now)
:named REQ6_AUXILIARY1)) ;; "severe hepatic disease implies hepatic disease (current)"

(assert
(! (=> patient_has_diagnosis_of_kidney_disease_now@@severe
       patient_has_diagnosis_of_kidney_disease_now)
:named REQ6_AUXILIARY2)) ;; "severe renal disease implies renal disease (current)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_inthehistory)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hepatic disease."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_inthehistory)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of renal disease."

(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now@@severe)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic disease."

(assert
(! (not patient_has_diagnosis_of_kidney_disease_now@@severe)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe renal disease with non-exhaustive examples (creatinine clearance < 0.5 milliliters per minute per 1.73 square meters)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infection is concomitant with the evaluation of response to antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's current infection is not concomitant with the evaluation of response to antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is concomitant.","meaning":"Boolean indicating whether the patient's current infection is concomitant with the evaluation of response to antibiotic therapy."} ;; "concomitant infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@would_interfere_with_evaluation_of_response_to_antibiotic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infection would interfere with evaluation of response to antibiotic therapy.","when_to_set_to_false":"Set to false if the patient's current infection would not interfere with evaluation of response to antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection would interfere with evaluation of response to antibiotic therapy.","meaning":"Boolean indicating whether the patient's current infection would interfere with evaluation of response to antibiotic therapy."} ;; "infection that would interfere with evaluation of response to antibiotic therapy"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@concomitant
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ7_AUXILIARY0)) ;; "concomitant infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@would_interfere_with_evaluation_of_response_to_antibiotic_therapy
      patient_has_finding_of_disorder_due_to_infection_now)
:named REQ7_AUXILIARY1)) ;; "infection that would interfere with evaluation of response to antibiotic therapy"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have a concomitant infection that would interfere with evaluation of response to antibiotic therapy
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@concomitant
             patient_has_finding_of_disorder_due_to_infection_now@@would_interfere_with_evaluation_of_response_to_antibiotic_therapy))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant infection that would interfere with evaluation of response to antibiotic therapy."
