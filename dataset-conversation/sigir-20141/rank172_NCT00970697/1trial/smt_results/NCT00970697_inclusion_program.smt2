;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged greater than or equal to 18 years"
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently not able to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."} // "able to give informed consent"
(declare-const patient_is_able_to_follow_treatment_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to follow the treatment procedure.","when_to_set_to_false":"Set to false if the patient is currently not able to follow the treatment procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to follow the treatment procedure.","meaning":"Boolean indicating whether the patient is currently able to follow the treatment procedure."} // "able to follow the treatment procedure"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "be aged greater than or equal to 18 years"
(assert
  (! patient_is_able_to_give_informed_consent_now
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to give informed consent"
(assert
  (! patient_is_able_to_follow_treatment_procedure_now
     :named REQ0_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "be able to follow the treatment procedure"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_surface_area_of_ulcer_value_recorded_now_withunit_square_centimeter Real) ;; {"when_to_set_to_value":"Set to the measured value of the patient's target ulcer surface area in square centimeters, recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value (in square centimeters) of the patient's target ulcer surface area, recorded now."} // "target ulcer area"

;; ===================== Constraint Assertions (REQ 1) =====================
;; The patient must have a target ulcer area greater than or equal to 1 square centimeter and less than or equal to 30 square centimeters.
(assert
  (! (and (>= patient_surface_area_of_ulcer_value_recorded_now_withunit_square_centimeter 1.0)
          (<= patient_surface_area_of_ulcer_value_recorded_now_withunit_square_centimeter 30.0))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a target ulcer area greater than or equal to 1 square centimeter and less than or equal to 30 square centimeters"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hypertensive_ischemic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypertensive ischemic ulcer (hypertensive leg ulcer).","when_to_set_to_false":"Set to false if the patient currently does not have a hypertensive ischemic ulcer (hypertensive leg ulcer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypertensive ischemic ulcer (hypertensive leg ulcer).","meaning":"Boolean indicating whether the patient currently has a hypertensive ischemic ulcer (hypertensive leg ulcer)."} // "hypertensive leg ulcer"
(declare-const patient_has_finding_of_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have an ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an ulcer.","meaning":"Boolean indicating whether the patient currently has an ulcer."} // "ulcer"
(declare-const patient_has_finding_of_ulcer_now@@diagnosed_as_hypertensive_leg_ulcer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ulcer is diagnosed as hypertensive leg ulcer.","when_to_set_to_false":"Set to false if the patient's current ulcer is not diagnosed as hypertensive leg ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ulcer is diagnosed as hypertensive leg ulcer.","meaning":"Boolean indicating whether the patient's current ulcer is diagnosed as hypertensive leg ulcer."} // "ulcer diagnosed as hypertensive leg ulcer"
(declare-const patient_has_finding_of_ulcer_of_lower_extremity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an ulcer of the lower extremity (leg ulcer).","when_to_set_to_false":"Set to false if the patient currently does not have an ulcer of the lower extremity (leg ulcer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an ulcer of the lower extremity (leg ulcer).","meaning":"Boolean indicating whether the patient currently has an ulcer of the lower extremity (leg ulcer)."} // "leg ulcer"
(declare-const patient_has_finding_of_ulcer_of_lower_extremity_now@@diagnosed_as_hypertensive_martorells_ulcer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ulcer of the lower extremity (leg ulcer) is diagnosed as hypertensive Martorell's ulcer.","when_to_set_to_false":"Set to false if the patient's current ulcer of the lower extremity (leg ulcer) is not diagnosed as hypertensive Martorell's ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ulcer of the lower extremity (leg ulcer) is diagnosed as hypertensive Martorell's ulcer.","meaning":"Boolean indicating whether the patient's current ulcer of the lower extremity (leg ulcer) is diagnosed as hypertensive Martorell's ulcer."} // "leg ulcer diagnosed as hypertensive Martorell's ulcer"
(declare-const patient_has_finding_of_ulcer_of_lower_extremity_now@@diagnosed_as_hypertensive_leg_ulcer Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ulcer of the lower extremity (leg ulcer) is diagnosed as hypertensive leg ulcer.","when_to_set_to_false":"Set to false if the patient's current ulcer of the lower extremity (leg ulcer) is not diagnosed as hypertensive leg ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ulcer of the lower extremity (leg ulcer) is diagnosed as hypertensive leg ulcer.","meaning":"Boolean indicating whether the patient's current ulcer of the lower extremity (leg ulcer) is diagnosed as hypertensive leg ulcer."} // "leg ulcer diagnosed as hypertensive leg ulcer"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_ulcer_of_lower_extremity_now@@diagnosed_as_hypertensive_martorells_ulcer
         patient_has_finding_of_ulcer_of_lower_extremity_now)
     :named REQ2_AUXILIARY0)) ;; "leg ulcer diagnosed as hypertensive Martorell's ulcer" implies "leg ulcer"

(assert
  (! (=> patient_has_finding_of_ulcer_of_lower_extremity_now@@diagnosed_as_hypertensive_leg_ulcer
         patient_has_finding_of_ulcer_of_lower_extremity_now)
     :named REQ2_AUXILIARY1)) ;; "leg ulcer diagnosed as hypertensive leg ulcer" implies "leg ulcer"

(assert
  (! (=> patient_has_finding_of_ulcer_now@@diagnosed_as_hypertensive_leg_ulcer
         patient_has_finding_of_ulcer_now)
     :named REQ2_AUXILIARY2)) ;; "ulcer diagnosed as hypertensive leg ulcer" implies "ulcer"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: patient must present with at least one leg ulcer diagnosed as hypertensive Martorell's ulcer OR at least one leg ulcer diagnosed as hypertensive leg ulcer
(assert
  (! (or patient_has_finding_of_ulcer_of_lower_extremity_now@@diagnosed_as_hypertensive_martorells_ulcer
         patient_has_finding_of_ulcer_of_lower_extremity_now@@diagnosed_as_hypertensive_leg_ulcer)
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one leg ulcer diagnosed as hypertensive Martorell's ulcer OR at least one leg ulcer diagnosed as hypertensive leg ulcer"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of hypertensive disorder (arterial hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of hypertensive disorder (arterial hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of hypertensive disorder (arterial hypertension).","meaning":"Boolean indicating whether the patient currently has hypertensive disorder (arterial hypertension)."} // "presence of arterial hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@defined_by_world_health_organization_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder (arterial hypertension) is defined according to World Health Organization criteria.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder (arterial hypertension) is not defined according to World Health Organization criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive disorder (arterial hypertension) is defined according to World Health Organization criteria.","meaning":"Boolean indicating whether the patient's hypertensive disorder (arterial hypertension) is defined according to World Health Organization criteria."} // "arterial hypertension according to the World Health Organization criteria"
(declare-const patient_has_finding_of_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of diabetes mellitus.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of diabetes mellitus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of diabetes mellitus.","meaning":"Boolean indicating whether the patient currently has diabetes mellitus."} // "presence of diabetes"
(declare-const patient_has_finding_of_diabetes_mellitus_now@@treated_by_oral_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus is treated by oral agent.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus is not treated by oral agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diabetes mellitus is treated by oral agent.","meaning":"Boolean indicating whether the patient's diabetes mellitus is treated by oral agent."} // "diabetes treated by oral agent"
(declare-const patient_has_finding_of_diabetes_mellitus_now@@treated_by_insulin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus is treated by insulin.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus is not treated by insulin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diabetes mellitus is treated by insulin.","meaning":"Boolean indicating whether the patient's diabetes mellitus is treated by insulin."} // "diabetes treated by insulin"
(declare-const patient_has_finding_of_diabetes_mellitus_now@@treated_by_diet Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diabetes mellitus is treated by diet.","when_to_set_to_false":"Set to false if the patient's diabetes mellitus is not treated by diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's diabetes mellitus is treated by diet.","meaning":"Boolean indicating whether the patient's diabetes mellitus is treated by diet."} // "diabetes treated by diet"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable for WHO criteria implies stem variable
(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@defined_by_world_health_organization_criteria
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ3_AUXILIARY0)) ;; "arterial hypertension according to the World Health Organization criteria"

;; Diabetes treatment qualifiers imply stem variable
(assert
  (! (=> patient_has_finding_of_diabetes_mellitus_now@@treated_by_oral_agent
         patient_has_finding_of_diabetes_mellitus_now)
     :named REQ3_AUXILIARY1)) ;; "diabetes treated by oral agent"

(assert
  (! (=> patient_has_finding_of_diabetes_mellitus_now@@treated_by_insulin
         patient_has_finding_of_diabetes_mellitus_now)
     :named REQ3_AUXILIARY2)) ;; "diabetes treated by insulin"

(assert
  (! (=> patient_has_finding_of_diabetes_mellitus_now@@treated_by_diet
         patient_has_finding_of_diabetes_mellitus_now)
     :named REQ3_AUXILIARY3)) ;; "diabetes treated by diet"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must have ((presence of arterial hypertension according to the World Health Organization criteria, treated OR untreated) OR (presence of diabetes treated by oral agent OR treated by insulin OR treated by diet)).
(assert
  (! (or patient_has_finding_of_hypertensive_disorder_now@@defined_by_world_health_organization_criteria
         patient_has_finding_of_diabetes_mellitus_now@@treated_by_oral_agent
         patient_has_finding_of_diabetes_mellitus_now@@treated_by_insulin
         patient_has_finding_of_diabetes_mellitus_now@@treated_by_diet)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have ((presence of arterial hypertension according to the World Health Organization criteria, treated OR untreated) OR (presence of diabetes treated by oral agent OR treated by insulin OR treated by diet))."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_clinical_signs_of_peripheral_venous_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of chronic venous insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of chronic venous insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of chronic venous insufficiency.","meaning":"Boolean indicating whether the patient currently has clinical signs of chronic venous insufficiency."} // "chronic venous insufficiency"
(declare-const patient_has_clinical_signs_of_hyperpigmentation_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of skin hyperpigmentation.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of skin hyperpigmentation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of skin hyperpigmentation.","meaning":"Boolean indicating whether the patient currently has clinical signs of skin hyperpigmentation."} // "skin hyperpigmentation"
(declare-const patient_has_clinical_signs_of_lipodermatosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of lipodermatosclerosis.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of lipodermatosclerosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of lipodermatosclerosis.","meaning":"Boolean indicating whether the patient currently has clinical signs of lipodermatosclerosis."} // "lipodermatosclerosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples: skin hyperpigmentation and lipodermatosclerosis are examples of clinical signs of chronic venous insufficiency
(assert
  (! (=> (or patient_has_clinical_signs_of_hyperpigmentation_of_skin_now
             patient_has_clinical_signs_of_lipodermatosclerosis_now)
         patient_has_clinical_signs_of_peripheral_venous_insufficiency_now)
     :named REQ4_AUXILIARY0)) ;; "including skin hyperpigmentation and lipodermatosclerosis" (non-exhaustive examples)

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion requires ABSENCE of clinical signs of chronic venous insufficiency
(assert
  (! (not patient_has_clinical_signs_of_peripheral_venous_insufficiency_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of clinical signs of chronic venous insufficiency"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has peripheral arterial occlusive disease."} // "peripheral arterial occlusive disease"
(declare-const patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@is_significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's peripheral arterial occlusive disease is significant.","when_to_set_to_false":"Set to false if the patient's peripheral arterial occlusive disease is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's peripheral arterial occlusive disease is significant.","meaning":"Boolean indicating whether the patient's peripheral arterial occlusive disease is significant."} // "significant peripheral arterial occlusive disease"
(declare-const patient_has_finding_of_peripheral_pulse_present_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peripheral pulses present.","when_to_set_to_false":"Set to false if the patient currently does not have peripheral pulses present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral pulses present.","meaning":"Boolean indicating whether the patient currently has peripheral pulses present."} // "presence of peripheral pulses"
(declare-const ankle_brachial_index_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured ankle brachial index value (ratio) if available at the present time.","when_to_set_to_null":"Set to null if the ankle brachial index value is unknown, not documented, or cannot be determined at the present time.","meaning":"Numeric value indicating the patient's ankle brachial index measured at the present time, expressed as a ratio."} // "ankle brachial index"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: "absence of significant peripheral arterial occlusive disease, defined as (presence of peripheral pulses OR ankle brachial index >= 0.8)"
(assert
  (! (= (not patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@is_significant)
        (or patient_has_finding_of_peripheral_pulse_present_now
            (>= ankle_brachial_index_value_recorded_now_withunit_ratio 0.8)))
     :named REQ5_AUXILIARY0)) ;; "absence of significant peripheral arterial occlusive disease, defined as (presence of peripheral pulses OR ankle brachial index >= 0.8)"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@is_significant
         patient_has_finding_of_peripheral_arterial_occlusive_disease_now)
     :named REQ5_AUXILIARY1)) ;; "significant peripheral arterial occlusive disease" implies "peripheral arterial occlusive disease"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Inclusion: patient must have absence of significant peripheral arterial occlusive disease (i.e., NOT significant)
(assert
  (! (not patient_has_finding_of_peripheral_arterial_occlusive_disease_now@@is_significant)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of significant peripheral arterial occlusive disease"

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_finding_of_arterial_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical signs of arterial insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have clinical signs of arterial insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical signs of arterial insufficiency.","meaning":"Boolean indicating whether the patient currently has clinical signs of arterial insufficiency."} // "clinical sign of arterial insufficiency"
(declare-const patient_has_finding_of_intermittent_claudication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intermittent claudication.","when_to_set_to_false":"Set to false if the patient currently does not have intermittent claudication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intermittent claudication.","meaning":"Boolean indicating whether the patient currently has intermittent claudication."} // "intermittent claudication"
(declare-const patient_has_finding_of_pain_provoked_by_rest_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pain provoked by rest (resting pain).","when_to_set_to_false":"Set to false if the patient currently does not have pain provoked by rest (resting pain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pain provoked by rest (resting pain).","meaning":"Boolean indicating whether the patient currently has pain provoked by rest (resting pain)."} // "resting pain"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive examples imply the umbrella term
(assert
  (! (=> (or patient_has_finding_of_intermittent_claudication_now
             patient_has_finding_of_pain_provoked_by_rest_now)
         patient_has_finding_of_arterial_insufficiency_now)
     :named REQ6_AUXILIARY0)) ;; "including intermittent claudication and resting pain"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Absence of clinical sign of arterial insufficiency is required for inclusion
(assert
  (! (not patient_has_finding_of_arterial_insufficiency_now)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "absence of clinical sign of arterial insufficiency"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_superficial_spreading_necrotic_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a superficial spreading necrotic ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have a superficial spreading necrotic ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a superficial spreading necrotic ulcer.","meaning":"Boolean indicating whether the patient currently has a superficial spreading necrotic ulcer."} // "superficial spreading necrotic ulcer"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_finding_of_superficial_spreading_necrotic_ulcer_now
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a superficial spreading necrotic ulcer."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_finding_of_spontaneous_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has spontaneous pain.","when_to_set_to_false":"Set to false if the patient currently does not have spontaneous pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has spontaneous pain.","meaning":"Boolean indicating whether the patient currently has spontaneous pain."} // "presence of spontaneous pain"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! patient_has_finding_of_spontaneous_pain_now
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have presence of spontaneous pain."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_finding_of_red_purpuric_margin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a red purpuric margin present.","when_to_set_to_false":"Set to false if the patient currently does not have a red purpuric margin present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a red purpuric margin present.","meaning":"Boolean indicating whether the patient currently has a red purpuric margin present."} // "presence of a red purpuric margin"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
  (! patient_has_finding_of_red_purpuric_margin_now
     :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have presence of a red purpuric margin."
