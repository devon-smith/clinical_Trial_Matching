;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

;; Age variables
(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "child aged (≥ 6 months AND ≤ 10 years)"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "child aged (≥ 6 months AND ≤ 10 years)"

;; Community-acquired pneumonia diagnosis variables
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of community-acquired pneumonia."} ;; "present with community-acquired pneumonia"
(declare-const patient_has_diagnosis_of_community_acquired_pneumonia_now@@diagnosed_by_attending_emergency_department_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of community-acquired pneumonia was made by the attending emergency department physician.","when_to_set_to_false":"Set to false if the patient's diagnosis of community-acquired pneumonia was not made by the attending emergency department physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was made by the attending emergency department physician.","meaning":"Boolean indicating whether the patient's diagnosis of community-acquired pneumonia was made by the attending emergency department physician."} ;; "the attending emergency department physician diagnoses the patient with primary community-acquired pneumonia"

;; Fever variables
(declare-const patient_has_finding_of_fever_inthepast2days Bool) ;; {"when_to_set_to_true":"Set to true if the patient had a finding of fever recorded in the past 2 days.","when_to_set_to_false":"Set to false if the patient did not have a finding of fever recorded in the past 2 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a finding of fever recorded in the past 2 days.","meaning":"Boolean indicating whether the patient had a finding of fever recorded in the past 2 days."} ;; "fever (axillary temperature > 37.5 degrees Celsius OR oral temperature > 37.7 degrees Celsius OR rectal temperature > 38 degrees Celsius) recorded (in the emergency department OR at home) in the 48 hours prior to presentation"
(declare-const patient_has_finding_of_fever_inthepast2days@@recorded_in_emergency_department_or_at_home Bool) ;; {"when_to_set_to_true":"Set to true if the patient's fever in the past 2 days was recorded in the emergency department or at home.","when_to_set_to_false":"Set to false if the patient's fever in the past 2 days was not recorded in the emergency department or at home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fever was recorded in the emergency department or at home.","meaning":"Boolean indicating whether the patient's fever in the past 2 days was recorded in the emergency department or at home."} ;; "fever ... recorded (in the emergency department OR at home)"

(declare-const patient_axillary_temperature_value_recorded_past_48_hours_in_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's axillary temperature in degrees Celsius if recorded in the past 48 hours.","when_to_set_to_null":"Set to null if the patient's axillary temperature in the past 48 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's axillary temperature recorded in the past 48 hours in degrees Celsius."} ;; "axillary temperature > 37.5 degrees Celsius"
(declare-const patient_axillary_temperature_value_recorded_past_48_hours_in_celsius@@recorded_in_emergency_department_or_at_home Real) ;; {"when_to_set_to_value":"Set to the patient's axillary temperature in degrees Celsius if recorded in the past 48 hours in the emergency department or at home.","when_to_set_to_null":"Set to null if the patient's axillary temperature in the past 48 hours in the emergency department or at home is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's axillary temperature recorded in the past 48 hours in the emergency department or at home in degrees Celsius."} ;; "axillary temperature ... recorded (in the emergency department OR at home)"

(declare-const patient_oral_temperature_value_recorded_past_48_hours_in_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's oral temperature in degrees Celsius if recorded in the past 48 hours.","when_to_set_to_null":"Set to null if the patient's oral temperature in the past 48 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's oral temperature recorded in the past 48 hours in degrees Celsius."} ;; "oral temperature > 37.7 degrees Celsius"
(declare-const patient_oral_temperature_value_recorded_past_48_hours_in_celsius@@recorded_in_emergency_department_or_at_home Real) ;; {"when_to_set_to_value":"Set to the patient's oral temperature in degrees Celsius if recorded in the past 48 hours in the emergency department or at home.","when_to_set_to_null":"Set to null if the patient's oral temperature in the past 48 hours in the emergency department or at home is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's oral temperature recorded in the past 48 hours in the emergency department or at home in degrees Celsius."} ;; "oral temperature ... recorded (in the emergency department OR at home)"

(declare-const patient_rectal_temperature_value_recorded_past_48_hours_in_celsius Real) ;; {"when_to_set_to_value":"Set to the patient's rectal temperature in degrees Celsius if recorded in the past 48 hours.","when_to_set_to_null":"Set to null if the patient's rectal temperature in the past 48 hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's rectal temperature recorded in the past 48 hours in degrees Celsius."} ;; "rectal temperature > 38 degrees Celsius"
(declare-const patient_rectal_temperature_value_recorded_past_48_hours_in_celsius@@recorded_in_emergency_department_or_at_home Real) ;; {"when_to_set_to_value":"Set to the patient's rectal temperature in degrees Celsius if recorded in the past 48 hours in the emergency department or at home.","when_to_set_to_null":"Set to null if the patient's rectal temperature in the past 48 hours in the emergency department or at home is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's rectal temperature recorded in the past 48 hours in the emergency department or at home in degrees Celsius."} ;; "rectal temperature ... recorded (in the emergency department OR at home)"

;; Tachypnoea variables
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of tachypnoea.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of tachypnoea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of tachypnoea.","meaning":"Boolean indicating whether the patient currently has a finding of tachypnoea."} ;; "tachypnoea on examination"
(declare-const patient_has_finding_of_tachypnea_now@@present_on_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tachypnoea is present on examination.","when_to_set_to_false":"Set to false if the patient's tachypnoea is not present on examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tachypnoea is present on examination.","meaning":"Boolean indicating whether the patient's tachypnoea is present on examination."} ;; "tachypnoea on examination"

(declare-const patient_respiratory_rate_value_recorded_now_in_beats_per_minute Real) ;; {"when_to_set_to_value":"Set to the patient's respiratory rate in beats per minute if recorded now.","when_to_set_to_null":"Set to null if the patient's respiratory rate recorded now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's respiratory rate recorded now in beats per minute."} ;; "respiratory rate > ..."

;; Cough variables
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of cough.","when_to_set_to_false":"Set to false if the patient currently does not have a finding of cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of cough.","meaning":"Boolean indicating whether the patient currently has a finding of cough."} ;; "cough (on examination OR by history)"
(declare-const patient_has_finding_of_cough_now@@present_on_examination_or_by_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient's cough is present on examination or by history.","when_to_set_to_false":"Set to false if the patient's cough is not present on examination or by history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cough is present on examination or by history.","meaning":"Boolean indicating whether the patient's cough is present on examination or by history."} ;; "cough (on examination OR by history)"

;; Increased work of breathing variables
(declare-const patient_has_finding_of_increased_work_of_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has increased work of breathing.","when_to_set_to_false":"Set to false if the patient currently does not have increased work of breathing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased work of breathing.","meaning":"Boolean indicating whether the patient currently has increased work of breathing."} ;; "increased work of breathing on examination"
(declare-const patient_has_finding_of_increased_work_of_breathing_now@@present_on_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's increased work of breathing is present on examination.","when_to_set_to_false":"Set to false if the patient's increased work of breathing is not present on examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the increased work of breathing is present on examination.","meaning":"Boolean indicating whether the patient's increased work of breathing is present on examination."} ;; "increased work of breathing on examination"

;; Auscultatory findings variables
(declare-const patient_has_finding_of_auscultatory_signs_consistent_with_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has auscultatory findings (such as focal crackles or bronchial breathing) consistent with pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have auscultatory findings consistent with pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has auscultatory findings consistent with pneumonia.","meaning":"Boolean indicating whether the patient currently has auscultatory findings consistent with pneumonia."} ;; "auscultatory findings (with non-exhaustive examples (focal crackles, bronchial breathing)) consistent with pneumonia"

;; Infiltrates on chest radiograph variables
(declare-const patient_has_finding_of_infiltrates_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has infiltrates on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have infiltrates on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has infiltrates on chest radiograph.","meaning":"Boolean indicating whether the patient currently has infiltrates on chest radiograph."} ;; "infiltrates on chest radiograph consistent with bacterial community-acquired pneumonia as judged by the emergency department physician"
(declare-const patient_has_finding_of_infiltrates_on_chest_radiograph_now@@consistent_with_bacterial_community_acquired_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the infiltrates on chest radiograph are consistent with bacterial community-acquired pneumonia.","when_to_set_to_false":"Set to false if the infiltrates on chest radiograph are not consistent with bacterial community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infiltrates on chest radiograph are consistent with bacterial community-acquired pneumonia.","meaning":"Boolean indicating whether the infiltrates on chest radiograph are consistent with bacterial community-acquired pneumonia."} ;; "infiltrates on chest radiograph consistent with bacterial community-acquired pneumonia"
(declare-const patient_has_finding_of_infiltrates_on_chest_radiograph_now@@judged_by_emergency_department_physician Bool) ;; {"when_to_set_to_true":"Set to true if the consistency of infiltrates with bacterial community-acquired pneumonia is judged by the emergency department physician.","when_to_set_to_false":"Set to false if the consistency of infiltrates with bacterial community-acquired pneumonia is not judged by the emergency department physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the consistency of infiltrates with bacterial community-acquired pneumonia is judged by the emergency department physician.","meaning":"Boolean indicating whether the consistency of infiltrates with bacterial community-acquired pneumonia is judged by the emergency department physician."} ;; "as judged by the emergency department physician"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_community_acquired_pneumonia_now@@diagnosed_by_attending_emergency_department_physician
         patient_has_diagnosis_of_community_acquired_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "the attending emergency department physician diagnoses the patient with primary community-acquired pneumonia"

(assert
  (! (=> patient_has_finding_of_fever_inthepast2days@@recorded_in_emergency_department_or_at_home
         patient_has_finding_of_fever_inthepast2days)
     :named REQ0_AUXILIARY1)) ;; "fever ... recorded (in the emergency department OR at home)"

(assert
  (! (=> patient_has_finding_of_tachypnea_now@@present_on_examination
         patient_has_finding_of_tachypnea_now)
     :named REQ0_AUXILIARY2)) ;; "tachypnoea on examination"

(assert
  (! (=> patient_has_finding_of_cough_now@@present_on_examination_or_by_history
         patient_has_finding_of_cough_now)
     :named REQ0_AUXILIARY3)) ;; "cough (on examination OR by history)"

(assert
  (! (=> patient_has_finding_of_increased_work_of_breathing_now@@present_on_examination
         patient_has_finding_of_increased_work_of_breathing_now)
     :named REQ0_AUXILIARY4)) ;; "increased work of breathing on examination"

(assert
  (! (=> patient_has_finding_of_infiltrates_on_chest_radiograph_now@@consistent_with_bacterial_community_acquired_pneumonia
         patient_has_finding_of_infiltrates_on_chest_radiograph_now)
     :named REQ0_AUXILIARY5)) ;; "infiltrates on chest radiograph consistent with bacterial community-acquired pneumonia"

(assert
  (! (=> patient_has_finding_of_infiltrates_on_chest_radiograph_now@@judged_by_emergency_department_physician
         patient_has_finding_of_infiltrates_on_chest_radiograph_now)
     :named REQ0_AUXILIARY6)) ;; "as judged by the emergency department physician"

;; Non-exhaustive examples for auscultatory findings (focal crackles, bronchial breathing) imply umbrella
(declare-const patient_has_finding_of_focal_crackles_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has focal crackles on auscultation.","when_to_set_to_false":"Set to false if the patient currently does not have focal crackles on auscultation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has focal crackles on auscultation.","meaning":"Boolean indicating whether the patient currently has focal crackles on auscultation."} ;; "focal crackles"
(declare-const patient_has_finding_of_bronchial_breathing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bronchial breathing on auscultation.","when_to_set_to_false":"Set to false if the patient currently does not have bronchial breathing on auscultation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bronchial breathing on auscultation.","meaning":"Boolean indicating whether the patient currently has bronchial breathing on auscultation."} ;; "bronchial breathing"

(assert
  (! (=> (or patient_has_finding_of_focal_crackles_now
             patient_has_finding_of_bronchial_breathing_now)
         patient_has_finding_of_auscultatory_signs_consistent_with_pneumonia_now)
     :named REQ0_AUXILIARY7)) ;; "auscultatory findings (with non-exhaustive examples (focal crackles, bronchial breathing)) consistent with pneumonia"

;; Definition of fever in the past 48 hours (in ED or at home)
(assert
  (! (= patient_has_finding_of_fever_inthepast2days@@recorded_in_emergency_department_or_at_home
        (or (> patient_axillary_temperature_value_recorded_past_48_hours_in_celsius@@recorded_in_emergency_department_or_at_home 37.5)
            (> patient_oral_temperature_value_recorded_past_48_hours_in_celsius@@recorded_in_emergency_department_or_at_home 37.7)
            (> patient_rectal_temperature_value_recorded_past_48_hours_in_celsius@@recorded_in_emergency_department_or_at_home 38.0)))
     :named REQ0_AUXILIARY8)) ;; "fever (axillary temperature > 37.5 degrees Celsius OR oral temperature > 37.7 degrees Celsius OR rectal temperature > 38 degrees Celsius) recorded (in the emergency department OR at home) in the 48 hours prior to presentation"

;; Definition of tachypnoea by age
(define-fun patient_has_finding_of_tachypnea_now@@present_on_examination_by_age () Bool
  (or
    (and (< patient_age_value_recorded_now_in_years 1)
         (> patient_respiratory_rate_value_recorded_now_in_beats_per_minute 60))
    (and (>= patient_age_value_recorded_now_in_years 1)
         (< patient_age_value_recorded_now_in_years 2)
         (> patient_respiratory_rate_value_recorded_now_in_beats_per_minute 50))
    (and (>= patient_age_value_recorded_now_in_years 2)
         (< patient_age_value_recorded_now_in_years 4)
         (> patient_respiratory_rate_value_recorded_now_in_beats_per_minute 40))
    (and (>= patient_age_value_recorded_now_in_years 4)
         (> patient_respiratory_rate_value_recorded_now_in_beats_per_minute 30))
  )
) ;; "tachypnoea on examination (respiratory rate > 60 beats per minute for age < 1 year OR respiratory rate > 50 beats per minute for age 1-2 years OR respiratory rate > 40 beats per minute for age 2-4 years OR respiratory rate > 30 beats per minute for age > 4 years)"

(assert
  (! (= patient_has_finding_of_tachypnea_now@@present_on_examination
        patient_has_finding_of_tachypnea_now@@present_on_examination_by_age)
     :named REQ0_AUXILIARY9)) ;; "tachypnoea on examination (respiratory rate ... by age)"

;; Definition of "at least one of" the four findings (tachypnoea, cough, increased work of breathing, auscultatory findings)
(define-fun patient_meets_any_of_4_pneumonia_findings_now () Bool
  (or patient_has_finding_of_tachypnea_now@@present_on_examination
      patient_has_finding_of_cough_now@@present_on_examination_or_by_history
      patient_has_finding_of_increased_work_of_breathing_now@@present_on_examination
      patient_has_finding_of_auscultatory_signs_consistent_with_pneumonia_now)
) ;; "at least one of the following: (tachypnoea ... OR cough ... OR increased work of breathing ... OR auscultatory findings ...)"

;; Definition of "infiltrates on chest radiograph consistent with bacterial community-acquired pneumonia as judged by the emergency department physician"
(assert
  (! (= patient_has_finding_of_infiltrates_on_chest_radiograph_now@@consistent_with_bacterial_community_acquired_pneumonia
        (and patient_has_finding_of_infiltrates_on_chest_radiograph_now
             patient_has_finding_of_infiltrates_on_chest_radiograph_now@@judged_by_emergency_department_physician))
     :named REQ0_AUXILIARY10)) ;; "infiltrates on chest radiograph consistent with bacterial community-acquired pneumonia as judged by the emergency department physician"

;; Definition of community-acquired pneumonia as meeting all four numeric criteria
(define-fun patient_meets_community_acquired_pneumonia_numeric_criteria () Bool
  (and
    patient_has_finding_of_fever_inthepast2days@@recorded_in_emergency_department_or_at_home
    patient_meets_any_of_4_pneumonia_findings_now
    patient_has_finding_of_infiltrates_on_chest_radiograph_now@@consistent_with_bacterial_community_acquired_pneumonia
    patient_has_diagnosis_of_community_acquired_pneumonia_now@@diagnosed_by_attending_emergency_department_physician
  )
) ;; "community-acquired pneumonia is defined as meeting ALL of the following four numeric criteria: ..."

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: Age (child aged ≥ 6 months AND ≤ 10 years)
(assert
  (! (and (>= patient_age_value_recorded_now_in_months 6)
          (<= patient_age_value_recorded_now_in_years 10))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "child aged (≥ 6 months AND ≤ 10 years)"

;; Component 1: Must present with community-acquired pneumonia (as defined)
(assert
  (! patient_meets_community_acquired_pneumonia_numeric_criteria
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "present with community-acquired pneumonia (community-acquired pneumonia is defined as meeting ALL of the following four numeric criteria: ...)"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_been_discharged_home_by_emergency_department_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been discharged home by the emergency department physician now.","when_to_set_to_false":"Set to false if the patient has not been discharged home by the emergency department physician now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been discharged home by the emergency department physician now.","meaning":"Boolean indicating whether the patient has been discharged home by the emergency department physician now."} ;; "discharged home by the emergency department physician"
(declare-const patient_has_adequate_volume_status_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has adequate volume status.","when_to_set_to_false":"Set to false if the patient currently does not have adequate volume status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has adequate volume status.","meaning":"Boolean indicating whether the patient currently has adequate volume status."} ;; "adequate volume status"
(declare-const patient_is_able_to_tolerate_oral_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to tolerate oral medication.","when_to_set_to_false":"Set to false if the patient is currently unable to tolerate oral medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to tolerate oral medication.","meaning":"Boolean indicating whether the patient is currently able to tolerate oral medication."} ;; "able to tolerate oral medication"
(declare-const patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's hemoglobin oxygen saturation is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current hemoglobin oxygen saturation."} ;; "oxygen saturation > 90 percent"
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} ;; "evidence of impending respiratory failure"
(declare-const patient_has_finding_of_respiratory_failure_now@@impending Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impending respiratory failure.","when_to_set_to_false":"Set to false if the patient currently has respiratory failure but it is not impending, or does not have respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's respiratory failure is impending.","meaning":"Boolean indicating whether the patient's current respiratory failure is impending."} ;; "evidence of impending respiratory failure"
(declare-const patient_has_finding_of_empyema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of empyema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of empyema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has empyema.","meaning":"Boolean indicating whether the patient currently has empyema."} ;; "evidence of empyema"
(declare-const patient_has_finding_of_necrotizing_pneumonia_on_chest_radiograph_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of necrotizing pneumonia on chest radiograph.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of necrotizing pneumonia on chest radiograph.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of necrotizing pneumonia on chest radiograph.","meaning":"Boolean indicating whether the patient currently has evidence of necrotizing pneumonia on chest radiograph."} ;; "evidence of necrotizing pneumonia on chest radiograph"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_respiratory_failure_now@@impending
         patient_has_finding_of_respiratory_failure_now)
     :named REQ1_AUXILIARY0)) ;; "evidence of impending respiratory failure"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: ALL of the following must be true for outpatient eligibility
(assert
  (! (and
        patient_has_been_discharged_home_by_emergency_department_physician_now
        ;; "discharged home by the emergency department physician"
        patient_has_adequate_volume_status_now
        ;; "adequate volume status"
        patient_is_able_to_tolerate_oral_medication_now
        ;; "able to tolerate oral medication"
        (> patient_hemoglobin_saturation_with_oxygen_value_recorded_now_withunit_percent 90.0)
        ;; "oxygen saturation > 90 percent"
        (not patient_has_finding_of_respiratory_failure_now@@impending)
        ;; "NOT (evidence of impending respiratory failure)"
        (not (or patient_has_finding_of_empyema_now
                 patient_has_finding_of_necrotizing_pneumonia_on_chest_radiograph_now))
        ;; "NOT (evidence of empyema OR evidence of necrotizing pneumonia on chest radiograph)"
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be well enough to be treated as an outpatient (defined as ALL of the following: ...)"
