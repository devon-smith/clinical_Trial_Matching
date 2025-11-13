;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const lesion_count_in_same_vessel_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of lesions present in the same vessel at the current time, as recorded in the patient's data.","when_to_set_to_null":"Set to null if the number of lesions in the same vessel is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the count of lesions present in the same vessel at the current time."} ;; "the number of lesions present in the same vessel at the current time, recorded as a count"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (>= lesion_count_in_same_vessel_value_recorded_now_withunit_count 2))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has greater than or equal to 2 lesions in the same vessel."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthepast48hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a diagnosis of acute ST-elevation myocardial infarction (STEMI) within the past 48 hours.","when_to_set_to_false":"Set to false if the patient has not had a diagnosis of acute ST-elevation myocardial infarction (STEMI) within the past 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a diagnosis of acute ST-elevation myocardial infarction (STEMI) within the past 48 hours.","meaning":"Boolean indicating whether the patient has had a diagnosis of acute ST-elevation myocardial infarction (STEMI) within the past 48 hours."} ;; "ST-elevation myocardial infarction within the previous 48 hours"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_acute_st_segment_elevation_myocardial_infarction_inthepast48hours)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute coronary syndrome with ST-elevation myocardial infarction within the previous 48 hours."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_vessel_outside_diameter_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value in millimeters if the patient's vessel reference diameter is recorded now.","when_to_set_to_null":"Set to null if no vessel reference diameter measurement is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's vessel reference diameter (outside diameter) measured now, in millimeters."} ;; "vessel reference diameter"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (< patient_vessel_outside_diameter_value_recorded_now_withunit_millimeter 2.50))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a vessel reference diameter less than 2.50 millimeters."

(assert
(! (not (> patient_vessel_outside_diameter_value_recorded_now_withunit_millimeter 3.50))
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a vessel reference diameter greater than 3.50 millimeters."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const lesion_length_value_recorded_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's lesion length in millimeters if it is documented.","when_to_set_to_null":"Set to null if the lesion length in millimeters is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the length of the patient's lesion, recorded in millimeters."} ;; "lesion length greater than 24 millimeters"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (> lesion_length_value_recorded_withunit_millimeter 24))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a lesion length greater than 24 millimeters."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left main coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have left main coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left main coronary artery disease.","meaning":"Boolean indicating whether the patient currently has left main coronary artery disease."} ;; "left main coronary artery disease"
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now@@unprotected_status Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left main coronary artery disease and the disease is unprotected (no bypass graft or stent protecting the left main coronary artery).","when_to_set_to_false":"Set to false if the patient currently has left main coronary artery disease and the disease is protected (e.g., by a bypass graft or stent).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the left main coronary artery disease is unprotected.","meaning":"Boolean indicating whether the patient's left main coronary artery disease is unprotected."} ;; "unprotected left main coronary artery disease"
(declare-const patient_left_main_coronary_artery_disease_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of left main coronary artery stenosis recorded now is available.","when_to_set_to_null":"Set to null if no such percentage measurement recorded now is available or the value is indeterminate.","meaning":"Numeric percentage representing the degree of stenosis in the patient's left main coronary artery disease recorded now."} ;; "stenosis greater than 50 percent"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_left_main_coronary_artery_disease_now@@unprotected_status
      patient_has_finding_of_left_main_coronary_artery_disease_now)
:named REQ4_AUXILIARY0)) ;; "unprotected left main coronary artery disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_left_main_coronary_artery_disease_now@@unprotected_status
             (> patient_left_main_coronary_artery_disease_stenosis_value_recorded_now_withunit_percent 50)))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unprotected left main coronary artery disease with stenosis greater than 50 percent."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_finding_of_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a lesion as a target for intervention.","when_to_set_to_false":"Set to false if the patient currently does not have a lesion as a target for intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a lesion as a target for intervention.","meaning":"Boolean indicating whether the patient currently has a lesion as a target for intervention."} ;; "lesion"
