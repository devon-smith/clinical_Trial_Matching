;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_pulmonary_artery_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's pulmonary artery pressure is recorded now in mm Hg.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current pulmonary artery pressure in mm Hg."} ;; "pulmonary artery pressure"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have suprasystemic pulmonary artery pressure
;; (Assuming suprasystemic means pulmonary artery pressure > systemic arterial pressure; since only pulmonary artery pressure is provided, we encode the exclusion as having a suprasystemic value, which is contextually > systemic pressure, but here we only check that the value is set and is suprasystemic (>120 mm Hg is a typical suprasystemic threshold for adults, but this may vary; if not specified, we use a placeholder threshold)
(assert
(! (not (> patient_pulmonary_artery_pressure_value_recorded_now_withunit_mm_hg 120.0))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suprasystemic pulmonary artery pressure."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_right_ventricular_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of right ventricular failure.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of right ventricular failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of right ventricular failure.","meaning":"Boolean indicating whether the patient currently has right ventricular failure."} ;; "right heart failure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_right_ventricular_failure_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of right heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_ventricular_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented finding of ventricular arrhythmia at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented finding of ventricular arrhythmia in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of ventricular arrhythmia.","meaning":"Boolean indicating whether the patient has ever had a finding of ventricular arrhythmia in their history."} ;; "ventricular arrhythmia"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_ventricular_arrhythmia_inthehistory)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of ventricular arrhythmia."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_vascular_access_arrhythmia_known Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or otherwise known diagnosis of vascular access arrhythmia.","when_to_set_to_false":"Set to false if it is known that the patient does not have vascular access arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a known diagnosis of vascular access arrhythmia.","meaning":"Boolean indicating whether the patient has a known diagnosis of vascular access arrhythmia."} ;; "known vascular access arrhythmia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_vascular_access_arrhythmia_known)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known vascular access arrhythmia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_contraindication_to_sildenafil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any contraindication to the administration of sildenafil.","when_to_set_to_false":"Set to false if the patient currently does not have any contraindication to the administration of sildenafil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to sildenafil.","meaning":"Boolean indicating whether the patient currently has a contraindication to sildenafil."} ;; "contraindication to Sildenafil administration"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_contraindication_to_sildenafil_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to Sildenafil administration."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_receiving_inotropic_administration_concurrently_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving inotropic administration concurrently.","when_to_set_to_false":"Set to false if the patient is currently not receiving inotropic administration concurrently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving inotropic administration concurrently.","meaning":"Boolean indicating whether the patient is currently receiving inotropic administration concurrently."} ;; "the patient is receiving concurrent inotropic administration"
(declare-const patient_is_receiving_phosphodiesterase_administration_concurrently_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving phosphodiesterase administration concurrently.","when_to_set_to_false":"Set to false if the patient is currently not receiving phosphodiesterase administration concurrently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving phosphodiesterase administration concurrently.","meaning":"Boolean indicating whether the patient is currently receiving phosphodiesterase administration concurrently."} ;; "the patient is receiving concurrent phosphodiesterase administration"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_receiving_inotropic_administration_concurrently_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concurrent inotropic administration."

(assert
(! (not patient_is_receiving_phosphodiesterase_administration_concurrently_now)
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concurrent phosphodiesterase administration."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_medical_circumstances_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other medical circumstances.","when_to_set_to_false":"Set to false if the patient currently does not have other medical circumstances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other medical circumstances.","meaning":"Boolean indicating whether the patient currently has other medical circumstances."} ;; "other medical circumstances"
(declare-const patient_has_finding_of_medical_circumstances_now@@complicates_regular_participation_or_increases_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other medical circumstances and these circumstances either complicate regular participation in the study or increase risk for the patient.","when_to_set_to_false":"Set to false if the patient currently has other medical circumstances but these circumstances do not complicate regular participation or increase risk for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's medical circumstances complicate regular participation or increase risk.","meaning":"Boolean indicating whether the patient's medical circumstances complicate regular participation in the study or increase risk for the patient."} ;; "other medical circumstances which complicate regular participation in the study OR increase the risk for the patient"

(declare-const patient_has_finding_of_psychological_circumstances_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other psychological circumstances.","when_to_set_to_false":"Set to false if the patient currently does not have other psychological circumstances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other psychological circumstances.","meaning":"Boolean indicating whether the patient currently has other psychological circumstances."} ;; "other psychological circumstances"
(declare-const patient_has_finding_of_psychological_circumstances_now@@complicates_regular_participation_or_increases_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other psychological circumstances and these circumstances either complicate regular participation in the study or increase risk for the patient.","when_to_set_to_false":"Set to false if the patient currently has other psychological circumstances but these circumstances do not complicate regular participation or increase risk for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's psychological circumstances complicate regular participation or increase risk.","meaning":"Boolean indicating whether the patient's psychological circumstances complicate regular participation in the study or increase risk for the patient."} ;; "other psychological circumstances which complicate regular participation in the study OR increase the risk for the patient"

(declare-const patient_has_finding_of_social_personal_history_observable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has social circumstances relevant to personal history.","when_to_set_to_false":"Set to false if the patient currently does not have social circumstances relevant to personal history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has social circumstances relevant to personal history.","meaning":"Boolean indicating whether the patient currently has social circumstances relevant to personal history."} ;; "social circumstances"
(declare-const patient_has_finding_of_social_personal_history_observable_now@@complicates_regular_participation_or_increases_risk Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has social circumstances relevant to personal history and these circumstances either complicate regular participation in the study or increase risk for the patient.","when_to_set_to_false":"Set to false if the patient currently has social circumstances relevant to personal history but these circumstances do not complicate regular participation or increase risk for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's social circumstances complicate regular participation or increase risk.","meaning":"Boolean indicating whether the patient's social circumstances complicate regular participation in the study or increase risk for the patient."} ;; "other social circumstances which complicate regular participation in the study OR increase the risk for the patient"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_medical_circumstances_now@@complicates_regular_participation_or_increases_risk
       patient_has_finding_of_medical_circumstances_now)
   :named REQ6_AUXILIARY0)) ;; "other medical circumstances which complicate regular participation in the study OR increase the risk for the patient"

(assert
(! (=> patient_has_finding_of_psychological_circumstances_now@@complicates_regular_participation_or_increases_risk
       patient_has_finding_of_psychological_circumstances_now)
   :named REQ6_AUXILIARY1)) ;; "other psychological circumstances which complicate regular participation in the study OR increase the risk for the patient"

(assert
(! (=> patient_has_finding_of_social_personal_history_observable_now@@complicates_regular_participation_or_increases_risk
       patient_has_finding_of_social_personal_history_observable_now)
   :named REQ6_AUXILIARY2)) ;; "other social circumstances which complicate regular participation in the study OR increase the risk for the patient"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_medical_circumstances_now@@complicates_regular_participation_or_increases_risk)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other medical circumstances which complicate regular participation in the study OR increase the risk for the patient."

(assert
(! (not patient_has_finding_of_psychological_circumstances_now@@complicates_regular_participation_or_increases_risk)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other psychological circumstances which complicate regular participation in the study OR increase the risk for the patient."

(assert
(! (not patient_has_finding_of_social_personal_history_observable_now@@complicates_regular_participation_or_increases_risk)
   :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other social circumstances which complicate regular participation in the study OR increase the risk for the patient."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_provided_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided consent for participation.","when_to_set_to_false":"Set to false if the patient has not provided consent for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided consent for participation.","meaning":"Boolean indicating whether the patient has provided consent for participation."} ;; "the patient does not provide consent"
(declare-const patient_has_provided_assent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided assent for participation.","when_to_set_to_false":"Set to false if the patient has not provided assent for participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided assent for participation.","meaning":"Boolean indicating whether the patient has provided assent for participation."} ;; "the patient does not provide assent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_provided_consent)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does not provide consent."

(assert
(! (not patient_has_provided_assent)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient does not provide assent."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_unwilling_to_comply_with_contraceptive_advice_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unwilling to comply with contraceptive advice as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently willing to comply with contraceptive advice as documented or reported.","when_to_set_to_null":"Set to null if the patient's willingness to comply with contraceptive advice is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently unwilling to comply with contraceptive advice."} ;; "the patient is unwilling to comply with contraceptive advice"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_is_pregnant_now
            patient_is_unwilling_to_comply_with_contraceptive_advice_now))
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is pregnant) OR (the patient is unwilling to comply with contraceptive advice)."
