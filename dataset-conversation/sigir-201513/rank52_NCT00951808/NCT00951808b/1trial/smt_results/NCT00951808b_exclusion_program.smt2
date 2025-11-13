;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of radiologic infiltrate of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of radiologic infiltrate of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of radiologic infiltrate of the lung.","meaning":"Boolean indicating whether the patient currently has a diagnosis of radiologic infiltrate of the lung."} ;; "the patient has an existing diagnosis of a new pulmonary infiltrate diagnosed by chest radiography"
(declare-const patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now@@diagnosed_by_chest_radiography Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of radiologic infiltrate of the lung is made by chest radiography.","when_to_set_to_false":"Set to false if the patient's diagnosis of radiologic infiltrate of the lung is not made by chest radiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is made by chest radiography.","meaning":"Boolean indicating whether the diagnosis of radiologic infiltrate of the lung is made by chest radiography."} ;; "diagnosed by chest radiography"
(declare-const patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now@@new Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of radiologic infiltrate of the lung is new (not pre-existing).","when_to_set_to_false":"Set to false if the patient's diagnosis of radiologic infiltrate of the lung is not new (pre-existing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infiltrate is new.","meaning":"Boolean indicating whether the radiologic infiltrate of the lung is new."} ;; "new pulmonary infiltrate"
(declare-const patient_has_finding_of_pulmonary_infiltrate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pulmonary infiltrate.","when_to_set_to_false":"Set to false if the patient currently does not have a pulmonary infiltrate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pulmonary infiltrate.","meaning":"Boolean indicating whether the patient currently has a pulmonary infiltrate."} ;; "pulmonary infiltrate"
(declare-const patient_has_finding_of_pulmonary_infiltrate_now@@is_pleural_effusion_not_obscuring_lung_parenchyma Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current pulmonary infiltrate is a pleural effusion that does not obscure lung parenchyma.","when_to_set_to_false":"Set to false if the patient's current pulmonary infiltrate is not a pleural effusion that does not obscure lung parenchyma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current pulmonary infiltrate is a pleural effusion that does not obscure lung parenchyma.","meaning":"Boolean indicating whether the patient's current pulmonary infiltrate is a pleural effusion that does not obscure lung parenchyma."} ;; "pulmonary infiltrate that is a pleural effusion not obscuring lung parenchyma"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a radiologic infiltrate of the lung.","when_to_set_to_false":"Set to false if the patient currently does not have a radiologic infiltrate of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a radiologic infiltrate of the lung.","meaning":"Boolean indicating whether the patient currently has a radiologic infiltrate of the lung."} ;; "pulmonary infiltrate"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now@@diagnosed_by_chest_radiography
      patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now)
    :named REQ0_AUXILIARY0)) ;; "diagnosed by chest radiography"

(assert
(! (=> patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now@@new
      patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now)
    :named REQ0_AUXILIARY1)) ;; "new pulmonary infiltrate"

(assert
(! (=> patient_has_finding_of_pulmonary_infiltrate_now@@is_pleural_effusion_not_obscuring_lung_parenchyma
      patient_has_finding_of_pulmonary_infiltrate_now)
    :named REQ0_AUXILIARY2)) ;; "pulmonary infiltrate that is a pleural effusion not obscuring lung parenchyma"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient has an existing diagnosis of a new pulmonary infiltrate diagnosed by chest radiography,
;; AND does NOT have a pulmonary infiltrate that is a pleural effusion not obscuring lung parenchyma
(assert
(! (not (and patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now@@new
             patient_has_diagnosis_of_radiologic_infiltrate_of_lung_now@@diagnosed_by_chest_radiography
             (not patient_has_finding_of_pulmonary_infiltrate_now@@is_pleural_effusion_not_obscuring_lung_parenchyma)))
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has an existing diagnosis of a new pulmonary infiltrate diagnosed by chest radiography) AND (the patient does NOT have a pulmonary infiltrate that is a pleural effusion not obscuring lung parenchyma))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const number_of_coexisting_medical_conditions_for_which_blood_transfusion_may_be_needed_within_24_hours Real) ;; {"when_to_set_to_value":"Set to the number of coexisting medical conditions for which the physician feels a blood transfusion may be needed within 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many coexisting medical conditions the patient has for which a blood transfusion may be needed within 24 hours.","meaning":"Numeric value indicating the number of coexisting medical conditions for which the physician feels a blood transfusion may be needed within 24 hours."} ;; "has ≥ 1 coexisting medical condition for which the physician feels that a blood transfusion may be needed within 24 hours"