(declare-const patient_has_finding_of_finding_of_lesion_now@@ostial_location Bool) ;; {"when_to_set_to_true":"Set to true if the patient's target lesion is located at the ostium (ostial location).","when_to_set_to_false":"Set to false if the patient's target lesion is not located at the ostium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's target lesion is located at the ostium.","meaning":"Boolean indicating whether the patient's target lesion is located at the ostium (ostial location)."} ;; "ostial target lesion"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_finding_of_lesion_now@@ostial_location
      patient_has_finding_of_finding_of_lesion_now)
:named REQ5_AUXILIARY0)) ;; "ostial target lesion" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_finding_of_lesion_now@@ostial_location)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an ostial target lesion."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_target_lesion_in_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a target lesion located in any graft.","when_to_set_to_false":"Set to false if the patient currently does not have a target lesion located in any graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a target lesion located in any graft.","meaning":"Boolean indicating whether the patient currently has a target lesion located in any graft."} ;; "has a target lesion in a venous graft"
(declare-const patient_has_target_lesion_in_graft_now@@venous Bool) ;; {"when_to_set_to_true":"Set to true if the graft in which the target lesion is located is a venous graft.","when_to_set_to_false":"Set to false if the graft in which the target lesion is located is not a venous graft (e.g., arterial or synthetic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the graft in which the target lesion is located is venous.","meaning":"Boolean indicating whether the graft in which the target lesion is located is venous."} ;; "has a target lesion in a venous graft"
(declare-const patient_is_exposed_to_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a graft (of any type).","when_to_set_to_false":"Set to false if the patient is currently not exposed to any graft.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a graft.","meaning":"Boolean indicating whether the patient is currently exposed to a graft (of any type)."} ;; "graft"
(declare-const patient_is_exposed_to_graft_now@@venous Bool) ;; {"when_to_set_to_true":"Set to true if the graft to which the patient is currently exposed is a venous graft.","when_to_set_to_false":"Set to false if the graft to which the patient is currently exposed is not a venous graft (e.g., arterial or synthetic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the graft is venous.","meaning":"Boolean indicating whether the graft to which the patient is currently exposed is venous."} ;; "venous graft"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_target_lesion_in_graft_now@@venous
      patient_has_target_lesion_in_graft_now)
:named REQ6_AUXILIARY0)) ;; "has a target lesion in a venous graft"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_exposed_to_graft_now@@venous
      patient_is_exposed_to_graft_now)
:named REQ6_AUXILIARY1)) ;; "venous graft"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_target_lesion_in_graft_now@@venous)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a target lesion in a venous graft."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_angiographic_evidence_of_thrombus_within_target_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has angiographic evidence of thrombus within the target lesion.","when_to_set_to_false":"Set to false if the patient currently does not have angiographic evidence of thrombus within the target lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has angiographic evidence of thrombus within the target lesion.","meaning":"Boolean indicating whether the patient currently has angiographic evidence of thrombus within the target lesion."} ;; "angiographic evidence of thrombus within the target lesion"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_angiographic_evidence_of_thrombus_within_target_lesion_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has angiographic evidence of thrombus within the target lesion."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_calcified_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a calcified lesion.","when_to_set_to_false":"Set to false if the patient currently does not have a calcified lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a calcified lesion.","meaning":"Boolean indicating whether the patient currently has a calcified lesion."} ;; "has a calcified lesion"
(declare-const patient_has_finding_of_calcified_lesion_now@@cannot_be_successfully_predilated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current calcified lesion cannot be successfully predilated.","when_to_set_to_false":"Set to false if the patient's current calcified lesion can be successfully predilated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current calcified lesion can be successfully predilated.","meaning":"Boolean indicating whether the patient's current calcified lesion cannot be successfully predilated."} ;; "calcified lesion which cannot be successfully predilated"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_calcified_lesion_now@@cannot_be_successfully_predilated
      patient_has_finding_of_calcified_lesion_now)
