;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const left_main_coronary_artery_diameter_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the percentage value if the diameter stenosis of the left main coronary artery is measured by angiography at the current time.","when_to_set_to_null":"Set to null if the percentage value of diameter stenosis of the left main coronary artery is not measured, not documented, or cannot be determined at the current time.","meaning":"Numeric value representing the percentage of diameter stenosis of the left main coronary artery as measured by angiography at the current time."} // "angiographic diameter stenosis"
(declare-const left_main_coronary_artery_revascularization_required_now Bool) ;; {"when_to_set_to_true":"Set to true if revascularization of the left main coronary artery is required at the current time based on angiographic findings.","when_to_set_to_false":"Set to false if revascularization of the left main coronary artery is not required at the current time based on angiographic findings.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether revascularization of the left main coronary artery is required at the current time based on angiographic findings.","meaning":"Boolean indicating whether revascularization of the left main coronary artery is required at the current time based on angiographic findings."} // "requiring revascularization"
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left main coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left main coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of left main coronary artery disease.","meaning":"Boolean indicating whether the patient currently has left main coronary artery disease."} // "left main coronary artery disease"
(declare-const patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unprotected left main coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have unprotected left main coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unprotected left main coronary artery disease.","meaning":"Boolean indicating whether the patient currently has unprotected left main coronary artery disease."} // "unprotected left main coronary artery disease"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now
         patient_has_finding_of_left_main_coronary_artery_disease_now)
     :named REQ0_AUXILIARY0)) ;; "unprotected left main coronary artery disease" implies "left main coronary artery disease"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must have unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization with angiographic diameter stenosis ≥ 70%.
(assert
  (! (and patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now
          left_main_coronary_artery_revascularization_required_now
          (>= left_main_coronary_artery_diameter_stenosis_value_recorded_now_withunit_percent 70.0))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization with angiographic diameter stenosis ≥ 70%."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T03:56:52.844602 policy=eventual
;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the recorded percentage value of angiographic diameter stenosis of the left main coronary artery now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the percentage of angiographic diameter stenosis of the left main coronary artery recorded now."} // "angiographic diameter stenosis"
(declare-const left_main_coronary_artery_fractional_flow_reserve_value_recorded_now Real) ;; {"when_to_set_to_value":"Set to the recorded fractional flow reserve value of the left main coronary artery now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the fractional flow reserve of the left main coronary artery recorded now."} // "fractional flow reserve"
(declare-const left_main_coronary_artery_intravascular_ultrasound_minimum_lumen_area_value_recorded_now_withunit_mm2 Real) ;; {"when_to_set_to_value":"Set to the recorded minimum lumen area value of the left main coronary artery measured by intravascular ultrasound now, in mm².","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the minimum lumen area of the left main coronary artery measured by intravascular ultrasound, recorded now, in mm²."} // "intravascular ultrasound minimum lumen area"
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now@@defined_by_angiographic_and_functional_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left main coronary artery disease and the disease is defined by the specified angiographic and functional criteria.","when_to_set_to_false":"Set to false if the patient currently has left main coronary artery disease but the disease is not defined by the specified angiographic and functional criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is defined by the specified angiographic and functional criteria.","meaning":"Boolean indicating whether the patient's left main coronary artery disease is defined by the specified angiographic and functional criteria."} // "defined by angiographic and functional criteria"
(declare-const patient_has_noninvasive_evidence_of_myocardial_ischemia_referable_to_hemodynamically_significant_left_main_coronary_artery_lesion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion.","when_to_set_to_false":"Set to false if the patient currently does not have non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion.","meaning":"Boolean indicating whether the patient currently has non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion."} // "non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: The disease is defined by the specified angiographic and functional criteria
(assert
  (! (= patient_has_finding_of_left_main_coronary_artery_disease_now@@defined_by_angiographic_and_functional_criteria
        (and
          patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now
          left_main_coronary_artery_revascularization_required_now
          (>= left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 50.0)
          (< left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 70.0)
          (or
            patient_has_noninvasive_evidence_of_myocardial_ischemia_referable_to_hemodynamically_significant_left_main_coronary_artery_lesion_now
            (<= left_main_coronary_artery_intravascular_ultrasound_minimum_lumen_area_value_recorded_now_withunit_mm2 6.0)
            (<= left_main_coronary_artery_fractional_flow_reserve_value_recorded_now 0.80)
          )
        )
     )
     :named REQ1_AUXILIARY0)) ;; "defined by angiographic and functional criteria"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_left_main_coronary_artery_disease_now@@defined_by_angiographic_and_functional_criteria
         patient_has_finding_of_left_main_coronary_artery_disease_now)
     :named REQ1_AUXILIARY1)) ;; "left main coronary artery disease defined by criteria" implies "left main coronary artery disease"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Must have unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization with (angiographic diameter stenosis ≥ 50% AND < 70%)
