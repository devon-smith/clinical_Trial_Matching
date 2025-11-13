;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_body_habitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a body habitus finding.","when_to_set_to_false":"Set to false if the patient currently does not have a body habitus finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a body habitus finding.","meaning":"Boolean indicating whether the patient currently has a body habitus finding."} ;; "body habitus"
(declare-const patient_has_body_habitus_now@@might_prevent_placement_of_sound_sensors_on_the_back Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current body habitus might prevent the placement of sound sensors on the back.","when_to_set_to_false":"Set to false if the patient's current body habitus does not affect the placement of sound sensors on the back.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the body habitus might prevent the placement of sound sensors on the back.","meaning":"Boolean indicating whether the patient's current body habitus might prevent the placement of sound sensors on the back."} ;; "body habitus that might prevent the placement of the sound sensors on the back"
(declare-const patients_skin_condition_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a skin condition.","when_to_set_to_false":"Set to false if the patient currently does not have a skin condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a skin condition.","meaning":"Boolean indicating whether the patient currently has a skin condition."} ;; "skin condition"
(declare-const patients_skin_condition_is_positive_now@@located_on_the_back Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current skin condition is located on the back.","when_to_set_to_false":"Set to false if the patient's current skin condition is not located on the back.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the skin condition is located on the back.","meaning":"Boolean indicating whether the patient's current skin condition is located on the back."} ;; "skin condition ... located on the back"
(declare-const patients_skin_condition_is_positive_now@@might_prevent_placement_of_sound_sensors Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current skin condition might prevent the placement of sound sensors.","when_to_set_to_false":"Set to false if the patient's current skin condition does not affect the placement of sound sensors.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the skin condition might prevent the placement of sound sensors.","meaning":"Boolean indicating whether the patient's current skin condition might prevent the placement of sound sensors."} ;; "skin condition that might prevent the placement of the sound sensors"
(declare-const patient_has_finding_of_scoliosis_deformity_of_spine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of scoliosis (deformity of the spine).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of scoliosis (deformity of the spine).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of scoliosis (deformity of the spine).","meaning":"Boolean indicating whether the patient currently has a clinical finding of scoliosis (deformity of the spine)."} ;; "scoliosis"
(declare-const patient_has_finding_of_scoliosis_deformity_of_spine_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current scoliosis is severe.","when_to_set_to_false":"Set to false if the patient's current scoliosis is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scoliosis is severe.","meaning":"Boolean indicating whether the patient's current scoliosis is severe."} ;; "severe scoliosis"
(declare-const patient_has_finding_of_kyphosis_deformity_of_spine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of kyphosis (deformity of the spine).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of kyphosis (deformity of the spine).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of kyphosis (deformity of the spine).","meaning":"Boolean indicating whether the patient currently has a clinical finding of kyphosis (deformity of the spine)."} ;; "kyphosis"
(declare-const patient_has_finding_of_deformity_of_chest_wall_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of deformity of the chest wall.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of deformity of the chest wall.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of deformity of the chest wall.","meaning":"Boolean indicating whether the patient currently has a clinical finding of deformity of the chest wall."} ;; "chest wall deformation"
(declare-const patient_has_finding_of_skin_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of skin lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of skin lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of skin lesion.","meaning":"Boolean indicating whether the patient currently has a clinical finding of skin lesion."} ;; "skin lesion"
(declare-const patient_has_finding_of_skin_lesion_now@@located_on_the_back Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current skin lesion is located on the back.","when_to_set_to_false":"Set to false if the patient's current skin lesion is not located on the back.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the skin lesion is located on the back.","meaning":"Boolean indicating whether the patient's current skin lesion is located on the back."} ;; "skin lesion on the back"
(declare-const patient_has_finding_of_compression_fracture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of compression fracture.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of compression fracture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of compression fracture.","meaning":"Boolean indicating whether the patient currently has a clinical finding of compression fracture."} ;; "compression fracture"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_body_habitus_now@@might_prevent_placement_of_sound_sensors_on_the_back
      patient_has_body_habitus_now)
   :named REQ0_AUXILIARY0)) ;; "body habitus that might prevent the placement of the sound sensors on the back"

(assert
(! (=> patients_skin_condition_is_positive_now@@located_on_the_back
      patients_skin_condition_is_positive_now)
   :named REQ0_AUXILIARY1)) ;; "skin condition ... located on the back"

(assert
(! (=> patients_skin_condition_is_positive_now@@might_prevent_placement_of_sound_sensors
      patients_skin_condition_is_positive_now)
   :named REQ0_AUXILIARY2)) ;; "skin condition that might prevent the placement of the sound sensors"

(assert
(! (=> patient_has_finding_of_scoliosis_deformity_of_spine_now@@is_severe
      patient_has_finding_of_scoliosis_deformity_of_spine_now)
   :named REQ0_AUXILIARY3)) ;; "severe scoliosis"

(assert
(! (=> patient_has_finding_of_skin_lesion_now@@located_on_the_back
      patient_has_finding_of_skin_lesion_now)
   :named REQ0_AUXILIARY4)) ;; "skin lesion on the back"

;; Non-exhaustive examples imply umbrella term (skin condition that might prevent placement)
(assert
(! (=> (or patient_has_finding_of_scoliosis_deformity_of_spine_now@@is_severe
           patient_has_finding_of_kyphosis_deformity_of_spine_now
           patient_has_finding_of_deformity_of_chest_wall_now
           patient_has_finding_of_skin_lesion_now@@located_on_the_back
           patient_has_finding_of_compression_fracture_now)
        (and patients_skin_condition_is_positive_now@@located_on_the_back
             patients_skin_condition_is_positive_now@@might_prevent_placement_of_sound_sensors))
   :named REQ0_AUXILIARY5)) ;; "with non-exhaustive examples (severe scoliosis, kyphosis, chest wall deformation, skin lesion on the back, compression fracture)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_body_habitus_now@@might_prevent_placement_of_sound_sensors_on_the_back)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a body habitus that might prevent the placement of the sound sensors on the back."

(assert
(! (not (and patients_skin_condition_is_positive_now@@located_on_the_back
             patients_skin_condition_is_positive_now@@might_prevent_placement_of_sound_sensors))
   :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a skin condition that might prevent the placement of the sound sensors on the back with non-exhaustive examples (severe scoliosis, kyphosis, chest wall deformation, skin lesion on the back, compression fracture)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_skin_lesion_now@@located_on_the_back@@potentially_contagious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's skin lesion on the back is potentially contagious.","when_to_set_to_false":"Set to false if the patient's skin lesion on the back is not potentially contagious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's skin lesion on the back is potentially contagious.","meaning":"Boolean indicating whether the patient's skin lesion on the back is potentially contagious."} ;; "potentially contagious skin lesion on the back"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_skin_lesion_now@@located_on_the_back@@potentially_contagious
     patient_has_finding_of_skin_lesion_now@@located_on_the_back)
:named REQ1_AUXILIARY0)) ;; "potentially contagious skin lesion on the back" implies "skin lesion on the back"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_skin_lesion_now@@located_on_the_back@@potentially_contagious)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a potentially contagious skin lesion on the back."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_undergone_operation_on_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone lung surgery at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone lung surgery in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone lung surgery.","meaning":"Boolean indicating whether the patient has ever undergone lung surgery in the past."} ;; "lung surgery"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_undergone_operation_on_lung_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had lung surgery."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_disorder_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder of lung at any time in the history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of disorder of lung at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of disorder of lung.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder of lung at any time in the history."} ;; "lung condition"
(declare-const patient_has_diagnosis_of_disorder_of_lung_inthehistory@@preexisted_current_acute_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the lung condition pre-existed the current, acute symptoms.","when_to_set_to_false":"Set to false if the lung condition did not pre-exist the current, acute symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lung condition pre-existed the current, acute symptoms.","meaning":"Boolean indicating whether the lung condition pre-existed the current, acute symptoms."} ;; "lung condition that pre-existed the current, acute symptoms"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a plain chest x-ray at any time in the history.","when_to_set_to_false":"Set to false if the patient has never undergone a plain chest x-ray at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a plain chest x-ray.","meaning":"Boolean indicating whether the patient has ever undergone a plain chest x-ray at any time in the history."} ;; "chest x-ray"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@prescribed_for_monitoring_of_lung_condition_preexisted_current_acute_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the chest x-ray was prescribed for monitoring of a lung condition that pre-existed the current, acute symptoms.","when_to_set_to_false":"Set to false if the chest x-ray was not prescribed for monitoring of a lung condition that pre-existed the current, acute symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest x-ray was prescribed for monitoring of a lung condition that pre-existed the current, acute symptoms.","meaning":"Boolean indicating whether the chest x-ray was prescribed for monitoring of a lung condition that pre-existed the current, acute symptoms."} ;; "chest x-ray prescribed for monitoring of a lung condition that pre-existed the current, acute symptoms"
(declare-const patient_has_undergone_plain_chest_x_ray_inthehistory@@prescribed_for_followup_of_lung_condition_preexisted_current_acute_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the chest x-ray was prescribed for follow-up of a lung condition that pre-existed the current, acute symptoms.","when_to_set_to_false":"Set to false if the chest x-ray was not prescribed for follow-up of a lung condition that pre-existed the current, acute symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest x-ray was prescribed for follow-up of a lung condition that pre-existed the current, acute symptoms.","meaning":"Boolean indicating whether the chest x-ray was prescribed for follow-up of a lung condition that pre-existed the current, acute symptoms."} ;; "chest x-ray prescribed for follow-up of a lung condition that pre-existed the current, acute symptoms"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for monitoring
(assert
(! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@prescribed_for_monitoring_of_lung_condition_preexisted_current_acute_symptoms
      patient_has_undergone_plain_chest_x_ray_inthehistory)
:named REQ3_AUXILIARY0)) ;; "the chest x-ray was prescribed for monitoring of a lung condition that pre-existed the current, acute symptoms"

;; Qualifier variable implies corresponding stem variable for follow-up
(assert
(! (=> patient_has_undergone_plain_chest_x_ray_inthehistory@@prescribed_for_followup_of_lung_condition_preexisted_current_acute_symptoms
      patient_has_undergone_plain_chest_x_ray_inthehistory)
:named REQ3_AUXILIARY1)) ;; "the chest x-ray was prescribed for follow-up of a lung condition that pre-existed the current, acute symptoms"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have had a chest x-ray prescribed for monitoring of a lung condition that pre-existed the current, acute symptoms
(assert
(! (not patient_has_undergone_plain_chest_x_ray_inthehistory@@prescribed_for_monitoring_of_lung_condition_preexisted_current_acute_symptoms)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient was prescribed the chest x-ray for monitoring of a lung condition that pre-existed the current, acute symptoms"

;; Exclusion: patient must NOT have had a chest x-ray prescribed for follow-up of a lung condition that pre-existed the current, acute symptoms
(assert
(! (not patient_has_undergone_plain_chest_x_ray_inthehistory@@prescribed_for_followup_of_lung_condition_preexisted_current_acute_symptoms)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient was prescribed the chest x-ray for follow-up of a lung condition that pre-existed the current, acute symptoms"