:named REQ8_AUXILIARY0)) ;; "calcified lesion which cannot be successfully predilated""

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_calcified_lesion_now@@cannot_be_successfully_predilated)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a calcified lesion which cannot be successfully predilated."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured value if a documented left ventricular ejection fraction (LVEF) in percent is recorded for the patient now.","when_to_set_to_null":"Set to null if no documented LVEF measurement in percent is available for the patient now or the value is indeterminate.","meaning":"Numeric value representing the patient's left ventricular ejection fraction, recorded now, in percent."} ;; "left ventricular ejection fraction"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@is_documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left ventricular ejection fraction measurement is documented in the medical record.","when_to_set_to_false":"Set to false if the patient's left ventricular ejection fraction measurement is not documented.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the measurement is documented.","meaning":"Boolean indicating whether the patient's left ventricular ejection fraction measurement is documented."} ;; "documented left ventricular ejection fraction"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@is_documented
             (<= patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 25)))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a documented left ventricular ejection fraction less than or equal to 25 percent."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine concentration (in mg/dl) is recorded now (at the time of treatment).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's creatinine concentration (in mg/dl) measured now (at the time of treatment)."} ;; "creatinine concentration > 3.0 mg/dl at the time of treatment"
(declare-const patient_has_finding_of_renal_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has impaired renal function (renal impairment).","when_to_set_to_false":"Set to false if the patient currently does not have impaired renal function (renal impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired renal function (renal impairment).","meaning":"Boolean indicating whether the patient currently has impaired renal function (renal impairment)."} ;; "impaired renal function"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Definition: impaired renal function is defined as creatinine concentration > 3.0 mg/dl at the time of treatment
(assert
(! (= patient_has_finding_of_renal_impairment_now
     (> patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 3.0))
   :named REQ10_AUXILIARY0)) ;; "impaired renal function (defined as creatinine concentration > 3.0 mg/dl at the time of treatment)"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_now)
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has impaired renal function (defined as creatinine concentration > 3.0 mg/dl at the time of treatment)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_received_pretreatment_with_device_other_than_balloon_angioplasty_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received pretreatment with any device other than balloon angioplasty at any time in the history.","when_to_set_to_false":"Set to false if the patient has not received pretreatment with any device other than balloon angioplasty at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received pretreatment with any device other than balloon angioplasty at any time in the history.","meaning":"Boolean indicating whether the patient has received pretreatment with any device other than balloon angioplasty in the history."} ;; "has received pretreatment with devices other than balloon angioplasty"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_received_pretreatment_with_device_other_than_balloon_angioplasty_in_the_history)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received pretreatment with devices other than balloon angioplasty."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_prior_stent_within_5mm_of_target_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a stent that was placed prior to the current evaluation and is located within 5 millimeters of the target lesion.","when_to_set_to_false":"Set to false if the patient does not have a stent that was placed prior to the current evaluation and is located within 5 millimeters of the target lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a prior stent within 5 millimeters of the target lesion.","meaning":"Boolean indicating whether the patient has a prior stent within 5 millimeters of the target lesion."} ;; "has a prior stent within 5 mm of the target lesion"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_prior_stent_within_5mm_of_target_lesion)
    :named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior stent within 5 mm of the target lesion."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_undergone_transplantation_of_heart_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone heart transplantation at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone heart transplantation at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone heart transplantation.","meaning":"Boolean indicating whether the patient has ever undergone heart transplantation in their medical history."} ;; "heart transplant"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
  (! (not patient_has_undergone_transplantation_of_heart_inthehistory)
     :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a recipient of a heart transplant."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_allergy_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to aspirin.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to aspirin.","meaning":"Boolean indicating whether the patient currently has a known allergy to aspirin."} ;; "the patient has a known allergy to aspirin"
