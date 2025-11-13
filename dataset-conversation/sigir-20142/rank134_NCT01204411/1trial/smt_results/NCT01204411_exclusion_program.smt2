;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_critical_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has signs of a critical illness.","when_to_set_to_false":"Set to false if the patient currently does not have signs of a critical illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has signs of a critical illness.","meaning":"Boolean indicating whether the patient currently has signs of a critical illness."} ;; "signs of a critical illness"

(declare-const patient_has_finding_of_critical_illness_now@@defined_by_who_2000_severe_falciparum_malaria_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current signs of critical illness are defined according to the World Health Organization (2000) severe Plasmodium falciparum malaria criteria.","when_to_set_to_false":"Set to false if the patient's current signs of critical illness are not defined according to the World Health Organization (2000) severe Plasmodium falciparum malaria criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current signs of critical illness are defined according to the World Health Organization (2000) severe Plasmodium falciparum malaria criteria.","meaning":"Boolean indicating whether the patient's current signs of critical illness are defined according to the World Health Organization (2000) severe Plasmodium falciparum malaria criteria."} ;; "as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria"

(declare-const patient_has_finding_of_falciparum_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of falciparum malaria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of falciparum malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of falciparum malaria.","meaning":"Boolean indicating whether the patient currently has falciparum malaria."} ;; "Plasmodium falciparum malaria"

(declare-const patient_has_finding_of_falciparum_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe falciparum malaria.","when_to_set_to_false":"Set to false if the patient currently has falciparum malaria but the case is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's falciparum malaria is severe.","meaning":"Boolean indicating whether the patient's current falciparum malaria is severe."} ;; "severe Plasmodium falciparum malaria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_critical_illness_now@@defined_by_who_2000_severe_falciparum_malaria_criteria
      patient_has_finding_of_critical_illness_now)
:named REQ0_AUXILIARY0)) ;; "signs of a critical illness as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria"

;; Severe falciparum malaria implies falciparum malaria
(assert
(! (=> patient_has_finding_of_falciparum_malaria_now@@severe
      patient_has_finding_of_falciparum_malaria_now)
:named REQ0_AUXILIARY1)) ;; "severe Plasmodium falciparum malaria"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_critical_illness_now@@defined_by_who_2000_severe_falciparum_malaria_criteria)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of a critical illness as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria; clinical features of severe Plasmodium falciparum malaria in children."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of malaria.","meaning":"Boolean indicating whether the patient currently has malaria."} ;; "malaria"

(declare-const patient_has_finding_of_malaria_now@@severe_as_defined_by_who_2000_severe_falciparum_malaria_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malaria and the malaria is severe as defined by the WHO 2000 severe Plasmodium falciparum malaria criteria.","when_to_set_to_false":"Set to false if the patient currently has malaria but it is not severe as defined by the WHO 2000 criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malaria is severe as defined by the WHO 2000 criteria.","meaning":"Boolean indicating whether the patient's current malaria is severe per WHO 2000 severe falciparum malaria criteria."} ;; "severe malaria as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria"

(declare-const patient_has_finding_of_malaria_now@@complicated_as_defined_by_who_2000_severe_falciparum_malaria_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malaria and the malaria is complicated as defined by the WHO 2000 severe Plasmodium falciparum malaria criteria.","when_to_set_to_false":"Set to false if the patient currently has malaria but it is not complicated as defined by the WHO 2000 criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malaria is complicated as defined by the WHO 2000 criteria.","meaning":"Boolean indicating whether the patient's current malaria is complicated per WHO 2000 severe falciparum malaria criteria."} ;; "complicated malaria as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_malaria_now@@severe_as_defined_by_who_2000_severe_falciparum_malaria_criteria
       patient_has_finding_of_malaria_now)
   :named REQ1_AUXILIARY0)) ;; "severe malaria as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria"

(assert
(! (=> patient_has_finding_of_malaria_now@@complicated_as_defined_by_who_2000_severe_falciparum_malaria_criteria
       patient_has_finding_of_malaria_now)
   :named REQ1_AUXILIARY1)) ;; "complicated malaria as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_malaria_now@@severe_as_defined_by_who_2000_severe_falciparum_malaria_criteria)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of severe malaria as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria."