(declare-const patient_has_coexisting_medical_condition_for_which_blood_transfusion_may_be_needed_within_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has at least one coexisting medical condition and the physician feels that a blood transfusion may be needed for this condition within 24 hours.","when_to_set_to_false":"Set to false if the patient does not have any coexisting medical condition for which the physician feels a blood transfusion may be needed within 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a coexisting medical condition for which a blood transfusion may be needed within 24 hours.","meaning":"Boolean indicating whether the patient has at least one coexisting medical condition for which the physician feels a blood transfusion may be needed within 24 hours."} ;; "has ≥ 1 coexisting medical condition for which the physician feels that a blood transfusion may be needed within 24 hours"

(declare-const patient_has_coexisting_medical_condition_for_which_blood_transfusion_may_be_needed_within_24_hours@@physician_feels_blood_transfusion_needed_within_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the physician feels that a blood transfusion may be needed for the patient's coexisting medical condition within 24 hours.","when_to_set_to_false":"Set to false if the physician does not feel that a blood transfusion may be needed for the patient's coexisting medical condition within 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the physician feels a blood transfusion may be needed for the patient's coexisting medical condition within 24 hours.","meaning":"Boolean indicating whether the physician feels a blood transfusion may be needed for the patient's coexisting medical condition within 24 hours."} ;; "for which the physician feels that a blood transfusion may be needed within 24 hours"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Numeric definition: patient has at least one such condition iff number ≥ 1
(assert
(! (= patient_has_coexisting_medical_condition_for_which_blood_transfusion_may_be_needed_within_24_hours
     (>= number_of_coexisting_medical_conditions_for_which_blood_transfusion_may_be_needed_within_24_hours 1))
:named REQ1_AUXILIARY0)) ;; "has ≥ 1 coexisting medical condition for which the physician feels that a blood transfusion may be needed within 24 hours"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_coexisting_medical_condition_for_which_blood_transfusion_may_be_needed_within_24_hours@@physician_feels_blood_transfusion_needed_within_24_hours
      patient_has_coexisting_medical_condition_for_which_blood_transfusion_may_be_needed_within_24_hours)
:named REQ1_AUXILIARY1)) ;; "for which the physician feels that a blood transfusion may be needed within 24 hours"

;; Non-exhaustive examples: severe anemia or stroke imply the umbrella term
(declare-const patient_has_severe_anemia_for_which_blood_transfusion_may_be_needed_within_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has severe anemia and the physician feels a blood transfusion may be needed for this condition within 24 hours.","when_to_set_to_false":"Set to false if the patient does not have severe anemia for which a blood transfusion may be needed within 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has severe anemia for which a blood transfusion may be needed within 24 hours.","meaning":"Boolean indicating whether the patient has severe anemia for which the physician feels a blood transfusion may be needed within 24 hours."} ;; "such as severe anemia"

(declare-const patient_has_stroke_for_which_blood_transfusion_may_be_needed_within_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has stroke and the physician feels a blood transfusion may be needed for this condition within 24 hours.","when_to_set_to_false":"Set to false if the patient does not have stroke for which a blood transfusion may be needed within 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has stroke for which a blood transfusion may be needed within 24 hours.","meaning":"Boolean indicating whether the patient has stroke for which the physician feels a blood transfusion may be needed within 24 hours."} ;; "such as stroke"

(assert
(! (=> (or patient_has_severe_anemia_for_which_blood_transfusion_may_be_needed_within_24_hours
           patient_has_stroke_for_which_blood_transfusion_may_be_needed_within_24_hours)
       patient_has_coexisting_medical_condition_for_which_blood_transfusion_may_be_needed_within_24_hours)
:named REQ1_AUXILIARY2)) ;; "with non-exhaustive examples (severe anemia, stroke)"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_coexisting_medical_condition_for_which_blood_transfusion_may_be_needed_within_24_hours)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ≥ 1 coexisting medical condition for which the physician feels that a blood transfusion may be needed within 24 hours with non-exhaustive examples (severe anemia, stroke)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_transfusion_of_red_blood_cells_inthepast60days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a transfusion of red blood cells in the past 60 days.","when_to_set_to_false":"Set to false if the patient has not undergone a transfusion of red blood cells in the past 60 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a transfusion of red blood cells in the past 60 days.","meaning":"Boolean indicating whether the patient has undergone a transfusion of red blood cells in the past 60 days."} ;; "red blood cell transfusion in the 60 days before study entry"

(declare-const patient_has_undergone_transfusion_of_red_blood_cells_inthepast60days@@temporalcontext_within60days_before_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a transfusion of red blood cells within the 60 days before study entry.","when_to_set_to_false":"Set to false if the patient has not undergone a transfusion of red blood cells within the 60 days before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a transfusion of red blood cells within the 60 days before study entry.","meaning":"Boolean indicating whether the patient has undergone a transfusion of red blood cells within the 60 days before study entry."} ;; "in the 60 days before study entry"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies the corresponding stem variable
(assert
(! (=> patient_has_undergone_transfusion_of_red_blood_cells_inthepast60days@@temporalcontext_within60days_before_study_entry
      patient_has_undergone_transfusion_of_red_blood_cells_inthepast60days)
   :named REQ2_AUXILIARY0)) ;; "in the 60 days before study entry"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_transfusion_of_red_blood_cells_inthepast60days@@temporalcontext_within60days_before_study_entry)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received a red blood cell transfusion in the 60 days before study entry."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_unwilling_to_sign_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to sign the consent form.","when_to_set_to_false":"Set to false if the patient is currently willing to sign the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unwilling to sign the consent form.","meaning":"Boolean indicating whether the patient is currently unwilling to sign the consent form."} ;; "the patient is unwilling to sign the consent form"
