;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "the patient is younger than thirty years OR the patient is older than seventy-five years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (or (< patient_age_value_recorded_now_in_years 30)
            (> patient_age_value_recorded_now_in_years 75)))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is younger than thirty years) OR (the patient is older than seventy-five years))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently suspected or confirmed to be pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant and there is no suspicion of pregnancy.","when_to_set_to_null":"Set to null if the patient's current pregnancy status (including suspicion) is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant, including both suspected and confirmed (ascertained) pregnancy."} ;; "the patient has suspected pregnancy OR the patient has ascertained pregnancy"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has suspected pregnancy) OR (the patient has ascertained pregnancy))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_left_ventricular_cardiac_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left ventricular cardiac dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left ventricular cardiac dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left ventricular cardiac dysfunction.","meaning":"Boolean indicating whether the patient currently has left ventricular cardiac dysfunction."} ;; "left ventricular dysfunction"

(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a left ventricular ejection fraction by echocardiography is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current left ventricular ejection fraction."} ;; "left ventricular ejection fraction"

(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular ejection fraction measurement was performed by echocardiography.","when_to_set_to_false":"Set to false if the measurement was not performed by echocardiography.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether echocardiography was the measurement method.","meaning":"Boolean indicating whether the left ventricular ejection fraction measurement was performed by echocardiography."} ;; "left ventricular ejection fraction < thirty-five percent by echocardiography"

(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_another_method Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular ejection fraction measurement was performed by another method (not echocardiography).","when_to_set_to_false":"Set to false if the measurement was not performed by another method.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether another method was the measurement method.","meaning":"Boolean indicating whether the left ventricular ejection fraction measurement was performed by another method (not echocardiography)."} ;; "left ventricular ejection fraction < thirty-five percent by another method"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: left ventricular dysfunction = (LVEF < 35% by echocardiography OR LVEF < 35% by another method)
(assert
(! (= patient_has_finding_of_left_ventricular_cardiac_dysfunction_now
     (or (and patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiography
              (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 35))
         (and patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_another_method
              (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 35))))
   :named REQ2_AUXILIARY0)) ;; "defined as ((left ventricular ejection fraction < thirty-five percent by echocardiography) OR (left ventricular ejection fraction < thirty-five percent by another method))"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_echocardiography
       true)
   :named REQ2_AUXILIARY1)) ;; "measurement was performed by echocardiography"

(assert
(! (=> patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@measured_by_another_method
       true)
   :named REQ2_AUXILIARY2)) ;; "measurement was performed by another method"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_left_ventricular_cardiac_dysfunction_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has left ventricular dysfunction, defined as ((left ventricular ejection fraction < thirty-five percent by echocardiography) OR (left ventricular ejection fraction < thirty-five percent by another method))."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_coronary_arteriosclerosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured or estimated probability (in percent) if a current probability of coronary arteriosclerosis is available.","when_to_set_to_null":"Set to null if no such probability measurement is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's current probability of having coronary arteriosclerosis (coronary artery disease)."} ;; "probability of coronary artery disease (probability ≤ twenty percent or probability ≥ ninety percent)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (or
    (<= patient_coronary_arteriosclerosis_value_recorded_now_withunit_percent 20) ;; "the patient has a low probability of coronary artery disease (probability ≤ twenty percent)"
    (>= patient_coronary_arteriosclerosis_value_recorded_now_withunit_percent 90) ;; "the patient has a high probability of coronary artery disease (probability ≥ ninety percent)"
  ))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a low probability of coronary artery disease (probability ≤ twenty percent)) OR (the patient has a high probability of coronary artery disease (probability ≥ ninety percent)))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_acute_coronary_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has acute coronary syndrome."} ;; "acute coronary syndrome"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_acute_coronary_syndrome_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_chest_pain_duration_value_in_minutes Real) ;; {"when_to_set_to_value":"Set to the number of minutes the patient's current episode of chest pain has lasted, if known.","when_to_set_to_null":"Set to null if the duration of the patient's current episode of chest pain is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in minutes of the patient's current episode of chest pain."} ;; "lasting more than twenty minutes"
