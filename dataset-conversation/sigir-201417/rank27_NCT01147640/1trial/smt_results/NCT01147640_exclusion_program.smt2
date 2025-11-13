;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Boolean indicating whether the patient is currently pregnant."} ;; "The patient is excluded if the patient is a woman who is pregnant."

(declare-const patient_is_nursing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently nursing (breastfeeding).","when_to_set_to_false":"Set to false if the patient is currently not nursing (breastfeeding).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently nursing (breastfeeding).","meaning":"Boolean indicating whether the patient is currently nursing (breastfeeding)."} ;; "The patient is excluded if the patient is a woman who is nursing."

(declare-const patient_is_woman_of_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman of childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently not a woman of childbearing potential.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman of childbearing potential.","meaning":"Boolean indicating whether the patient is currently a woman of childbearing potential."} ;; "The patient is excluded if the patient is a woman of childbearing potential..."

(declare-const patient_is_woman_of_childbearing_potential_now@@not_using_medically_accepted_effective_birth_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a woman of childbearing potential and is NOT using a medically accepted, effective method of birth control.","when_to_set_to_false":"Set to false if the patient is currently a woman of childbearing potential and IS using a medically accepted, effective method of birth control.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a woman of childbearing potential and is NOT using a medically accepted, effective method of birth control.","meaning":"Boolean indicating whether the patient is currently a woman of childbearing potential and is NOT using a medically accepted, effective method of birth control."} ;; "The patient is excluded if the patient is a woman of childbearing potential and the patient is NOT using a medically accepted, effective method of birth control..."

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_woman_of_childbearing_potential_now@@not_using_medically_accepted_effective_birth_control_now
      patient_is_woman_of_childbearing_potential_now)
:named REQ0_AUXILIARY0)) ;; "Qualifier variables imply corresponding stem variables"

;; Non-exhaustive examples imply umbrella term (medically accepted, effective method of birth control)
;; (condom, oral contraceptive, indwelling intrauterine device, sexual abstinence) are examples, but not exhaustive
;; No additional variables for examples are present, so no further auxiliary assertion needed.

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT be currently pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is pregnant."

