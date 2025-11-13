;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "be an adult (age > 18 years)"
(declare-const patient_requires_surgical_intervention_within_24_hours_of_diagnosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient requires surgical intervention within 24 hours of diagnosis.","when_to_set_to_false":"Set to false if the patient does not require surgical intervention within 24 hours of diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient requires surgical intervention within 24 hours of diagnosis.","meaning":"Boolean indicating whether the patient requires surgical intervention within 24 hours of diagnosis."} ;; "require surgical intervention within 24 hours of diagnosis"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intra-abdominal infection.","when_to_set_to_false":"Set to false if the patient currently does not have an intra-abdominal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intra-abdominal infection.","meaning":"Boolean indicating whether the patient currently has an intra-abdominal infection."} ;; "have a localized intra-abdominal infection"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@localized Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection is localized.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection is not localized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection is localized.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection is localized."} ;; "localized intra-abdominal infection"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@extends_beyond_organ_wall Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection extends beyond the organ wall.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection does not extend beyond the organ wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection extends beyond the organ wall.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection extends beyond the organ wall."} ;; "localized intra-abdominal infection extending beyond the organ wall"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@confined_near_hollow_viscus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection is confined near the hollow viscus.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection is not confined near the hollow viscus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection is confined near the hollow viscus.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection is confined near the hollow viscus."} ;; "localized intra-abdominal infection confined near the hollow viscus"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@mild_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection is of mild severity.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection is not of mild severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection is of mild severity.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection is of mild severity."} ;; "localized intra-abdominal infection of mild severity"
(declare-const patient_has_finding_of_infectious_disease_of_abdomen_now@@moderate_severity Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current intra-abdominal infection is of moderate severity.","when_to_set_to_false":"Set to false if the patient's current intra-abdominal infection is not of moderate severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current intra-abdominal infection is of moderate severity.","meaning":"Boolean indicating whether the patient's current intra-abdominal infection is of moderate severity."} ;; "localized intra-abdominal infection of moderate severity"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable (localized)
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@localized
         patient_has_finding_of_infectious_disease_of_abdomen_now)
     :named REQ0_AUXILIARY0)) ;; "have a localized intra-abdominal infection"

;; Qualifier variable implies stem variable (extends beyond organ wall)
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@extends_beyond_organ_wall
         patient_has_finding_of_infectious_disease_of_abdomen_now)
     :named REQ0_AUXILIARY1)) ;; "localized intra-abdominal infection extending beyond the organ wall"

;; Qualifier variable implies stem variable (confined near hollow viscus)
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@confined_near_hollow_viscus
         patient_has_finding_of_infectious_disease_of_abdomen_now)
     :named REQ0_AUXILIARY2)) ;; "localized intra-abdominal infection confined near the hollow viscus"

;; Qualifier variable implies stem variable (mild severity)
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@mild_severity
         patient_has_finding_of_infectious_disease_of_abdomen_now)
     :named REQ0_AUXILIARY3)) ;; "localized intra-abdominal infection of mild severity"

;; Qualifier variable implies stem variable (moderate severity)
(assert
  (! (=> patient_has_finding_of_infectious_disease_of_abdomen_now@@moderate_severity
         patient_has_finding_of_infectious_disease_of_abdomen_now)
     :named REQ0_AUXILIARY4)) ;; "localized intra-abdominal infection of moderate severity"

;; Exhaustive subcategories for localized intra-abdominal infection
(assert
  (! (= patient_has_finding_of_infectious_disease_of_abdomen_now@@localized
        (or patient_has_finding_of_infectious_disease_of_abdomen_now@@extends_beyond_organ_wall
            patient_has_finding_of_infectious_disease_of_abdomen_now@@confined_near_hollow_viscus
            patient_has_finding_of_infectious_disease_of_abdomen_now@@mild_severity
            patient_has_finding_of_infectious_disease_of_abdomen_now@@moderate_severity))
     :named REQ0_AUXILIARY5)) ;; "localized intra-abdominal infection (localized intra-abdominal infection extending beyond the organ wall OR localized intra-abdominal infection confined near the hollow viscus OR localized intra-abdominal infection of mild severity OR localized intra-abdominal infection of moderate severity)"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be an adult (age > 18 years)
