;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one clinical problem now.","when_to_set_to_false":"Set to false if the patient currently does not have any clinical problem now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any clinical problem now.","meaning":"Boolean indicating whether the patient currently has at least one clinical problem now."} ;; "the patient has at least one of the following problems"

(declare-const patient_has_undergone_history_taking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a history taking interview now.","when_to_set_to_false":"Set to false if the patient has not undergone a history taking interview now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a history taking interview now.","meaning":"Boolean indicating whether the patient has undergone a history taking interview now."} ;; "based on interview"

(declare-const patient_has_undergone_history_taking_self_administered_questionnaire_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a self-administered history taking questionnaire now.","when_to_set_to_false":"Set to false if the patient has not undergone a self-administered history taking questionnaire now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a self-administered history taking questionnaire now.","meaning":"Boolean indicating whether the patient has undergone a self-administered history taking questionnaire now."} ;; "based on questionnaire"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and
         (or patient_has_undergone_history_taking_now
             patient_has_undergone_history_taking_self_administered_questionnaire_now)
         patient_has_finding_of_problem_now))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((based on interview OR based on questionnaire) AND (the patient has at least one of the following problems))."

;; ===================== Declarations for the exclusion criterion (REQ 1, COMPONENT 3) =====================
(declare-const patients_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the patient's current systolic blood pressure value in millimeters of mercury.","when_to_set_to_null":"Set to null if the patient's current systolic blood pressure value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current systolic blood pressure in millimeters of mercury."} ;; "systolic blood pressure > 160 millimeters of mercury"
(declare-const patients_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the patient's current diastolic blood pressure value in millimeters of mercury.","when_to_set_to_null":"Set to null if the patient's current diastolic blood pressure value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the patient's current diastolic blood pressure in millimeters of mercury."} ;; "diastolic blood pressure > 100 millimeters of mercury"

;; ===================== Constraint Assertions (REQ 1, COMPONENT 3) =====================
(assert
(! (not (or
         (> patients_systolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 160) ;; "systolic blood pressure > 160 millimeters of mercury"
         (> patients_diastolic_blood_pressure_value_recorded_now_withunit_millimeters_of_mercury 100) ;; "diastolic blood pressure > 100 millimeters of mercury"
      ))
   :named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has (systolic blood pressure > 160 millimeters of mercury) OR (diastolic blood pressure > 100 millimeters of mercury) as known by the patient, whether on OR off treatment for hypertension."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_prescription_medication_affecting_body_weight_or_glucose_metabolism_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used any prescription medication within the previous 3 months that has the potential to affect body weight or glucose metabolism.","when_to_set_to_false":"Set to false if the patient has not used any prescription medication within the previous 3 months that has the potential to affect body weight or glucose metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any prescription medication within the previous 3 months that has the potential to affect body weight or glucose metabolism.","meaning":"Boolean indicating whether the patient is currently using or has used any prescription medication within the previous 3 months that has the potential to affect body weight or glucose metabolism."} ;; "any prescription medication that has the potential of affecting body weight OR glucose metabolism"

(declare-const patient_is_taking_glucocorticoid_containing_product_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used any glucocorticoid-containing product within the previous 3 months.","when_to_set_to_false":"Set to false if the patient has not used any glucocorticoid-containing product within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any glucocorticoid-containing product within the previous 3 months.","meaning":"Boolean indicating whether the patient is currently using or has used any glucocorticoid-containing product within the previous 3 months."} ;; "glucocorticoid medication"

(declare-const patient_is_taking_glucocorticoid_containing_product_inthepast3months@@excludes_inhaled_steroid_medication Bool) ;; {"when_to_set_to_true":"Set to true if inhaled steroid medications are excluded from the glucocorticoid-containing products considered in this variable.","when_to_set_to_false":"Set to false if inhaled steroid medications are not excluded.","when_to_set_to_null":"Set to null if it is unknown whether inhaled steroid medications are excluded.","meaning":"Boolean indicating whether inhaled steroid medications are excluded from the glucocorticoid-containing products considered in this variable."} ;; "excluding inhaled steroid medication"

(declare-const patient_is_taking_glucocorticoid_containing_product_inthepast3months@@excludes_topical_steroid_medication Bool) ;; {"when_to_set_to_true":"Set to true if topical steroid medications are excluded from the glucocorticoid-containing products considered in this variable.","when_to_set_to_false":"Set to false if topical steroid medications are not excluded.","when_to_set_to_null":"Set to null if it is unknown whether topical steroid medications are excluded.","meaning":"Boolean indicating whether topical steroid medications are excluded from the glucocorticoid-containing products considered in this variable."} ;; "excluding topical steroid medication"

(declare-const patient_is_exposed_to_bronchodilator_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used any bronchodilator substance within the previous 3 months.","when_to_set_to_false":"Set to false if the patient has not used any bronchodilator substance within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any bronchodilator substance within the previous 3 months.","meaning":"Boolean indicating whether the patient is currently using or has used any bronchodilator substance within the previous 3 months."} ;; "bronchodilator medication is allowed"

(declare-const patient_is_exposed_to_psychoactive_substance_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used any psychoactive substance within the previous 3 months.","when_to_set_to_false":"Set to false if the patient has not used any psychoactive substance within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any psychoactive substance within the previous 3 months.","meaning":"Boolean indicating whether the patient is currently using or has used any psychoactive substance within the previous 3 months."} ;; "psychoactive medication"

(declare-const patient_is_exposed_to_anticonvulsant_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used any anticonvulsant substance within the previous 3 months.","when_to_set_to_false":"Set to false if the patient has not used any anticonvulsant substance within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any anticonvulsant substance within the previous 3 months.","meaning":"Boolean indicating whether the patient is currently using or has used any anticonvulsant substance within the previous 3 months."} ;; "antiepileptic medication"

(declare-const patient_is_exposed_to_weight_loss_medication_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used any weight loss medication within the previous 3 months, including prescription medication, over the counter medication, or herbal medication.","when_to_set_to_false":"Set to false if the patient has not used any weight loss medication within the previous 3 months, including prescription medication, over the counter medication, or herbal medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any weight loss medication within the previous 3 months, including prescription medication, over the counter medication, or herbal medication.","meaning":"Boolean indicating whether the patient is currently using or has used any weight loss medication within the previous 3 months, including prescription medication, over the counter medication, or herbal medication."} ;; "weight loss medication (either prescription medication OR over the counter medication OR herbal medication)"

(declare-const patient_is_exposed_to_low_dose_antidepressant_medication_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used any low dose antidepressant medication within the previous 3 months.","when_to_set_to_false":"Set to false if the patient has not used any low dose antidepressant medication within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any low dose antidepressant medication within the previous 3 months.","meaning":"Boolean indicating whether the patient is currently using or has used any low dose antidepressant medication within the previous 3 months."} ;; "low dose antidepressant medication"

(declare-const patient_is_exposed_to_low_dose_antidepressant_medication_inthepast3months@@does_not_affect_body_weight_or_study_participation_investigator_judgement Bool) ;; {"when_to_set_to_true":"Set to true if, in the judgement of the investigator, the low dose antidepressant medication does not affect body weight or participation in the study protocol.","when_to_set_to_false":"Set to false if, in the judgement of the investigator, the low dose antidepressant medication does affect body weight or participation in the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the judgement of the investigator, the low dose antidepressant medication affects body weight or participation in the study protocol.","meaning":"Boolean indicating whether, in the judgement of the investigator, the low dose antidepressant medication does not affect body weight or participation in the study protocol."} ;; "if, in the judgement of the investigator, it does NOT affect body weight OR participation to the study protocol"

(declare-const patient_is_exposed_to_levothyroxine_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using or has used levothyroxine within the previous 3 months.","when_to_set_to_false":"Set to false if the patient has not used levothyroxine within the previous 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used levothyroxine within the previous 3 months.","meaning":"Boolean indicating whether the patient is currently using or has used levothyroxine within the previous 3 months."} ;; "levothyroxine for treatment of hypothyroidism"

(declare-const patient_is_exposed_to_levothyroxine_inthepast3months@@for_treatment_of_hypothyroidism Bool) ;; {"when_to_set_to_true":"Set to true if levothyroxine is being used for the treatment of hypothyroidism.","when_to_set_to_false":"Set to false if levothyroxine is not being used for the treatment of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown whether levothyroxine is being used for the treatment of hypothyroidism.","meaning":"Boolean indicating whether levothyroxine is being used for the treatment of hypothyroidism."} ;; "for treatment of hypothyroidism"

(declare-const patient_is_exposed_to_levothyroxine_inthepast3months@@stable_dose_for_at_least_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been on a stable dose of levothyroxine for at least 3 months.","when_to_set_to_false":"Set to false if the patient has not been on a stable dose for at least 3 months.","when_to_set_to_null":"Set to null if it is unknown whether the patient has been on a stable dose for at least 3 months.","meaning":"Boolean indicating whether the patient has been on a stable dose of levothyroxine for at least 3 months."} ;; "if the patient has been on a stable dose for at least 3 months"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or 
         (and patient_is_taking_glucocorticoid_containing_product_inthepast3months
              patient_is_taking_glucocorticoid_containing_product_inthepast3months@@excludes_inhaled_steroid_medication
              patient_is_taking_glucocorticoid_containing_product_inthepast3months@@excludes_topical_steroid_medication)
         patient_is_exposed_to_psychoactive_substance_inthepast3months
         patient_is_exposed_to_anticonvulsant_inthepast3months
         patient_is_exposed_to_weight_loss_medication_inthepast3months)
     patient_is_exposed_to_prescription_medication_affecting_body_weight_or_glucose_metabolism_inthepast3months)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples ((glucocorticoid medication excluding inhaled steroid medication AND excluding topical steroid medication; bronchodilator medication is allowed) OR (psychoactive medication) OR (antiepileptic medication) OR (weight loss medication (either prescription medication OR over the counter medication OR herbal medication)))"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_taking_glucocorticoid_containing_product_inthepast3months@@excludes_inhaled_steroid_medication
      patient_is_taking_glucocorticoid_containing_product_inthepast3months)
:named REQ2_AUXILIARY1)) ;; "excluding inhaled steroid medication"

(assert
(! (=> patient_is_taking_glucocorticoid_containing_product_inthepast3months@@excludes_topical_steroid_medication
      patient_is_taking_glucocorticoid_containing_product_inthepast3months)
:named REQ2_AUXILIARY2)) ;; "excluding topical steroid medication"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion with exceptions for low dose antidepressant (if does not affect body weight or study participation) and levothyroxine (if for hypothyroidism and stable dose for at least 3 months)
(assert
(! (not
      (or
        (and patient_is_exposed_to_prescription_medication_affecting_body_weight_or_glucose_metabolism_inthepast3months
             (not
               (or
                 (and patient_is_exposed_to_low_dose_antidepressant_medication_inthepast3months
                      patient_is_exposed_to_low_dose_antidepressant_medication_inthepast3months@@does_not_affect_body_weight_or_study_participation_investigator_judgement)
                 (and patient_is_exposed_to_levothyroxine_inthepast3months
                      patient_is_exposed_to_levothyroxine_inthepast3months@@for_treatment_of_hypothyroidism
                      patient_is_exposed_to_levothyroxine_inthepast3months@@stable_dose_for_at_least_3_months)
               )
             )
        )
      )
   )
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is currently using OR has used within the previous 3 months) any prescription medication that has the potential of affecting body weight OR glucose metabolism ... EXCEPT ((low dose antidepressant medication) IF (in the judgement of the investigator, it does NOT affect body weight OR participation to the study protocol)) EXCEPT ((levothyroxine for treatment of hypothyroidism) IF (the patient has been on a stable dose for at least 3 months))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_engagement_in_competitive_sports_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently engaged in competitive sports.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently engaged in competitive sports.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient is currently engaged in competitive sports.","meaning":"Boolean indicating whether the patient is currently engaged in competitive sports."} ;; "engagement in competitive sports"

(declare-const patient_weight_change_value_recorded_inthepast2months_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage change if a numeric measurement of body weight change (increase or decrease) within the past 2 months prior to screening is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's body weight change (increase or decrease) within the past 2 months prior to screening."} ;; "self-reported body weight change > 5 percent (increase OR decrease) within 2 months prior to screening"

(declare-const patient_has_special_diet_within_past_2_months_prior_to_study_start Bool) ;; {"when_to_set_to_true":"Set to true if the patient has followed a special diet (excluding lacto-vegetarian diet) within the past 2 months prior to study start.","when_to_set_to_false":"Set to false if the patient has not followed a special diet (excluding lacto-vegetarian diet) within the past 2 months prior to study start.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has followed a special diet (excluding lacto-vegetarian diet) within the past 2 months prior to study start.","meaning":"Boolean indicating whether the patient has followed a special diet (excluding lacto-vegetarian diet) within the past 2 months prior to study start."} ;; "special diet with non-exhaustive examples (vegan diet OR Atkins diet) within 2 months prior to study start; lacto-vegetarian diet is allowed"

(declare-const patient_has_severe_food_intolerance_expected_to_interfere_with_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a severe food intolerance expected to interfere with the study.","when_to_set_to_false":"Set to false if the patient does not have a severe food intolerance expected to interfere with the study.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has a severe food intolerance expected to interfere with the study.","meaning":"Boolean indicating whether the patient has a severe food intolerance expected to interfere with the study."} ;; "severe food intolerance expected to interfere with the study"

(declare-const patient_alcoholic_units_per_week_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the number of alcoholic units the patient regularly drinks per week at the current time.","when_to_set_to_null":"Set to null if the value is unknown or cannot be determined.","meaning":"Numeric value representing the number of alcoholic units the patient regularly drinks per week at the current time."} ;; "regularly drinking > 21 alcoholic units per week (men)" and "regularly drinking > 14 alcoholic units per week (women)"

(declare-const patient_sex_recorded_now Bool) ;; {"when_to_set_to_value":"Set to the patient's sex (male or female) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown or cannot be determined.","meaning":"Categorical value indicating the patient's sex (male or female) at the current time."} ;; "men" / "women" for alcohol thresholds

(declare-const patient_has_use_of_drug_of_abuse_within_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used a drug of abuse within the previous 12 months.","when_to_set_to_false":"Set to false if the patient has not used a drug of abuse within the previous 12 months.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has used a drug of abuse within the previous 12 months.","meaning":"Boolean indicating whether the patient has used a drug of abuse within the previous 12 months."} ;; "use of drug of abuse within the previous 12 months"

(declare-const patient_has_blood_donation_within_past_1_month_before_baseline_or_clinical_investigation_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has donated blood within the past 1 month before baseline or clinical investigation days.","when_to_set_to_false":"Set to false if the patient has not donated blood within the past 1 month before baseline or clinical investigation days.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has donated blood within the past 1 month before baseline or clinical investigation days.","meaning":"Boolean indicating whether the patient has donated blood within the past 1 month before baseline or clinical investigation days."} ;; "blood donation ... within the past 1 month before baseline or clinical investigation days"

(declare-const patient_has_blood_transfusion_within_past_1_month_before_baseline_or_clinical_investigation_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received a blood transfusion within the past 1 month before baseline or clinical investigation days.","when_to_set_to_false":"Set to false if the patient has not received a blood transfusion within the past 1 month before baseline or clinical investigation days.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient has received a blood transfusion within the past 1 month before baseline or clinical investigation days.","meaning":"Boolean indicating whether the patient has received a blood transfusion within the past 1 month before baseline or clinical investigation days."} ;; "blood transfusion ... within the past 1 month before baseline or clinical investigation days"

(declare-const patient_has_self_reported_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a self-reported eating disorder.","when_to_set_to_false":"Set to false if the patient does not currently have a self-reported eating disorder.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has a self-reported eating disorder.","meaning":"Boolean indicating whether the patient currently has a self-reported eating disorder."} ;; "self-reported eating disorder"

(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "pregnancy"

(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "lactation"

(declare-const patient_plans_to_become_pregnant_within_next_36_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient plans to become pregnant within the next 36 months.","when_to_set_to_false":"Set to false if the patient does not plan to become pregnant within the next 36 months.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient plans to become pregnant within the next 36 months.","meaning":"Boolean indicating whether the patient plans to become pregnant within the next 36 months."} ;; "plans to become pregnant within the next 36 months"

(declare-const patient_has_no_access_to_phone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no access to a phone.","when_to_set_to_false":"Set to false if the patient currently has access to a phone.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has access to a phone.","meaning":"Boolean indicating whether the patient currently has no access to a phone."} ;; "no access to phone"

(declare-const patient_has_no_access_to_internet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no access to the Internet.","when_to_set_to_false":"Set to false if the patient currently has access to the Internet.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has access to the Internet.","meaning":"Boolean indicating whether the patient currently has no access to the Internet."} ;; "no access to Internet"

(declare-const patient_has_inadequate_understanding_of_national_language_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inadequate understanding of the national language.","when_to_set_to_false":"Set to false if the patient currently has adequate understanding of the national language.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has inadequate understanding of the national language.","meaning":"Boolean indicating whether the patient currently has inadequate understanding of the national language."} ;; "inadequate understanding of national language"

(declare-const patient_has_psychological_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a psychological problem.","when_to_set_to_false":"Set to false if the patient currently does not have a psychological problem.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has a psychological problem.","meaning":"Boolean indicating whether the patient currently has a psychological problem."} ;; "psychological problem"

(declare-const patient_has_psychological_problem_now@@expected_to_lead_to_difficulty_in_complying_with_protocol_investigator_judgement Bool) ;; {"when_to_set_to_true":"Set to true if, in the judgement of the investigator, the patient's current psychological problem would lead to difficulty in complying with the protocol.","when_to_set_to_false":"Set to false if, in the judgement of the investigator, the patient's current psychological problem would not lead to difficulty in complying with the protocol.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether, in the judgement of the investigator, the patient's current psychological problem would lead to difficulty in complying with the protocol.","meaning":"Boolean indicating whether, in the judgement of the investigator, the patient's current psychological problem would lead to difficulty in complying with the protocol."} ;; "psychological problem ... which, in the judgement of the investigator, would lead to difficulty in complying with the protocol"

(declare-const patient_has_behavioral_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a behavioral problem.","when_to_set_to_false":"Set to false if the patient currently does not have a behavioral problem.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the patient currently has a behavioral problem.","meaning":"Boolean indicating whether the patient currently has a behavioral problem."} ;; "behavioral problem"

(declare-const patient_has_behavioral_problem_now@@expected_to_lead_to_difficulty_in_complying_with_protocol_investigator_judgement Bool) ;; {"when_to_set_to_true":"Set to true if, in the judgement of the investigator, the patient's current behavioral problem would lead to difficulty in complying with the protocol.","when_to_set_to_false":"Set to false if, in the judgement of the investigator, the patient's current behavioral problem would not lead to difficulty in complying with the protocol.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether, in the judgement of the investigator, the patient's current behavioral problem would lead to difficulty in complying with the protocol.","meaning":"Boolean indicating whether, in the judgement of the investigator, the patient's current behavioral problem would lead to difficulty in complying with the protocol."} ;; "behavioral problem ... which, in the judgement of the investigator, would lead to difficulty in complying with the protocol"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples for special diet: vegan diet or Atkins diet are only examples
;; (No explicit variables for vegan/Atkins diet, so no implication needed.)

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_psychological_problem_now@@expected_to_lead_to_difficulty_in_complying_with_protocol_investigator_judgement
       patient_has_psychological_problem_now)
:named REQ3_AUXILIARY0)) ;; "psychological problem ... which, in the judgement of the investigator, would lead to difficulty in complying with the protocol"

(assert
(! (=> patient_has_behavioral_problem_now@@expected_to_lead_to_difficulty_in_complying_with_protocol_investigator_judgement
       patient_has_behavioral_problem_now)
:named REQ3_AUXILIARY1)) ;; "behavioral problem ... which, in the judgement of the investigator, would lead to difficulty in complying with the protocol"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_engagement_in_competitive_sports_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "engagement in competitive sports"

(assert
(! (not (> (abs patient_weight_change_value_recorded_inthepast2months_withunit_percent) 5))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "self-reported body weight change > 5 percent (increase OR decrease) within 2 months prior to screening"

(assert
(! (not patient_has_special_diet_within_past_2_months_prior_to_study_start)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "special diet with non-exhaustive examples (vegan diet OR Atkins diet) within 2 months prior to study start; lacto-vegetarian diet is allowed"

(assert
(! (not patient_has_severe_food_intolerance_expected_to_interfere_with_study)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "severe food intolerance expected to interfere with the study"

;; Alcohol exclusion: men > 21 units/week, women > 14 units/week
(assert
(! (not (or (and (= patient_sex_recorded_now true) ; true = male, false = female
                 (> patient_alcoholic_units_per_week_value_recorded_now_withunit_unit 21))
            (and (= patient_sex_recorded_now false)
                 (> patient_alcoholic_units_per_week_value_recorded_now_withunit_unit 14))))
:named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "regularly drinking > 21 alcoholic units per week (men) OR regularly drinking > 14 alcoholic units per week (women)"

(assert
(! (not patient_has_use_of_drug_of_abuse_within_past_12_months)
:named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "use of drug of abuse within the previous 12 months"

(assert
(! (not (or patient_has_blood_donation_within_past_1_month_before_baseline_or_clinical_investigation_days
            patient_has_blood_transfusion_within_past_1_month_before_baseline_or_clinical_investigation_days))
:named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "(blood donation OR blood transfusion) within the past 1 month before baseline OR clinical investigation days"

(assert
(! (not patient_has_self_reported_eating_disorder_now)
:named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "self-reported eating disorder"

(assert
(! (not (or patient_is_pregnant_now
            patient_is_lactating_now
            patient_plans_to_become_pregnant_within_next_36_months))
:named REQ3_COMPONENT8_OTHER_REQUIREMENTS)) ;; "pregnancy OR lactation OR plans to become pregnant within the next 36 months"

(assert
(! (not (or patient_has_no_access_to_phone_now
            patient_has_no_access_to_internet_now))
:named REQ3_COMPONENT9_OTHER_REQUIREMENTS)) ;; "no access to phone OR no access to Internet"

(assert
(! (not patient_has_inadequate_understanding_of_national_language_now)
:named REQ3_COMPONENT10_OTHER_REQUIREMENTS)) ;; "inadequate understanding of national language"

(assert
(! (not (or patient_has_psychological_problem_now@@expected_to_lead_to_difficulty_in_complying_with_protocol_investigator_judgement
            patient_has_behavioral_problem_now@@expected_to_lead_to_difficulty_in_complying_with_protocol_investigator_judgement))
:named REQ3_COMPONENT11_OTHER_REQUIREMENTS)) ;; "(psychological problem OR behavioral problem) which, in the judgement of the investigator, would lead to difficulty in complying with the protocol"
