;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as confirmed by clinical assessment or documentation.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_breastfeeding_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 Real) ;; {"when_to_set_to_value":"Set to the measured BMI value if a numeric measurement of the patient's body mass index (kg/m²) recorded now is available.","when_to_set_to_null":"Set to null if no such BMI measurement recorded now is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index (BMI) in kg/m²."} ;; "body mass index"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (> patient_body_mass_index_value_recorded_now_withunit_kg_per_m2 35))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has body mass index > 35."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_serious_comorbidity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has serious comorbidities.","when_to_set_to_false":"Set to false if the patient currently does not have serious comorbidities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has serious comorbidities.","meaning":"Boolean indicating whether the patient currently has serious comorbidities."} ;; "serious comorbidities"

(declare-const patient_has_finding_of_serious_comorbidity_now@@precludes_laparoendoscopic_single_site_cholecystectomy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current serious comorbidities preclude laparoendoscopic single-site cholecystectomy.","when_to_set_to_false":"Set to false if the patient's current serious comorbidities do not preclude laparoendoscopic single-site cholecystectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current serious comorbidities preclude laparoendoscopic single-site cholecystectomy.","meaning":"Boolean indicating whether the patient's current serious comorbidities preclude laparoendoscopic single-site cholecystectomy."} ;; "serious comorbidities that preclude laparoendoscopic single-site cholecystectomy"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_serious_comorbidity_now@@precludes_laparoendoscopic_single_site_cholecystectomy
      patient_has_finding_of_serious_comorbidity_now)
:named REQ3_AUXILIARY0)) ;; "serious comorbidities that preclude laparoendoscopic single-site cholecystectomy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_serious_comorbidity_now@@precludes_laparoendoscopic_single_site_cholecystectomy)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious comorbidities that preclude laparoendoscopic single-site cholecystectomy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_myoneural_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a neuromuscular disorder (myoneural disorder).","when_to_set_to_false":"Set to false if the patient currently does not have a neuromuscular disorder (myoneural disorder).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a neuromuscular disorder (myoneural disorder).","meaning":"Boolean indicating whether the patient currently has a neuromuscular disorder (myoneural disorder)."} ;; "neuromuscular disorders impairing neuromuscular function"

(declare-const patient_has_finding_of_myoneural_disorder_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the neuromuscular disorder is a known diagnosis (established, confirmed, or documented as known).","when_to_set_to_false":"Set to false if the neuromuscular disorder is not known (e.g., only suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neuromuscular disorder is known.","meaning":"Boolean indicating whether the neuromuscular disorder is a known diagnosis."} ;; "known neuromuscular disorders impairing neuromuscular function"

(declare-const patient_has_finding_of_myoneural_disorder_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the neuromuscular disorder is a suspected diagnosis (not confirmed, but suspected or under investigation).","when_to_set_to_false":"Set to false if the neuromuscular disorder is not suspected (e.g., known, ruled out, or not considered).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the neuromuscular disorder is suspected.","meaning":"Boolean indicating whether the neuromuscular disorder is a suspected diagnosis."} ;; "suspected neuromuscular disorders impairing neuromuscular function"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_myoneural_disorder_now@@known
      patient_has_finding_of_myoneural_disorder_now)
   :named REQ4_AUXILIARY0)) ;; "known neuromuscular disorders impairing neuromuscular function"

(assert
(! (=> patient_has_finding_of_myoneural_disorder_now@@suspected
      patient_has_finding_of_myoneural_disorder_now)
   :named REQ4_AUXILIARY1)) ;; "suspected neuromuscular disorders impairing neuromuscular function"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_has_finding_of_myoneural_disorder_now@@known
            patient_has_finding_of_myoneural_disorder_now@@suspected))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has known neuromuscular disorders impairing neuromuscular function) OR (the patient has suspected neuromuscular disorders impairing neuromuscular function)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_allergy_to_muscle_relaxant_utilized_for_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented allergy to any muscle relaxant that is utilized for this study.","when_to_set_to_false":"Set to false if the patient does not have a documented allergy to any muscle relaxant utilized for this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy to muscle relaxants utilized for this study.","meaning":"Boolean indicating whether the patient has an allergy to muscle relaxants utilized for this study."} ;; "the patient has allergies to muscle relaxants utilized for this study"
(declare-const patient_has_allergy_to_anesthetic_utilized_for_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented allergy to any anesthetic that is utilized for this study.","when_to_set_to_false":"Set to false if the patient does not have a documented allergy to any anesthetic utilized for this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy to anesthetics utilized for this study.","meaning":"Boolean indicating whether the patient has an allergy to anesthetics utilized for this study."} ;; "the patient has allergies to anesthetics utilized for this study"
(declare-const patient_has_allergy_to_narcotic_utilized_for_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented allergy to any narcotic that is utilized for this study.","when_to_set_to_false":"Set to false if the patient does not have a documented allergy to any narcotic utilized for this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy to narcotics utilized for this study.","meaning":"Boolean indicating whether the patient has an allergy to narcotics utilized for this study."} ;; "the patient has allergies to narcotics utilized for this study"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_allergy_to_muscle_relaxant_utilized_for_this_study
            patient_has_allergy_to_anesthetic_utilized_for_this_study
            patient_has_allergy_to_narcotic_utilized_for_this_study))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has allergies to muscle relaxants utilized for this study) OR (the patient has allergies to anesthetics utilized for this study) OR (the patient has allergies to narcotics utilized for this study)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_malignant_hyperthermia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented personal history of malignant hyperthermia at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented personal history of malignant hyperthermia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a personal history of malignant hyperthermia.","meaning":"Boolean indicating whether the patient has ever had malignant hyperthermia (personal history)."} ;; "the patient has personal history of malignant hyperthermia"
(declare-const patient_has_family_history_of_malignant_hyperthermia Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented family history of malignant hyperthermia at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented family history of malignant hyperthermia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family history of malignant hyperthermia.","meaning":"Boolean indicating whether the patient has a family history of malignant hyperthermia."} ;; "the patient has family history of malignant hyperthermia"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not (or patient_has_finding_of_malignant_hyperthermia_inthehistory
              patient_has_family_history_of_malignant_hyperthermia))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has personal history of malignant hyperthermia) OR (the patient has family history of malignant hyperthermia)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_contraindication_to_neostigmine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to neostigmine administration.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to neostigmine administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any contraindication to neostigmine administration.","meaning":"Boolean indicating whether the patient currently has any contraindication to neostigmine administration."} ;; "contraindication for neostigmine administration"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_contraindication_to_neostigmine_now)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has contraindication for neostigmine administration."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_continuous_opioid_dependence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has continuous opioid dependence (chronic opioid use).","when_to_set_to_false":"Set to false if the patient currently does not have continuous opioid dependence (chronic opioid use).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has continuous opioid dependence (chronic opioid use).","meaning":"Boolean indicating whether the patient currently has continuous opioid dependence (chronic opioid use)."} ;; "chronic opioid use"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_continuous_opioid_dependence_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic opioid use."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of long QT syndrome (prolonged QT syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of long QT syndrome."} ;; "prolonged QT syndrome"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_long_qt_syndrome_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has prolonged QT syndrome."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine level in mg/dL is recorded now.","when_to_set_to_null":"Set to null if no creatinine level measurement in mg/dL is available for now or the value is indeterminate.","meaning":"Numeric value representing the patient's current creatinine level in mg/dL."} ;; "creatinine level"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (> patient_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl 2.0))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine level greater than 2.0 mg/dL."
