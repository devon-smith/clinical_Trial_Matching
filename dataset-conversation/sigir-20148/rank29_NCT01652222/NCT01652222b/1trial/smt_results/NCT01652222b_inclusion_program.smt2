;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_dementia_now Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of dementia." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of dementia."}
(declare-const patient_has_diagnosis_of_dementia_now@@probable_alzheimer_type Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of dementia, and the dementia is of probable Alzheimer type." {"when_to_set_to_true":"Set to true if the patient's current dementia diagnosis is of probable Alzheimer type.","when_to_set_to_false":"Set to false if the patient's current dementia diagnosis is not of probable Alzheimer type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia diagnosis is of probable Alzheimer type.","meaning":"Boolean indicating whether the patient's current dementia diagnosis is of probable Alzheimer type."}
(declare-const patient_has_diagnosis_of_dementia_now@@possible_alzheimer_type Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of dementia, and the dementia is of possible Alzheimer type." {"when_to_set_to_true":"Set to true if the patient's current dementia diagnosis is of possible Alzheimer type.","when_to_set_to_false":"Set to false if the patient's current dementia diagnosis is not of possible Alzheimer type.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia diagnosis is of possible Alzheimer type.","meaning":"Boolean indicating whether the patient's current dementia diagnosis is of possible Alzheimer type."}
(declare-const patient_has_diagnosis_of_dementia_now@@advanced Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of dementia, and the dementia is advanced." {"when_to_set_to_true":"Set to true if the patient's current dementia diagnosis is advanced.","when_to_set_to_false":"Set to false if the patient's current dementia diagnosis is not advanced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia diagnosis is advanced.","meaning":"Boolean indicating whether the patient's current dementia diagnosis is advanced."}
(declare-const patient_has_diagnosis_of_dementia_now@@diagnosed_by_specialized_evaluation_unit Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of dementia, and the diagnosis was made by a specialized evaluation unit." {"when_to_set_to_true":"Set to true if the patient's current dementia diagnosis was made by a specialized evaluation unit.","when_to_set_to_false":"Set to false if the patient's current dementia diagnosis was not made by a specialized evaluation unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dementia diagnosis was made by a specialized evaluation unit.","meaning":"Boolean indicating whether the patient's current dementia diagnosis was made by a specialized evaluation unit."}
(declare-const patient_has_diagnosis_of_dementia_now@@other_advanced_dementia Bool) ;; "Boolean indicating whether the patient currently has a diagnosis of dementia, and the dementia is classified as other advanced dementia." {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of other advanced dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of other advanced dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of other advanced dementia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of other advanced dementia."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable (diagnosis of dementia)
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@probable_alzheimer_type
         patient_has_diagnosis_of_dementia_now)
     :named REQ0_AUXILIARY0)) ;; "probable Alzheimer type dementia" is a type of dementia

(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@possible_alzheimer_type
         patient_has_diagnosis_of_dementia_now)
     :named REQ0_AUXILIARY1)) ;; "possible Alzheimer type dementia" is a type of dementia

(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@advanced
         patient_has_diagnosis_of_dementia_now)
     :named REQ0_AUXILIARY2)) ;; "advanced dementia" is a type of dementia

(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@other_advanced_dementia
         patient_has_diagnosis_of_dementia_now)
     :named REQ0_AUXILIARY3)) ;; "other advanced dementia" is a type of dementia

;; "other advanced dementia" is a subtype of "advanced dementia"
(assert
  (! (=> patient_has_diagnosis_of_dementia_now@@other_advanced_dementia
         patient_has_diagnosis_of_dementia_now@@advanced)
     :named REQ0_AUXILIARY4)) ;; "other advanced dementia" is a subset of "advanced dementia"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must have (probable Alzheimer type dementia OR possible Alzheimer type dementia OR other advanced dementia) according to a diagnosis done by a specialized evaluation unit.