(declare-const patient_has_finding_of_allergy_to_aspirin_now@@cannot_be_managed_medically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to aspirin cannot be managed medically.","when_to_set_to_false":"Set to false if the patient's allergy to aspirin can be managed medically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to aspirin can be managed medically.","meaning":"Boolean indicating whether the patient's allergy to aspirin cannot be managed medically."} ;; "the allergy cannot be managed medically (aspirin)"
(declare-const patient_has_finding_of_allergy_to_clopidogrel_bisulfate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to clopidogrel bisulfate.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to clopidogrel bisulfate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to clopidogrel bisulfate.","meaning":"Boolean indicating whether the patient currently has a known allergy to clopidogrel bisulfate."} ;; "the patient has a known allergy to clopidogrel bisulfate"
(declare-const patient_has_finding_of_allergy_to_clopidogrel_bisulfate_now@@cannot_be_managed_medically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to clopidogrel bisulfate cannot be managed medically.","when_to_set_to_false":"Set to false if the patient's allergy to clopidogrel bisulfate can be managed medically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to clopidogrel bisulfate can be managed medically.","meaning":"Boolean indicating whether the patient's allergy to clopidogrel bisulfate cannot be managed medically."} ;; "the allergy cannot be managed medically (clopidogrel bisulfate)"
(declare-const patient_has_finding_of_allergy_to_ticlopidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to ticlopidine.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to ticlopidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to ticlopidine.","meaning":"Boolean indicating whether the patient currently has a known allergy to ticlopidine."} ;; "the patient has a known allergy to ticlopidine"
(declare-const patient_has_finding_of_allergy_to_ticlopidine_now@@cannot_be_managed_medically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to ticlopidine cannot be managed medically.","when_to_set_to_false":"Set to false if the patient's allergy to ticlopidine can be managed medically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to ticlopidine can be managed medically.","meaning":"Boolean indicating whether the patient's allergy to ticlopidine cannot be managed medically."} ;; "the allergy cannot be managed medically (ticlopidine)"
(declare-const patient_has_finding_of_allergy_to_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to heparin.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to heparin.","meaning":"Boolean indicating whether the patient currently has a known allergy to heparin."} ;; "the patient has a known allergy to heparin"
(declare-const patient_has_finding_of_allergy_to_heparin_now@@cannot_be_managed_medically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to heparin cannot be managed medically.","when_to_set_to_false":"Set to false if the patient's allergy to heparin can be managed medically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to heparin can be managed medically.","meaning":"Boolean indicating whether the patient's allergy to heparin cannot be managed medically."} ;; "the allergy cannot be managed medically (heparin)"
(declare-const patient_has_finding_of_allergy_to_cobalt_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to cobalt.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to cobalt.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to cobalt.","meaning":"Boolean indicating whether the patient currently has a known allergy to cobalt."} ;; "the patient has a known allergy to cobalt"
(declare-const patient_has_finding_of_allergy_to_cobalt_now@@cannot_be_managed_medically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to cobalt cannot be managed medically.","when_to_set_to_false":"Set to false if the patient's allergy to cobalt can be managed medically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to cobalt can be managed medically.","meaning":"Boolean indicating whether the patient's allergy to cobalt cannot be managed medically."} ;; "the allergy cannot be managed medically (cobalt)"
(declare-const patient_has_finding_of_allergy_to_chromium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to chromium.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to chromium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to chromium.","meaning":"Boolean indicating whether the patient currently has a known allergy to chromium."} ;; "the patient has a known allergy to chromium"
(declare-const patient_has_finding_of_allergy_to_chromium_now@@cannot_be_managed_medically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to chromium cannot be managed medically.","when_to_set_to_false":"Set to false if the patient's allergy to chromium can be managed medically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to chromium can be managed medically.","meaning":"Boolean indicating whether the patient's allergy to chromium cannot be managed medically."} ;; "the allergy cannot be managed medically (chromium)"
(declare-const patient_has_finding_of_allergy_to_contrast_media_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known allergy to contrast media.","when_to_set_to_false":"Set to false if the patient currently does not have a known allergy to contrast media.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known allergy to contrast media.","meaning":"Boolean indicating whether the patient currently has a known allergy to contrast media."} ;; "the patient has a known allergy to contrast agent"
(declare-const patient_has_finding_of_allergy_to_contrast_media_now@@cannot_be_managed_medically Bool) ;; {"when_to_set_to_true":"Set to true if the patient's allergy to contrast media cannot be managed medically.","when_to_set_to_false":"Set to false if the patient's allergy to contrast media can be managed medically.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergy to contrast media can be managed medically.","meaning":"Boolean indicating whether the patient's allergy to contrast media cannot be managed medically."} ;; "the allergy cannot be managed medically (contrast agent)"

;; ===================== Auxiliary Assertions (REQ 14) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_allergy_to_aspirin_now@@cannot_be_managed_medically
      patient_has_finding_of_allergy_to_aspirin_now)
   :named REQ14_AUXILIARY0)) ;; "the allergy cannot be managed medically (aspirin)" implies "the patient has a known allergy to aspirin"

(assert
(! (=> patient_has_finding_of_allergy_to_clopidogrel_bisulfate_now@@cannot_be_managed_medically
      patient_has_finding_of_allergy_to_clopidogrel_bisulfate_now)
   :named REQ14_AUXILIARY1)) ;; "the allergy cannot be managed medically (clopidogrel bisulfate)" implies "the patient has a known allergy to clopidogrel bisulfate"

(assert
(! (=> patient_has_finding_of_allergy_to_ticlopidine_now@@cannot_be_managed_medically
      patient_has_finding_of_allergy_to_ticlopidine_now)
   :named REQ14_AUXILIARY2)) ;; "the allergy cannot be managed medically (ticlopidine)" implies "the patient has a known allergy to ticlopidine"

(assert
(! (=> patient_has_finding_of_allergy_to_heparin_now@@cannot_be_managed_medically
      patient_has_finding_of_allergy_to_heparin_now)
   :named REQ14_AUXILIARY3)) ;; "the allergy cannot be managed medically (heparin)" implies "the patient has a known allergy to heparin"

(assert
(! (=> patient_has_finding_of_allergy_to_cobalt_now@@cannot_be_managed_medically
      patient_has_finding_of_allergy_to_cobalt_now)
   :named REQ14_AUXILIARY4)) ;; "the allergy cannot be managed medically (cobalt)" implies "the patient has a known allergy to cobalt"

(assert
(! (=> patient_has_finding_of_allergy_to_chromium_now@@cannot_be_managed_medically
      patient_has_finding_of_allergy_to_chromium_now)
   :named REQ14_AUXILIARY5)) ;; "the allergy cannot be managed medically (chromium)" implies "the patient has a known allergy to chromium"

(assert
(! (=> patient_has_finding_of_allergy_to_contrast_media_now@@cannot_be_managed_medically
      patient_has_finding_of_allergy_to_contrast_media_now)
   :named REQ14_AUXILIARY6)) ;; "the allergy cannot be managed medically (contrast agent)" implies "the patient has a known allergy to contrast agent"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not (or patient_has_finding_of_allergy_to_aspirin_now@@cannot_be_managed_medically
            patient_has_finding_of_allergy_to_clopidogrel_bisulfate_now@@cannot_be_managed_medically
            patient_has_finding_of_allergy_to_ticlopidine_now@@cannot_be_managed_medically
            patient_has_finding_of_allergy_to_heparin_now@@cannot_be_managed_medically
            patient_has_finding_of_allergy_to_cobalt_now@@cannot_be_managed_medically
            patient_has_finding_of_allergy_to_chromium_now@@cannot_be_managed_medically
            patient_has_finding_of_allergy_to_contrast_media_now@@cannot_be_managed_medically))
   :named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has a known allergy to aspirin) OR (the patient has a known allergy to clopidogrel bisulfate) OR (the patient has a known allergy to ticlopidine) OR (the patient has a known allergy to heparin) OR (the patient has a known allergy to cobalt) OR (the patient has a known allergy to chromium) OR (the patient has a known allergy to contrast agent)) AND (the allergy cannot be managed medically)."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident within the past 6 months."} ;; "the patient has had a cerebrovascular accident within the past 6 months"
(declare-const patient_has_finding_of_intracranial_hemorrhage_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an intracranial hemorrhage within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had an intracranial hemorrhage within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an intracranial hemorrhage within the past 6 months.","meaning":"Boolean indicating whether the patient has had an intracranial hemorrhage within the past 6 months."} ;; "the patient has had intracranial hemorrhage within the past 6 months"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
  (! (not patient_has_finding_of_cerebrovascular_accident_inthepast6months)
     :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a cerebrovascular accident within the past 6 months."

(assert
  (! (not patient_has_finding_of_intracranial_hemorrhage_inthepast6months)
     :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had intracranial hemorrhage within the past 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "medical condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@significant_and_investigator_opinion_interferes_with_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding, and, in the investigator's opinion, the condition is significant and may interfere with the patient's optimal participation in the study.","when_to_set_to_false":"Set to false if the patient currently has any disease, condition, or clinical finding, but, in the investigator's opinion, the condition is not significant or does not interfere with the patient's optimal participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the condition is significant and may interfere with the patient's optimal participation in the study, as judged by the investigator.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding, and, in the investigator's opinion, the condition is significant and may interfere with the patient's optimal participation in the study."} ;; "any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@significant_and_investigator_opinion_interferes_with_study_participation
      patient_has_finding_of_disease_condition_finding_now)
:named REQ16_AUXILIARY0)) ;; "any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@significant_and_investigator_opinion_interferes_with_study_participation)
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any significant medical condition which, in the investigator's opinion, may interfere with the patient's optimal participation in the study."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_undergoing_clinical_drug_trial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a clinical drug trial (investigational drug study).","when_to_set_to_false":"Set to false if the patient is currently not participating in a clinical drug trial (investigational drug study).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a clinical drug trial.","meaning":"Boolean indicating whether the patient is currently participating in a clinical drug trial."} ;; "the patient is currently participating in an investigational drug study"
(declare-const patient_is_undergoing_medical_device_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in a medical device study.","when_to_set_to_false":"Set to false if the patient is currently not participating in a medical device study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in a medical device study.","meaning":"Boolean indicating whether the patient is currently participating in a medical device study."} ;; "the patient is currently participating in another medical device study"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (or patient_is_undergoing_clinical_drug_trial_now
            patient_is_undergoing_medical_device_study_now))
   :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is currently participating in an investigational drug study) OR (the patient is currently participating in another medical device study))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const lesion_is_not_suitable_for_stenting_in_investigators_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's opinion, the lesion is not suitable for stenting.","when_to_set_to_false":"Set to false if, in the investigator's opinion, the lesion is suitable for stenting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the investigator's opinion, the lesion is suitable for stenting.","meaning":"Boolean indicating whether, in the investigator's opinion, the lesion is not suitable for stenting."} ;; "in the investigator's opinion, the lesion is not suitable for stenting"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not lesion_is_not_suitable_for_stenting_in_investigators_opinion)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if, in the investigator's opinion, the lesion is not suitable for stenting."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_life_expectancy_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current life expectancy in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current life expectancy in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current life expectancy in months."} ;; "life expectancy ≤ 12 months"

(declare-const patient_age_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the patient's current age in months if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in months."} ;; "patient's current age in months" (not used in assertion, but declared for completeness per <new_variable_declarations>)

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not (<= patient_life_expectancy_value_recorded_now_in_months 12))
    :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a life expectancy ≤ 12 months."
