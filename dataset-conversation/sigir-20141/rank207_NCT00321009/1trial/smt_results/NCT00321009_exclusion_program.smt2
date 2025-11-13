;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_able_to_give_written_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give written informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give written informed consent.","meaning":"Boolean indicating whether the patient is currently able to give written informed consent."} ;; "unable to give written informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_able_to_give_written_informed_consent_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to give written informed consent."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T23:39:27.107213 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_anticoagulation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a need for anticoagulation.","when_to_set_to_false":"Set to false if the patient currently does not have a need for anticoagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a need for anticoagulation.","meaning":"Boolean indicating whether the patient currently has a need for anticoagulation."} ;; "need for anticoagulation"
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or finding."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@would_prohibit_discharge_within_48_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease, condition, or finding would prohibit discharge within 48 hours.","when_to_set_to_false":"Set to false if the patient's current disease, condition, or finding would not prohibit discharge within 48 hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease, condition, or finding would prohibit discharge within 48 hours.","meaning":"Boolean indicating whether the patient's current disease, condition, or finding would prohibit discharge within 48 hours."} ;; "would prohibit discharge within 48 hours"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@would_prohibit_discharge_within_48_hours
      patient_has_finding_of_disease_condition_finding_now)
:named REQ1_AUXILIARY0)) ;; "medical condition that would prohibit discharge within 48 hours"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient has ≥ 1 medical condition that would prohibit discharge within 48 hours, UNLESS the ONLY reason is need for anticoagulation.
(assert
(! (not (and patient_has_finding_of_disease_condition_finding_now@@would_prohibit_discharge_within_48_hours
             (not (and patient_has_finding_of_anticoagulation_now
                       (not patient_has_finding_of_disease_condition_finding_now@@would_prohibit_discharge_within_48_hours)))))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has ≥ 1 medical condition that would prohibit discharge within 48 hours, UNLESS the ONLY reason is need for anticoagulation."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cardiogenic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiogenic shock.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiogenic shock.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiogenic shock.","meaning":"Boolean indicating whether the patient currently has cardiogenic shock."} ;; "cardiogenic shock"

(declare-const patient_has_finding_of_angina_decubitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of rest angina.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of rest angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of rest angina.","meaning":"Boolean indicating whether the patient currently has rest angina."} ;; "rest angina"

(declare-const patient_has_finding_of_angina_decubitus_now@@unresponsive_to_medical_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's rest angina is unresponsive to medical therapy.","when_to_set_to_false":"Set to false if the patient's rest angina is responsive to medical therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's rest angina is unresponsive to medical therapy.","meaning":"Boolean indicating whether the patient's rest angina is unresponsive to medical therapy."} ;; "rest angina unresponsive to medical therapy"

(declare-const patient_has_finding_of_ventricular_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of ventricular arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of ventricular arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of ventricular arrhythmia.","meaning":"Boolean indicating whether the patient currently has ventricular arrhythmia."} ;; "ventricular arrhythmia"

(declare-const patient_has_finding_of_ventricular_arrhythmia_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ventricular arrhythmia is serious.","when_to_set_to_false":"Set to false if the patient's ventricular arrhythmia is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ventricular arrhythmia is serious.","meaning":"Boolean indicating whether the patient's ventricular arrhythmia is serious."} ;; "serious ventricular arrhythmia"

(declare-const patient_has_finding_of_ventricular_arrhythmia_now@@temporalcontext_within_24_hours_prior_to_randomization Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ventricular arrhythmia occurred within the 24 hours prior to randomization.","when_to_set_to_false":"Set to false if the patient's ventricular arrhythmia did not occur within the 24 hours prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ventricular arrhythmia occurred within the 24 hours prior to randomization.","meaning":"Boolean indicating whether the patient's ventricular arrhythmia occurred within the 24 hours prior to randomization."} ;; "ventricular arrhythmia in the 24 hours prior to randomization"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable for angina
(assert
(! (=> patient_has_finding_of_angina_decubitus_now@@unresponsive_to_medical_therapy
       patient_has_finding_of_angina_decubitus_now)
   :named REQ2_AUXILIARY0)) ;; "rest angina unresponsive to medical therapy"

;; Qualifier variable implies corresponding stem variable for ventricular arrhythmia (serious)
(assert
(! (=> patient_has_finding_of_ventricular_arrhythmia_now@@serious
       patient_has_finding_of_ventricular_arrhythmia_now)
   :named REQ2_AUXILIARY1)) ;; "serious ventricular arrhythmia"

;; Qualifier variable implies corresponding stem variable for ventricular arrhythmia (temporal context)
(assert
(! (=> patient_has_finding_of_ventricular_arrhythmia_now@@temporalcontext_within_24_hours_prior_to_randomization
       patient_has_finding_of_ventricular_arrhythmia_now)
   :named REQ2_AUXILIARY2)) ;; "ventricular arrhythmia in the 24 hours prior to randomization"

;; Both qualifiers together define the exclusion for ventricular arrhythmia
(assert
(! (= (and patient_has_finding_of_ventricular_arrhythmia_now@@serious
           patient_has_finding_of_ventricular_arrhythmia_now@@temporalcontext_within_24_hours_prior_to_randomization)
      (and patient_has_finding_of_ventricular_arrhythmia_now@@serious
           patient_has_finding_of_ventricular_arrhythmia_now@@temporalcontext_within_24_hours_prior_to_randomization))
   :named REQ2_AUXILIARY3)) ;; "serious ventricular arrhythmia in the 24 hours prior to randomization"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have cardiogenic shock
(assert
(! (not patient_has_finding_of_cardiogenic_shock_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiogenic shock."

;; Exclusion: patient must NOT have rest angina unresponsive to medical therapy
(assert
(! (not patient_has_finding_of_angina_decubitus_now@@unresponsive_to_medical_therapy)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has rest angina unresponsive to medical therapy."

;; Exclusion: patient must NOT have serious ventricular arrhythmia in the 24 hours prior to randomization
(assert
(! (not (and patient_has_finding_of_ventricular_arrhythmia_now@@serious
             patient_has_finding_of_ventricular_arrhythmia_now@@temporalcontext_within_24_hours_prior_to_randomization))
   :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious ventricular arrhythmia in the 24 hours prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_will_undergo_surgical_procedure_inthefuture4months Bool) ;; {"when_to_set_to_true":"Set to true if the patient is scheduled to undergo at least one surgical procedure in the next 4 months.","when_to_set_to_false":"Set to false if the patient is not scheduled to undergo any surgical procedure in the next 4 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is scheduled for a surgical procedure in the next 4 months.","meaning":"Boolean indicating whether the patient is scheduled to undergo a surgical procedure in the next 4 months."} ;; "the patient is scheduled for ≥ 1 surgical procedure in the next 4 months"
(declare-const patient_will_undergo_surgical_procedure_inthefuture4months@@would_prevent_use_of_enoxaparin Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled surgical procedure in the next 4 months would prevent use of enoxaparin.","when_to_set_to_false":"Set to false if the scheduled surgical procedure in the next 4 months would not prevent use of enoxaparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled surgical procedure in the next 4 months would prevent use of enoxaparin.","meaning":"Boolean indicating whether the scheduled surgical procedure in the next 4 months would prevent use of enoxaparin."} ;; "that would prevent use of enoxaparin"
(declare-const patient_will_undergo_surgical_procedure_inthefuture4months@@would_prevent_use_of_warfarin Bool) ;; {"when_to_set_to_true":"Set to true if the scheduled surgical procedure in the next 4 months would prevent use of warfarin.","when_to_set_to_false":"Set to false if the scheduled surgical procedure in the next 4 months would not prevent use of warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the scheduled surgical procedure in the next 4 months would prevent use of warfarin.","meaning":"Boolean indicating whether the scheduled surgical procedure in the next 4 months would prevent use of warfarin."} ;; "that would prevent use of warfarin"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_will_undergo_surgical_procedure_inthefuture4months@@would_prevent_use_of_enoxaparin
      patient_will_undergo_surgical_procedure_inthefuture4months)
:named REQ3_AUXILIARY0)) ;; "the patient is scheduled for ≥ 1 surgical procedure in the next 4 months that would prevent use of enoxaparin"

(assert
(! (=> patient_will_undergo_surgical_procedure_inthefuture4months@@would_prevent_use_of_warfarin
      patient_will_undergo_surgical_procedure_inthefuture4months)
:named REQ3_AUXILIARY1)) ;; "the patient is scheduled for ≥ 1 surgical procedure in the next 4 months that would prevent use of warfarin"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_will_undergo_surgical_procedure_inthefuture4months@@would_prevent_use_of_enoxaparin)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is scheduled for ≥ 1 surgical procedure in the next 4 months that would prevent use of enoxaparin."

(assert
(! (not patient_will_undergo_surgical_procedure_inthefuture4months@@would_prevent_use_of_warfarin)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is scheduled for ≥ 1 surgical procedure in the next 4 months that would prevent use of warfarin."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of anemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of anemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of anemia.","meaning":"Boolean indicating whether the patient currently has anemia."} ;; "anemia"

(declare-const patient_hemoglobin_value_recorded_now_withunit_grams Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's baseline hemoglobin (in grams) recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current baseline hemoglobin in grams."} ;; "hemoglobin"

(declare-const patient_platelet_count_finding_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of the patient's platelet count recorded now is available.","when_to_set_to_null":"Set to null if no such measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count."} ;; "platelet count"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified sex and is documented.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified sex and is documented.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex as male, female, or other."} ;; "baseline hemoglobin ≤ 9 grams for women OR baseline hemoglobin ≤ 10 grams for men"

(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex matches the specified sex and is documented.","when_to_set_to_false":"Set to false if the patient's current sex does not match the specified sex and is documented.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates the patient's current sex as male, female, or other."} ;; "baseline hemoglobin ≤ 9 grams for women OR baseline hemoglobin ≤ 10 grams for men"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_finding_of_anemia_now
             patient_sex_is_female_now
             (<= patient_hemoglobin_value_recorded_now_withunit_grams 9)))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anemia defined as baseline hemoglobin ≤ 9 grams for women."

(assert
(! (not (and patient_has_finding_of_anemia_now
             patient_sex_is_male_now
             (<= patient_hemoglobin_value_recorded_now_withunit_grams 10)))
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has anemia defined as baseline hemoglobin ≤ 10 grams for men."

(assert
(! (not (< patient_platelet_count_finding_value_recorded_now_withunit_count 100000))
   :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has platelet count < 100,000."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const creatinine_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the patient's most recently recorded creatinine value in mg/dL if available.","when_to_set_to_null":"Set to null if the patient's creatinine value is unknown, not documented, or cannot be determined.","meaning":"Numeric variable representing the patient's most recently recorded creatinine value in milligrams per deciliter (mg/dL)."} ;; "creatinine > 2.0 milligrams per deciliter"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: renal insufficiency is defined as creatinine > 2.0 mg/dL
(assert
(! (= patient_has_finding_of_renal_insufficiency_now
     (> creatinine_value_recorded_now_withunit_mg_per_dl 2.0))
   :named REQ5_AUXILIARY0)) ;; "renal insufficiency defined as creatinine > 2.0 milligrams per deciliter."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_renal_insufficiency_now)
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal insufficiency defined as creatinine > 2.0 milligrams per deciliter."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of liver disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of liver disease."} ;; "liver disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of liver disease and the liver disease is serious.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of liver disease but the liver disease is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the liver disease is serious.","meaning":"Boolean indicating whether the patient's current liver disease diagnosis is serious."} ;; "serious liver disease"
(declare-const patient_international_normalized_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current international normalized ratio (INR) is recorded.","when_to_set_to_null":"Set to null if no current INR measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current international normalized ratio (INR)."} ;; "international normalized ratio > 1.3"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: serious liver disease as reflected by INR > 1.3
(assert
(! (= patient_has_diagnosis_of_disease_of_liver_now@@serious
(and patient_has_diagnosis_of_disease_of_liver_now
(> patient_international_normalized_ratio_value_recorded_now_withunit_ratio 1.3)))
:named REQ6_AUXILIARY0)) ;; "serious liver disease as reflected by international normalized ratio > 1.3."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@serious
patient_has_diagnosis_of_disease_of_liver_now)
:named REQ6_AUXILIARY1)) ;; "serious liver disease" implies "liver disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now@@serious)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious liver disease as reflected by international normalized ratio > 1.3."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within the past 6 months.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within the past 6 months."} ;; "stroke within the past 6 months"

(declare-const patient_has_finding_of_intracranial_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an intracranial hemorrhage at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an intracranial hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an intracranial hemorrhage in the past.","meaning":"Boolean indicating whether the patient has had an intracranial hemorrhage at any time in the past."} ;; "prior documented intracranial hemorrhage"

(declare-const patient_has_finding_of_intracranial_hemorrhage_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior intracranial hemorrhage is documented.","when_to_set_to_false":"Set to false if the patient's prior intracranial hemorrhage is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior intracranial hemorrhage is documented.","meaning":"Boolean indicating whether the patient's prior intracranial hemorrhage is documented."} ;; "prior documented intracranial hemorrhage"

(declare-const patient_has_finding_of_subarachnoid_hemorrhage_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a subarachnoid hemorrhage at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a subarachnoid hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a subarachnoid hemorrhage in the past.","meaning":"Boolean indicating whether the patient has had a subarachnoid hemorrhage at any time in the past."} ;; "prior documented subarachnoid hemorrhage"

(declare-const patient_has_finding_of_subarachnoid_hemorrhage_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's prior subarachnoid hemorrhage is documented.","when_to_set_to_false":"Set to false if the patient's prior subarachnoid hemorrhage is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's prior subarachnoid hemorrhage is documented.","meaning":"Boolean indicating whether the patient's prior subarachnoid hemorrhage is documented."} ;; "prior documented subarachnoid hemorrhage"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_intracranial_hemorrhage_inthehistory@@documented
       patient_has_finding_of_intracranial_hemorrhage_inthehistory)
   :named REQ7_AUXILIARY0)) ;; "prior documented intracranial hemorrhage"

(assert
(! (=> patient_has_finding_of_subarachnoid_hemorrhage_inthehistory@@documented
       patient_has_finding_of_subarachnoid_hemorrhage_inthehistory)
   :named REQ7_AUXILIARY1)) ;; "prior documented subarachnoid hemorrhage"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (or patient_has_finding_of_cerebrovascular_accident_inthepast6months
            patient_has_finding_of_intracranial_hemorrhage_inthehistory@@documented
            patient_has_finding_of_subarachnoid_hemorrhage_inthehistory@@documented))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a stroke within the past 6 months) OR (the patient has had a prior documented intracranial hemorrhage) OR (the patient has had a prior documented subarachnoid hemorrhage)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_bleeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bleeding.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bleeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bleeding.","meaning":"Boolean indicating whether the patient currently has bleeding now."} ;; "bleeding"
(declare-const patient_has_finding_of_bleeding_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bleeding and the bleeding is active.","when_to_set_to_false":"Set to false if the patient currently has bleeding but it is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bleeding is active.","meaning":"Boolean indicating whether the patient's current bleeding is active."} ;; "active bleeding"
(declare-const patient_has_undergone_surgical_procedure_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure at any time in the past.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure at any time in the past."} ;; "surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a major surgical procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has undergone a surgical procedure at any time in the past but it is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure in the past is major.","meaning":"Boolean indicating whether the surgical procedure in the past is major."} ;; "major surgery"
(declare-const patient_has_undergone_surgical_procedure_inthehistory@@prohibits_use_of_anticoagulants Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a major surgical procedure at any time in the past and the procedure prohibits the use of anticoagulants.","when_to_set_to_false":"Set to false if the patient has undergone a major surgical procedure at any time in the past but the procedure does not prohibit the use of anticoagulants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the major surgical procedure in the past prohibits the use of anticoagulants.","meaning":"Boolean indicating whether the major surgical procedure in the past prohibits the use of anticoagulants."} ;; "major surgery prohibits the use of anticoagulants"
(declare-const patient_has_undergone_surgical_procedure_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone a surgical procedure within the past 2 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure within the past 2 weeks.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure within the past 2 weeks."} ;; "major surgery within 2 weeks"
(declare-const patient_has_undergone_surgical_procedure_inthepast2weeks@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a major surgical procedure within the past 2 weeks.","when_to_set_to_false":"Set to false if the patient has undergone a surgical procedure within the past 2 weeks but it is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure within the past 2 weeks is major.","meaning":"Boolean indicating whether the surgical procedure within the past 2 weeks is major."} ;; "major surgery within 2 weeks"
(declare-const patient_has_undergone_surgical_procedure_inthepast2weeks@@prohibits_use_of_anticoagulants Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure within the past 2 weeks and the procedure prohibits the use of anticoagulants.","when_to_set_to_false":"Set to false if the patient has undergone a surgical procedure within the past 2 weeks but the procedure does not prohibit the use of anticoagulants.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure within the past 2 weeks prohibits the use of anticoagulants.","meaning":"Boolean indicating whether the surgical procedure within the past 2 weeks prohibits the use of anticoagulants."} ;; "major surgery within 2 weeks prohibits the use of anticoagulants"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable for active bleeding implies stem variable
(assert
(! (=> patient_has_finding_of_bleeding_now@@active
       patient_has_finding_of_bleeding_now)
   :named REQ8_AUXILIARY0)) ;; "active bleeding"

;; Qualifier variable for major surgery in past 2 weeks implies stem variable
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast2weeks@@major
       patient_has_undergone_surgical_procedure_inthepast2weeks)
   :named REQ8_AUXILIARY1)) ;; "major surgery within 2 weeks"

;; Qualifier variable for major surgery in past 2 weeks that prohibits anticoagulants implies both major and stem
(assert
(! (=> patient_has_undergone_surgical_procedure_inthepast2weeks@@prohibits_use_of_anticoagulants
       (and patient_has_undergone_surgical_procedure_inthepast2weeks@@major
            patient_has_undergone_surgical_procedure_inthepast2weeks))
   :named REQ8_AUXILIARY2)) ;; "major surgery within 2 weeks prohibits the use of anticoagulants"

;; ===================== Constraint Assertions (REQ 8) =====================
;; Exclusion: patient has active bleeding
(assert
(! (not (not patient_has_finding_of_bleeding_now@@active))
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active bleeding."

;; Exclusion: patient has had major surgery within 2 weeks AND the major surgery prohibits the use of anticoagulants
(assert
(! (not (and patient_has_undergone_surgical_procedure_inthepast2weeks@@major
             patient_has_undergone_surgical_procedure_inthepast2weeks@@prohibits_use_of_anticoagulants))
   :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had major surgery within 2 weeks) AND (the major surgery prohibits the use of anticoagulants)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_acute_pericarditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute pericarditis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute pericarditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute pericarditis.","meaning":"Boolean indicating whether the patient currently has acute pericarditis."} ;; "acute pericarditis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_acute_pericarditis_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute pericarditis."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has childbearing potential (i.e., is capable of becoming pregnant).","when_to_set_to_false":"Set to false if the patient currently does not have childbearing potential (e.g., postmenopausal, surgically sterile, or otherwise incapable of becoming pregnant).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has childbearing potential.","meaning":"Boolean value indicating whether the patient currently has childbearing potential."} ;; "woman of childbearing potential"
(declare-const patient_has_negative_pregnancy_test_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a negative pregnancy test result.","when_to_set_to_false":"Set to false if the patient currently does not have a negative pregnancy test result (i.e., the test is positive or not performed).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a negative pregnancy test result.","meaning":"Boolean indicating whether the patient currently has a negative pregnancy test result."} ;; "negative pregnancy test"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently pregnant.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "negative pregnancy test"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; A negative pregnancy test implies the patient is not pregnant
(assert
(! (=> patient_has_negative_pregnancy_test_now
     (not patient_is_pregnant_now))
:named REQ10_AUXILIARY0)) ;; "the patient does NOT have a negative pregnancy test" and "negative pregnancy test"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: If the patient is a woman of childbearing potential AND does NOT have a negative pregnancy test, exclude.
(assert
(! (not (and patient_has_childbearing_potential_now
             (not patient_has_negative_pregnancy_test_now)))
:named REQ10_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is excluded if (the patient is a woman of childbearing potential) AND (the patient does NOT have a negative pregnancy test)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const expected_survival_time_months Real) ;; {"when_to_set_to_value":"Set to the expected survival time in months for the patient, as estimated by clinical judgment or documentation.","when_to_set_to_null":"Set to null if the expected survival time in months is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the expected survival time of the patient in months."} ;; "expected survival less than 6 months"

(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a cardiac condition (heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a cardiac condition (heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a cardiac condition (heart disease).","meaning":"Boolean indicating whether the patient currently has a cardiac condition (heart disease)."} ;; "cardiac condition"

(declare-const patient_has_finding_of_non_cardiac_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-cardiac condition.","when_to_set_to_false":"Set to false if the patient currently does not have a non-cardiac condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-cardiac condition.","meaning":"Boolean indicating whether the patient currently has a non-cardiac condition."} ;; "non-cardiac condition"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (and patient_has_finding_of_heart_disease_now
             (< expected_survival_time_months 6)))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a cardiac condition with expected survival less than 6 months."

(assert
(! (not (and patient_has_finding_of_non_cardiac_condition_now
             (< expected_survival_time_months 6)))
   :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a non-cardiac condition with expected survival less than 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_peripheral_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of peripheral vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of peripheral vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peripheral vascular disease.","meaning":"Boolean indicating whether the patient currently has peripheral vascular disease."} ;; "peripheral vascular disease"
(declare-const patient_has_finding_of_severe_peripheral_vascular_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe peripheral vascular disease.","when_to_set_to_false":"Set to false if the patient currently does not have severe peripheral vascular disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe peripheral vascular disease.","meaning":"Boolean indicating whether the patient currently has severe peripheral vascular disease."} ;; "severe peripheral vascular disease"

;; ===================== Auxiliary Assertions (REQ 12) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_severe_peripheral_vascular_disease_now
      patient_has_finding_of_peripheral_vascular_disease_now)
:named REQ12_AUXILIARY0)) ;; "severe peripheral vascular disease" implies "peripheral vascular disease"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_severe_peripheral_vascular_disease_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe peripheral vascular disease."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_undergone_cardiac_surgery_inthehistory@@as_a_result_of_index_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone any cardiac surgery at any time in their history, and the surgery was performed as a result of the index myocardial infarction.","when_to_set_to_false":"Set to false if the patient has not undergone any cardiac surgery at any time in their history as a result of the index myocardial infarction, or if any cardiac surgery performed was not as a result of the index myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone any cardiac surgery as a result of the index myocardial infarction.","meaning":"Boolean indicating whether the patient has undergone any cardiac surgery at any time in their history, specifically as a result of the index myocardial infarction."} ;; "undergoes cardiac surgery ... as a result of the index myocardial infarction"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone coronary artery bypass grafting at any time in their history, regardless of reason.","when_to_set_to_false":"Set to false if the patient has not undergone coronary artery bypass grafting at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone coronary artery bypass grafting in their history.","meaning":"Boolean indicating whether the patient has undergone coronary artery bypass grafting at any time in their history."} ;; "coronary artery bypass grafting"

(declare-const patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@as_a_result_of_index_myocardial_infarction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coronary artery bypass grafting was performed as a result of the index myocardial infarction.","when_to_set_to_false":"Set to false if the patient's coronary artery bypass grafting was not performed as a result of the index myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coronary artery bypass grafting was performed as a result of the index myocardial infarction.","meaning":"Boolean indicating whether the patient's coronary artery bypass grafting was performed as a result of the index myocardial infarction."} ;; "coronary artery bypass grafting ... as a result of the index myocardial infarction"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive example: coronary artery bypass grafting is an example of cardiac surgery as a result of index MI
(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@as_a_result_of_index_myocardial_infarction
      patient_has_undergone_cardiac_surgery_inthehistory@@as_a_result_of_index_myocardial_infarction)
:named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (coronary artery bypass grafting) as a result of the index myocardial infarction."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_coronary_artery_bypass_graft_inthehistory@@as_a_result_of_index_myocardial_infarction
      patient_has_undergone_coronary_artery_bypass_graft_inthehistory)
:named REQ13_AUXILIARY1)) ;; "coronary artery bypass grafting ... as a result of the index myocardial infarction"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_undergone_cardiac_surgery_inthehistory@@as_a_result_of_index_myocardial_infarction)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient undergoes cardiac surgery ... as a result of the index myocardial infarction."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_allergy_to_aspirin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to aspirin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to aspirin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to aspirin.","meaning":"Boolean indicating whether the patient currently has an allergy to aspirin."} ;; "allergy to aspirin"
(declare-const patient_has_finding_of_allergy_to_heparin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to heparin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to heparin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to heparin.","meaning":"Boolean indicating whether the patient currently has an allergy to heparin."} ;; "allergy to heparin"
(declare-const patient_has_finding_of_allergy_to_warfarin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to warfarin.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to warfarin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to warfarin.","meaning":"Boolean indicating whether the patient currently has an allergy to warfarin."} ;; "allergy to warfarin"
(declare-const patient_has_finding_of_allergy_to_pork_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to pork.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to pork.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to pork.","meaning":"Boolean indicating whether the patient currently has an allergy to pork."} ;; "allergy to pork"
(declare-const patient_has_finding_of_allergy_to_pork_products_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to pork products.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to pork products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to pork products.","meaning":"Boolean indicating whether the patient currently has an allergy to pork products."} ;; "allergy to pork products"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_allergy_to_aspirin_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to aspirin."

(assert
(! (not patient_has_finding_of_allergy_to_heparin_now)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to heparin."

(assert
(! (not patient_has_finding_of_allergy_to_warfarin_now)
:named REQ14_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to warfarin."

(assert
(! (not patient_has_finding_of_allergy_to_pork_now)
:named REQ14_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to pork."

(assert
(! (not patient_has_finding_of_allergy_to_pork_products_now)
:named REQ14_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to pork products."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_thromboembolic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a thromboembolic disorder in their history.","when_to_set_to_false":"Set to false if the patient has never had a thromboembolic disorder in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a thromboembolic disorder in their history.","meaning":"Boolean indicating whether the patient has ever had a thromboembolic disorder in their history."} ;; "thromboembolic disease"
(declare-const patient_has_finding_of_thromboembolic_disorder_inthehistory@@recurrent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a recurrent thromboembolic disorder in their history.","when_to_set_to_false":"Set to false if the patient has ever had a thromboembolic disorder in their history but it was not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thromboembolic disorder was recurrent.","meaning":"Boolean indicating whether the patient's history of thromboembolic disorder was recurrent."} ;; "recurrent thromboembolic disease"
(declare-const patient_has_finding_of_protein_c_deficiency_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had Protein C deficiency disease in their history.","when_to_set_to_false":"Set to false if the patient has never had Protein C deficiency disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had Protein C deficiency disease in their history.","meaning":"Boolean indicating whether the patient has ever had Protein C deficiency disease in their history."} ;; "Protein C deficiency"
(declare-const patient_has_finding_of_protein_s_deficiency_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had Protein S deficiency disease in their history.","when_to_set_to_false":"Set to false if the patient has never had Protein S deficiency disease in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had Protein S deficiency disease in their history.","meaning":"Boolean indicating whether the patient has ever had Protein S deficiency disease in their history."} ;; "Protein S deficiency"
(declare-const patient_has_finding_of_antithrombin_iii_deficiency_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had antithrombin III deficiency in their history.","when_to_set_to_false":"Set to false if the patient has never had antithrombin III deficiency in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had antithrombin III deficiency in their history.","meaning":"Boolean indicating whether the patient has ever had antithrombin III deficiency in their history."} ;; "antithrombin III deficiency"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder.","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder."} ;; "bleeding disorder"
(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder and it is known (diagnosed or documented).","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder but it is not known (not diagnosed or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the blood coagulation disorder is known.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder is known (diagnosed or documented)."} ;; "known bleeding disorder"
(declare-const patient_has_finding_of_bleeding_disorder_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a bleeding disorder and it is known (diagnosed or documented).","when_to_set_to_false":"Set to false if the patient currently has a bleeding disorder but it is not known (not diagnosed or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bleeding disorder is known.","meaning":"Boolean indicating whether the patient currently has a known bleeding disorder."} ;; "known bleeding disorder"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variable implies corresponding stem variable for recurrent thromboembolic disorder
(assert
(! (=> patient_has_finding_of_thromboembolic_disorder_inthehistory@@recurrent
      patient_has_finding_of_thromboembolic_disorder_inthehistory)
    :named REQ15_AUXILIARY0)) ;; "recurrent thromboembolic disease"

;; Qualifier variable implies corresponding stem variable for blood coagulation disorder
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@known
      patient_has_finding_of_blood_coagulation_disorder_now)
    :named REQ15_AUXILIARY1)) ;; "known bleeding disorder"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_thromboembolic_disorder_inthehistory@@recurrent)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of recurrent thromboembolic disease."

(assert
(! (not patient_has_finding_of_protein_c_deficiency_disease_inthehistory)
    :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of Protein C deficiency."

(assert
(! (not patient_has_finding_of_protein_s_deficiency_disease_inthehistory)
    :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of Protein S deficiency."

(assert
(! (not patient_has_finding_of_antithrombin_iii_deficiency_inthehistory)
    :named REQ15_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of antithrombin III deficiency."

(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now@@known)
    :named REQ15_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known bleeding disorder."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_is_taking_warfarin_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a warfarin-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a warfarin-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a warfarin-containing product.","meaning":"Boolean indicating whether the patient is currently taking a warfarin-containing product."} ;; "the patient is currently using warfarin"
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulation"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@chronic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy and the therapy is chronic.","when_to_set_to_false":"Set to false if the patient is currently undergoing anticoagulant therapy and the therapy is not chronic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anticoagulant therapy is chronic.","meaning":"Boolean indicating whether the patient's current anticoagulant therapy is chronic."} ;; "needs chronic anticoagulation"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_anticoagulant_therapy_now@@chronic
       patient_is_undergoing_anticoagulant_therapy_now)
   :named REQ16_AUXILIARY0)) ;; "the therapy is chronic" implies "the patient is currently undergoing anticoagulant therapy"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_is_taking_warfarin_containing_product_now)
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently using warfarin."

(assert
(! (not patient_is_undergoing_anticoagulant_therapy_now@@chronic)
   :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs chronic anticoagulation."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T23:50:13.688573 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_is_exposed_to_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to any drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently not exposed to any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient is currently exposed to any drug or medicament."} ;; "drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@investigational Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to an investigational drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament that is not investigational.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament is investigational.","meaning":"Boolean indicating whether the drug or medicament the patient is currently exposed to is investigational."} ;; "investigational drugs"
(declare-const patient_is_exposed_to_drug_or_medicament_now@@as_part_of_participation_in_other_trials Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a drug or medicament as part of participation in other clinical trials.","when_to_set_to_false":"Set to false if the patient is currently exposed to a drug or medicament but not as part of participation in other clinical trials.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure is as part of participation in other clinical trials.","meaning":"Boolean indicating whether the patient's current exposure to drug or medicament is as part of participation in other clinical trials."} ;; "as part of participation in other trials"
(declare-const patient_is_participating_in_other_trials_using_investigational_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in other clinical trials that use investigational devices.","when_to_set_to_false":"Set to false if the patient is currently participating in other clinical trials but not using investigational devices, or not participating in other trials at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in other clinical trials using investigational devices.","meaning":"Boolean indicating whether the patient is currently participating in other clinical trials that use investigational devices."} ;; "currently participating in other trials using investigational devices"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; The patient is currently participating in other trials using investigational drugs
(assert
(! (= patient_is_exposed_to_drug_or_medicament_now@@as_part_of_participation_in_other_trials
(and patient_is_exposed_to_drug_or_medicament_now
    patient_is_exposed_to_drug_or_medicament_now@@investigational
    patient_is_exposed_to_drug_or_medicament_now@@as_part_of_participation_in_other_trials))
:named REQ17_AUXILIARY0)) ;; "currently participating in other trials using investigational drugs"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not (or patient_is_exposed_to_drug_or_medicament_now@@as_part_of_participation_in_other_trials
            patient_is_participating_in_other_trials_using_investigational_device_now))
:named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is currently participating in other trials using investigational drugs) OR (the patient is currently participating in other trials using investigational devices))."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_prior_enrollment_in_this_trial Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in this trial.","when_to_set_to_false":"Set to false if the patient has not previously enrolled in this trial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in this trial.","meaning":"Boolean indicating whether the patient has had prior enrollment in this trial."} ;; "The patient is excluded if the patient has prior enrollment in this trial."

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
  (! (not patient_has_prior_enrollment_in_this_trial)
     :named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prior enrollment in this trial."
