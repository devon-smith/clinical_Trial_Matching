;; ===================== Declarations for the inclusion criteria (REQ 0) =====================

;; Age 1 to 12 years
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged 1 to 12 years"

;; Acute community-acquired pneumonia (defined as cough, tachypnea, fever)
(declare-const patient_has_finding_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has community-acquired pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have community-acquired pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has community-acquired pneumonia.","meaning":"Boolean indicating whether the patient currently has community-acquired pneumonia."}  ;; "community-acquired pneumonia"
(declare-const patient_has_finding_of_community_acquired_pneumonia_now@@acute Bool) ;; {"when_to_set_to_true":"Set to true if the patient's community-acquired pneumonia is acute.","when_to_set_to_false":"Set to false if the patient's community-acquired pneumonia is not acute.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's community-acquired pneumonia is acute.","meaning":"Boolean indicating whether the patient's community-acquired pneumonia is acute."}  ;; "acute"
(declare-const patient_has_finding_of_cough_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cough.","when_to_set_to_false":"Set to false if the patient currently does not have cough.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cough.","meaning":"Boolean indicating whether the patient currently has cough."}  ;; "cough"
(declare-const patient_has_finding_of_tachypnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnea.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnea.","meaning":"Boolean indicating whether the patient currently has tachypnea."}  ;; "tachypnea"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."}  ;; "fever"

;; Chest radiography showing lobar pneumonia, segmental pneumonia, or bronchopneumonia within the first 48 hours
(declare-const patient_has_undergone_plain_chest_x_ray_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chest radiography now.","when_to_set_to_false":"Set to false if the patient has not undergone chest radiography now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chest radiography now.","meaning":"Boolean indicating whether the patient has undergone chest radiography now."}  ;; "chest radiography"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@shows_lobar_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the chest radiography shows lobar pneumonia.","when_to_set_to_false":"Set to false if the chest radiography does not show lobar pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest radiography shows lobar pneumonia.","meaning":"Boolean indicating whether the chest radiography shows lobar pneumonia."}  ;; "shows lobar pneumonia"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@shows_segmental_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the chest radiography shows segmental pneumonia.","when_to_set_to_false":"Set to false if the chest radiography does not show segmental pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest radiography shows segmental pneumonia.","meaning":"Boolean indicating whether the chest radiography shows segmental pneumonia."}  ;; "shows segmental pneumonia"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@shows_bronchopneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the chest radiography shows bronchopneumonia.","when_to_set_to_false":"Set to false if the chest radiography does not show bronchopneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest radiography shows bronchopneumonia.","meaning":"Boolean indicating whether the chest radiography shows bronchopneumonia."}  ;; "shows bronchopneumonia"
(declare-const patient_has_undergone_plain_chest_x_ray_now@@temporalcontext_within_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the chest radiography occurred within the first 48 hours.","when_to_set_to_false":"Set to false if the chest radiography did not occur within the first 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chest radiography occurred within the first 48 hours.","meaning":"Boolean indicating whether the chest radiography occurred within the first 48 hours."}  ;; "within the first 48 hours"

;; ===================== Auxiliary Assertions (REQ 0) =====================

;; Qualifier variable for acute implies stem variable
(assert
  (! (=> patient_has_finding_of_community_acquired_pneumonia_now@@acute
         patient_has_finding_of_community_acquired_pneumonia_now)
     :named REQ0_AUXILIARY0)) ;; "acute community-acquired pneumonia"

;; Definition: acute community-acquired pneumonia is defined as cough, tachypnea, fever (exhaustive subcategories)
(assert
  (! (= patient_has_finding_of_community_acquired_pneumonia_now@@acute
        (and patient_has_finding_of_cough_now
             patient_has_finding_of_tachypnea_now
             patient_has_finding_of_fever_now))
     :named REQ0_AUXILIARY1)) ;; "acute community-acquired pneumonia (defined as cough, tachypnea, fever)"

;; ===================== Constraint Assertions (REQ 0) =====================

;; Component 0: Age 1 to 12 years
(assert
  (! (and (>= patient_age_value_recorded_now_in_years 1.0)
          (<= patient_age_value_recorded_now_in_years 12.0))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "aged 1 to 12 years"

;; Component 1: Must have acute community-acquired pneumonia (as defined)
(assert
  (! patient_has_finding_of_community_acquired_pneumonia_now@@acute
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "have acute community-acquired pneumonia (defined as cough, tachypnea, fever)"

;; Component 2: Must have chest radiography showing lobar pneumonia OR segmental pneumonia OR bronchopneumonia within the first 48 hours
(assert
  (! (and patient_has_undergone_plain_chest_x_ray_now@@temporalcontext_within_48_hours
          (or patient_has_undergone_plain_chest_x_ray_now@@shows_lobar_pneumonia
              patient_has_undergone_plain_chest_x_ray_now@@shows_segmental_pneumonia
              patient_has_undergone_plain_chest_x_ray_now@@shows_bronchopneumonia))
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "chest radiography showing lobar pneumonia or segmental pneumonia or bronchopneumonia within the first 48 hours"