(assert
  (! (and
        (or patient_has_diagnosis_of_dementia_now@@probable_alzheimer_type
            patient_has_diagnosis_of_dementia_now@@possible_alzheimer_type
            patient_has_diagnosis_of_dementia_now@@other_advanced_dementia)
        patient_has_diagnosis_of_dementia_now@@diagnosed_by_specialized_evaluation_unit)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (probable Alzheimer type dementia OR possible Alzheimer type dementia OR other advanced dementia) according to a diagnosis done by a specialized evaluation unit."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_global_deterioration_scale_level_value_recorded_now_withunit_none Real) ;; "Global Deterioration Scale" {"when_to_set_to_value":"Set to the measured Global Deterioration Scale level if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Global Deterioration Scale level recorded now."}
(declare-const patient_mini_mental_state_examination_score_value_recorded_now_withunit_none Real) ;; "Mini-Mental State Examination" {"when_to_set_to_value":"Set to the measured Mini-Mental State Examination score if a numeric measurement recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Mini-Mental State Examination score recorded now."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must have ((Global Deterioration Scale score = 5) OR ((Global Deterioration Scale score = 6) AND (Mini-Mental State Examination score ≤ 12))).
(assert
  (! (or
        (= patient_global_deterioration_scale_level_value_recorded_now_withunit_none 5.0) ;; "Global Deterioration Scale score = 5"
        (and
          (= patient_global_deterioration_scale_level_value_recorded_now_withunit_none 6.0) ;; "Global Deterioration Scale score = 6"
          (<= patient_mini_mental_state_examination_score_value_recorded_now_withunit_none 12.0) ;; "Mini-Mental State Examination score ≤ 12"
        )
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patients_language_comprehension_is_positive_now Bool) ;; "To be included, the patient must preserve (verbal comprehension of basic instructions)." {"when_to_set_to_true":"Set to true if the patient currently demonstrates verbal (language) comprehension.","when_to_set_to_false":"Set to false if the patient currently does not demonstrate verbal (language) comprehension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently demonstrates verbal (language) comprehension.","meaning":"Boolean indicating whether the patient currently demonstrates verbal (language) comprehension."}
(declare-const patients_language_comprehension_is_positive_now@@of_basic_instructions Bool) ;; "To be included, the patient must preserve (verbal comprehension of basic instructions)." {"when_to_set_to_true":"Set to true if the patient's verbal comprehension is specifically of basic instructions.","when_to_set_to_false":"Set to false if the patient's verbal comprehension is not specifically of basic instructions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's verbal comprehension is specifically of basic instructions.","meaning":"Boolean indicating whether the patient's verbal comprehension is specifically of basic instructions."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_language_comprehension_is_positive_now@@of_basic_instructions
         patients_language_comprehension_is_positive_now)
     :named REQ2_AUXILIARY0)) ;; "To be included, the patient must preserve (verbal comprehension of basic instructions)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patients_language_comprehension_is_positive_now@@of_basic_instructions
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must preserve (verbal comprehension of basic instructions)."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patients_ability_to_move_arm_is_normal_now Bool) ;; "mobility of the arms" {"when_to_set_to_true":"Set to true if the patient's ability to move their arms is normal now.","when_to_set_to_false":"Set to false if the patient's ability to move their arms is not normal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to move their arms is normal now.","meaning":"Boolean indicating whether the patient's ability to move their arms is normal at the present time."}
(declare-const patients_ability_to_move_arm_is_normal_now@@allows_patient_to_conduct_activities Bool) ;; "mobility of the arms that allow the patient to conduct the activities" {"when_to_set_to_true":"Set to true if the patient's ability to move their arms is normal now and allows the patient to conduct the required activities.","when_to_set_to_false":"Set to false if the patient's ability to move their arms is normal now but does not allow the patient to conduct the required activities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to move their arms allows the patient to conduct the required activities.","meaning":"Boolean indicating whether the patient's ability to move their arms is normal now and allows the patient to conduct the required activities."}
(declare-const patients_visual_function_is_normal_now Bool) ;; "visual capacities" {"when_to_set_to_true":"Set to true if the patient's visual function is normal now.","when_to_set_to_false":"Set to false if the patient's visual function is not normal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's visual function is normal now.","meaning":"Boolean indicating whether the patient's visual function is normal at the present time."}
(declare-const patients_visual_function_is_normal_now@@allows_patient_to_conduct_activities Bool) ;; "visual capacities that allow the patient to conduct the activities" {"when_to_set_to_true":"Set to true if the patient's visual function is normal now and allows the patient to conduct the required activities.","when_to_set_to_false":"Set to false if the patient's visual function is normal now but does not allow the patient to conduct the required activities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's visual function allows the patient to conduct the required activities.","meaning":"Boolean indicating whether the patient's visual function is normal now and allows the patient to conduct the required activities."}
(declare-const patients_hearing_is_normal_now Bool) ;; "auditive capacities" {"when_to_set_to_true":"Set to true if the patient's hearing is normal now.","when_to_set_to_false":"Set to false if the patient's hearing is not normal now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hearing is normal now.","meaning":"Boolean indicating whether the patient's hearing is normal at the present time."}
(declare-const patients_hearing_is_normal_now@@allows_patient_to_conduct_activities Bool) ;; "auditive capacities that allow the patient to conduct the activities" {"when_to_set_to_true":"Set to true if the patient's hearing is normal now and allows the patient to conduct the required activities.","when_to_set_to_false":"Set to false if the patient's hearing is normal now but does not allow the patient to conduct the required activities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hearing allows the patient to conduct the required activities.","meaning":"Boolean indicating whether the patient's hearing is normal now and allows the patient to conduct the required activities."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patients_ability_to_move_arm_is_normal_now@@allows_patient_to_conduct_activities
         patients_ability_to_move_arm_is_normal_now)
     :named REQ3_AUXILIARY0)) ;; "mobility of the arms that allow the patient to conduct the activities"

(assert
  (! (=> patients_visual_function_is_normal_now@@allows_patient_to_conduct_activities
         patients_visual_function_is_normal_now)
     :named REQ3_AUXILIARY1)) ;; "visual capacities that allow the patient to conduct the activities"

(assert
  (! (=> patients_hearing_is_normal_now@@allows_patient_to_conduct_activities
         patients_hearing_is_normal_now)
     :named REQ3_AUXILIARY2)) ;; "auditive capacities that allow the patient to conduct the activities"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Component 0: Must preserve mobility of the arms
(assert
  (! patients_ability_to_move_arm_is_normal_now
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must preserve (mobility of the arms)."

;; Component 1: Must preserve visual capacities that allow the patient to conduct the activities
(assert
  (! patients_visual_function_is_normal_now@@allows_patient_to_conduct_activities
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must preserve (visual capacities that allow the patient to conduct the activities)."

;; Component 2: Must preserve auditive capacities that allow the patient to conduct the activities
(assert
  (! patients_hearing_is_normal_now@@allows_patient_to_conduct_activities
     :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must preserve (auditive capacities that allow the patient to conduct the activities)."