;; Exclusion: patient must NOT be currently nursing
(assert
(! (not patient_is_nursing_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is nursing."

;; Exclusion: patient must NOT be a woman of childbearing potential who is NOT using a medically accepted, effective method of birth control
(assert
(! (not patient_is_woman_of_childbearing_potential_now@@not_using_medically_accepted_effective_birth_control_now)
:named REQ0_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is a woman of childbearing potential and the patient is NOT using a medically accepted, effective method of birth control with non-exhaustive examples (condom, oral contraceptive, indwelling intrauterine device, sexual abstinence)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_abscess_of_abdominal_wall_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess of the abdominal wall.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abscess of the abdominal wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abscess of the abdominal wall.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abscess of the abdominal wall."} ;; "abdominal wall abscess"

(declare-const patient_has_diagnosis_of_small_bowel_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of small bowel obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of small bowel obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of small bowel obstruction.","meaning":"Boolean indicating whether the patient currently has a diagnosis of small bowel obstruction."} ;; "small bowel obstruction"

(declare-const patient_has_diagnosis_of_vascular_insufficiency_of_intestine_now@@without_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of vascular insufficiency of intestine (ischemic bowel disease) and there is no perforation.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of vascular insufficiency of intestine (ischemic bowel disease) and there is perforation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic bowel disease is without perforation.","meaning":"Boolean indicating whether the patient's ischemic bowel disease is without perforation."} ;; "ischemic bowel disease without perforation"

(declare-const patient_has_diagnosis_of_perforation_of_intestine_now@@traumatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of traumatic perforation of intestine (bowel perforation).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of perforation of intestine (bowel perforation) that is not traumatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the perforation is traumatic.","meaning":"Boolean indicating whether the patient's perforation of intestine is traumatic."} ;; "traumatic bowel perforation"

(declare-const patient_has_diagnosis_of_perforation_of_intestine_now@@surgery_within_twelve_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of perforation of intestine (bowel perforation) and had surgery within twelve hours.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of perforation of intestine (bowel perforation) and did not have surgery within twelve hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had surgery within twelve hours of the diagnosis.","meaning":"Boolean indicating whether the patient had surgery within twelve hours of the diagnosis of perforation of intestine."} ;; "surgery within twelve hours"

(declare-const patient_has_diagnosis_of_peptic_ulcer_now@@perforated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of perforated peptic ulcer (gastroduodenal ulcer).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of peptic ulcer (gastroduodenal ulcer) that is not perforated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ulcer is perforated.","meaning":"Boolean indicating whether the patient's peptic ulcer is perforated."} ;; "perforation of gastroduodenal ulcer"

(declare-const patient_has_diagnosis_of_peptic_ulcer_now@@surgery_within_twenty_four_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peptic ulcer (gastroduodenal ulcer) and had surgery within twenty-four hours.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of peptic ulcer (gastroduodenal ulcer) and did not have surgery within twenty-four hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had surgery within twenty-four hours of the diagnosis.","meaning":"Boolean indicating whether the patient had surgery within twenty-four hours of the diagnosis of peptic ulcer."} ;; "surgery within twenty-four hours"

(declare-const patient_has_diagnosis_of_intraabdominal_process_now@@primary_etiology_not_likely_infectious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of an intraabdominal process and the primary etiology is not likely to be infectious.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of an intraabdominal process and the primary etiology is likely to be infectious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the primary etiology of the intraabdominal process is not likely to be infectious.","meaning":"Boolean indicating whether the patient's intraabdominal process has a primary etiology that is not likely to be infectious."} ;; "another intraabdominal process in which the primary etiology is not likely to be infectious"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_abscess_of_abdominal_wall_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of abdominal wall abscess."

(assert
(! (not patient_has_diagnosis_of_small_bowel_obstruction_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of small bowel obstruction."

(assert
(! (not patient_has_diagnosis_of_vascular_insufficiency_of_intestine_now@@without_perforation)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of ischemic bowel disease without perforation."

(assert
(! (not (and patient_has_diagnosis_of_perforation_of_intestine_now@@traumatic
             patient_has_diagnosis_of_perforation_of_intestine_now@@surgery_within_twelve_hours))
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of traumatic bowel perforation and the patient had surgery within twelve hours."

(assert
(! (not (and patient_has_diagnosis_of_peptic_ulcer_now@@perforated
             patient_has_diagnosis_of_peptic_ulcer_now@@surgery_within_twenty_four_hours))
:named REQ1_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of perforation of gastroduodenal ulcer and the patient had surgery within twenty-four hours."

(assert
(! (not patient_has_diagnosis_of_intraabdominal_process_now@@primary_etiology_not_likely_infectious)
:named REQ1_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of another intraabdominal process in which the primary etiology is not likely to be infectious."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cholecystitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cholecystitis."} ;; "simple cholecystitis"
(declare-const patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute gangrenous cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute gangrenous cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute gangrenous cholecystitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute gangrenous cholecystitis."} ;; "gangrenous cholecystitis"
(declare-const patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now@@without_rupture Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of acute gangrenous cholecystitis is specified as occurring without rupture.","when_to_set_to_false":"Set to false if the diagnosis of acute gangrenous cholecystitis is specified as occurring with rupture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether rupture is present in the diagnosis of acute gangrenous cholecystitis.","meaning":"Boolean indicating whether the diagnosis of acute gangrenous cholecystitis is specified as occurring without rupture."} ;; "gangrenous cholecystitis without rupture"
(declare-const patient_has_diagnosis_of_simple_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of simple appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of simple appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of simple appendicitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of simple appendicitis."} ;; "simple appendicitis"
(declare-const patient_has_diagnosis_of_cholangitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cholangitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cholangitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cholangitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cholangitis."} ;; "acute suppurative cholangitis"
(declare-const patient_has_diagnosis_of_acute_necrotizing_pancreatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute necrotizing pancreatitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute necrotizing pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute necrotizing pancreatitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute necrotizing pancreatitis."} ;; "infected necrotizing pancreatitis"
(declare-const patient_has_diagnosis_of_abscess_of_pancreas_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess of pancreas.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abscess of pancreas.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abscess of pancreas.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abscess of pancreas."} ;; "pancreatic abscess"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for gangrenous cholecystitis
(assert
(! (=> patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now@@without_rupture
      patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now)
:named REQ2_AUXILIARY0)) ;; "gangrenous cholecystitis without rupture"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_cholecystitis_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of simple cholecystitis."

(assert
(! (not patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now@@without_rupture)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of gangrenous cholecystitis without rupture."

(assert
(! (not patient_has_diagnosis_of_simple_appendicitis_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of simple appendicitis."

(assert
(! (not patient_has_diagnosis_of_cholangitis_now)
:named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of acute suppurative cholangitis."

(assert
(! (not patient_has_diagnosis_of_acute_necrotizing_pancreatitis_now)
:named REQ2_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of infected necrotizing pancreatitis."

(assert
(! (not patient_has_diagnosis_of_abscess_of_pancreas_now)
:named REQ2_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of pancreatic abscess."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intra-abdominal infection.","when_to_set_to_false":"Set to false if the patient currently does not have an intra-abdominal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intra-abdominal infection.","meaning":"Boolean indicating whether the patient currently has an intra-abdominal infection."} ;; "intra-abdominal infection"

(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@managed_by_staged_abdominal_repair Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection is managed by staged abdominal repair.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection is not managed by staged abdominal repair.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection is managed by staged abdominal repair.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection is managed by staged abdominal repair."} ;; "managed by staged abdominal repair"

(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@managed_by_open_abdomen_technique Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection is managed by open abdomen technique.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection is not managed by open abdomen technique.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection is managed by open abdomen technique.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection is managed by open abdomen technique."} ;; "managed by open abdomen technique"

(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@source_control_not_likely_to_be_achieved Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection occurs in a situation where infection source control is not likely to be achieved.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection does not occur in such a situation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection occurs in a situation where infection source control is not likely to be achieved.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection occurs in a situation where infection source control is not likely to be achieved."} ;; "in any situation where infection source control is not likely to be achieved"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@managed_by_staged_abdominal_repair
      patient_has_finding_of_infectious_disease_of_abdomen_now)
:named REQ3_AUXILIARY0)) ;; "managed by staged abdominal repair"

(assert
(! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@managed_by_open_abdomen_technique
      patient_has_finding_of_infectious_disease_of_abdomen_now)
:named REQ3_AUXILIARY1)) ;; "managed by open abdomen technique"

(assert
(! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@source_control_not_likely_to_be_achieved
      patient_has_finding_of_infectious_disease_of_abdomen_now)
:named REQ3_AUXILIARY2)) ;; "in any situation where infection source control is not likely to be achieved"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_infectious_disease_of_abdomen_now@@managed_by_staged_abdominal_repair)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complicated intra-abdominal infection managed by staged abdominal repair."

(assert
(! (not patient_has_finding_of_infectious_disease_of_abdomen_now@@managed_by_open_abdomen_technique)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complicated intra-abdominal infection managed by open abdomen technique."

(assert
(! (not patient_has_finding_of_infectious_disease_of_abdomen_now@@source_control_not_likely_to_be_achieved)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has complicated intra-abdominal infection in any situation where infection source control is not likely to be achieved."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an intra-abdominal infection at any time in the past (regardless of cause or resistance profile).","when_to_set_to_false":"Set to false if the patient has never had an intra-abdominal infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an intra-abdominal infection.","meaning":"Boolean indicating whether the patient has ever had an intra-abdominal infection in the past."} ;; "intra-abdominal infection"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_inthehistory@@known_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the intra-abdominal infection was known prior to randomization.","when_to_set_to_false":"Set to false if the intra-abdominal infection was not known prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intra-abdominal infection was known prior to randomization.","meaning":"Boolean indicating whether the intra-abdominal infection was known prior to randomization."} ;; "known prior to randomization"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_inthehistory@@caused_by_pathogen_resistant_to_meropenem Bool) ;; {"when_to_set_to_true":"Set to true if the intra-abdominal infection was caused by pathogen(s) resistant to meropenem.","when_to_set_to_false":"Set to false if the intra-abdominal infection was not caused by pathogen(s) resistant to meropenem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intra-abdominal infection was caused by pathogen(s) resistant to meropenem.","meaning":"Boolean indicating whether the intra-abdominal infection was caused by pathogen(s) resistant to meropenem."} ;; "caused by pathogen(s) resistant to meropenem"
(declare-const patient_has_finding_of_postoperative_infection_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a postoperative infection at any time in the past (regardless of cause or resistance profile).","when_to_set_to_false":"Set to false if the patient has never had a postoperative infection at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a postoperative infection.","meaning":"Boolean indicating whether the patient has ever had a postoperative infection in the past."} ;; "postoperative infection"
(declare-const patient_has_finding_of_postoperative_infection_inthehistory@@known_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the postoperative infection was known prior to randomization.","when_to_set_to_false":"Set to false if the postoperative infection was not known prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the postoperative infection was known prior to randomization.","meaning":"Boolean indicating whether the postoperative infection was known prior to randomization."} ;; "known prior to randomization"
(declare-const patient_has_finding_of_postoperative_infection_inthehistory@@caused_by_pathogen_resistant_to_meropenem Bool) ;; {"when_to_set_to_true":"Set to true if the postoperative infection was caused by pathogen(s) resistant to meropenem.","when_to_set_to_false":"Set to false if the postoperative infection was not caused by pathogen(s) resistant to meropenem.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the postoperative infection was caused by pathogen(s) resistant to meropenem.","meaning":"Boolean indicating whether the postoperative infection was caused by pathogen(s) resistant to meropenem."} ;; "caused by pathogen(s) resistant to meropenem"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables for intra-abdominal infection
(assert
(! (=> patient_has_finding_of_infectious_disease_of_abdomen_inthehistory@@known_prior_to_randomization
      patient_has_finding_of_infectious_disease_of_abdomen_inthehistory)
:named REQ4_AUXILIARY0)) ;; "intra-abdominal infection was known prior to randomization"

(assert
(! (=> patient_has_finding_of_infectious_disease_of_abdomen_inthehistory@@caused_by_pathogen_resistant_to_meropenem
      patient_has_finding_of_infectious_disease_of_abdomen_inthehistory)
:named REQ4_AUXILIARY1)) ;; "intra-abdominal infection was caused by pathogen(s) resistant to meropenem"

;; Qualifier variables imply corresponding stem variables for postoperative infection
(assert
(! (=> patient_has_finding_of_postoperative_infection_inthehistory@@known_prior_to_randomization
      patient_has_finding_of_postoperative_infection_inthehistory)
:named REQ4_AUXILIARY2)) ;; "postoperative infection was known prior to randomization"

(assert
(! (=> patient_has_finding_of_postoperative_infection_inthehistory@@caused_by_pathogen_resistant_to_meropenem
      patient_has_finding_of_postoperative_infection_inthehistory)
:named REQ4_AUXILIARY3)) ;; "postoperative infection was caused by pathogen(s) resistant to meropenem"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion if (intra-abdominal infection known prior to randomization AND caused by pathogen(s) resistant to meropenem)
(assert
(! (not (and patient_has_finding_of_infectious_disease_of_abdomen_inthehistory@@known_prior_to_randomization
             patient_has_finding_of_infectious_disease_of_abdomen_inthehistory@@caused_by_pathogen_resistant_to_meropenem))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known prior to randomization to have intra-abdominal infection caused by pathogen(s) resistant to meropenem."

;; Exclusion if (postoperative infection known prior to randomization AND caused by pathogen(s) resistant to meropenem)
(assert
(! (not (and patient_has_finding_of_postoperative_infection_inthehistory@@known_prior_to_randomization
             patient_has_finding_of_postoperative_infection_inthehistory@@caused_by_pathogen_resistant_to_meropenem))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is known prior to randomization to have postoperative infection caused by pathogen(s) resistant to meropenem."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_unlikely_to_survive_study_period_of_4_to_5_weeks Bool) ;; {"when_to_set_to_true":"Set to true if, in the clinical judgment, the patient is considered unlikely to survive the four- to five-week study period.","when_to_set_to_false":"Set to false if, in the clinical judgment, the patient is considered likely to survive the four- to five-week study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is considered unlikely to survive the four- to five-week study period.","meaning":"Boolean indicating whether the patient is considered unlikely to survive the four- to five-week study period."} ;; "The patient is excluded if the patient is considered unlikely to survive the four- to five-week study period."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_unlikely_to_survive_study_period_of_4_to_5_weeks)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is considered unlikely to survive the four- to five-week study period."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease.","when_to_set_to_false":"Set to false if the patient currently does not have any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease.","meaning":"Boolean indicating whether the patient currently has any disease."} ;; "The patient is excluded if the patient has any rapidly-progressing disease."
(declare-const patient_has_finding_of_disease_now@@rapidly_progressing Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease that is rapidly-progressing.","when_to_set_to_false":"Set to false if the patient currently has disease(s) but none are rapidly-progressing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any current disease is rapidly-progressing.","meaning":"Boolean indicating whether any current disease is rapidly-progressing."} ;; "rapidly-progressing disease"
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness.","when_to_set_to_false":"Set to false if the patient currently does not have any illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any illness.","meaning":"Boolean indicating whether the patient currently has any illness."} ;; "The patient is excluded if the patient has any immediately life-threatening illness..."
(declare-const patient_has_finding_of_illness_now@@immediately_life_threatening Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any illness that is immediately life-threatening.","when_to_set_to_false":"Set to false if the patient currently has illness(es) but none are immediately life-threatening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any current illness is immediately life-threatening.","meaning":"Boolean indicating whether any current illness is immediately life-threatening."} ;; "immediately life-threatening illness"
(declare-const patient_has_finding_of_acute_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have acute hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute hepatic failure.","meaning":"Boolean indicating whether the patient currently has acute hepatic failure."} ;; "acute hepatic failure"
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} ;; "respiratory failure"
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has septic shock.","when_to_set_to_false":"Set to false if the patient currently does not have septic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has septic shock.","meaning":"Boolean indicating whether the patient currently has septic shock."} ;; "septic shock"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable for disease
(assert
(! (=> patient_has_finding_of_disease_now@@rapidly_progressing
      patient_has_finding_of_disease_now)
    :named REQ6_AUXILIARY0)) ;; "rapidly-progressing disease"

;; Qualifier variable implies corresponding stem variable for illness
(assert
(! (=> patient_has_finding_of_illness_now@@immediately_life_threatening
      patient_has_finding_of_illness_now)
    :named REQ6_AUXILIARY1)) ;; "immediately life-threatening illness"

;; Non-exhaustive examples imply the umbrella subclass for immediately life-threatening illness
(assert
(! (=> (or patient_has_finding_of_acute_hepatic_failure_now
           patient_has_finding_of_respiratory_failure_now
           patient_has_finding_of_septic_shock_now)
      patient_has_finding_of_illness_now@@immediately_life_threatening)
    :named REQ6_AUXILIARY2)) ;; "with non-exhaustive examples (acute hepatic failure, respiratory failure, septic shock)"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: rapidly-progressing disease
(assert
(! (not patient_has_finding_of_disease_now@@rapidly_progressing)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any rapidly-progressing disease."

;; Exclusion: immediately life-threatening illness
(assert
(! (not patient_has_finding_of_illness_now@@immediately_life_threatening)
    :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any immediately life-threatening illness with non-exhaustive examples (acute hepatic failure, respiratory failure, septic shock)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any antibacterial agent.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any antibacterial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antibacterial agents.","meaning":"Boolean indicating whether the patient is currently exposed to antibacterial agents."} ;; "antibacterial agents"

(declare-const patient_is_exposed_to_antibacterial_now@@concomitant_systemic_in_addition_to_study_drugs_and_not_vancomycin_or_linezolid Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to antibacterial agents is systemic, concomitant with study drug(s), and the agent is not vancomycin or linezolid.","when_to_set_to_false":"Set to false if the patient's current exposure to antibacterial agents does not meet all of these criteria (i.e., not systemic, not concomitant, not in addition to study drug(s), or is vancomycin/linezolid).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's exposure meets all these criteria.","meaning":"Boolean indicating whether the patient's current exposure to antibacterial agents is systemic, concomitant with study drug(s), and excludes vancomycin or linezolid."} ;; "concomitant systemic antibacterial agents (other than vancomycin or linezolid) in addition to study drug(s)"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_is_exposed_to_antibacterial_now@@concomitant_systemic_in_addition_to_study_drugs_and_not_vancomycin_or_linezolid
      patient_is_exposed_to_antibacterial_now)
   :named REQ7_AUXILIARY0)) ;; "concomitant systemic antibacterial agents (other than vancomycin or linezolid) in addition to study drug(s)" implies "antibacterial agents"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_antibacterial_now@@concomitant_systemic_in_addition_to_study_drugs_and_not_vancomycin_or_linezolid)
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs concomitant systemic antibacterial agents (other than vancomycin or linezolid) in addition to study drug(s)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute Real) ;; {"when_to_set_to_value":"Set to the value of the patient's estimated creatinine clearance measured now, in milliliters per minute.","when_to_set_to_null":"Set to null if the patient's estimated creatinine clearance measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's estimated creatinine clearance measured now, in milliliters per minute."} ;; "estimated creatinine clearance < 50 milliliters per minute"

(declare-const patient_is_undergoing_peritoneal_dialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing peritoneal dialysis.","when_to_set_to_false":"Set to false if the patient is not currently undergoing peritoneal dialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing peritoneal dialysis.","meaning":"Boolean indicating whether the patient is currently undergoing peritoneal dialysis."} ;; "the patient requires peritoneal dialysis"

(declare-const patient_is_undergoing_hemodialysis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hemodialysis.","when_to_set_to_false":"Set to false if the patient is not currently undergoing hemodialysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hemodialysis.","meaning":"Boolean indicating whether the patient is currently undergoing hemodialysis."} ;; "the patient requires hemodialysis"

(declare-const patient_is_undergoing_hemofiltration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing hemofiltration.","when_to_set_to_false":"Set to false if the patient is not currently undergoing hemofiltration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing hemofiltration.","meaning":"Boolean indicating whether the patient is currently undergoing hemofiltration."} ;; "the patient requires hemofiltration"

(declare-const patient_has_finding_of_oliguria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of oliguria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of oliguria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of oliguria.","meaning":"Boolean indicating whether the patient currently has oliguria."} ;; "the patient has oliguria"

(declare-const urine_output_value_recorded_over_24_hours_withunit_milliliters_per_hour Real) ;; {"when_to_set_to_value":"Set to the value of the patient's urine output measured over a twenty-four hour period, in milliliters per hour.","when_to_set_to_null":"Set to null if the patient's urine output measured over a twenty-four hour period is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's urine output measured over a twenty-four hour period, in milliliters per hour."} ;; "urine output < 20 milliliters per hour over twenty-four hours"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Moderate impairment of renal function: estimated creatinine clearance < 50 mL/min
(assert
(! (= (and (< estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 50)
           (>= estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 30))
      ;; This is a placeholder for moderate impairment if a specific range is needed; if not, just use < 50 for both moderate and severe as per requirement text.
      (< estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 50))
   :named REQ8_AUXILIARY0)) ;; "the patient has moderate impairment of renal function (estimated creatinine clearance < 50 milliliters per minute)"

;; Severe impairment of renal function: estimated creatinine clearance < 50 mL/min
(assert
(! (= (< estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 50)
      (< estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 50))
   :named REQ8_AUXILIARY1)) ;; "the patient has severe impairment of renal function (estimated creatinine clearance < 50 milliliters per minute)"

;; Oliguria definition: urine output < 20 mL/h over 24 hours implies oliguria
(assert
(! (=> (< urine_output_value_recorded_over_24_hours_withunit_milliliters_per_hour 20)
       patient_has_finding_of_oliguria_now)
   :named REQ8_AUXILIARY2)) ;; "the patient has oliguria (urine output < 20 milliliters per hour over twenty-four hours)"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: moderate impairment of renal function (estimated creatinine clearance < 50 mL/min)
(assert
(! (not (< estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 50))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has moderate impairment of renal function (estimated creatinine clearance < 50 milliliters per minute)."

;; Exclusion: severe impairment of renal function (estimated creatinine clearance < 50 mL/min)
(assert
(! (not (< estimated_creatinine_clearance_value_recorded_now_withunit_milliliters_per_minute 50))
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe impairment of renal function (estimated creatinine clearance < 50 milliliters per minute)."

;; Exclusion: requires peritoneal dialysis
(assert
(! (not patient_is_undergoing_peritoneal_dialysis_now)
   :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires peritoneal dialysis."

;; Exclusion: requires hemodialysis
(assert
(! (not patient_is_undergoing_hemodialysis_now)
   :named REQ8_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires hemodialysis."

;; Exclusion: requires hemofiltration
(assert
(! (not patient_is_undergoing_hemofiltration_now)
   :named REQ8_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires hemofiltration."

;; Exclusion: has oliguria (urine output < 20 mL/h over 24 hours)
(assert
(! (not patient_has_finding_of_oliguria_now)
   :named REQ8_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has oliguria (urine output < 20 milliliters per hour over twenty-four hours)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const alanine_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current alanine aminotransferase (ALT) level in U/L.","when_to_set_to_null":"Set to null if the patient's current alanine aminotransferase (ALT) level is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current alanine aminotransferase (ALT) level in U/L."} ;; "alanine aminotransferase > 4 × upper limit of normal"
(declare-const aspartate_aminotransferase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current aspartate aminotransferase (AST) level in U/L.","when_to_set_to_null":"Set to null if the patient's current aspartate aminotransferase (AST) level is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current aspartate aminotransferase (AST) level in U/L."} ;; "aspartate aminotransferase > 4 × upper limit of normal"
(declare-const total_bilirubin_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current total bilirubin level in mg/dL.","when_to_set_to_null":"Set to null if the patient's current total bilirubin level is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current total bilirubin level in mg/dL."} ;; "total bilirubin > 2 × upper limit of normal"
(declare-const total_bilirubin_elevation_is_unrelated_to_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current elevation in total bilirubin is determined to be unrelated to cholecystitis.","when_to_set_to_false":"Set to false if the patient's current elevation in total bilirubin is determined to be related to cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current elevation in total bilirubin is unrelated to cholecystitis.","meaning":"Boolean indicating whether the patient's current elevation in total bilirubin is unrelated to cholecystitis."} ;; "the value is unrelated to cholecystitis"
(declare-const alkaline_phosphatase_value_recorded_now_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current alkaline phosphatase level in U/L.","when_to_set_to_null":"Set to null if the patient's current alkaline phosphatase level is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current alkaline phosphatase level in U/L."} ;; "alkaline phosphatase > 4 × upper limit of normal"
(declare-const alkaline_phosphatase_value_recorded_now_withunit_u_per_l@@is_historically_stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current alkaline phosphatase level is historically stable (i.e., has remained at a similar level over time).","when_to_set_to_false":"Set to false if the patient's current alkaline phosphatase level is not historically stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current alkaline phosphatase level is historically stable.","meaning":"Boolean indicating whether the patient's current alkaline phosphatase level is historically stable."} ;; "alkaline phosphatase is historically stable"
(declare-const upper_limit_of_normal_for_alanine_aminotransferase_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for alanine aminotransferase (ALT) in U/L as per laboratory reference.","when_to_set_to_null":"Set to null if the upper limit of normal for alanine aminotransferase (ALT) is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the upper limit of normal for alanine aminotransferase (ALT) in U/L."} ;; "upper limit of normal for alanine aminotransferase"
(declare-const upper_limit_of_normal_for_aspartate_aminotransferase_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for aspartate aminotransferase (AST) in U/L as per laboratory reference.","when_to_set_to_null":"Set to null if the upper limit of normal for aspartate aminotransferase (AST) is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the upper limit of normal for aspartate aminotransferase (AST) in U/L."} ;; "upper limit of normal for aspartate aminotransferase"
(declare-const upper_limit_of_normal_for_total_bilirubin_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for total bilirubin in mg/dL as per laboratory reference.","when_to_set_to_null":"Set to null if the upper limit of normal for total bilirubin is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the upper limit of normal for total bilirubin in mg/dL."} ;; "upper limit of normal for total bilirubin"
(declare-const upper_limit_of_normal_for_alkaline_phosphatase_withunit_u_per_l Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the upper limit of normal for alkaline phosphatase in U/L as per laboratory reference.","when_to_set_to_null":"Set to null if the upper limit of normal for alkaline phosphatase is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the upper limit of normal for alkaline phosphatase in U/L."} ;; "upper limit of normal for alkaline phosphatase"
(declare-const patient_has_finding_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hepatic disease (disease of liver).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hepatic disease (disease of liver).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hepatic disease (disease of liver).","meaning":"Boolean indicating whether the patient currently has hepatic disease (disease of liver)."} ;; "hepatic disease"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition of hepatic disease per requirement
(assert
(! (= patient_has_finding_of_disease_of_liver_now
     (or
      (> alanine_aminotransferase_value_recorded_now_withunit_u_per_l
         (* 4.0 upper_limit_of_normal_for_alanine_aminotransferase_withunit_u_per_l))
      (> aspartate_aminotransferase_value_recorded_now_withunit_u_per_l
         (* 4.0 upper_limit_of_normal_for_aspartate_aminotransferase_withunit_u_per_l))
      (and
        (> total_bilirubin_value_recorded_now_withunit_mg_per_dl
           (* 2.0 upper_limit_of_normal_for_total_bilirubin_withunit_mg_per_dl))
        total_bilirubin_elevation_is_unrelated_to_cholecystitis_now)
      (and
        (> alkaline_phosphatase_value_recorded_now_withunit_u_per_l
           (* 4.0 upper_limit_of_normal_for_alkaline_phosphatase_withunit_u_per_l))
        (not (and
                (> alkaline_phosphatase_value_recorded_now_withunit_u_per_l
                   (* 4.0 upper_limit_of_normal_for_alkaline_phosphatase_withunit_u_per_l))
                (< alkaline_phosphatase_value_recorded_now_withunit_u_per_l
                   (* 5.0 upper_limit_of_normal_for_alkaline_phosphatase_withunit_u_per_l))
                alkaline_phosphatase_value_recorded_now_withunit_u_per_l@@is_historically_stable
             ))
        )
      )
   )
:named REQ9_AUXILIARY0)) ;; "hepatic disease defined as ((alanine aminotransferase > 4 × upper limit of normal) OR (aspartate aminotransferase > 4 × upper limit of normal) OR ((total bilirubin > 2 × upper limit of normal) AND (the value is unrelated to cholecystitis)) OR ((alkaline phosphatase > 4 × upper limit of normal) AND (NOT ((alkaline phosphatase > 4 × upper limit of normal) AND (alkaline phosphatase < 5 × upper limit of normal) AND (alkaline phosphatase is historically stable)))))"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disease_of_liver_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hepatic disease defined as ...)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_chronic_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of chronic hepatic failure.","meaning":"Boolean indicating whether the patient currently has chronic hepatic failure."} ;; "chronic hepatic failure"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_acute_hepatic_failure_now)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute hepatic failure."

(assert
(! (not patient_has_finding_of_acute_decompensation_of_chronic_hepatic_failure_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute decompensation of chronic hepatic failure."