(assert
  (! (and patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now
          left_main_coronary_artery_revascularization_required_now
          (>= left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 50.0)
          (< left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 70.0))
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization with (angiographic diameter stenosis ≥ 50% AND < 70%)"

;; Component 1: Must have at least one of the following: (non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion) OR (intravascular ultrasound minimum lumen area ≤ 6.0 mm²) OR (fractional flow reserve ≤ 0.80)
(assert
  (! (or patient_has_noninvasive_evidence_of_myocardial_ischemia_referable_to_hemodynamically_significant_left_main_coronary_artery_lesion_now
         (<= left_main_coronary_artery_intravascular_ultrasound_minimum_lumen_area_value_recorded_now_withunit_mm2 6.0)
         (<= left_main_coronary_artery_fractional_flow_reserve_value_recorded_now 0.80))
     :named REQ1_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "at least one of: non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion OR intravascular ultrasound minimum lumen area ≤ 6.0 mm² OR fractional flow reserve ≤ 0.80"

;; ===================== Declarations for the criterion (REQ 2) =====================
;; "stress-induced hypotension"
(declare-const patient_has_finding_of_exertional_hypotension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has exertional (stress-induced) hypotension.","when_to_set_to_false":"Set to false if the patient currently does not have exertional (stress-induced) hypotension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has exertional (stress-induced) hypotension.","meaning":"Boolean indicating whether the patient currently has exertional (stress-induced) hypotension."} // "stress-induced hypotension"

;; "a large area of myocardial ischemia in both the left anterior descending coronary artery territory and the left circumflex coronary artery territory"
(declare-const patient_has_finding_of_large_area_of_myocardial_ischemia_in_left_anterior_descending_and_left_circumflex_coronary_artery_territories_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a large area of myocardial ischemia in both the left anterior descending coronary artery territory and the left circumflex coronary artery territory.","when_to_set_to_false":"Set to false if the patient currently does not have a large area of myocardial ischemia in both the left anterior descending coronary artery territory and the left circumflex coronary artery territory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a large area of myocardial ischemia in both the left anterior descending coronary artery territory and the left circumflex coronary artery territory.","meaning":"Boolean indicating whether the patient currently has a large area of myocardial ischemia in both the left anterior descending coronary artery territory and the left circumflex coronary artery territory."} // "large area of myocardial ischemia in both territories"

;; "myocardial ischemia in left anterior descending coronary artery territory"
(declare-const patient_has_finding_of_myocardial_ischemia_in_left_anterior_descending_coronary_artery_territory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial ischemia in the left anterior descending coronary artery territory.","when_to_set_to_false":"Set to false if the patient currently does not have myocardial ischemia in the left anterior descending coronary artery territory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocardial ischemia in the left anterior descending coronary artery territory.","meaning":"Boolean indicating whether the patient currently has myocardial ischemia in the left anterior descending coronary artery territory."} // "myocardial ischemia in left anterior descending coronary artery territory"

;; "myocardial ischemia in left anterior descending coronary artery territory in absence of other obstructive coronary artery disease to explain defect"
(declare-const patient_has_finding_of_myocardial_ischemia_in_left_anterior_descending_coronary_artery_territory_now@@in_absence_of_other_obstructive_coronary_artery_disease_to_explain_defect Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial ischemia in the left anterior descending coronary artery territory is present in the absence of other obstructive coronary artery disease to explain the defect.","when_to_set_to_false":"Set to false if the patient's myocardial ischemia in the left anterior descending coronary artery territory is present but there is other obstructive coronary artery disease to explain the defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether other obstructive coronary artery disease explains the left anterior descending coronary artery defect.","meaning":"Boolean indicating whether the patient's myocardial ischemia in the left anterior descending coronary artery territory is present in the absence of other obstructive coronary artery disease to explain the defect."} // "in absence of other obstructive coronary artery disease to explain LAD defect"

;; "myocardial ischemia in left circumflex coronary artery territory"
(declare-const patient_has_finding_of_myocardial_ischemia_in_left_circumflex_coronary_artery_territory_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial ischemia in the left circumflex coronary artery territory.","when_to_set_to_false":"Set to false if the patient currently does not have myocardial ischemia in the left circumflex coronary artery territory.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocardial ischemia in the left circumflex coronary artery territory.","meaning":"Boolean indicating whether the patient currently has myocardial ischemia in the left circumflex coronary artery territory."} // "myocardial ischemia in left circumflex coronary artery territory"

;; "myocardial ischemia in left circumflex coronary artery territory in absence of other obstructive coronary artery disease to explain defect"
(declare-const patient_has_finding_of_myocardial_ischemia_in_left_circumflex_coronary_artery_territory_now@@in_absence_of_other_obstructive_coronary_artery_disease_to_explain_defect Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial ischemia in the left circumflex coronary artery territory is present in the absence of other obstructive coronary artery disease to explain the defect.","when_to_set_to_false":"Set to false if the patient's myocardial ischemia in the left circumflex coronary artery territory is present but there is other obstructive coronary artery disease to explain the defect.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether other obstructive coronary artery disease explains the left circumflex coronary artery defect.","meaning":"Boolean indicating whether the patient's myocardial ischemia in the left circumflex coronary artery territory is present in the absence of other obstructive coronary artery disease to explain the defect."} // "in absence of other obstructive coronary artery disease to explain LCx defect"

;; "stress-induced fall in left ventricular ejection fraction"
(declare-const patient_has_finding_of_stress_induced_fall_in_left_ventricular_ejection_fraction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a stress-induced fall in left ventricular ejection fraction.","when_to_set_to_false":"Set to false if the patient currently does not have a stress-induced fall in left ventricular ejection fraction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a stress-induced fall in left ventricular ejection fraction.","meaning":"Boolean indicating whether the patient currently has a stress-induced fall in left ventricular ejection fraction."} // "stress-induced fall in LVEF"

;; "transient ischemic dilatation of the left ventricle"
(declare-const patient_has_finding_of_transient_ischemic_dilatation_of_left_ventricular_cavity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transient ischemic dilatation of the left ventricular cavity.","when_to_set_to_false":"Set to false if the patient currently does not have transient ischemic dilatation of the left ventricular cavity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transient ischemic dilatation of the left ventricular cavity.","meaning":"Boolean indicating whether the patient currently has transient ischemic dilatation of the left ventricular cavity."} // "transient ischemic dilatation of LV"

;; "technetium, stress-induced lung uptake"
(declare-const patient_is_exposed_to_technetium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to technetium.","when_to_set_to_false":"Set to false if the patient is currently not exposed to technetium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to technetium.","meaning":"Boolean indicating whether the patient is currently exposed to technetium."} // "technetium exposure"
(declare-const patient_is_exposed_to_technetium_now@@stress_induced_lung_uptake Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to technetium and this exposure is associated with stress-induced lung uptake.","when_to_set_to_false":"Set to false if the patient is currently exposed to technetium but not associated with stress-induced lung uptake.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether technetium exposure is associated with stress-induced lung uptake.","meaning":"Boolean indicating whether the patient is currently exposed to technetium and this exposure is associated with stress-induced lung uptake."} // "technetium stress-induced lung uptake"

;; "thallium, stress-induced lung uptake"
(declare-const patient_is_exposed_to_thallium_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to thallium.","when_to_set_to_false":"Set to false if the patient is currently not exposed to thallium.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to thallium.","meaning":"Boolean indicating whether the patient is currently exposed to thallium."} // "thallium exposure"
(declare-const patient_is_exposed_to_thallium_now@@stress_induced_lung_uptake Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to thallium and this exposure is associated with stress-induced lung uptake.","when_to_set_to_false":"Set to false if the patient is currently exposed to thallium but not associated with stress-induced lung uptake.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether thallium exposure is associated with stress-induced lung uptake.","meaning":"Boolean indicating whether the patient is currently exposed to thallium and this exposure is associated with stress-induced lung uptake."} // "thallium stress-induced lung uptake"

;; "left ventricular ejection fraction"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a numeric measurement of the patient's left ventricular ejection fraction recorded now is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent representing the patient's current left ventricular ejection fraction."} // "left ventricular ejection fraction"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_myocardial_ischemia_in_left_anterior_descending_coronary_artery_territory_now@@in_absence_of_other_obstructive_coronary_artery_disease_to_explain_defect
         patient_has_finding_of_myocardial_ischemia_in_left_anterior_descending_coronary_artery_territory_now)
     :named REQ2_AUXILIARY0)) ;; "in absence of other obstructive coronary artery disease to explain LAD defect"

(assert
  (! (=> patient_has_finding_of_myocardial_ischemia_in_left_circumflex_coronary_artery_territory_now@@in_absence_of_other_obstructive_coronary_artery_disease_to_explain_defect
         patient_has_finding_of_myocardial_ischemia_in_left_circumflex_coronary_artery_territory_now)
     :named REQ2_AUXILIARY1)) ;; "in absence of other obstructive coronary artery disease to explain LCx defect"

(assert
  (! (=> patient_is_exposed_to_technetium_now@@stress_induced_lung_uptake
         patient_is_exposed_to_technetium_now)
     :named REQ2_AUXILIARY2)) ;; "technetium stress-induced lung uptake"

(assert
  (! (=> patient_is_exposed_to_thallium_now@@stress_induced_lung_uptake
         patient_is_exposed_to_thallium_now)
     :named REQ2_AUXILIARY3)) ;; "thallium stress-induced lung uptake"

;; Non-exhaustive examples for non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion
(assert
  (! (=> (or patient_has_finding_of_large_area_of_myocardial_ischemia_in_left_anterior_descending_and_left_circumflex_coronary_artery_territories_now
            patient_has_finding_of_myocardial_ischemia_in_left_anterior_descending_coronary_artery_territory_now@@in_absence_of_other_obstructive_coronary_artery_disease_to_explain_defect
            patient_has_finding_of_myocardial_ischemia_in_left_circumflex_coronary_artery_territory_now@@in_absence_of_other_obstructive_coronary_artery_disease_to_explain_defect)
         patient_has_noninvasive_evidence_of_myocardial_ischemia_referable_to_hemodynamically_significant_left_main_coronary_artery_lesion_now)
     :named REQ2_AUXILIARY4)) ;; "non-invasive evidence of myocardial ischemia referable to a hemodynamically significant left main coronary artery lesion with non-exhaustive examples"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Main inclusion: If the patient has unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization (≥50% and <70%), then the patient must have one of the listed findings.
(assert
  (! (=> (and patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now
             left_main_coronary_artery_revascularization_required_now
             (>= left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 50.0)
             (< left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 70.0))
         (or patient_has_noninvasive_evidence_of_myocardial_ischemia_referable_to_hemodynamically_significant_left_main_coronary_artery_lesion_now
             patient_has_finding_of_exertional_hypotension_now
             patient_has_finding_of_stress_induced_fall_in_left_ventricular_ejection_fraction_now
             patient_has_finding_of_transient_ischemic_dilatation_of_left_ventricular_cavity_now
             patient_is_exposed_to_thallium_now@@stress_induced_lung_uptake
             patient_is_exposed_to_technetium_now@@stress_induced_lung_uptake))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient has unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization with (angiographic diameter stenosis ≥ 50% AND angiographic diameter stenosis < 70%), the patient must have ..."

;; ===================== Declarations for the criterion (REQ 3) =====================
;; No new variable declarations needed; all required variables are already declared.

;; ===================== Constraint Assertions (REQ 3) =====================
;; If the patient has unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization
;; AND angiographic diameter stenosis ≥ 50% AND < 70%, THEN the patient must have intravascular ultrasound minimum lumen area ≤ 6.0 mm².
(assert
  (! (=> (and patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now ;; "unprotected left main coronary artery disease"
             left_main_coronary_artery_revascularization_required_now ;; "requiring revascularization"
             (>= left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 50.0) ;; "angiographic diameter stenosis ≥ 50%"
             (< left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 70.0)) ;; "angiographic diameter stenosis < 70%"
         (<= left_main_coronary_artery_intravascular_ultrasound_minimum_lumen_area_value_recorded_now_withunit_mm2 6.0)) ;; "intravascular ultrasound minimum lumen area ≤ 6.0 mm²"
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient has unprotected left main coronary artery disease with angiographic diameter stenosis requiring revascularization (angiographic diameter stenosis ≥ 50% AND < 70%), then the patient must have fractional flow reserve ≤ 0.80.
(assert
  (! (=> (and patient_has_finding_of_unprotected_left_main_coronary_artery_disease_now ;; "unprotected left main coronary artery disease"
             left_main_coronary_artery_revascularization_required_now ;; "requiring revascularization"
             (>= left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 50.0) ;; "angiographic diameter stenosis ≥ 50%"
             (< left_main_coronary_artery_angiographic_diameter_stenosis_value_recorded_now_withunit_percent 70.0)) ;; "angiographic diameter stenosis < 70%"
         (<= left_main_coronary_artery_fractional_flow_reserve_value_recorded_now 0.80)) ;; "fractional flow reserve ≤ 0.80"
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient currently has coronary artery disease (coronary arteriosclerosis) now."} // "coronary artery disease"
(declare-const patient_has_finding_of_left_main_equivalent_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has left main equivalent coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have left main equivalent coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left main equivalent coronary artery disease.","meaning":"Boolean indicating whether the patient currently has left main equivalent coronary artery disease now."} // "left main equivalent coronary artery disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_left_main_equivalent_coronary_artery_disease_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have left main equivalent coronary artery disease."

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently clinically eligible to undergo percutaneous coronary intervention.","when_to_set_to_false":"Set to false if the patient is currently not clinically eligible to undergo percutaneous coronary intervention.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently clinically eligible to undergo percutaneous coronary intervention.","meaning":"Boolean indicating whether the patient is currently clinically eligible to undergo percutaneous coronary intervention."} // "clinical eligibility for percutaneous coronary intervention"
(declare-const patient_can_undergo_percutaneous_coronary_intervention_now@@anatomic_eligibility Bool) ;; {"when_to_set_to_true":"Set to true if the patient's eligibility for percutaneous coronary intervention is based on anatomic criteria.","when_to_set_to_false":"Set to false if the patient's eligibility for percutaneous coronary intervention is not based on anatomic criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the eligibility is based on anatomic criteria.","meaning":"Boolean indicating that the eligibility for percutaneous coronary intervention is based on anatomic criteria."} // "anatomic eligibility for percutaneous coronary intervention"
(declare-const patient_can_undergo_coronary_artery_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently clinically eligible to undergo coronary artery bypass graft surgery.","when_to_set_to_false":"Set to false if the patient is currently not clinically eligible to undergo coronary artery bypass graft surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently clinically eligible to undergo coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient is currently clinically eligible to undergo coronary artery bypass graft surgery."} // "clinical eligibility for coronary artery bypass graft surgery"
(declare-const patient_can_undergo_coronary_artery_bypass_graft_now@@anatomic_eligibility Bool) ;; {"when_to_set_to_true":"Set to true if the patient's eligibility for coronary artery bypass graft surgery is based on anatomic criteria.","when_to_set_to_false":"Set to false if the patient's eligibility for coronary artery bypass graft surgery is not based on anatomic criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the eligibility is based on anatomic criteria.","meaning":"Boolean indicating that the eligibility for coronary artery bypass graft surgery is based on anatomic criteria."} // "anatomic eligibility for coronary artery bypass graft surgery"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_can_undergo_percutaneous_coronary_intervention_now@@anatomic_eligibility
         patient_can_undergo_percutaneous_coronary_intervention_now)
     :named REQ6_AUXILIARY0)) ;; "anatomic eligibility for percutaneous coronary intervention" implies "clinical eligibility for percutaneous coronary intervention"

(assert
  (! (=> patient_can_undergo_coronary_artery_bypass_graft_now@@anatomic_eligibility
         patient_can_undergo_coronary_artery_bypass_graft_now)
     :named REQ6_AUXILIARY1)) ;; "anatomic eligibility for coronary artery bypass graft surgery" implies "clinical eligibility for coronary artery bypass graft surgery"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! patient_can_undergo_percutaneous_coronary_intervention_now
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "clinical eligibility for percutaneous coronary intervention"

(assert
  (! patient_can_undergo_coronary_artery_bypass_graft_now
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "clinical eligibility for coronary artery bypass graft surgery"

(assert
  (! patient_can_undergo_percutaneous_coronary_intervention_now@@anatomic_eligibility
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "anatomic eligibility for percutaneous coronary intervention"

(assert
  (! patient_can_undergo_coronary_artery_bypass_graft_now@@anatomic_eligibility
     :named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "anatomic eligibility for coronary artery bypass graft surgery"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_finding_of_silent_myocardial_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has silent myocardial ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have silent myocardial ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has silent myocardial ischemia.","meaning":"Boolean indicating whether the patient currently has silent myocardial ischemia."} // "silent myocardial ischemia"
(declare-const patient_has_finding_of_stable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has stable angina.","when_to_set_to_false":"Set to false if the patient currently does not have stable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has stable angina.","meaning":"Boolean indicating whether the patient currently has stable angina."} // "stable angina"
(declare-const patient_has_finding_of_unstable_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has unstable angina.","when_to_set_to_false":"Set to false if the patient currently does not have unstable angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has unstable angina.","meaning":"Boolean indicating whether the patient currently has unstable angina."} // "unstable angina"
(declare-const patient_has_finding_of_myocardial_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial infarction.","when_to_set_to_false":"Set to false if the patient currently does not have myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has myocardial infarction.","meaning":"Boolean indicating whether the patient currently has myocardial infarction."} // "myocardial infarction"
(declare-const patient_has_finding_of_myocardial_infarction_now@@recent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has myocardial infarction and the infarction is recent.","when_to_set_to_false":"Set to false if the patient currently has myocardial infarction but the infarction is not recent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction is recent.","meaning":"Boolean indicating whether the patient currently has myocardial infarction and the infarction is recent."} // "recent myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable for recent myocardial infarction implies myocardial infarction
(assert
  (! (=> patient_has_finding_of_myocardial_infarction_now@@recent
         patient_has_finding_of_myocardial_infarction_now)
     :named REQ7_AUXILIARY0)) ;; "recent myocardial infarction" implies "myocardial infarction"

;; ===================== Constraint Assertions (REQ 7) =====================
;; To be included, the patient must have (silent myocardial ischemia OR stable angina OR unstable angina OR recent myocardial infarction).
(assert
  (! (or patient_has_finding_of_silent_myocardial_ischemia_now
         patient_has_finding_of_stable_angina_now
         patient_has_finding_of_unstable_angina_now
         patient_has_finding_of_myocardial_infarction_now@@recent)
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have (silent myocardial ischemia OR stable angina OR unstable angina OR recent myocardial infarction)."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_has_ability_to_sign_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to sign informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to sign informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to sign informed consent.","meaning":"Boolean indicating whether the patient currently has the ability to sign informed consent."} // "the ability to sign informed consent"
(declare-const patient_has_ability_to_comply_with_all_study_procedures_including_followup_for_3_years_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the ability to comply with all study procedures, including follow-up for at least 3 years.","when_to_set_to_false":"Set to false if the patient currently does not have the ability to comply with all study procedures, including follow-up for at least 3 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the ability to comply with all study procedures, including follow-up for at least 3 years.","meaning":"Boolean indicating whether the patient currently has the ability to comply with all study procedures, including follow-up for at least 3 years."} // "the ability to comply with all study procedures including follow-up for ≥ 3 years"
(declare-const study_procedures_followup_duration_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the number of years for which the patient is able to comply with follow-up as part of study procedures.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined for how many years the patient is able to comply with follow-up as part of study procedures.","meaning":"Numeric value indicating the duration in years for which the patient is able to comply with follow-up as part of study procedures."} // "follow-up for ≥ 3 years"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Definition: ability to comply with all study procedures including follow-up for ≥ 3 years
(assert
  (! (= patient_has_ability_to_comply_with_all_study_procedures_including_followup_for_3_years_now
        (>= study_procedures_followup_duration_value_recorded_now_in_years 3.0))
     :named REQ8_AUXILIARY0)) ;; "the ability to comply with all study procedures including follow-up for ≥ 3 years"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Component 0: ability to sign informed consent
(assert
  (! patient_has_ability_to_sign_informed_consent_now
     :named REQ8_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the ability to sign informed consent"

;; Component 1: ability to comply with all study procedures including follow-up for ≥ 3 years
(assert
  (! patient_has_ability_to_comply_with_all_study_procedures_including_followup_for_3_years_now
     :named REQ8_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the ability to comply with all study procedures including follow-up for ≥ 3 years"
