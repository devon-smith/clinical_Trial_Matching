;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const number_of_food_textures_with_aspiration_on_swallow_videofluoroscopic_feeding_study_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of food textures with which the patient has aspiration on swallow during videofluoroscopic feeding study, recorded now, unit: count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many food textures with aspiration on swallow during videofluoroscopic feeding study, recorded now.","meaning":"Numeric value indicating the number of food textures with which the patient has aspiration on swallow during videofluoroscopic feeding study, recorded now, unit: count."}  // "dysphagia resulting in aspiration with swallow of at least 2 food textures"
(declare-const patient_has_finding_of_aspiration_with_swallow_of_food_texture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has aspiration with swallow of any food texture.","when_to_set_to_false":"Set to false if the patient currently does not have aspiration with swallow of any food texture.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has aspiration with swallow of any food texture.","meaning":"Boolean indicating whether the patient currently has aspiration with swallow of any food texture."}  // "dysphagia resulting in aspiration with swallow of at least 2 food textures"
(declare-const patient_has_finding_of_dysphagia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dysphagia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dysphagia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dysphagia.","meaning":"Boolean indicating whether the patient currently has dysphagia."}  // "dysphagia"
(declare-const patient_has_finding_of_dysphagia_now@@identified_on_videofluoroscopic_feeding_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dysphagia is identified on videofluoroscopic feeding study.","when_to_set_to_false":"Set to false if the patient's dysphagia is not identified on videofluoroscopic feeding study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is identified on videofluoroscopic feeding study.","meaning":"Boolean indicating whether the patient's dysphagia is identified on videofluoroscopic feeding study."}  // "severe dysphagia on videofluoroscopic feeding study"
(declare-const patient_has_finding_of_dysphagia_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dysphagia is severe.","when_to_set_to_false":"Set to false if the patient's dysphagia is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is severe.","meaning":"Boolean indicating whether the patient's dysphagia is severe."}  // "severe dysphagia"
(declare-const patient_has_finding_of_dysphagia_now@@results_in_aspiration_with_swallow_of_at_least_2_food_textures Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dysphagia results in aspiration with swallow of at least 2 food textures.","when_to_set_to_false":"Set to false if the patient's dysphagia does not result in aspiration with swallow of at least 2 food textures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia results in aspiration with swallow of at least 2 food textures.","meaning":"Boolean indicating whether the patient's dysphagia results in aspiration with swallow of at least 2 food textures."}  // "dysphagia resulting in aspiration with swallow of at least 2 food textures"
(declare-const patient_has_finding_of_dysphagia_now@@due_to_central_neurologic_deficit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's dysphagia is due to a central neurologic deficit.","when_to_set_to_false":"Set to false if the patient's dysphagia is not due to a central neurologic deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's dysphagia is due to a central neurologic deficit.","meaning":"Boolean indicating whether the patient's dysphagia is due to a central neurologic deficit."}  // "dysphagia due to a central neurologic deficit"
(declare-const patient_has_finding_of_central_nervous_system_deficit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of central nervous system deficit.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of central nervous system deficit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has central nervous system deficit.","meaning":"Boolean indicating whether the patient currently has central nervous system deficit."}  // "central neurologic deficit"
(declare-const patient_has_finding_of_central_nervous_system_deficit_now@@diagnosis_based_on_treating_physician Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of central nervous system deficit is based on the treating physician's diagnosis.","when_to_set_to_false":"Set to false if the diagnosis of central nervous system deficit is not based on the treating physician's diagnosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of central nervous system deficit is based on the treating physician's diagnosis.","meaning":"Boolean indicating whether the diagnosis of central nervous system deficit is based on the treating physician's diagnosis."}  // "central neurologic diagnosis based on the diagnosis from the treating physician"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_dysphagia_now@@identified_on_videofluoroscopic_feeding_study
         patient_has_finding_of_dysphagia_now)
     :named REQ0_AUXILIARY0)) ;; "dysphagia identified on videofluoroscopic feeding study"

(assert
  (! (=> patient_has_finding_of_dysphagia_now@@is_severe
         patient_has_finding_of_dysphagia_now)
     :named REQ0_AUXILIARY1)) ;; "severe dysphagia"

(assert
  (! (=> patient_has_finding_of_dysphagia_now@@results_in_aspiration_with_swallow_of_at_least_2_food_textures
         patient_has_finding_of_dysphagia_now)
     :named REQ0_AUXILIARY2)) ;; "dysphagia results in aspiration with swallow of at least 2 food textures"

(assert
  (! (=> patient_has_finding_of_dysphagia_now@@due_to_central_neurologic_deficit
         patient_has_finding_of_dysphagia_now)
     :named REQ0_AUXILIARY3)) ;; "dysphagia due to a central neurologic deficit"

(assert
  (! (=> patient_has_finding_of_central_nervous_system_deficit_now@@diagnosis_based_on_treating_physician
         patient_has_finding_of_central_nervous_system_deficit_now)
     :named REQ0_AUXILIARY4)) ;; "central neurologic diagnosis based on the diagnosis from the treating physician"

;; Dysphagia results in aspiration with swallow of at least 2 food textures is defined by numeric threshold
(assert
  (! (= patient_has_finding_of_dysphagia_now@@results_in_aspiration_with_swallow_of_at_least_2_food_textures
        (>= number_of_food_textures_with_aspiration_on_swallow_videofluoroscopic_feeding_study_value_recorded_now_withunit_count 2))
     :named REQ0_AUXILIARY5)) ;; "dysphagia resulting in aspiration with swallow of at least 2 food textures"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: severe dysphagia on videofluoroscopic feeding study as defined by dysphagia resulting in aspiration with swallow of at least 2 food textures
(assert
  (! (and patient_has_finding_of_dysphagia_now@@identified_on_videofluoroscopic_feeding_study
          patient_has_finding_of_dysphagia_now@@is_severe
          patient_has_finding_of_dysphagia_now@@results_in_aspiration_with_swallow_of_at_least_2_food_textures)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "severe dysphagia on videofluoroscopic feeding study as defined by dysphagia resulting in aspiration with swallow of at least 2 food textures"

;; Component 1: dysphagia due to a central neurologic deficit, with the central neurologic diagnosis based on the diagnosis from the treating physician
(assert
  (! (and patient_has_finding_of_dysphagia_now@@due_to_central_neurologic_deficit
          patient_has_finding_of_central_nervous_system_deficit_now@@diagnosis_based_on_treating_physician)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "dysphagia due to a central neurologic deficit, with the central neurologic diagnosis based on the diagnosis from the treating physician"