(assert
  (! (> patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "be an adult (age > 18 years)"

;; Component 1: patient must require surgical intervention within 24 hours of diagnosis
(assert
  (! patient_requires_surgical_intervention_within_24_hours_of_diagnosis
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "require surgical intervention within 24 hours of diagnosis"

;; Component 2: patient must have a localized intra-abdominal infection (as defined by exhaustive subcategories)
(assert
  (! patient_has_finding_of_infectious_disease_of_abdomen_now@@localized
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "have a localized intra-abdominal infection (localized intra-abdominal infection extending beyond the organ wall OR localized intra-abdominal infection confined near the hollow viscus OR localized intra-abdominal infection of mild severity OR localized intra-abdominal infection of moderate severity)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_acute_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute appendicitis.","meaning":"Boolean indicating whether the patient currently has acute appendicitis."} ;; "acute appendicitis"
(declare-const patient_has_finding_of_acute_appendicitis_now@@ruptured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current acute appendicitis is ruptured.","when_to_set_to_false":"Set to false if the patient's current acute appendicitis is not ruptured.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current acute appendicitis is ruptured.","meaning":"Boolean indicating whether the patient's current acute appendicitis is ruptured."} ;; "ruptured acute appendicitis"
(declare-const patient_has_finding_of_acute_perforated_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of perforated acute appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of perforated acute appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has perforated acute appendicitis.","meaning":"Boolean indicating whether the patient currently has perforated acute appendicitis."} ;; "perforated acute appendicitis"
(declare-const patient_has_finding_of_acute_appendicitis_with_appendix_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abscess of acute appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abscess of acute appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abscess of acute appendicitis.","meaning":"Boolean indicating whether the patient currently has abscess of acute appendicitis."} ;; "abscess of acute appendicitis"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_acute_appendicitis_now@@ruptured
         patient_has_finding_of_acute_appendicitis_now)
     :named REQ1_AUXILIARY0)) ;; "ruptured acute appendicitis" implies "acute appendicitis"

;; "perforated acute appendicitis with abscess of acute appendicitis" means both findings are present
(define-fun patient_has_finding_of_perforated_acute_appendicitis_with_abscess_now () Bool
  (and patient_has_finding_of_acute_perforated_appendicitis_now
       patient_has_finding_of_acute_appendicitis_with_appendix_abscess_now)) ;; "perforated acute appendicitis with abscess of acute appendicitis"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have acute appendicitis, and either ruptured acute appendicitis OR perforated acute appendicitis with abscess
(assert
  (! (and patient_has_finding_of_acute_appendicitis_now
          (or patient_has_finding_of_acute_appendicitis_now@@ruptured
              patient_has_finding_of_perforated_acute_appendicitis_with_abscess_now))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute appendicitis (ruptured acute appendicitis OR perforated acute appendicitis with abscess of acute appendicitis)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_diverticulitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of diverticulitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of diverticulitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diverticulitis.","meaning":"Boolean indicating whether the patient currently has diverticulitis."} ;; "the patient must have acute diverticulitis"
(declare-const patient_has_finding_of_diverticulitis_now@@is_perforated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diverticulitis is perforated.","when_to_set_to_false":"Set to false if the patient's current diverticulitis is not perforated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diverticulitis is perforated.","meaning":"Boolean indicating whether the patient's current diverticulitis is perforated."} ;; "perforation of acute diverticulitis"
(declare-const patient_has_finding_of_diverticulitis_now@@associated_with_abscess Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diverticulitis is associated with abscess.","when_to_set_to_false":"Set to false if the patient's current diverticulitis is not associated with abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diverticulitis is associated with abscess.","meaning":"Boolean indicating whether the patient's current diverticulitis is associated with abscess."} ;; "abscess of acute diverticulitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply the stem variable (if patient has perforated or abscess-associated diverticulitis, then they have diverticulitis)
(assert
  (! (=> patient_has_finding_of_diverticulitis_now@@is_perforated
         patient_has_finding_of_diverticulitis_now)
     :named REQ2_AUXILIARY0)) ;; "perforation of acute diverticulitis" implies "acute diverticulitis"

(assert
  (! (=> patient_has_finding_of_diverticulitis_now@@associated_with_abscess
         patient_has_finding_of_diverticulitis_now)
     :named REQ2_AUXILIARY1)) ;; "abscess of acute diverticulitis" implies "acute diverticulitis"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have acute diverticulitis with either perforation or abscess
(assert
  (! (or patient_has_finding_of_diverticulitis_now@@is_perforated
         patient_has_finding_of_diverticulitis_now@@associated_with_abscess)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "acute diverticulitis (perforation of acute diverticulitis OR abscess of acute diverticulitis)"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute cholecystitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute cholecystitis."} ;; "acute cholecystitis"
(declare-const patient_has_diagnosis_of_acute_cholecystitis_now@@ruptured Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute cholecystitis is ruptured.","when_to_set_to_false":"Set to false if the patient's acute cholecystitis is not ruptured.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute cholecystitis is ruptured.","meaning":"Boolean indicating whether the patient's acute cholecystitis is ruptured."} ;; "rupture of acute cholecystitis"
(declare-const patient_has_diagnosis_of_acute_cholecystitis_now@@perforated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute cholecystitis is perforated.","when_to_set_to_false":"Set to false if the patient's acute cholecystitis is not perforated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute cholecystitis is perforated.","meaning":"Boolean indicating whether the patient's acute cholecystitis is perforated."} ;; "perforation of acute cholecystitis"
(declare-const patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute gangrenous cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute gangrenous cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute gangrenous cholecystitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute gangrenous cholecystitis."} ;; "gangrenous acute cholecystitis"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive example: gangrenous acute cholecystitis is an example of acute cholecystitis
(assert
  (! (=> patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now
         patient_has_diagnosis_of_acute_cholecystitis_now)
     :named REQ3_AUXILIARY0)) ;; "including gangrenous acute cholecystitis with non-exhaustive examples (gangrenous acute cholecystitis)"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_diagnosis_of_acute_cholecystitis_now@@ruptured
         patient_has_diagnosis_of_acute_cholecystitis_now)
     :named REQ3_AUXILIARY1)) ;; "rupture of acute cholecystitis"

(assert
  (! (=> patient_has_diagnosis_of_acute_cholecystitis_now@@perforated
         patient_has_diagnosis_of_acute_cholecystitis_now)
     :named REQ3_AUXILIARY2)) ;; "perforation of acute cholecystitis"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must have acute cholecystitis (including gangrenous acute cholecystitis)
(assert
  (! patient_has_diagnosis_of_acute_cholecystitis_now
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have acute cholecystitis (including gangrenous acute cholecystitis with non-exhaustive examples (gangrenous acute cholecystitis))."

;; Component 1: Must have rupture OR perforation of acute cholecystitis
(assert
  (! (or patient_has_diagnosis_of_acute_cholecystitis_now@@ruptured
         patient_has_diagnosis_of_acute_cholecystitis_now@@perforated)
     :named REQ3_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (rupture of acute cholecystitis OR perforation of acute cholecystitis)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_perforation_of_stomach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of perforation of the stomach (gastric perforation).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of perforation of the stomach (gastric perforation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of perforation of the stomach (gastric perforation).","meaning":"Boolean indicating whether the patient currently has a clinical finding of perforation of the stomach (gastric perforation)."} ;; "acute gastric perforation"
(declare-const duration_of_gastric_perforation_value_recorded_now_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the onset of the patient's current acute gastric perforation.","when_to_set_to_null":"Set to null if the duration in hours of the patient's current acute gastric perforation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours of the patient's current acute gastric perforation."} ;; "duration > 24 hours for acute gastric perforation"
(declare-const patient_has_finding_of_duodenal_perforation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of perforation of the duodenum (duodenal perforation).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of perforation of the duodenum (duodenal perforation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of perforation of the duodenum (duodenal perforation).","meaning":"Boolean indicating whether the patient currently has a clinical finding of perforation of the duodenum (duodenal perforation)."} ;; "acute duodenal perforation"
(declare-const duration_of_duodenal_perforation_value_recorded_now_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the onset of the patient's current acute duodenal perforation.","when_to_set_to_null":"Set to null if the duration in hours of the patient's current acute duodenal perforation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours of the patient's current acute duodenal perforation."} ;; "duration > 24 hours for acute duodenal perforation"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: To be included, the patient must have (acute gastric perforation of duration > 24 hours) OR (acute duodenal perforation of duration > 24 hours).
(assert
  (! (or (and patient_has_finding_of_perforation_of_stomach_now
              (> duration_of_gastric_perforation_value_recorded_now_in_hours 24.0))
         (and patient_has_finding_of_duodenal_perforation_now
              (> duration_of_duodenal_perforation_value_recorded_now_in_hours 24.0)))
     :named REQ4_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (acute gastric perforation of duration > 24 hours) OR (acute duodenal perforation of duration > 24 hours)."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_traumatic_perforation_of_intestines_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a traumatic perforation of the intestines.","when_to_set_to_false":"Set to false if the patient currently does not have a traumatic perforation of the intestines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a traumatic perforation of the intestines.","meaning":"Boolean indicating whether the patient currently has a traumatic perforation of the intestines."} ;; "the patient must have traumatic perforation of the intestines"
(declare-const traumatic_perforation_of_intestines_duration_value_recorded_now_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the onset of the patient's traumatic perforation of the intestines, as recorded at the current time.","when_to_set_to_null":"Set to null if the duration in hours since the onset of the patient's traumatic perforation of the intestines is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the duration in hours since the onset of the patient's traumatic perforation of the intestines, as recorded at the current time."} ;; "duration > 12 hours"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (and patient_has_finding_of_traumatic_perforation_of_intestines_now
          (> traumatic_perforation_of_intestines_duration_value_recorded_now_withunit_hours 12.0))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have traumatic perforation of the intestines of duration > 12 hours."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of peritonitis.","meaning":"Boolean indicating whether the patient currently has peritonitis."} ;; "the patient must have secondary peritonitis due to perforated viscus"
(declare-const patient_has_finding_of_peritonitis_now@@is_secondary Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current peritonitis is secondary.","when_to_set_to_false":"Set to false if the patient's current peritonitis is not secondary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current peritonitis is secondary.","meaning":"Boolean indicating whether the patient's current peritonitis is secondary."} ;; "the patient must have secondary peritonitis"
(declare-const patient_has_finding_of_peritonitis_now@@caused_by_perforated_viscus Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current peritonitis is caused by perforated viscus.","when_to_set_to_false":"Set to false if the patient's current peritonitis is not caused by perforated viscus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current peritonitis is caused by perforated viscus.","meaning":"Boolean indicating whether the patient's current peritonitis is caused by perforated viscus."} ;; "the patient must have secondary peritonitis due to perforated viscus"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies stem variable: is_secondary
(assert
  (! (=> patient_has_finding_of_peritonitis_now@@is_secondary
         patient_has_finding_of_peritonitis_now)
     :named REQ6_AUXILIARY0)) ;; "the patient must have secondary peritonitis"

;; Qualifier variable implies stem variable: caused_by_perforated_viscus
(assert
  (! (=> patient_has_finding_of_peritonitis_now@@caused_by_perforated_viscus
         patient_has_finding_of_peritonitis_now)
     :named REQ6_AUXILIARY1)) ;; "the patient must have secondary peritonitis due to perforated viscus"

;; ===================== Constraint Assertions (REQ 6) =====================
;; The patient must have secondary peritonitis due to perforated viscus
(assert
  (! (and patient_has_finding_of_peritonitis_now@@is_secondary
          patient_has_finding_of_peritonitis_now@@caused_by_perforated_viscus)
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have secondary peritonitis due to perforated viscus."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_abdominal_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an intra-abdominal abscess.","when_to_set_to_false":"Set to false if the patient currently does not have an intra-abdominal abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an intra-abdominal abscess.","meaning":"Boolean indicating whether the patient currently has an intra-abdominal abscess."} ;; "intra-abdominal abscess"
(declare-const patient_has_finding_of_abscess_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abscess of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have an abscess of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abscess of the liver.","meaning":"Boolean indicating whether the patient currently has an abscess of the liver."} ;; "abscess of the liver"
(declare-const patient_has_finding_of_splenic_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a splenic abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a splenic abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a splenic abscess.","meaning":"Boolean indicating whether the patient currently has a splenic abscess."} ;; "abscess of the spleen"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term
(assert
  (! (=> (or patient_has_finding_of_abscess_of_liver_now
            patient_has_finding_of_splenic_abscess_now)
         patient_has_finding_of_abdominal_abscess_now)
     :named REQ7_AUXILIARY0)) ;; "including abscess of the liver or abscess of the spleen" (non-exhaustive examples)

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_finding_of_abdominal_abscess_now
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must have intra-abdominal abscess"