(assert
(! (not patient_has_finding_of_malaria_now@@complicated_as_defined_by_who_2000_severe_falciparum_malaria_criteria)
   :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of complicated malaria as defined by the World Health Organization (2000) severe Plasmodium falciparum malaria criteria."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anaemia"
(declare-const patient_hemoglobin_value_recorded_now_withunit_grams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current haemoglobin concentration in grams per deciliter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current haemoglobin concentration in grams per deciliter."} ;; "haemoglobin < 5 grams per deciliter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not (and patient_has_finding_of_anemia_now
               (< patient_hemoglobin_value_recorded_now_withunit_grams_per_deciliter 5)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe anaemia (haemoglobin < 5 grams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of hypersensitivity condition at any time in the past, regardless of cause.","when_to_set_to_false":"Set to false if the patient does not have a documented history of hypersensitivity condition at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of hypersensitivity condition.","meaning":"Boolean indicating whether the patient has a history of hypersensitivity condition."} ;; "hypersensitivity"
(declare-const patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_any_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of hypersensitivity condition was caused by any of the study medications.","when_to_set_to_false":"Set to false if the patient's history of hypersensitivity condition was not caused by any of the study medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity condition was caused by any of the study medications.","meaning":"Boolean indicating whether the patient's history of hypersensitivity condition was caused by any of the study medications."} ;; "hypersensitivity to any of the study medications"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_any_study_medication
      patient_has_finding_of_hypersensitivity_condition_inthehistory)
   :named REQ3_AUXILIARY0)) ;; "hypersensitivity to any of the study medications" implies "hypersensitivity"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_condition_inthehistory@@caused_by_any_study_medication)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known history of hypersensitivity to any of the study medications."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_edema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of edema, regardless of symmetry or location.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of edema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of edema.","meaning":"Boolean indicating whether the patient currently has edema (any type, any location)."} ;; "oedema"
(declare-const patient_has_finding_of_edema_now@@symmetric Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current edema is symmetric.","when_to_set_to_false":"Set to false if the patient's current edema is not symmetric.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current edema is symmetric.","meaning":"Boolean indicating whether the patient's current edema is symmetric."} ;; "symmetric"
(declare-const patient_has_finding_of_edema_now@@location_feet Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current edema is located in the feet.","when_to_set_to_false":"Set to false if the patient's current edema is not located in the feet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current edema is located in the feet.","meaning":"Boolean indicating whether the patient's current edema is located in the feet."} ;; "of the feet"
(declare-const patient_has_finding_of_edema_now@@location_feet@@symmetric Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has edema, the edema is located in the feet, and the edema is symmetric.","when_to_set_to_false":"Set to false if the patient currently does not have edema, or the edema is not located in the feet, or the edema is not symmetric.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has edema that is symmetric and located in the feet.","meaning":"Boolean indicating whether the patient currently has symmetric edema of the feet."} ;; "symmetric oedema of the feet"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for symmetric edema of the feet implies all component qualifiers
(assert
(! (=> patient_has_finding_of_edema_now@@location_feet@@symmetric
      (and patient_has_finding_of_edema_now
           patient_has_finding_of_edema_now@@location_feet
           patient_has_finding_of_edema_now@@symmetric))
:named REQ4_AUXILIARY0)) ;; "symmetric oedema of the feet" implies edema, symmetric, and location feet

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_edema_now@@location_feet@@symmetric)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symmetric oedema of the feet."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder characterized by fever (febrile illness).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder characterized by fever (febrile illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder characterized by fever (febrile illness).","meaning":"Boolean indicating whether the patient currently has a disorder characterized by fever (febrile illness)."} ;; "febrile illness"
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now@@not_originating_from_malaria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current febrile illness does not originate from malaria.","when_to_set_to_false":"Set to false if the patient's current febrile illness does originate from malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current febrile illness originates from malaria.","meaning":"Boolean indicating whether the patient's current febrile illness does not originate from malaria."} ;; "not originating from malaria"
(declare-const patient_has_finding_of_disorder_characterized_by_fever_now@@could_alter_study_outcome Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current febrile illness could alter the outcome of the study.","when_to_set_to_false":"Set to false if the patient's current febrile illness could not alter the outcome of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current febrile illness could alter the outcome of the study.","meaning":"Boolean indicating whether the patient's current febrile illness could alter the outcome of the study."} ;; "could alter the outcome of the study"
(declare-const patient_has_finding_of_measles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has measles.","when_to_set_to_false":"Set to false if the patient currently does not have measles.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has measles.","meaning":"Boolean indicating whether the patient currently has measles."} ;; "measles"
(declare-const patient_has_finding_of_acute_lower_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute lower respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have an acute lower respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute lower respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has an acute lower respiratory tract infection."} ;; "acute lower respiratory tract infection"
(declare-const patient_has_finding_of_otitis_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has otitis media.","when_to_set_to_false":"Set to false if the patient currently does not have otitis media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has otitis media.","meaning":"Boolean indicating whether the patient currently has otitis media."} ;; "otitis media"
(declare-const patient_has_finding_of_tonsillitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tonsillitis.","when_to_set_to_false":"Set to false if the patient currently does not have tonsillitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tonsillitis.","meaning":"Boolean indicating whether the patient currently has tonsillitis."} ;; "tonsillitis"
(declare-const patient_has_finding_of_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abscess.","when_to_set_to_false":"Set to false if the patient currently does not have an abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abscess.","meaning":"Boolean indicating whether the patient currently has an abscess."} ;; "abscesses"
(declare-const patient_has_finding_of_severe_diarrhea_with_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe diarrhea with dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have severe diarrhea with dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe diarrhea with dehydration.","meaning":"Boolean indicating whether the patient currently has severe diarrhea with dehydration."} ;; "severe diarrhea with dehydration"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_measles_now
           patient_has_finding_of_acute_lower_respiratory_tract_infection_now
           patient_has_finding_of_otitis_media_now
           patient_has_finding_of_tonsillitis_now
           patient_has_finding_of_abscess_now
           patient_has_finding_of_severe_diarrhea_with_dehydration_now)
       (and patient_has_finding_of_disorder_characterized_by_fever_now@@not_originating_from_malaria
            patient_has_finding_of_disorder_characterized_by_fever_now@@could_alter_study_outcome))
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (measles, acute lower respiratory tract infection, otitis media, tonsillitis, abscesses, severe diarrhea with dehydration)"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_characterized_by_fever_now@@not_originating_from_malaria
       patient_has_finding_of_disorder_characterized_by_fever_now)
:named REQ5_AUXILIARY1)) ;; "not originating from malaria"

(assert
(! (=> patient_has_finding_of_disorder_characterized_by_fever_now@@could_alter_study_outcome
       patient_has_finding_of_disorder_characterized_by_fever_now)
:named REQ5_AUXILIARY2)) ;; "could alter the outcome of the study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_finding_of_disorder_characterized_by_fever_now@@not_originating_from_malaria
             patient_has_finding_of_disorder_characterized_by_fever_now@@could_alter_study_outcome))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant febrile illness not originating from malaria, which could alter the outcome of the study with non-exhaustive examples (measles, acute lower respiratory tract infection, otitis media, tonsillitis, abscesses, severe diarrhea with dehydration)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to a drug or medicament within the past twenty-eight days.","when_to_set_to_false":"Set to false if the patient has not been exposed to a drug or medicament within the past twenty-eight days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to a drug or medicament within the past twenty-eight days.","meaning":"Boolean indicating whether the patient has been exposed to a drug or medicament within the past twenty-eight days."} ;; "drug in the past twenty-eight days"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed within the past twenty-eight days is the study drug.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed within the past twenty-eight days is not the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is the study drug.","meaning":"Boolean indicating whether the drug or medicament is the study drug."} ;; "study drug"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast28days@@full_treatment_course Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to the study drug or medicament within the past twenty-eight days constituted a full treatment course.","when_to_set_to_false":"Set to false if the exposure did not constitute a full treatment course.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure constituted a full treatment course.","meaning":"Boolean indicating whether the exposure constituted a full treatment course."} ;; "full treatment course"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_study_drug
      patient_is_exposed_to_drug_or_medicament_inthepast28days)
:named REQ6_AUXILIARY0)) ;; "study drug in the past twenty-eight days"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast28days@@full_treatment_course
      patient_is_exposed_to_drug_or_medicament_inthepast28days)
:named REQ6_AUXILIARY1)) ;; "full treatment course with the study drug in the past twenty-eight days"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have a history of a full treatment course with the study drug in the past twenty-eight days
(assert
(! (not (and patient_is_exposed_to_drug_or_medicament_inthepast28days@@is_study_drug
             patient_is_exposed_to_drug_or_medicament_inthepast28days@@full_treatment_course))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of a full treatment course with the study drug in the past twenty-eight days."
