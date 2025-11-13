;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_length_of_gestation_at_birth_value_recorded_now_withunit_weeks Real) ;; {"when_to_set_to_value":"Set to the measured value in weeks if the patient's gestational age at birth is recorded.","when_to_set_to_null":"Set to null if the patient's gestational age at birth is not recorded or is indeterminate.","meaning":"Numeric value (in weeks) representing the patient's gestational age at birth."} // "birth gestational age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: birth gestational age ≥ 25 weeks
(assert
  (! (>= patient_length_of_gestation_at_birth_value_recorded_now_withunit_weeks 25.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have birth gestational age ≥ 25 weeks."

;; Component 1: birth gestational age ≤ 32 weeks
(assert
  (! (<= patient_length_of_gestation_at_birth_value_recorded_now_withunit_weeks 32.0)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have birth gestational age ≤ 32 weeks."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const corrected_gestational_age_value_recorded_now_in_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's corrected gestational age in weeks, as recorded at the current time.","when_to_set_to_null":"Set to null if the corrected gestational age in weeks is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value of the patient's corrected gestational age in weeks, recorded now."} // "corrected gestational age < 34 weeks"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (< corrected_gestational_age_value_recorded_now_in_weeks 34.0)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have corrected gestational age < 34 weeks."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const enteral_feeding_tolerated_duration_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the numeric value of the total duration (in hours) for which enteral feeding has been tolerated by the patient, as recorded in the clinical record.","when_to_set_to_null":"Set to null if the duration of enteral feeding tolerance is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the duration of enteral feeding tolerance in hours."} // "enteral feeding tolerated at a minimum of 10 milliliters per kilogram per day for a minimum of 48 hours"
(declare-const enteral_feeding_volume_per_kg_per_day_value_recorded_in_milliliters_per_kg_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value of enteral feeding volume tolerated by the patient, in milliliters per kilogram per day, as recorded in the clinical record.","when_to_set_to_null":"Set to null if the enteral feeding volume per kilogram per day is unknown, not documented, or cannot be determined.","meaning":"Numeric value of enteral feeding tolerated in milliliters per kilogram per day."} // "enteral feeding tolerated at a minimum of 10 milliliters per kilogram per day for a minimum of 48 hours"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have enteral feeding tolerated at a minimum of 10 milliliters per kilogram per day for a minimum of 48 hours.
(assert
  (! (and (>= enteral_feeding_volume_per_kg_per_day_value_recorded_in_milliliters_per_kg_per_day 10.0)
          (>= enteral_feeding_tolerated_duration_value_recorded_in_hours 48.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have enteral feeding tolerated at a minimum of 10 milliliters per kilogram per day for a minimum of 48 hours."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_feeding_intolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has feeding intolerance.","when_to_set_to_false":"Set to false if the patient currently does not have feeding intolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has feeding intolerance.","meaning":"Boolean indicating whether the patient currently has feeding intolerance."} // "feeding intolerance"
(declare-const patient_has_finding_of_feeding_intolerance_now@@leading_to_withholding_of_milk_feedings_on_two_evaluations_over_12_to_24_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's feeding intolerance leads to withholding of milk feedings on two evaluations over 12 to 24 hours.","when_to_set_to_false":"Set to false if the patient's feeding intolerance does not lead to withholding of milk feedings on two evaluations over 12 to 24 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's feeding intolerance leads to withholding of milk feedings on two evaluations over 12 to 24 hours.","meaning":"Boolean indicating whether the patient's feeding intolerance leads to withholding of milk feedings on two evaluations over 12 to 24 hours."} // "feeding intolerance leading to withholding of milk feedings on two evaluations over 12 to 24 hours"
(declare-const number_of_evaluations_with_withholding_of_milk_feedings_over_12_to_24_hours_value_recorded_now_withunit_count Int) ;; {"when_to_set_to_value":"Set to the number of evaluations with withholding of milk feedings over a 12 to 24 hour period, recorded now, in count units.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many evaluations with withholding of milk feedings occurred over a 12 to 24 hour period.","meaning":"Numeric value indicating the number of evaluations with withholding of milk feedings over a 12 to 24 hour period, recorded now, in count units."} // "withholding of milk feedings on two evaluations over 12 to 24 hours"
(declare-const patient_has_finding_of_significant_increase_in_abdominal_girth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a significant increase in abdominal girth.","when_to_set_to_false":"Set to false if the patient currently does not have a significant increase in abdominal girth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a significant increase in abdominal girth.","meaning":"Boolean indicating whether the patient currently has a significant increase in abdominal girth."} // "significant increased abdominal girth"
(declare-const patient_has_finding_of_significant_increase_in_abdominal_girth_now@@evaluated_by_treatment_team Bool) ;; {"when_to_set_to_true":"Set to true if the patient's significant increase in abdominal girth is evaluated by the treatment team.","when_to_set_to_false":"Set to false if the patient's significant increase in abdominal girth is not evaluated by the treatment team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the significant increase in abdominal girth is evaluated by the treatment team.","meaning":"Boolean indicating whether the patient's significant increase in abdominal girth is evaluated by the treatment team."} // "significant increased abdominal girth, as evaluated by the treatment team"
(declare-const patient_has_finding_of_significant_increase_in_abdominal_girth_now@@with_abdominal_tenderness Bool) ;; {"when_to_set_to_true":"Set to true if the patient's significant increase in abdominal girth is associated with abdominal tenderness.","when_to_set_to_false":"Set to false if the patient's significant increase in abdominal girth is not associated with abdominal tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the significant increase in abdominal girth is associated with abdominal tenderness.","meaning":"Boolean indicating whether the patient's significant increase in abdominal girth is associated with abdominal tenderness."} // "significant increased abdominal girth ... with abdominal tenderness"
(declare-const patient_has_finding_of_abdominal_tenderness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of abdominal tenderness.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of abdominal tenderness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has abdominal tenderness.","meaning":"Boolean indicating whether the patient currently has abdominal tenderness."} // "abdominal tenderness"
(declare-const patient_has_finding_of_abdominal_tenderness_now@@evaluated_by_treatment_team Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abdominal tenderness is evaluated by the treatment team.","when_to_set_to_false":"Set to false if the patient's abdominal tenderness is not evaluated by the treatment team.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abdominal tenderness is evaluated by the treatment team.","meaning":"Boolean indicating whether the patient's abdominal tenderness is evaluated by the treatment team."} // "abdominal tenderness evaluated by treatment team"
(declare-const patient_has_finding_of_dilatation_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of visible enlarged bowel loops (dilatation of intestine).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of visible enlarged bowel loops (dilatation of intestine).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visible enlarged bowel loops (dilatation of intestine).","meaning":"Boolean indicating whether the patient currently has visible enlarged bowel loops (dilatation of intestine)."} // "visible enlarged bowel loops"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} // "emesis"
(declare-const patient_has_finding_of_vomiting_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vomiting is recurrent.","when_to_set_to_false":"Set to false if the patient's vomiting is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vomiting is recurrent.","meaning":"Boolean indicating whether the patient's vomiting is recurrent."} // "recurrent emesis"
(declare-const patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastric residuals in excess of one feeding.","when_to_set_to_false":"Set to false if the patient currently does not have gastric residuals in excess of one feeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastric residuals in excess of one feeding.","meaning":"Boolean indicating whether the patient currently has gastric residuals in excess of one feeding."} // "gastric residuals in excess of one feeding"
(declare-const patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastric residuals in excess of one feeding are recurrent.","when_to_set_to_false":"Set to false if the patient's gastric residuals in excess of one feeding are not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastric residuals in excess of one feeding are recurrent.","meaning":"Boolean indicating whether the patient's gastric residuals in excess of one feeding are recurrent."} // "gastric residuals in excess of one feeding, recurrent"
(declare-const patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now@@with_growing_abdominal_girth Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastric residuals in excess of one feeding are associated with growing abdominal girth.","when_to_set_to_false":"Set to false if the patient's gastric residuals in excess of one feeding are not associated with growing abdominal girth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastric residuals in excess of one feeding are associated with growing abdominal girth.","meaning":"Boolean indicating whether the patient's gastric residuals in excess of one feeding are associated with growing abdominal girth."} // "gastric residuals in excess of one feeding ... with growing abdominal girth"
(declare-const patient_has_finding_of_growing_abdominal_girth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has growing abdominal girth.","when_to_set_to_false":"Set to false if the patient currently does not have growing abdominal girth.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has growing abdominal girth.","meaning":"Boolean indicating whether the patient currently has growing abdominal girth."} // "growing abdominal girth"
(declare-const patient_has_finding_of_hematochezia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of visible blood in stools (hematochezia).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of visible blood in stools (hematochezia).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has visible blood in stools (hematochezia).","meaning":"Boolean indicating whether the patient currently has visible blood in stools (hematochezia)."} // "visible blood in stools"
(declare-const patient_has_finding_of_hematochezia_now@@without_anal_etiology Bool) ;; {"when_to_set_to_true":"Set to true if the patient's visible blood in stools is without anal etiology.","when_to_set_to_false":"Set to false if the patient's visible blood in stools is with anal etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood in stools is without anal etiology.","meaning":"Boolean indicating whether the patient's visible blood in stools is without anal etiology."} // "visible blood in stools without anal etiology"
(declare-const patient_has_finding_of_withholding_of_milk_feedings_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has withholding of milk feedings.","when_to_set_to_false":"Set to false if the patient currently does not have withholding of milk feedings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has withholding of milk feedings.","meaning":"Boolean indicating whether the patient currently has withholding of milk feedings."} // "withholding of milk feedings"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply their stem variables
(assert
  (! (=> patient_has_finding_of_significant_increase_in_abdominal_girth_now@@evaluated_by_treatment_team
         patient_has_finding_of_significant_increase_in_abdominal_girth_now)
     :named REQ3_AUXILIARY0)) ;; "significant increased abdominal girth, as evaluated by the treatment team"

(assert
  (! (=> patient_has_finding_of_significant_increase_in_abdominal_girth_now@@with_abdominal_tenderness
         (and patient_has_finding_of_significant_increase_in_abdominal_girth_now
              patient_has_finding_of_abdominal_tenderness_now))
     :named REQ3_AUXILIARY1)) ;; "significant increased abdominal girth ... with abdominal tenderness"

(assert
  (! (=> patient_has_finding_of_abdominal_tenderness_now@@evaluated_by_treatment_team
         patient_has_finding_of_abdominal_tenderness_now)
     :named REQ3_AUXILIARY2)) ;; "abdominal tenderness evaluated by treatment team"

(assert
  (! (=> patient_has_finding_of_vomiting_now@@recurrent
         patient_has_finding_of_vomiting_now)
     :named REQ3_AUXILIARY3)) ;; "recurrent emesis"

(assert
  (! (=> patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now@@recurrent
         patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now)
     :named REQ3_AUXILIARY4)) ;; "gastric residuals in excess of one feeding, recurrent"

(assert
  (! (=> patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now@@with_growing_abdominal_girth
         (and patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now
              patient_has_finding_of_growing_abdominal_girth_now))
     :named REQ3_AUXILIARY5)) ;; "gastric residuals in excess of one feeding ... with growing abdominal girth"

(assert
  (! (=> patient_has_finding_of_hematochezia_now@@without_anal_etiology
         patient_has_finding_of_hematochezia_now)
     :named REQ3_AUXILIARY6)) ;; "visible blood in stools without anal etiology"

;; Definition: severe feeding intolerance (exhaustive subcategories)
;; The requirement defines "severe feeding intolerance" as at least one of the following signs (each leading to withholding of milk feedings on two evaluations over 12 to 24 hours):
;;   1. significant increased abdominal girth, as evaluated by the treatment team, with abdominal tenderness
;;   2. visible enlarged bowel loops with abdominal tenderness
;;   3. recurrent emesis leading to withholding of feeds
;;   4. gastric residuals in excess of one feeding, recurrent OR with growing abdominal girth
;;   5. visible blood in stools without anal etiology

;; For each, we define the Boolean for the sign being present and leading to withholding of milk feedings on two evaluations over 12 to 24 hours.

(define-fun severe_feeding_intolerance_sign1 () Bool
  (and patient_has_finding_of_significant_increase_in_abdominal_girth_now@@evaluated_by_treatment_team
       patient_has_finding_of_significant_increase_in_abdominal_girth_now@@with_abdominal_tenderness
       (>= number_of_evaluations_with_withholding_of_milk_feedings_over_12_to_24_hours_value_recorded_now_withunit_count 2)
  )
) ;; "significant increased abdominal girth, as evaluated by the treatment team, with abdominal tenderness, leading to withholding of milk feedings on two evaluations over 12 to 24 hours"

(define-fun severe_feeding_intolerance_sign2 () Bool
  (and patient_has_finding_of_dilatation_of_intestine_now
       patient_has_finding_of_abdominal_tenderness_now
       (>= number_of_evaluations_with_withholding_of_milk_feedings_over_12_to_24_hours_value_recorded_now_withunit_count 2)
  )
) ;; "visible enlarged bowel loops with abdominal tenderness, leading to withholding of milk feedings on two evaluations over 12 to 24 hours"

(define-fun severe_feeding_intolerance_sign3 () Bool
  (and patient_has_finding_of_vomiting_now@@recurrent
       (>= number_of_evaluations_with_withholding_of_milk_feedings_over_12_to_24_hours_value_recorded_now_withunit_count 2)
  )
) ;; "recurrent emesis leading to withholding of feeds on two evaluations over 12 to 24 hours"

(define-fun severe_feeding_intolerance_sign4 () Bool
  (and (or patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now@@recurrent
           patient_has_finding_of_gastric_residuals_in_excess_of_one_feeding_now@@with_growing_abdominal_girth)
       (>= number_of_evaluations_with_withholding_of_milk_feedings_over_12_to_24_hours_value_recorded_now_withunit_count 2)
  )
) ;; "gastric residuals in excess of one feeding, recurrent OR with growing abdominal girth, leading to withholding of milk feedings on two evaluations over 12 to 24 hours"

(define-fun severe_feeding_intolerance_sign5 () Bool
  (and patient_has_finding_of_hematochezia_now@@without_anal_etiology
       (>= number_of_evaluations_with_withholding_of_milk_feedings_over_12_to_24_hours_value_recorded_now_withunit_count 2)
  )
) ;; "visible blood in stools without anal etiology, leading to withholding of milk feedings on two evaluations over 12 to 24 hours"

;; Definition: severe feeding intolerance is present if at least one of the above signs is present
(assert
  (! (= patient_has_finding_of_feeding_intolerance_now@@leading_to_withholding_of_milk_feedings_on_two_evaluations_over_12_to_24_hours
        (or severe_feeding_intolerance_sign1
            severe_feeding_intolerance_sign2
            severe_feeding_intolerance_sign3
            severe_feeding_intolerance_sign4
            severe_feeding_intolerance_sign5))
     :named REQ3_AUXILIARY7)) ;; "severe feeding intolerance (defined as at least one of the following signs ... leading to withholding of milk feedings on two evaluations over 12 to 24 hours)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_feeding_intolerance_now@@leading_to_withholding_of_milk_feedings_on_two_evaluations_over_12_to_24_hours
         patient_has_finding_of_feeding_intolerance_now)
     :named REQ3_AUXILIARY8)) ;; "feeding intolerance leading to withholding of milk feedings on two evaluations over 12 to 24 hours" implies "feeding intolerance"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_feeding_intolerance_now@@leading_to_withholding_of_milk_feedings_on_two_evaluations_over_12_to_24_hours
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have severe feeding intolerance (defined as at least one of the following signs leading to withholding of milk feedings on two evaluations over 12 to 24 hours: ... )"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_documented_informed_consent_for_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has documented informed consent for participation in the study.","when_to_set_to_false":"Set to false if the patient does not have documented informed consent for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has documented informed consent for participation in the study.","meaning":"Boolean indicating whether the patient has documented informed consent for participation in the study."} // "the patient must have documented informed consent for participation in the study"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_has_documented_informed_consent_for_study_participation
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have documented informed consent for participation in the study"