(declare-const patient_is_minor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a minor according to local legal definitions.","when_to_set_to_false":"Set to false if the patient is currently not a minor according to local legal definitions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a minor according to local legal definitions.","meaning":"Boolean indicating whether the patient is currently a minor according to local legal definitions."} ;; "the patient is a minor"
(declare-const parent_or_guardian_is_unwilling_to_sign_consent_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent or guardian is currently unwilling to sign the consent form.","when_to_set_to_false":"Set to false if the patient's parent or guardian is currently willing to sign the consent form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent or guardian is currently unwilling to sign the consent form.","meaning":"Boolean indicating whether the patient's parent or guardian is currently unwilling to sign the consent form."} ;; "the parent or guardian is unwilling to sign the consent form"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is a minor"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or patient_is_unwilling_to_sign_consent_form_now
            (and patient_is_minor_now parent_or_guardian_is_unwilling_to_sign_consent_form_now)))
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient is unwilling to sign the consent form) OR ((the patient is a minor) AND (the parent or guardian is unwilling to sign the consent form)))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_taken_hydroxyurea_containing_product_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken a hydroxyurea-containing product in the 30 days before study entry.","when_to_set_to_false":"Set to false if the patient has not taken a hydroxyurea-containing product in the 30 days before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken a hydroxyurea-containing product in the 30 days before study entry.","meaning":"Boolean indicating whether the patient has taken a hydroxyurea-containing product in the 30 days before study entry."} ;; "except if the patient has received treatment with hydroxyurea"
(declare-const patient_is_exposed_to_device_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any device in the 30 days before study entry.","when_to_set_to_false":"Set to false if the patient has not been exposed to any device in the 30 days before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any device in the 30 days before study entry.","meaning":"Boolean indicating whether the patient has been exposed to any device in the 30 days before study entry."} ;; "any investigational device in the 30 days before study entry"
(declare-const patient_is_exposed_to_device_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the device to which the patient was exposed in the 30 days before study entry is investigational.","when_to_set_to_false":"Set to false if the device to which the patient was exposed in the 30 days before study entry is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the device to which the patient was exposed in the 30 days before study entry is investigational.","meaning":"Boolean indicating whether the device to which the patient was exposed in the 30 days before study entry is investigational."} ;; "any investigational device in the 30 days before study entry"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been exposed to any drug or medicament in the 30 days before study entry.","when_to_set_to_false":"Set to false if the patient has not been exposed to any drug or medicament in the 30 days before study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been exposed to any drug or medicament in the 30 days before study entry.","meaning":"Boolean indicating whether the patient has been exposed to any drug or medicament in the 30 days before study entry."} ;; "any investigational drug in the 30 days before study entry"
(declare-const patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient was exposed in the 30 days before study entry is investigational.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient was exposed in the 30 days before study entry is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient was exposed in the 30 days before study entry is investigational.","meaning":"Boolean indicating whether the drug or medicament to which the patient was exposed in the 30 days before study entry is investigational."} ;; "any investigational drug in the 30 days before study entry"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_device_inthepast30days@@is_investigational
      patient_is_exposed_to_device_inthepast30days)
:named REQ4_AUXILIARY0)) ;; "any investigational device in the 30 days before study entry"

