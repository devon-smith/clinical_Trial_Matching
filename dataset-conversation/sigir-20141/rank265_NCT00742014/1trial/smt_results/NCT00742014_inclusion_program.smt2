;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_pulmonary_arterial_hypertension_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pulmonary arterial hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pulmonary arterial hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pulmonary arterial hypertension.","meaning":"Boolean indicating whether the patient currently has pulmonary arterial hypertension."}  // "To be included, the patient must have significant pulmonary arterial hypertension"
(declare-const patient_pulmonary_artery_mean_pressure_value_recorded_now_withunit_millimeters_of_mercury Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's mean pulmonary artery pressure (in millimeters of mercury) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's mean pulmonary artery pressure (in millimeters of mercury) recorded now."}  // "mean pulmonary artery pressure > 25 millimeters of mercury"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition in the requirement: significant pulmonary arterial hypertension is defined as mean pulmonary artery pressure > 25 mm Hg
(assert
  (! (= patient_has_finding_of_pulmonary_arterial_hypertension_now
        (> patient_pulmonary_artery_mean_pressure_value_recorded_now_withunit_millimeters_of_mercury 25.0))
     :named REQ0_AUXILIARY0))  ;; "significant pulmonary arterial hypertension (defined as mean pulmonary artery pressure > 25 millimeters of mercury)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_pulmonary_arterial_hypertension_now
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS))  ;; "To be included, the patient must have significant pulmonary arterial hypertension (defined as mean pulmonary artery pressure > 25 millimeters of mercury)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  // "aged ≥ 4 years AND aged ≤ 18 years"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 4)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 4 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 18 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_undergone_cardiac_catheterization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone cardiac catheterization at the present time (now).","when_to_set_to_false":"Set to false if the patient has not undergone cardiac catheterization at the present time (now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone cardiac catheterization at the present time (now).","meaning":"Boolean indicating whether the patient has undergone cardiac catheterization now."}  // "To be included, the patient must have routine cardiac catheterization that is clinically indicated for deciding therapeutic treatment."
(declare-const patient_has_undergone_cardiac_catheterization_now@@routine Bool) ;; {"when_to_set_to_true":"Set to true if the cardiac catheterization undergone now is routine.","when_to_set_to_false":"Set to false if the cardiac catheterization undergone now is not routine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac catheterization undergone now is routine.","meaning":"Boolean indicating whether the cardiac catheterization undergone now is routine."}  // "routine cardiac catheterization"
(declare-const patient_has_undergone_cardiac_catheterization_now@@clinically_indicated_for_deciding_therapeutic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the cardiac catheterization undergone now is clinically indicated for deciding therapeutic treatment.","when_to_set_to_false":"Set to false if the cardiac catheterization undergone now is not clinically indicated for deciding therapeutic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cardiac catheterization undergone now is clinically indicated for deciding therapeutic treatment.","meaning":"Boolean indicating whether the cardiac catheterization undergone now is clinically indicated for deciding therapeutic treatment."}  // "clinically indicated for deciding therapeutic treatment"
(declare-const patient_has_undergone_cardiac_catheterization_now@@routine@@clinically_indicated_for_deciding_therapeutic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a routine cardiac catheterization now, and the procedure is clinically indicated for deciding therapeutic treatment.","when_to_set_to_false":"Set to false if the patient has not undergone a routine cardiac catheterization now that is clinically indicated for deciding therapeutic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a routine cardiac catheterization now that is clinically indicated for deciding therapeutic treatment.","meaning":"Boolean indicating whether the patient has undergone a routine cardiac catheterization now that is clinically indicated for deciding therapeutic treatment."}  // "routine cardiac catheterization that is clinically indicated for deciding therapeutic treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_undergone_cardiac_catheterization_now@@routine
         patient_has_undergone_cardiac_catheterization_now)
     :named REQ2_AUXILIARY0)) ;; "routine cardiac catheterization"

(assert
  (! (=> patient_has_undergone_cardiac_catheterization_now@@clinically_indicated_for_deciding_therapeutic_treatment
         patient_has_undergone_cardiac_catheterization_now)
     :named REQ2_AUXILIARY1)) ;; "clinically indicated for deciding therapeutic treatment"

;; The doubly-qualified variable is true iff both qualifiers are true
(assert
  (! (= patient_has_undergone_cardiac_catheterization_now@@routine@@clinically_indicated_for_deciding_therapeutic_treatment
        (and patient_has_undergone_cardiac_catheterization_now@@routine
             patient_has_undergone_cardiac_catheterization_now@@clinically_indicated_for_deciding_therapeutic_treatment))
     :named REQ2_AUXILIARY2)) ;; "routine cardiac catheterization that is clinically indicated for deciding therapeutic treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_has_undergone_cardiac_catheterization_now@@routine@@clinically_indicated_for_deciding_therapeutic_treatment
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have routine cardiac catheterization that is clinically indicated for deciding therapeutic treatment."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const parent_has_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the parent has provided informed consent.","when_to_set_to_false":"Set to false if the parent has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the parent has provided informed consent.","meaning":"Boolean indicating whether the parent has provided informed consent."}  // "informed consent from the parent"
(declare-const parent_has_informed_consent@@obtained_from_parent Bool) ;; {"when_to_set_to_true":"Set to true if the informed consent is obtained from the parent.","when_to_set_to_false":"Set to false if the informed consent is not obtained from the parent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed consent is obtained from the parent.","meaning":"Boolean indicating whether the informed consent is obtained from the parent."}  // "informed consent from the parent"
(declare-const patient_has_informed_assent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed assent.","when_to_set_to_false":"Set to false if the patient has not provided informed assent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed assent.","meaning":"Boolean indicating whether the patient has provided informed assent."}  // "informed assent from the patient"
(declare-const patient_has_informed_assent@@obtained_from_patient Bool) ;; {"when_to_set_to_true":"Set to true if the informed assent is obtained from the patient.","when_to_set_to_false":"Set to false if the informed assent is not obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed assent is obtained from the patient.","meaning":"Boolean indicating whether the informed assent is obtained from the patient."}  // "informed assent from the patient"
(declare-const patient_has_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided informed consent.","when_to_set_to_false":"Set to false if the patient has not provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided informed consent.","meaning":"Boolean indicating whether the patient has provided informed consent."}  // "informed consent from the patient"
(declare-const patient_has_informed_consent@@obtained_from_patient Bool) ;; {"when_to_set_to_true":"Set to true if the informed consent is obtained from the patient.","when_to_set_to_false":"Set to false if the informed consent is not obtained from the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the informed consent is obtained from the patient.","meaning":"Boolean indicating whether the informed consent is obtained from the patient."}  // "informed consent from the patient"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> parent_has_informed_consent@@obtained_from_parent
         parent_has_informed_consent)
     :named REQ3_AUXILIARY0)) ;; "informed consent from the parent"

(assert
  (! (=> patient_has_informed_assent@@obtained_from_patient
         patient_has_informed_assent)
     :named REQ3_AUXILIARY1)) ;; "informed assent from the patient"

(assert
  (! (=> patient_has_informed_consent@@obtained_from_patient
         patient_has_informed_consent)
     :named REQ3_AUXILIARY2)) ;; "informed consent from the patient"

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least one of: informed assent from the patient OR informed consent from the patient OR informed consent from the parent
(assert
  (! (or patient_has_informed_assent
         patient_has_informed_consent
         parent_has_informed_consent)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have ((informed assent from the patient) OR (informed consent from the patient) OR (informed consent from the parent))."
