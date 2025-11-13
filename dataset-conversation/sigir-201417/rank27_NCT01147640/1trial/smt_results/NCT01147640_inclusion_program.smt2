;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} // "male OR female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."} // "male OR female"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 18 years AND aged ≤ 90 years"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: (male OR female)
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

;; Component 1: aged ≥ 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≥ 18 years."

;; Component 2: aged ≤ 90 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 90)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged ≤ 90 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cholecystitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cholecystitis."} // "cholecystitis"
(declare-const patient_has_diagnosis_of_cholecystitis_now@@accompanied_by_rupture_or_perforation_or_infection_progressed_beyond_gallbladder_wall Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cholecystitis and the cholecystitis is accompanied by rupture, perforation, or progression of the infection beyond the wall of the gallbladder.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of cholecystitis but it is not accompanied by rupture, perforation, or progression of the infection beyond the wall of the gallbladder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cholecystitis is accompanied by rupture, perforation, or progression of the infection beyond the wall of the gallbladder.","meaning":"Boolean indicating whether the cholecystitis is accompanied by rupture, perforation, or progression of the infection beyond the wall of the gallbladder."} // "with rupture, perforation, or progression of the infection beyond the wall of the gallbladder"
(declare-const patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute gangrenous cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute gangrenous cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute gangrenous cholecystitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute gangrenous cholecystitis."} // "gangrenous cholecystitis"
(declare-const patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now@@infection_progressed_beyond_gallbladder_wall Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute gangrenous cholecystitis and the infection has progressed beyond the wall of the gallbladder.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute gangrenous cholecystitis but the infection has not progressed beyond the wall of the gallbladder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection has progressed beyond the wall of the gallbladder in the context of acute gangrenous cholecystitis.","meaning":"Boolean indicating whether the infection has progressed beyond the wall of the gallbladder in the context of acute gangrenous cholecystitis diagnosis."} // "gangrenous cholecystitis with progression of infection beyond the wall"
(declare-const patient_has_diagnosis_of_diverticular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of diverticular disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of diverticular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of diverticular disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of diverticular disease."} // "diverticular disease"
(declare-const patient_has_diagnosis_of_perforation_of_appendix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of perforation of the appendix.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of perforation of the appendix.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of perforation of the appendix.","meaning":"Boolean indicating whether the patient currently has a diagnosis of perforation of the appendix."} // "perforation of the appendix"
(declare-const patient_has_diagnosis_of_abscess_of_appendix_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess of the appendix (periappendiceal abscess).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abscess of the appendix (periappendiceal abscess).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abscess of the appendix (periappendiceal abscess).","meaning":"Boolean indicating whether the patient currently has a diagnosis of abscess of the appendix (periappendiceal abscess)."} // "periappendiceal abscess"
(declare-const patient_has_diagnosis_of_acute_perforation_of_stomach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute perforation of the stomach.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute perforation of the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute perforation of the stomach.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute perforation of the stomach."} // "acute perforation of the stomach"
(declare-const patient_has_diagnosis_of_acute_perforation_of_stomach_now@@operated_on_after_24_hours_since_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute perforation of the stomach and the operation was performed more than 24 hours after the perforation occurred.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute perforation of the stomach and the operation was performed 24 hours or less after the perforation occurred.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operation was performed more than 24 hours after the perforation occurred in the context of acute perforation of the stomach.","meaning":"Boolean indicating whether the operation was performed more than 24 hours after the perforation occurred in the context of acute perforation of the stomach."} // "operated on >24 hours after perforation occurs"
(declare-const patient_has_diagnosis_of_acute_perforation_of_stomach_now@@time_from_perforation_to_operation_value_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours from the occurrence of stomach perforation to the operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours elapsed from the occurrence of stomach perforation to the operation.","meaning":"Numeric value indicating the number of hours from the occurrence of stomach perforation to the operation."} // "time from perforation to operation (stomach)"
(declare-const patient_has_diagnosis_of_acute_perforation_of_duodenum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute perforation of the duodenum.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute perforation of the duodenum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute perforation of the duodenum.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute perforation of the duodenum."} // "acute perforation of the duodenum"
(declare-const patient_has_diagnosis_of_acute_perforation_of_duodenum_now@@operated_on_after_24_hours_since_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute perforation of the duodenum and the operation was performed more than 24 hours after the perforation occurred.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of acute perforation of the duodenum and the operation was performed 24 hours or less after the perforation occurred.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operation was performed more than 24 hours after the perforation occurred in the context of acute perforation of the duodenum.","meaning":"Boolean indicating whether the operation was performed more than 24 hours after the perforation occurred in the context of acute perforation of the duodenum."} // "operated on >24 hours after perforation occurs"
(declare-const patient_has_diagnosis_of_acute_perforation_of_duodenum_now@@time_from_perforation_to_operation_value_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours from the occurrence of duodenal perforation to the operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours elapsed from the occurrence of duodenal perforation to the operation.","meaning":"Numeric value indicating the number of hours from the occurrence of duodenal perforation to the operation."} // "time from perforation to operation (duodenum)"
(declare-const patient_has_diagnosis_of_traumatic_perforation_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of traumatic perforation of the intestine.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of traumatic perforation of the intestine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of traumatic perforation of the intestine.","meaning":"Boolean indicating whether the patient currently has a diagnosis of traumatic perforation of the intestine."} // "traumatic perforation of the intestine"
(declare-const patient_has_diagnosis_of_traumatic_perforation_of_intestine_now@@operated_on_after_12_hours_since_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of traumatic perforation of the intestine and the operation was performed more than 12 hours after the perforation occurred.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of traumatic perforation of the intestine and the operation was performed 12 hours or less after the perforation occurred.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the operation was performed more than 12 hours after the perforation occurred in the context of traumatic perforation of the intestine.","meaning":"Boolean indicating whether the operation was performed more than 12 hours after the perforation occurred in the context of traumatic perforation of the intestine."} // "operated on >12 hours after perforation occurs"
(declare-const patient_has_diagnosis_of_traumatic_perforation_of_intestine_now@@time_from_perforation_to_operation_value_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours from the occurrence of traumatic intestinal perforation to the operation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours elapsed from the occurrence of traumatic intestinal perforation to the operation.","meaning":"Numeric value indicating the number of hours from the occurrence of traumatic intestinal perforation to the operation."} // "time from perforation to operation (traumatic intestine)"
(declare-const patient_has_diagnosis_of_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of peritonitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peritonitis."} // "peritonitis"
(declare-const patient_has_diagnosis_of_peritonitis_now@@due_to_perforated_viscus_or_spread_from_other_focus_of_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peritonitis and the peritonitis is due to perforated viscus or spread from other focus of infection.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of peritonitis but it is not due to perforated viscus or spread from other focus of infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peritonitis is due to perforated viscus or spread from other focus of infection.","meaning":"Boolean indicating whether the peritonitis is due to perforated viscus or spread from other focus of infection."} // "peritonitis due to perforated viscus or spread from other focus of infection"
(declare-const patient_has_diagnosis_of_peritonitis_now@@due_to_spread_from_other_focus_of_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peritonitis and the peritonitis is due to spread from other focus of infection.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of peritonitis but it is not due to spread from other focus of infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peritonitis is due to spread from other focus of infection.","meaning":"Boolean indicating whether the peritonitis is due to spread from other focus of infection."} // "peritonitis due to spread from other focus of infection"
(declare-const patient_has_diagnosis_of_peritonitis_now@@associated_with_cirrhosis_and_chronic_ascites Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peritonitis and the peritonitis is associated with cirrhosis and chronic ascites.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of peritonitis but it is not associated with cirrhosis and chronic ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the peritonitis is associated with cirrhosis and chronic ascites.","meaning":"Boolean indicating whether the peritonitis is associated with cirrhosis and chronic ascites."} // "peritonitis associated with cirrhosis and chronic ascites"
(declare-const patient_has_diagnosis_of_postoperative_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of postoperative peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of postoperative peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of postoperative peritonitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of postoperative peritonitis."} // "postoperative peritonitis"
(declare-const patient_has_diagnosis_of_primary_bacterial_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of spontaneous (primary) bacterial peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of spontaneous (primary) bacterial peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of spontaneous (primary) bacterial peritonitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of spontaneous (primary) bacterial peritonitis."} // "spontaneous (primary) bacterial peritonitis"
(declare-const patient_has_diagnosis_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of inflammatory bowel disease."} // "inflammatory bowel disease"
(declare-const patient_has_diagnosis_of_inflammatory_bowel_disease_now@@accompanied_by_perforation_of_bowel Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inflammatory bowel disease and the disease is accompanied by perforation of the bowel.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of inflammatory bowel disease but it is not accompanied by perforation of the bowel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the inflammatory bowel disease is accompanied by perforation of the bowel.","meaning":"Boolean indicating whether the inflammatory bowel disease is accompanied by perforation of the bowel."} // "inflammatory bowel disease with perforation of the bowel"
(declare-const patient_has_diagnosis_of_vascular_insufficiency_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic bowel disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic bowel disease."} // "ischemic bowel disease"
(declare-const patient_has_diagnosis_of_vascular_insufficiency_of_intestine_now@@accompanied_by_perforation_of_bowel Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic bowel disease and the disease is accompanied by perforation of the bowel.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of ischemic bowel disease but it is not accompanied by perforation of the bowel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ischemic bowel disease is accompanied by perforation of the bowel.","meaning":"Boolean indicating whether the ischemic bowel disease is accompanied by perforation of the bowel."} // "ischemic bowel disease with perforation of the bowel"
(declare-const patient_has_diagnosis_of_abdominal_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of intraabdominal abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of intraabdominal abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of intraabdominal abscess.","meaning":"Boolean indicating whether the patient currently has a diagnosis of intraabdominal abscess."} // "intraabdominal abscess"
(declare-const patient_has_diagnosis_of_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abscess.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abscess."} // "abscess"
(declare-const patient_has_diagnosis_of_abscess_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abscess of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abscess of the liver.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abscess of the liver."} // "abscess of the liver"
(declare-const patient_has_diagnosis_of_splenic_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abscess of the spleen.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abscess of the spleen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abscess of the spleen.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abscess of the spleen."} // "abscess of the spleen"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_cholecystitis_now@@accompanied_by_rupture_or_perforation_or_infection_progressed_beyond_gallbladder_wall
         patient_has_diagnosis_of_cholecystitis_now)
     :named REQ1_AUXILIARY0)) ;; "cholecystitis with rupture, perforation, or progression of infection beyond the wall"

(assert
  (! (=> patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now@@infection_progressed_beyond_gallbladder_wall
         patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now)
     :named REQ1_AUXILIARY1)) ;; "gangrenous cholecystitis with progression of infection beyond the wall"

(assert
  (! (=> patient_has_diagnosis_of_acute_perforation_of_stomach_now@@operated_on_after_24_hours_since_perforation
         patient_has_diagnosis_of_acute_perforation_of_stomach_now)
     :named REQ1_AUXILIARY2)) ;; "acute perforation of stomach operated on >24h after perforation"

(assert
  (! (= patient_has_diagnosis_of_acute_perforation_of_stomach_now@@operated_on_after_24_hours_since_perforation
        (and patient_has_diagnosis_of_acute_perforation_of_stomach_now
             (> patient_has_diagnosis_of_acute_perforation_of_stomach_now@@time_from_perforation_to_operation_value_in_hours 24.0)))
     :named REQ1_AUXILIARY3)) ;; "operated on >24 hours after perforation (stomach)"

(assert
  (! (=> patient_has_diagnosis_of_acute_perforation_of_duodenum_now@@operated_on_after_24_hours_since_perforation
         patient_has_diagnosis_of_acute_perforation_of_duodenum_now)
     :named REQ1_AUXILIARY4)) ;; "acute perforation of duodenum operated on >24h after perforation"

(assert
  (! (= patient_has_diagnosis_of_acute_perforation_of_duodenum_now@@operated_on_after_24_hours_since_perforation
        (and patient_has_diagnosis_of_acute_perforation_of_duodenum_now
             (> patient_has_diagnosis_of_acute_perforation_of_duodenum_now@@time_from_perforation_to_operation_value_in_hours 24.0)))
     :named REQ1_AUXILIARY5)) ;; "operated on >24 hours after perforation (duodenum)"

(assert
  (! (=> patient_has_diagnosis_of_traumatic_perforation_of_intestine_now@@operated_on_after_12_hours_since_perforation
         patient_has_diagnosis_of_traumatic_perforation_of_intestine_now)
     :named REQ1_AUXILIARY6)) ;; "traumatic perforation operated on >12h after perforation"

(assert
  (! (= patient_has_diagnosis_of_traumatic_perforation_of_intestine_now@@operated_on_after_12_hours_since_perforation
        (and patient_has_diagnosis_of_traumatic_perforation_of_intestine_now
             (> patient_has_diagnosis_of_traumatic_perforation_of_intestine_now@@time_from_perforation_to_operation_value_in_hours 12.0)))
     :named REQ1_AUXILIARY7)) ;; "operated on >12 hours after perforation (traumatic intestine)"

(assert
  (! (=> patient_has_diagnosis_of_inflammatory_bowel_disease_now@@accompanied_by_perforation_of_bowel
         patient_has_diagnosis_of_inflammatory_bowel_disease_now)
     :named REQ1_AUXILIARY8)) ;; "inflammatory bowel disease with perforation"

(assert
  (! (=> patient_has_diagnosis_of_vascular_insufficiency_of_intestine_now@@accompanied_by_perforation_of_bowel
         patient_has_diagnosis_of_vascular_insufficiency_of_intestine_now)
     :named REQ1_AUXILIARY9)) ;; "ischemic bowel disease with perforation"

;; Peritonitis qualifiers
(assert
  (! (=> patient_has_diagnosis_of_peritonitis_now@@due_to_perforated_viscus_or_spread_from_other_focus_of_infection
         patient_has_diagnosis_of_peritonitis_now)
     :named REQ1_AUXILIARY10)) ;; "peritonitis due to perforated viscus or spread from other focus"

(assert
  (! (=> patient_has_diagnosis_of_peritonitis_now@@due_to_spread_from_other_focus_of_infection
         patient_has_diagnosis_of_peritonitis_now)
     :named REQ1_AUXILIARY11)) ;; "peritonitis due to spread from other focus"

(assert
  (! (=> patient_has_diagnosis_of_peritonitis_now@@associated_with_cirrhosis_and_chronic_ascites
         patient_has_diagnosis_of_peritonitis_now)
     :named REQ1_AUXILIARY12)) ;; "peritonitis associated with cirrhosis and chronic ascites"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: At least one of the following diagnoses, each with evidence of intraperitoneal infection
(assert
  (! (or
        ;; (a) cholecystitis (including gangrenous cholecystitis) with rupture, perforation, or progression of infection beyond the wall
        patient_has_diagnosis_of_cholecystitis_now@@accompanied_by_rupture_or_perforation_or_infection_progressed_beyond_gallbladder_wall
        patient_has_diagnosis_of_acute_gangrenous_cholecystitis_now@@infection_progressed_beyond_gallbladder_wall

        ;; (b) diverticular disease with perforation or abscess
        (and patient_has_diagnosis_of_diverticular_disease_now
             (or patient_has_diagnosis_of_abscess_now
                 patient_has_diagnosis_of_abdominal_abscess_now))

        ;; (c) perforation of the appendix or periappendiceal abscess
        patient_has_diagnosis_of_perforation_of_appendix_now
        patient_has_diagnosis_of_abscess_of_appendix_now

        ;; (d) acute perforation of the stomach, operated on >24 hours after perforation occurs
        patient_has_diagnosis_of_acute_perforation_of_stomach_now@@operated_on_after_24_hours_since_perforation

        ;; (e) acute perforation of the duodenum, operated on >24 hours after perforation occurs
        patient_has_diagnosis_of_acute_perforation_of_duodenum_now@@operated_on_after_24_hours_since_perforation

        ;; (f) traumatic perforation of the intestine, operated on >12 hours after perforation occurs
        patient_has_diagnosis_of_traumatic_perforation_of_intestine_now@@operated_on_after_12_hours_since_perforation

        ;; (g) peritonitis due to perforated viscus, postoperative peritonitis, or peritonitis due to spread from other focus of infection,
        ;; but NOT spontaneous (primary) bacterial peritonitis or peritonitis associated with cirrhosis and chronic ascites
        (or
          patient_has_diagnosis_of_peritonitis_now@@due_to_perforated_viscus_or_spread_from_other_focus_of_infection
          patient_has_diagnosis_of_postoperative_peritonitis_now
          patient_has_diagnosis_of_peritonitis_now@@due_to_spread_from_other_focus_of_infection
        )
        ;; Exclude spontaneous (primary) bacterial peritonitis and peritonitis associated with cirrhosis and chronic ascites
        ;; (handled by not including those variables in the OR above)

        ;; (h) inflammatory bowel disease with perforation of the bowel
        patient_has_diagnosis_of_inflammatory_bowel_disease_now@@accompanied_by_perforation_of_bowel

        ;; (i) ischemic bowel disease with perforation of the bowel
        patient_has_diagnosis_of_vascular_insufficiency_of_intestine_now@@accompanied_by_perforation_of_bowel

        ;; (j) intraabdominal abscess, abscess of the liver, or abscess of the spleen
        patient_has_diagnosis_of_abdominal_abscess_now
        patient_has_diagnosis_of_abscess_of_liver_now
        patient_has_diagnosis_of_splenic_abscess_now
     )
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one of the following diagnoses, each with evidence of intraperitoneal infection"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abscess.","when_to_set_to_false":"Set to false if the patient currently does not have an abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abscess.","meaning":"Boolean indicating whether the patient currently has an abscess."} // "abscess"
(declare-const patient_has_finding_of_abscess_now@@drained_percutaneously Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abscess and the abscess is drained percutaneously.","when_to_set_to_false":"Set to false if the patient currently has an abscess but it is not drained percutaneously.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abscess is drained percutaneously.","meaning":"Boolean indicating whether the patient currently has an abscess that is drained percutaneously."} // "percutaneous draining of an abscess"
(declare-const patient_will_undergo_surgical_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to undergo a surgical procedure at any point in the future.","when_to_set_to_false":"Set to false if the patient is not expected to undergo a surgical procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a surgical procedure in the future.","meaning":"Boolean indicating whether the patient is expected to undergo a surgical procedure in the future."} // "surgical intervention"
(declare-const patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_24_hours_before_or_after_first_dose_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient will undergo a surgical procedure within 24 hours before or after the first dose of study drug.","when_to_set_to_false":"Set to false if the patient will not undergo a surgical procedure within 24 hours before or after the first dose of study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will undergo a surgical procedure within 24 hours before or after the first dose of study drug.","meaning":"Boolean indicating whether the patient will undergo a surgical procedure within 24 hours before or after the first dose of study drug."} // "within 24 hours of (before OR after) the first dose of study drug"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_abscess_now@@drained_percutaneously
         patient_has_finding_of_abscess_now)
     :named REQ2_AUXILIARY0)) ;; "percutaneous draining of an abscess" is a type of abscess

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_24_hours_before_or_after_first_dose_of_study_drug
         patient_will_undergo_surgical_procedure_inthefuture)
     :named REQ2_AUXILIARY1)) ;; "surgical intervention within 24 hours before or after first dose" is a type of surgical intervention

;; Non-exhaustive examples imply umbrella term
(assert
  (! (=> patient_has_finding_of_abscess_now@@drained_percutaneously
         patient_will_undergo_surgical_procedure_inthefuture)
     :named REQ2_AUXILIARY2)) ;; "percutaneous draining of an abscess" is a surgical intervention

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must require surgical intervention within 24 hours before or after first dose of study drug
(assert
  (! patient_will_undergo_surgical_procedure_inthefuture@@temporalcontext_within_24_hours_before_or_after_first_dose_of_study_drug
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must require surgical intervention (with non-exhaustive examples (laparotomy, laparoscopic surgery, percutaneous draining of an abscess)) within 24 hours of (before OR after) the first dose of study drug."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_abdominal_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abdominal abscess.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abdominal abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of abdominal abscess.","meaning":"Boolean indicating whether the patient currently has abdominal abscess."} // "radiographic evidence of intraabdominal abscess"
(declare-const patient_has_finding_of_abdominal_abscess_now@@radiographic_evidence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current abdominal abscess is supported by radiographic evidence.","when_to_set_to_false":"Set to false if the patient's current abdominal abscess is not supported by radiographic evidence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether radiographic evidence supports the finding.","meaning":"Boolean indicating whether the patient's current abdominal abscess is supported by radiographic evidence."} // "radiographic evidence of intraabdominal abscess"
(declare-const patient_has_finding_of_perforation_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of perforation of the intestine.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of perforation of the intestine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of perforation of the intestine.","meaning":"Boolean indicating whether the patient currently has perforation of the intestine."} // "radiographic evidence of perforation of the bowel"
(declare-const patient_has_finding_of_perforation_of_intestine_now@@radiographic_evidence Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current perforation of the intestine is supported by radiographic evidence.","when_to_set_to_false":"Set to false if the patient's current perforation of the intestine is not supported by radiographic evidence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether radiographic evidence supports the finding.","meaning":"Boolean indicating whether the patient's current perforation of the intestine is supported by radiographic evidence."} // "radiographic evidence of perforation of the bowel"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies stem variable for abdominal abscess
(assert
  (! (=> patient_has_finding_of_abdominal_abscess_now@@radiographic_evidence
         patient_has_finding_of_abdominal_abscess_now)
     :named REQ3_AUXILIARY0)) ;; "radiographic evidence of intraabdominal abscess" implies "abdominal abscess"

;; Qualifier variable implies stem variable for perforation of intestine
(assert
  (! (=> patient_has_finding_of_perforation_of_intestine_now@@radiographic_evidence
         patient_has_finding_of_perforation_of_intestine_now)
     :named REQ3_AUXILIARY1)) ;; "radiographic evidence of perforation of the bowel" implies "perforation of the intestine"

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient is to be enrolled preoperatively, must have radiographic evidence of perforation of the bowel OR radiographic evidence of intraabdominal abscess
(assert
  (! (or patient_has_finding_of_perforation_of_intestine_now@@radiographic_evidence
         patient_has_finding_of_abdominal_abscess_now@@radiographic_evidence)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is to be enrolled preoperatively, the patient must have (radiographic evidence of perforation of the bowel OR radiographic evidence of intraabdominal abscess)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_failed_prior_antibacterial_treatment_for_current_complicated_intraabdominal_infection Bool) ;; {"when_to_set_to_true":"Set to true if the patient has failed antibacterial treatment that was administered prior to the current episode of complicated intra-abdominal infection.","when_to_set_to_false":"Set to false if the patient has not failed antibacterial treatment administered prior to the current episode of complicated intra-abdominal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has failed prior antibacterial treatment for the current complicated intra-abdominal infection.","meaning":"Boolean indicating whether the patient has failed prior antibacterial treatment for the current complicated intra-abdominal infection."} // "if the patient has failed prior antibacterial treatment for the current complicated intra-abdominal infection"
(declare-const patient_has_failed_prior_antibacterial_treatment_for_current_complicated_intraabdominal_infection@@prior_to_current_complicated_intraabdominal_infection Bool) ;; {"when_to_set_to_true":"Set to true if the failed antibacterial treatment was administered prior to the current episode of complicated intra-abdominal infection.","when_to_set_to_false":"Set to false if the failed antibacterial treatment was not administered prior to the current episode of complicated intra-abdominal infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the failed antibacterial treatment was administered prior to the current episode of complicated intra-abdominal infection.","meaning":"Boolean indicating whether the failed antibacterial treatment was administered prior to the current complicated intra-abdominal infection."} // "prior antibacterial treatment for the current complicated intra-abdominal infection"
(declare-const patient_has_finding_of_microbiologic_culture_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a positive microbiologic culture.","when_to_set_to_false":"Set to false if the patient currently does not have a positive microbiologic culture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a positive microbiologic culture.","meaning":"Boolean indicating whether the patient currently has a positive microbiologic culture."} // "have a positive culture"
(declare-const patient_has_finding_of_microbiologic_culture_positive_now@@from_intraabdominal_site Bool) ;; {"when_to_set_to_true":"Set to true if the positive microbiologic culture is from an intraabdominal site.","when_to_set_to_false":"Set to false if the positive microbiologic culture is not from an intraabdominal site.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive microbiologic culture is from an intraabdominal site.","meaning":"Boolean indicating whether the positive microbiologic culture is from an intraabdominal site."} // "positive culture (from an intraabdominal site)"
;; patient_will_undergo_surgical_procedure_inthefuture is already declared in reusable_variables

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_failed_prior_antibacterial_treatment_for_current_complicated_intraabdominal_infection@@prior_to_current_complicated_intraabdominal_infection
         patient_has_failed_prior_antibacterial_treatment_for_current_complicated_intraabdominal_infection)
     :named REQ4_AUXILIARY0)) ;; "prior antibacterial treatment for the current complicated intra-abdominal infection"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_microbiologic_culture_positive_now@@from_intraabdominal_site
         patient_has_finding_of_microbiologic_culture_positive_now)
     :named REQ4_AUXILIARY1)) ;; "positive culture (from an intraabdominal site)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Component 0: If the patient has failed prior antibacterial treatment for the current complicated intra-abdominal infection,
;; then the patient must have a positive culture (from an intraabdominal site).
(assert
  (! (=> patient_has_failed_prior_antibacterial_treatment_for_current_complicated_intraabdominal_infection
         patient_has_finding_of_microbiologic_culture_positive_now@@from_intraabdominal_site)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "must have a positive culture (from an intraabdominal site)"

;; Component 1: If the patient has failed prior antibacterial treatment for the current complicated intra-abdominal infection,
;; then the patient must require surgical intervention.
(assert
  (! (=> patient_has_failed_prior_antibacterial_treatment_for_current_complicated_intraabdominal_infection
         patient_will_undergo_surgical_procedure_inthefuture)
     :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "must require surgical intervention"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_able_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient is unable to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is able to comply with all study procedures and restrictions."} // "able to comply with all study procedures and restrictions"
(declare-const patient_is_willing_to_comply_with_study_procedures_and_restrictions Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to comply with all study procedures and restrictions.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to comply with all study procedures and restrictions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to comply with all study procedures and restrictions.","meaning":"Boolean indicating whether the patient is willing to comply with all study procedures and restrictions."} // "willing to comply with all study procedures and restrictions"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (and patient_is_willing_to_comply_with_study_procedures_and_restrictions
          patient_is_able_to_comply_with_study_procedures_and_restrictions)
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (willing AND able to comply with all study procedures AND restrictions)."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_is_able_to_provide_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is not able to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to provide written informed consent.","meaning":"Boolean indicating whether the patient is able to provide written informed consent."} // "able to provide written informed consent"
(declare-const patient_is_willing_to_provide_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to provide written informed consent.","when_to_set_to_false":"Set to false if the patient is not willing to provide written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to provide written informed consent.","meaning":"Boolean indicating whether the patient is willing to provide written informed consent."} // "willing to provide written informed consent"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (and patient_is_willing_to_provide_written_informed_consent
          patient_is_able_to_provide_written_informed_consent)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be (willing AND able to provide written informed consent)."
