;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} // "aged 2 months to 59 months"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (and (>= patient_age_value_recorded_now_in_months 2.0)
          (<= patient_age_value_recorded_now_in_months 59.0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be aged 2 months to 59 months."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_boy Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a boy (male child).","when_to_set_to_false":"Set to false if the patient is not a boy (male child).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a boy (male child).","meaning":"Boolean indicating whether the patient is a boy (male child)."} // "To be included, the patient must be a boy or a girl."
(declare-const patient_is_girl Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a girl (female child).","when_to_set_to_false":"Set to false if the patient is not a girl (female child).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a girl (female child).","meaning":"Boolean indicating whether the patient is a girl (female child)."} // "To be included, the patient must be a boy or a girl."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or patient_is_boy patient_is_girl)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a boy or a girl."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pneumonia."} // "pneumonia"
(declare-const patient_has_diagnosis_of_pneumonia_now@@diagnosed_according_to_world_health_organization_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia diagnosis is made according to World Health Organization criteria.","when_to_set_to_false":"Set to false if the patient's pneumonia diagnosis is not made according to World Health Organization criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pneumonia diagnosis is made according to World Health Organization criteria.","meaning":"Boolean indicating whether the patient's pneumonia diagnosis is made according to World Health Organization criteria."} // "according to World Health Organization criteria"
(declare-const patient_has_diagnosis_of_pneumonia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's pneumonia is classified as severe.","when_to_set_to_false":"Set to false if the patient's pneumonia is not classified as severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's pneumonia is classified as severe.","meaning":"Boolean indicating whether the patient's pneumonia is classified as severe."} // "severe pneumonia"
(declare-const patient_has_finding_of_lower_chest_wall_in_drawing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has lower chest wall in drawing (retraction).","when_to_set_to_false":"Set to false if the patient currently does not have lower chest wall in drawing (retraction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has lower chest wall in drawing (retraction).","meaning":"Boolean indicating whether the patient currently has lower chest wall in drawing (retraction) now."} // "lower chest wall in drawing"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea (fast breathing).","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea (fast breathing).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea (fast breathing).","meaning":"Boolean indicating whether the patient currently has tachypnea (fast breathing)."} // "fast breathing"
(declare-const patient_has_symptoms_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of cough.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of cough.","meaning":"Boolean indicating whether the patient currently has symptoms of cough."} // "cough"
(declare-const patient_has_symptoms_of_difficulty_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of difficult breathing.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of difficult breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of difficult breathing.","meaning":"Boolean indicating whether the patient currently has symptoms of difficult breathing."} // "difficult breathing"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's respiratory rate (breaths per minute) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current respiratory rate in breaths per minute."} // "respiratory rate"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute@@applies_to_children_aged_2_months_to_11_months Bool) ;; {"when_to_set_to_true":"Set to true if the respiratory rate measurement applies to a patient aged 2 months to 11 months.","when_to_set_to_false":"Set to false if the respiratory rate measurement does not apply to a patient aged 2 months to 11 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the respiratory rate measurement applies to a patient aged 2 months to 11 months.","meaning":"Boolean indicating whether the respiratory rate measurement applies to a patient aged 2 months to 11 months."} // "children aged 2 months to 11 months"
(declare-const patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute@@applies_to_children_aged_12_months_to_59_months Bool) ;; {"when_to_set_to_true":"Set to true if the respiratory rate measurement applies to a patient aged 12 months to 59 months.","when_to_set_to_false":"Set to false if the respiratory rate measurement does not apply to a patient aged 12 months to 59 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the respiratory rate measurement applies to a patient aged 12 months to 59 months.","meaning":"Boolean indicating whether the respiratory rate measurement applies to a patient aged 12 months to 59 months."} // "children aged 12 months to 59 months"
(assert
  (! (=> patient_has_diagnosis_of_pneumonia_now@@diagnosed_according_to_world_health_organization_criteria
         patient_has_diagnosis_of_pneumonia_now)
     :named REQ2_AUXILIARY0)) ;; "diagnosed according to World Health Organization criteria"

(assert
  (! (=> patient_has_diagnosis_of_pneumonia_now@@severe
         patient_has_diagnosis_of_pneumonia_now)
     :named REQ2_AUXILIARY1)) ;; "severe pneumonia"

;; Definition of fast breathing for age groups
(assert
  (! (= patient_has_finding_of_tachypnea_now
        (or
          (and (>= patient_age_value_recorded_now_in_months 2)
               (<= patient_age_value_recorded_now_in_months 11)
               (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 50)
               patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute@@applies_to_children_aged_2_months_to_11_months)
          (and (>= patient_age_value_recorded_now_in_months 12)
               (<= patient_age_value_recorded_now_in_months 59)
               (>= patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute 40)
               patient_respiratory_rate_value_recorded_now_withunit_breaths_per_minute@@applies_to_children_aged_12_months_to_59_months)))
     :named REQ2_AUXILIARY2)) ;; "fast breathing, which is defined as respiratory rate >= 50 for 2-11 months, >= 40 for 12-59 months"

;; Definition of severe pneumonia according to WHO criteria
(assert
  (! (= patient_has_diagnosis_of_pneumonia_now@@severe
        (and patient_has_diagnosis_of_pneumonia_now@@diagnosed_according_to_world_health_organization_criteria
             (or patient_has_symptoms_of_cough_now
                 patient_has_symptoms_of_difficulty_breathing_now)
             patient_has_finding_of_lower_chest_wall_in_drawing_now
             (or patient_has_finding_of_tachypnea_now
                 (not patient_has_finding_of_tachypnea_now))))
     :named REQ2_AUXILIARY3)) ;; "severe pneumonia according to WHO criteria, defined as cough or difficult breathing with lower chest wall in drawing with or without fast breathing"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_diagnosis_of_pneumonia_now@@severe
          patient_has_diagnosis_of_pneumonia_now@@diagnosed_according_to_world_health_organization_criteria)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have severe pneumonia according to World Health Organization criteria"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_attended_institute_of_child_health_between_08_00_and_16_00_sunday_to_saturday Bool) ;; {"when_to_set_to_true":"Set to true if the patient attended Institute of Child Health between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","when_to_set_to_false":"Set to false if the patient did not attend Institute of Child Health between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient attended Institute of Child Health between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","meaning":"Boolean indicating whether the patient attended Institute of Child Health between 8:00 am and 4:00 pm on any day from Sunday through Saturday."} // "the patient must attend ... Institute of Child Health ... between 8:00 am to 4:00 pm (Sunday through Saturday)"
(declare-const patient_attended_radda_clinic_between_08_00_and_16_00_sunday_to_saturday Bool) ;; {"when_to_set_to_true":"Set to true if the patient attended Radda Clinic between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","when_to_set_to_false":"Set to false if the patient did not attend Radda Clinic between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient attended Radda Clinic between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","meaning":"Boolean indicating whether the patient attended Radda Clinic between 8:00 am and 4:00 pm on any day from Sunday through Saturday."} // "the patient must attend Radda Clinic ... between 8:00 am to 4:00 pm (Sunday through Saturday)"
(declare-const patient_attended_shishu_hospital_between_08_00_and_16_00_sunday_to_saturday Bool) ;; {"when_to_set_to_true":"Set to true if the patient attended Shishu Hospital between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","when_to_set_to_false":"Set to false if the patient did not attend Shishu Hospital between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient attended Shishu Hospital between 8:00 am and 4:00 pm on any day from Sunday through Saturday.","meaning":"Boolean indicating whether the patient attended Shishu Hospital between 8:00 am and 4:00 pm on any day from Sunday through Saturday."} // "the patient must attend ... Shishu Hospital between 8:00 am to 4:00 pm (Sunday through Saturday)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must attend Radda Clinic and Institute of Child Health and Shishu Hospital between 8:00 am to 4:00 pm (Sunday through Saturday).
(assert
  (! (and patient_attended_radda_clinic_between_08_00_and_16_00_sunday_to_saturday
          patient_attended_institute_of_child_health_between_08_00_and_16_00_sunday_to_saturday
          patient_attended_shishu_hospital_between_08_00_and_16_00_sunday_to_saturday)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must attend Radda Clinic and Institute of Child Health and Shishu Hospital between 8:00 am to 4:00 pm (Sunday through Saturday)"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const written_informed_consent_provided_by_parents_or_guardians_of_patient Bool) ;; {"when_to_set_to_true":"Set to true if written informed consent has been provided by the parents or guardians of the patient.","when_to_set_to_false":"Set to false if written informed consent has not been provided by the parents or guardians of the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether written informed consent has been provided by the parents or guardians of the patient.","meaning":"Boolean indicating whether written informed consent has been provided by the parents or guardians of the patient."} // "written informed consent provided by the parents or guardians of the patient"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! written_informed_consent_provided_by_parents_or_guardians_of_patient
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have written informed consent provided by the parents or guardians of the patient."