(declare-const patient_has_finding_of_chest_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chest pain.","when_to_set_to_false":"Set to false if the patient currently does not have chest pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chest pain.","meaning":"Boolean indicating whether the patient currently has chest pain."} ;; "chest pain"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_finding_of_chest_pain_now
             (> patient_chest_pain_duration_value_in_minutes 20)))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prolonged chest pain lasting more than twenty minutes."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_new_onset_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of new onset angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of new onset angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has new onset angina.","meaning":"Boolean indicating whether the patient currently has new onset angina."} ;; "de novo angina"
(declare-const patient_has_finding_of_progressive_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of progressive angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of progressive angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has progressive angina.","meaning":"Boolean indicating whether the patient currently has progressive angina."} ;; "accelerated angina"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_new_onset_angina_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has de novo angina."

(assert
(! (not patient_has_finding_of_progressive_angina_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has accelerated angina."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hemodynamic instability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hemodynamic instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hemodynamic instability.","meaning":"Boolean indicating whether the patient currently has hemodynamic instability."} ;; "the patient has hemodynamic instability"
(declare-const patient_has_finding_of_electrical_instability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has electrical instability.","when_to_set_to_false":"Set to false if the patient currently does not have electrical instability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has electrical instability.","meaning":"Boolean indicating whether the patient currently has electrical instability."} ;; "the patient has electrical instability"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_hemodynamic_instability_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability."

(assert
  (! (not patient_has_finding_of_electrical_instability_now)
     :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has electrical instability."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_ekg_st_segment_changes_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST segment changes.","when_to_set_to_false":"Set to false if the patient currently does not have ST segment changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST segment changes.","meaning":"Boolean indicating whether the patient currently has ST segment changes."} ;; "ST segment changes"
(declare-const patient_has_finding_of_ekg_st_segment_changes_now@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ST segment changes are recent.","when_to_set_to_false":"Set to false if the patient's current ST segment changes are not recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ST segment changes are recent.","meaning":"Boolean indicating whether the patient's current ST segment changes are recent."} ;; "recent ST segment changes"
(declare-const patient_has_finding_of_ekg_st_segment_changes_now@@ischemic_nature Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ST segment changes are of ischemic nature.","when_to_set_to_false":"Set to false if the patient's current ST segment changes are not of ischemic nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ST segment changes are of ischemic nature.","meaning":"Boolean indicating whether the patient's current ST segment changes are of ischemic nature."} ;; "ST segment changes of ischemic nature"
(declare-const patient_has_finding_of_ekg_st_segment_changes_only_now@@recent@@ischemic_nature Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ST segment changes that are both recent and of ischemic nature.","when_to_set_to_false":"Set to false if the patient currently does not have ST segment changes that are both recent and of ischemic nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ST segment changes that are both recent and of ischemic nature.","meaning":"Boolean indicating whether the patient currently has ST segment changes that are both recent and of ischemic nature."} ;; "recent ST segment changes of ischemic nature"

(declare-const patient_has_finding_of_t_wave_changes_only_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has T wave changes.","when_to_set_to_false":"Set to false if the patient currently does not have T wave changes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has T wave changes.","meaning":"Boolean indicating whether the patient currently has T wave changes."} ;; "T wave changes"
(declare-const patient_has_finding_of_t_wave_changes_only_now@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current T wave changes are recent.","when_to_set_to_false":"Set to false if the patient's current T wave changes are not recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current T wave changes are recent.","meaning":"Boolean indicating whether the patient's current T wave changes are recent."} ;; "recent T wave changes"
(declare-const patient_has_finding_of_t_wave_changes_only_now@@ischemic_nature Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current T wave changes are of ischemic nature.","when_to_set_to_false":"Set to false if the patient's current T wave changes are not of ischemic nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current T wave changes are of ischemic nature.","meaning":"Boolean indicating whether the patient's current T wave changes are of ischemic nature."} ;; "T wave changes of ischemic nature"
(declare-const patient_has_finding_of_t_wave_changes_only_now@@recent@@ischemic_nature Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has T wave changes that are both recent and of ischemic nature.","when_to_set_to_false":"Set to false if the patient currently does not have T wave changes that are both recent and of ischemic nature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has T wave changes that are both recent and of ischemic nature.","meaning":"Boolean indicating whether the patient currently has T wave changes that are both recent and of ischemic nature."} ;; "recent T wave changes of ischemic nature"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variables for ST segment changes
(assert
(! (=> patient_has_finding_of_ekg_st_segment_changes_now@@recent
       patient_has_finding_of_ekg_st_segment_changes_now)
    :named REQ8_AUXILIARY0)) ;; "recent ST segment changes"

(assert
(! (=> patient_has_finding_of_ekg_st_segment_changes_now@@ischemic_nature
       patient_has_finding_of_ekg_st_segment_changes_now)
    :named REQ8_AUXILIARY1)) ;; "ST segment changes of ischemic nature"

;; Both qualifiers imply the doubly qualified variable for ST segment changes
(assert
(! (= patient_has_finding_of_ekg_st_segment_changes_only_now@@recent@@ischemic_nature
      (and patient_has_finding_of_ekg_st_segment_changes_now@@recent
           patient_has_finding_of_ekg_st_segment_changes_now@@ischemic_nature))
    :named REQ8_AUXILIARY2)) ;; "recent ST segment changes of ischemic nature"

;; Qualifier variables imply corresponding stem variables for T wave changes
(assert
(! (=> patient_has_finding_of_t_wave_changes_only_now@@recent
       patient_has_finding_of_t_wave_changes_only_now)
    :named REQ8_AUXILIARY3)) ;; "recent T wave changes"

(assert
(! (=> patient_has_finding_of_t_wave_changes_only_now@@ischemic_nature
       patient_has_finding_of_t_wave_changes_only_now)
    :named REQ8_AUXILIARY4)) ;; "T wave changes of ischemic nature"

;; Both qualifiers imply the doubly qualified variable for T wave changes
(assert
(! (= patient_has_finding_of_t_wave_changes_only_now@@recent@@ischemic_nature
      (and patient_has_finding_of_t_wave_changes_only_now@@recent
           patient_has_finding_of_t_wave_changes_only_now@@ischemic_nature))
    :named REQ8_AUXILIARY5)) ;; "recent T wave changes of ischemic nature"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient must NOT have recent ST segment changes of ischemic nature
(assert
(! (not patient_has_finding_of_ekg_st_segment_changes_only_now@@recent@@ischemic_nature)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent ST segment changes of ischemic nature."

;; Exclusion: patient must NOT have recent T wave changes of ischemic nature
(assert
(! (not patient_has_finding_of_t_wave_changes_only_now@@recent@@ischemic_nature)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has recent T wave changes of ischemic nature."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_acute_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute myocardial infarction.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction."} ;; "acute myocardial infarction"

(declare-const patient_has_finding_of_acute_myocardial_infarction_now@@without_st_segment_elevation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has acute myocardial infarction and the finding is without ST segment elevation.","when_to_set_to_false":"Set to false if the patient currently has acute myocardial infarction and the finding is with ST segment elevation, or if ST segment status is known to be present.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute myocardial infarction is without ST segment elevation.","meaning":"Boolean indicating whether the patient's current acute myocardial infarction is without ST segment elevation."} ;; "acute myocardial infarction without ST segment elevation"

(declare-const patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute myocardial infarction with ST segment elevation.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute myocardial infarction with ST segment elevation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has acute myocardial infarction with ST segment elevation.","meaning":"Boolean indicating whether the patient currently has acute myocardial infarction with ST segment elevation."} ;; "acute myocardial infarction with ST segment elevation"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_myocardial_infarction_now@@without_st_segment_elevation
      patient_has_finding_of_acute_myocardial_infarction_now)
:named REQ9_AUXILIARY0)) ;; "acute myocardial infarction without ST segment elevation"

;; Qualifier variable for ST segment elevation myocardial infarction implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now
      patient_has_finding_of_acute_myocardial_infarction_now)
:named REQ9_AUXILIARY1)) ;; "acute myocardial infarction with ST segment elevation"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Exclusion: patient must NOT have acute myocardial infarction with ST segment elevation
(assert
(! (not patient_has_finding_of_acute_st_segment_elevation_myocardial_infarction_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute myocardial infarction with ST segment elevation."

;; Exclusion: patient must NOT have acute myocardial infarction without ST segment elevation
(assert
(! (not patient_has_finding_of_acute_myocardial_infarction_now@@without_st_segment_elevation)
:named REQ9_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute myocardial infarction without ST segment elevation."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_elevated_serum_cardiac_marker_of_necrosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's serum cardiac marker of necrosis is elevated according to the laboratory reference range.","when_to_set_to_false":"Set to false if the patient's serum cardiac marker of necrosis is not elevated according to the laboratory reference range.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's serum cardiac marker of necrosis is elevated.","meaning":"Boolean indicating whether the patient's serum cardiac marker of necrosis is elevated."} ;; "has elevated serum cardiac markers of necrosis"

(declare-const serum_cardiac_marker_of_necrosis_value_recorded_in_micrograms_per_liter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's serum cardiac marker of necrosis measured in micrograms per liter (μg/L) if available.","when_to_set_to_null":"Set to null if the value of serum cardiac marker of necrosis in serum is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's serum cardiac marker of necrosis in micrograms per liter (μg/L)."} ;; "serum cardiac markers of necrosis"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_elevated_serum_cardiac_marker_of_necrosis)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has elevated serum cardiac markers of necrosis."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_coronary_arteriosclerosis_value_recorded_now_withunit_percent@@diagnosis_is_known Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of coronary artery disease is known, i.e., confirmed and documented in the patient's record.","when_to_set_to_false":"Set to false if the diagnosis of coronary artery disease is not known, i.e., not confirmed or not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of coronary artery disease is known.","meaning":"Boolean indicating whether the diagnosis of coronary artery disease is known (confirmed and documented)."} ;; "known diagnosis of coronary artery disease"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_coronary_arteriosclerosis_value_recorded_now_withunit_percent@@diagnosis_is_known)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known diagnosis of coronary artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_diagnosis_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of myocardial infarction at any time prior to now.","when_to_set_to_false":"Set to false if the patient has no documented diagnosis of myocardial infarction at any time prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of myocardial infarction in their history."} ;; "previously known myocardial infarction"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_diagnosis_of_myocardial_infarction_inthehistory)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a previously known myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_undergone_percutaneous_coronary_intervention_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone percutaneous coronary intervention at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient has ever undergone percutaneous coronary intervention at any time in the past."} ;; "percutaneous coronary intervention"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not patient_has_undergone_percutaneous_coronary_intervention_inthehistory)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous percutaneous coronary intervention."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass grafting at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never undergone coronary artery bypass grafting prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone coronary artery bypass grafting.","meaning":"Boolean indicating whether the patient has ever undergone coronary artery bypass grafting at any time in the past."} ;; "coronary artery bypass grafting"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
  (! (not patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
     :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous coronary artery bypass grafting."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_persistent_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has persistent atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have persistent atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has persistent atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has persistent atrial fibrillation."} ;; "persistent atrial fibrillation"
(declare-const patient_has_finding_of_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has atrioventricular block.","meaning":"Boolean indicating whether the patient currently has atrioventricular block."} ;; "atrioventricular block"
(declare-const patient_has_finding_of_atrioventricular_block_now@@advanced Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has atrioventricular block and the block is advanced.","when_to_set_to_false":"Set to false if the patient currently has atrioventricular block but the block is not advanced.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the atrioventricular block is advanced.","meaning":"Boolean indicating whether the patient's current atrioventricular block is advanced."} ;; "advanced atrioventricular block"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_atrioventricular_block_now@@advanced
      patient_has_finding_of_atrioventricular_block_now)
:named REQ15_AUXILIARY0)) ;; "advanced atrioventricular block""

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_persistent_atrial_fibrillation_now)
:named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has persistent atrial fibrillation."

(assert
(! (not patient_has_finding_of_atrioventricular_block_now@@advanced)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has advanced atrioventricular block."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "the patient has asthma"

(declare-const patient_is_exposed_to_aminophylline_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to aminophylline.","when_to_set_to_false":"Set to false if the patient is currently not exposed to aminophylline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to aminophylline.","meaning":"Boolean indicating whether the patient is currently exposed to aminophylline."} ;; "the patient is on chronic treatment with aminophylline"

(declare-const patient_is_exposed_to_aminophylline_now@@chronic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current exposure to aminophylline is due to chronic treatment.","when_to_set_to_false":"Set to false if the patient's current exposure to aminophylline is not due to chronic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current exposure to aminophylline is due to chronic treatment.","meaning":"Boolean indicating whether the patient's current exposure to aminophylline is due to chronic treatment."} ;; "the patient is on chronic treatment with aminophylline"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_aminophylline_now@@chronic_treatment
      patient_is_exposed_to_aminophylline_now)
:named REQ16_AUXILIARY0)) ;; "the patient is on chronic treatment with aminophylline"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (or patient_has_diagnosis_of_asthma_now
            patient_is_exposed_to_aminophylline_now@@chronic_treatment))
:named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has asthma) OR (the patient is on chronic treatment with aminophylline)."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const cerebral_ischemic_attack_time_since_most_recent_event_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent cerebral ischemic attack event, if known.","when_to_set_to_null":"Set to null if the time since the most recent cerebral ischemic attack event is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent cerebral ischemic attack event."} ;; "the patient has had a cerebral ischemic attack within the past six months"

(declare-const patient_has_history_of_cerebral_ischemic_attack_within_past_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebral ischemic attack that occurred within the past six months.","when_to_set_to_false":"Set to false if the patient has not had a cerebral ischemic attack within the past six months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebral ischemic attack within the past six months.","meaning":"Boolean indicating whether the patient has had a cerebral ischemic attack within the past six months."} ;; "the patient has had a cerebral ischemic attack within the past six months"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Definition: patient has history of cerebral ischemic attack within past 6 months if and only if time since most recent event is less than 6 months
(assert
(! (= patient_has_history_of_cerebral_ischemic_attack_within_past_6_months
     (< cerebral_ischemic_attack_time_since_most_recent_event_in_months 6))
:named REQ17_AUXILIARY0)) ;; "the patient has had a cerebral ischemic attack within the past six months"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not patient_has_history_of_cerebral_ischemic_attack_within_past_6_months)
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a cerebral ischemic attack within the past six months."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_carotid_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of carotid artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of carotid artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has carotid artery stenosis.","meaning":"Boolean indicating whether the patient currently has carotid artery stenosis."} ;; "carotid stenosis"
(declare-const patient_has_finding_of_carotid_artery_stenosis_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's carotid artery stenosis is known (diagnosed/documented).","when_to_set_to_false":"Set to false if the patient's carotid artery stenosis is not known (not diagnosed/documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carotid artery stenosis is known.","meaning":"Boolean indicating whether the patient's carotid artery stenosis is known."} ;; "known carotid stenosis"
(declare-const patient_has_finding_of_carotid_artery_stenosis_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's carotid artery stenosis is significant (meets clinical criteria for significance).","when_to_set_to_false":"Set to false if the patient's carotid artery stenosis is not significant (does not meet clinical criteria for significance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the carotid artery stenosis is significant.","meaning":"Boolean indicating whether the patient's carotid artery stenosis is significant."} ;; "significant carotid stenosis"
(declare-const patient_has_finding_of_aneurysm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of vascular aneurysms.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of vascular aneurysms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vascular aneurysms.","meaning":"Boolean indicating whether the patient currently has vascular aneurysms."} ;; "aneurysms"
(declare-const patient_has_finding_of_aneurysm_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vascular aneurysms are known (diagnosed/documented).","when_to_set_to_false":"Set to false if the patient's vascular aneurysms are not known (not diagnosed/documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vascular aneurysms are known.","meaning":"Boolean indicating whether the patient's vascular aneurysms are known."} ;; "known vascular aneurysms"
(declare-const patient_has_finding_of_aneurysm_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's vascular aneurysms are significant (meets clinical criteria for significance).","when_to_set_to_false":"Set to false if the patient's vascular aneurysms are not significant (does not meet clinical criteria for significance).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vascular aneurysms are significant.","meaning":"Boolean indicating whether the patient's vascular aneurysms are significant."} ;; "significant vascular aneurysms"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_carotid_artery_stenosis_now@@known
      patient_has_finding_of_carotid_artery_stenosis_now)
    :named REQ18_AUXILIARY0)) ;; "known carotid stenosis"
(assert
(! (=> patient_has_finding_of_carotid_artery_stenosis_now@@significant
      patient_has_finding_of_carotid_artery_stenosis_now)
    :named REQ18_AUXILIARY1)) ;; "significant carotid stenosis"
(assert
(! (=> patient_has_finding_of_aneurysm_now@@known
      patient_has_finding_of_aneurysm_now)
    :named REQ18_AUXILIARY2)) ;; "known vascular aneurysms"
(assert
(! (=> patient_has_finding_of_aneurysm_now@@significant
      patient_has_finding_of_aneurysm_now)
    :named REQ18_AUXILIARY3)) ;; "significant vascular aneurysms"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_carotid_artery_stenosis_now@@known)
    :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has known significant carotid stenosis"
(assert
(! (not patient_has_finding_of_aneurysm_now@@known)
    :named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has known significant vascular aneurysms"

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant neoplastic disease (cancer).","when_to_set_to_false":"Set to false if the patient currently does not have malignant neoplastic disease (cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant neoplastic disease (cancer).","meaning":"Boolean indicating whether the patient currently has malignant neoplastic disease (cancer)."} ;; "cancer"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@active_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient's malignant neoplastic disease (cancer) is currently active.","when_to_set_to_false":"Set to false if the patient's malignant neoplastic disease (cancer) is currently not active (e.g., in remission, inactive, or resolved).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malignant neoplastic disease (cancer) is active.","meaning":"Boolean indicating whether the patient's malignant neoplastic disease (cancer) is active."} ;; "active cancer"

;; ===================== Auxiliary Assertions (REQ 19) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@active_status
      patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ19_AUXILIARY0)) ;; "active cancer" implies "cancer"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now@@active_status)
:named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active cancer."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding or diagnosis of hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding or diagnosis of hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding or diagnosis of hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has a clinical finding or diagnosis of hypertensive disorder (hypertension)."} ;; "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current hypertensive disorder (hypertension) is severe.","when_to_set_to_false":"Set to false if the patient's current hypertensive disorder (hypertension) is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current hypertensive disorder (hypertension) is severe.","meaning":"Boolean indicating whether the patient's current hypertensive disorder (hypertension) is severe."} ;; "severe hypertension"
(declare-const therapy_withdrawal_duration_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours for which the patient can withdraw therapy, as documented or reported.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined for how many hours the patient can withdraw therapy.","meaning":"Numeric value representing the duration in hours for which the patient can withdraw therapy."} ;; "cannot withdraw therapy for at least twelve hours"

;; ===================== Auxiliary Assertions (REQ 20) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypertensive_disorder_now@@severe
       patient_has_finding_of_hypertensive_disorder_now)
   :named REQ20_AUXILIARY0)) ;; "severe hypertension"

;; ===================== Constraint Assertions (REQ 20) =====================
;; Exclusion: patient has severe hypertension AND cannot withdraw therapy for at least twelve hours
(assert
(! (not (and patient_has_finding_of_hypertensive_disorder_now@@severe
             (< therapy_withdrawal_duration_in_hours 12)))
   :named REQ20_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient has severe hypertension) AND (the patient cannot withdraw therapy for at least twelve hours)."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_congenital_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital heart disease.","meaning":"Boolean indicating whether the patient currently has congenital heart disease."} ;; "congenital heart disease"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
  (! (not patient_has_finding_of_congenital_heart_disease_now)
     :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital heart disease."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_heart_valve_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (valvular disease), regardless of severity.","when_to_set_to_false":"Set to false if the patient currently does not have a heart valve disorder (valvular disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a heart valve disorder (valvular disease).","meaning":"Boolean indicating whether the patient currently has a heart valve disorder (valvular disease)."} ;; "valvular disease"
(declare-const patient_has_finding_of_heart_valve_disorder_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a heart valve disorder (valvular disease) and the disorder is significant.","when_to_set_to_false":"Set to false if the patient currently has a heart valve disorder (valvular disease) but the disorder is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart valve disorder (valvular disease) is significant.","meaning":"Boolean indicating whether the patient's current heart valve disorder (valvular disease) is significant."} ;; "significant valvular disease"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_heart_valve_disorder_now@@significant
       patient_has_finding_of_heart_valve_disorder_now)
   :named REQ22_AUXILIARY0)) ;; "significant valvular disease" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_heart_valve_disorder_now@@significant)
   :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant valvular disease."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any form of cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have any form of cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any form of cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has any form of cardiomyopathy."} ;; "cardiomyopathy"
(declare-const patient_has_finding_of_dilated_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dilated cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have dilated cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dilated cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has dilated cardiomyopathy."} ;; "dilated cardiomyopathy"
(declare-const patient_has_finding_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"
(declare-const patient_has_finding_of_arrhythmogenic_right_ventricular_dysplasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has arrhythmogenic right ventricular dysplasia (cardiomyopathy).","when_to_set_to_false":"Set to false if the patient currently does not have arrhythmogenic right ventricular dysplasia (cardiomyopathy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arrhythmogenic right ventricular dysplasia (cardiomyopathy).","meaning":"Boolean indicating whether the patient currently has arrhythmogenic right ventricular dysplasia (cardiomyopathy)."} ;; "arrhythmogenic right ventricular cardiomyopathy"
(declare-const patient_has_finding_of_amyloidosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has amyloidosis.","when_to_set_to_false":"Set to false if the patient currently does not have amyloidosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has amyloidosis.","meaning":"Boolean indicating whether the patient currently has amyloidosis."} ;; "amyloidosis"

;; ===================== Auxiliary Assertions (REQ 23) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_dilated_cardiomyopathy_now
           patient_has_finding_of_hypertrophic_cardiomyopathy_now
           patient_has_finding_of_arrhythmogenic_right_ventricular_dysplasia_now
           patient_has_finding_of_amyloidosis_now)
        patient_has_finding_of_cardiomyopathy_now)
   :named REQ23_AUXILIARY0)) ;; "with non-exhaustive examples ((dilated cardiomyopathy) OR (hypertrophic cardiomyopathy) OR (arrhythmogenic right ventricular cardiomyopathy) OR (amyloidosis))."

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not patient_has_finding_of_cardiomyopathy_now)
   :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiomyopathy with non-exhaustive examples ((dilated cardiomyopathy) OR (hypertrophic cardiomyopathy) OR (arrhythmogenic right ventricular cardiomyopathy) OR (amyloidosis))."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_is_able_to_provide_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to provide informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to provide informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to provide informed consent.","meaning":"Boolean indicating whether the patient is currently able to provide informed consent."} ;; "The patient is excluded if the patient is unable to provide informed consent."

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not patient_is_able_to_provide_informed_consent_now)
:named REQ24_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to provide informed consent."