(assert
(! (=> patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
      patient_is_exposed_to_drug_or_medicament_inthepast30days)
:named REQ4_AUXILIARY1)) ;; "any investigational drug in the 30 days before study entry"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have received any investigational drug or device in the 30 days before study entry, except hydroxyurea
(assert
(! (not (and
         (or patient_is_exposed_to_drug_or_medicament_inthepast30days@@is_investigational
             patient_is_exposed_to_device_inthepast30days@@is_investigational)
         (not patient_has_taken_hydroxyurea_containing_product_inthepast30days)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has received treatment with any investigational drug or investigational device in the 30 days before study entry, except if the patient has received treatment with hydroxyurea."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_allosensitization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of alloimmunization (allosensitization).","when_to_set_to_false":"Set to false if the patient does not have a documented history of alloimmunization (allosensitization).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of alloimmunization (allosensitization).","meaning":"Boolean indicating whether the patient has a history of alloimmunization (allosensitization)."} ;; "the patient has a history of alloimmunization"
(declare-const patient_has_finding_of_allosensitization_inthehistory@@prevents_blood_transfusion_within_8_hours_of_eligibility_for_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of alloimmunization would prevent the patient from receiving blood within 8 hours of eligibility for study entry.","when_to_set_to_false":"Set to false if the patient's history of alloimmunization would not prevent the patient from receiving blood within 8 hours of eligibility for study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of alloimmunization would prevent blood transfusion within 8 hours of eligibility for study entry.","meaning":"Boolean indicating whether the patient's history of alloimmunization would prevent blood transfusion within 8 hours of eligibility for study entry."} ;; "alloimmunization that would prevent the patient from receiving blood within 8 hours of eligibility for study entry"
(declare-const patient_has_finding_of_blood_transfusion_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of blood transfusion reaction.","when_to_set_to_false":"Set to false if the patient does not have a documented history of blood transfusion reaction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of blood transfusion reaction.","meaning":"Boolean indicating whether the patient has a history of blood transfusion reaction."} ;; "the patient has a history of a transfusion reaction"
(declare-const patient_has_finding_of_blood_transfusion_reaction_inthehistory@@is_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of blood transfusion reaction was life-threatening.","when_to_set_to_false":"Set to false if the patient's history of blood transfusion reaction was not life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of blood transfusion reaction was life-threatening.","meaning":"Boolean indicating whether the patient's history of blood transfusion reaction was life-threatening."} ;; "the patient has a history of a life-threatening transfusion reaction"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for alloimmunization implies stem variable
(assert
(! (=> patient_has_finding_of_allosensitization_inthehistory@@prevents_blood_transfusion_within_8_hours_of_eligibility_for_study_entry
      patient_has_finding_of_allosensitization_inthehistory)
:named REQ5_AUXILIARY0)) ;; "alloimmunization that would prevent the patient from receiving blood within 8 hours of eligibility for study entry"

;; Qualifier variable for transfusion reaction implies stem variable
(assert
(! (=> patient_has_finding_of_blood_transfusion_reaction_inthehistory@@is_life_threatening
      patient_has_finding_of_blood_transfusion_reaction_inthehistory)
:named REQ5_AUXILIARY1)) ;; "history of a life-threatening transfusion reaction"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have (alloimmunization that would prevent blood within 8 hours) OR (history of life-threatening transfusion reaction)
(assert
(! (not (or patient_has_finding_of_allosensitization_inthehistory@@prevents_blood_transfusion_within_8_hours_of_eligibility_for_study_entry
            patient_has_finding_of_blood_transfusion_reaction_inthehistory@@is_life_threatening))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a history of alloimmunization that would prevent the patient from receiving blood within 8 hours of eligibility for study entry) OR (the patient has a history of a life-threatening transfusion reaction))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_objects_to_blood_transfusion_for_religious_reasons_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently objects to blood transfusion for religious reasons.","when_to_set_to_false":"Set to false if the patient currently does not object to blood transfusion for religious reasons.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently objects to blood transfusion for religious reasons.","meaning":"Boolean indicating whether the patient currently objects to blood transfusion for religious reasons."} ;; "the patient objects to blood transfusion for religious reasons"
(declare-const patient_objects_to_blood_transfusion_for_other_reasons_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently objects to blood transfusion for reasons other than religious reasons.","when_to_set_to_false":"Set to false if the patient currently does not object to blood transfusion for reasons other than religious reasons.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently objects to blood transfusion for reasons other than religious reasons.","meaning":"Boolean indicating whether the patient currently objects to blood transfusion for reasons other than religious reasons."} ;; "the patient objects to blood transfusion for other reasons"
(declare-const guardian_objects_to_blood_transfusion_for_religious_reasons_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's guardian currently objects to blood transfusion for religious reasons.","when_to_set_to_false":"Set to false if the patient's guardian currently does not object to blood transfusion for religious reasons.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's guardian currently objects to blood transfusion for religious reasons.","meaning":"Boolean indicating whether the patient's guardian currently objects to blood transfusion for religious reasons."} ;; "the patient's guardian objects to blood transfusion for religious reasons"
(declare-const guardian_objects_to_blood_transfusion_for_other_reasons_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's guardian currently objects to blood transfusion for reasons other than religious reasons.","when_to_set_to_false":"Set to false if the patient's guardian currently does not object to blood transfusion for reasons other than religious reasons.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's guardian currently objects to blood transfusion for reasons other than religious reasons.","meaning":"Boolean indicating whether the patient's guardian currently objects to blood transfusion for reasons other than religious reasons."} ;; "the patient's guardian objects to blood transfusion for other reasons"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (or patient_objects_to_blood_transfusion_for_religious_reasons_now
              patient_objects_to_blood_transfusion_for_other_reasons_now
              guardian_objects_to_blood_transfusion_for_religious_reasons_now
              guardian_objects_to_blood_transfusion_for_other_reasons_now))
     :named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient objects to blood transfusion for religious reasons) OR (the patient objects to blood transfusion for other reasons) OR (the patient's guardian objects to blood transfusion for religious reasons) OR (the patient's guardian objects to blood transfusion for other reasons))."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_steroid_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to steroid at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to steroid at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to steroid.","meaning":"Boolean indicating whether the patient has ever been exposed to steroid at any time in the past."} ;; "steroid"
(declare-const patient_is_exposed_to_steroid_inthehistory@@administered_systemically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to steroid in history was via systemic administration.","when_to_set_to_false":"Set to false if the patient's exposure to steroid in history was not via systemic administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the steroid exposure was systemic.","meaning":"Boolean indicating whether the patient's exposure to steroid in history was via systemic administration."} ;; "systemic steroid"
(declare-const patient_is_exposed_to_steroid_inthehistory@@temporalcontext_within1weekof_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to steroid in history occurred within 1 week prior to study entry.","when_to_set_to_false":"Set to false if the patient's exposure to steroid in history did not occur within 1 week prior to study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within 1 week prior to study entry.","meaning":"Boolean indicating whether the patient's exposure to steroid in history occurred within 1 week prior to study entry."} ;; "within 1 week of study entry"
(declare-const patient_is_exposed_to_steroid_inthehistory@@administered_by_inhalation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to steroid in history was via inhalation.","when_to_set_to_false":"Set to false if the patient's exposure to steroid in history was not via inhalation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the steroid exposure was by inhalation.","meaning":"Boolean indicating whether the patient's exposure to steroid in history was via inhalation."} ;; "inhaled steroid"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_exposed_to_steroid_inthehistory@@administered_systemically
      patient_is_exposed_to_steroid_inthehistory)
    :named REQ7_AUXILIARY0)) ;; "systemic steroid"

(assert
(! (=> patient_is_exposed_to_steroid_inthehistory@@administered_by_inhalation
      patient_is_exposed_to_steroid_inthehistory)
    :named REQ7_AUXILIARY1)) ;; "inhaled steroid"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: history of systemic steroid within 1 week AND NOT history of inhaled steroid
(assert
(! (not (and
         (and patient_is_exposed_to_steroid_inthehistory@@administered_systemically
              patient_is_exposed_to_steroid_inthehistory@@temporalcontext_within1weekof_study_entry)
         (not patient_is_exposed_to_steroid_inthehistory@@administered_by_inhalation)))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of treatment with systemic steroid within 1 week of study entry) AND (the patient does NOT have a history of treatment with inhaled steroid)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."
