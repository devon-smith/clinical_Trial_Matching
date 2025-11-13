;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary artery disease (coronary arteriosclerosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary artery disease (coronary arteriosclerosis)."}

(declare-const diameter_stenosis_value_left_main_coronary_artery_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent diameter stenosis of the left main coronary artery as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the current percent diameter stenosis of the left main coronary artery is.","meaning":"Numeric value indicating the current percent diameter stenosis of the left main coronary artery."}
(declare-const diameter_stenosis_value_left_anterior_descending_coronary_artery_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent diameter stenosis of the left anterior descending coronary artery as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the current percent diameter stenosis of the left anterior descending coronary artery is.","meaning":"Numeric value indicating the current percent diameter stenosis of the left anterior descending coronary artery."}
(declare-const diameter_stenosis_value_left_circumflex_coronary_artery_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent diameter stenosis of the left circumflex coronary artery as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the current percent diameter stenosis of the left circumflex coronary artery is.","meaning":"Numeric value indicating the current percent diameter stenosis of the left circumflex coronary artery."}
(declare-const diameter_stenosis_value_right_coronary_artery_now_in_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent diameter stenosis of the right coronary artery as recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined what the current percent diameter stenosis of the right coronary artery is.","meaning":"Numeric value indicating the current percent diameter stenosis of the right coronary artery."}

(declare-const patient_has_undergone_heart_revascularization_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a heart revascularization procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a heart revascularization procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a heart revascularization procedure.","meaning":"Boolean indicating whether the patient has ever undergone a heart revascularization procedure."}
(declare-const patient_has_undergone_heart_revascularization_inthehistory@@is_surgical Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart revascularization procedure was surgical.","when_to_set_to_false":"Set to false if the patient's heart revascularization procedure was not surgical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart revascularization procedure was surgical.","meaning":"Boolean indicating whether the patient's heart revascularization procedure was surgical."}
(declare-const patient_has_undergone_heart_revascularization_inthehistory@@is_percutaneous Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart revascularization procedure was percutaneous.","when_to_set_to_false":"Set to false if the patient's heart revascularization procedure was not percutaneous.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart revascularization procedure was percutaneous.","meaning":"Boolean indicating whether the patient's heart revascularization procedure was percutaneous."}

(declare-const patient_has_undergone_thrombolysis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone thrombolysis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone thrombolysis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone thrombolysis.","meaning":"Boolean indicating whether the patient has ever undergone thrombolysis."}
(declare-const patient_has_undergone_thrombolysis_inthehistory@@outcome_is_successful Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thrombolysis procedure was successful.","when_to_set_to_false":"Set to false if the patient's thrombolysis procedure was not successful.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thrombolysis procedure was successful.","meaning":"Boolean indicating whether the patient's thrombolysis procedure was successful."}

(declare-const patient_has_finding_of_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of myocardial infarction at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of myocardial infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of myocardial infarction.","meaning":"Boolean indicating whether the patient has ever had a finding of myocardial infarction."}
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_q_wave Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction was documented by Q-wave.","when_to_set_to_false":"Set to false if the patient's myocardial infarction was not documented by Q-wave.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction was documented by Q-wave.","meaning":"Boolean indicating whether the patient's myocardial infarction was documented by Q-wave."}
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_r_reduction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction was documented by R-reduction.","when_to_set_to_false":"Set to false if the patient's myocardial infarction was not documented by R-reduction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction was documented by R-reduction.","meaning":"Boolean indicating whether the patient's myocardial infarction was documented by R-reduction."}
(declare-const patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_aneurysm Bool) ;; {"when_to_set_to_true":"Set to true if the patient's myocardial infarction was documented by aneurysm.","when_to_set_to_false":"Set to false if the patient's myocardial infarction was not documented by aneurysm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the myocardial infarction was documented by aneurysm.","meaning":"Boolean indicating whether the patient's myocardial infarction was documented by aneurysm."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables (for revascularization)
(assert
  (! (=> patient_has_undergone_heart_revascularization_inthehistory@@is_surgical
         patient_has_undergone_heart_revascularization_inthehistory)
     :named REQ0_AUXILIARY0)) ;; "history of a surgical revascularization procedure"

(assert
  (! (=> patient_has_undergone_heart_revascularization_inthehistory@@is_percutaneous
         patient_has_undergone_heart_revascularization_inthehistory)
     :named REQ0_AUXILIARY1)) ;; "history of a percutaneous revascularization procedure"

;; Qualifier variable implies stem variable (for thrombolysis)
(assert
  (! (=> patient_has_undergone_thrombolysis_inthehistory@@outcome_is_successful
         patient_has_undergone_thrombolysis_inthehistory)
     :named REQ0_AUXILIARY2)) ;; "history of successful thrombolysis"

;; Qualifier variables imply corresponding stem variable (for myocardial infarction)
(assert
  (! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_q_wave
         patient_has_finding_of_myocardial_infarction_inthehistory)
     :named REQ0_AUXILIARY3)) ;; "history of prior myocardial infarction documented by Q-wave"

(assert
  (! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_r_reduction
         patient_has_finding_of_myocardial_infarction_inthehistory)
     :named REQ0_AUXILIARY4)) ;; "history of prior myocardial infarction documented by R-reduction"

(assert
  (! (=> patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_aneurysm
         patient_has_finding_of_myocardial_infarction_inthehistory)
     :named REQ0_AUXILIARY5)) ;; "history of prior myocardial infarction documented by aneurysm"

;; Non-exhaustive examples: documentation methods imply myocardial infarction in history
(assert
  (! (=> (or patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_q_wave
            patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_r_reduction
            patient_has_finding_of_myocardial_infarction_inthehistory@@documented_by_aneurysm)
         patient_has_finding_of_myocardial_infarction_inthehistory)
     :named REQ0_AUXILIARY6)) ;; "history of prior myocardial infarction (with non-exhaustive examples ...)"

;; ===================== Definitional assertion for coronary artery disease (REQ 0) =====================
;; Definition: coronary artery disease is present if any of the following are true:
;; (diameter stenosis of the left main coronary artery ≥ 50%) OR
;; (diameter stenosis of the left anterior descending coronary artery ≥ 75%) OR
;; (diameter stenosis of the left circumflex coronary artery ≥ 75%) OR
;; (diameter stenosis of the right coronary artery ≥ 75%) OR
;; (history of a surgical revascularization procedure) OR
;; (history of a percutaneous revascularization procedure) OR
;; (history of successful thrombolysis) OR
;; (history of prior myocardial infarction)
(assert
  (! (= patient_has_diagnosis_of_coronary_arteriosclerosis_now
        (or (>= diameter_stenosis_value_left_main_coronary_artery_now_in_percent 50.0)
            (>= diameter_stenosis_value_left_anterior_descending_coronary_artery_now_in_percent 75.0)
            (>= diameter_stenosis_value_left_circumflex_coronary_artery_now_in_percent 75.0)
            (>= diameter_stenosis_value_right_coronary_artery_now_in_percent 75.0)
            patient_has_undergone_heart_revascularization_inthehistory@@is_surgical
            patient_has_undergone_heart_revascularization_inthehistory@@is_percutaneous
            patient_has_undergone_thrombolysis_inthehistory@@outcome_is_successful
            patient_has_finding_of_myocardial_infarction_inthehistory))
     :named REQ0_AUXILIARY7)) ;; "coronary artery disease (defined as ...)"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_diagnosis_of_coronary_arteriosclerosis_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have coronary artery disease (defined as ...)"

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percent value if a left ventricular ejection fraction measurement is available from any time in the patient's history.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percent value representing the patient's left ventricular ejection fraction recorded in the history."} ;; "left ventricular ejection fraction ≤ 50% (as estimated by echocardiography OR as estimated by contrast ventriculography within the previous 30 days)"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent@@estimated_by_echocardiography_or_contrast_ventriculography Bool) ;; {"when_to_set_to_true":"Set to true if the LVEF measurement was estimated by echocardiography or contrast ventriculography.","when_to_set_to_false":"Set to false if the LVEF measurement was not estimated by echocardiography or contrast ventriculography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the LVEF measurement was estimated by echocardiography or contrast ventriculography.","meaning":"Boolean indicating whether the LVEF measurement was estimated by echocardiography or contrast ventriculography."} ;; "as estimated by echocardiography OR as estimated by contrast ventriculography"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent@@temporalcontext_within_30_days Bool) ;; {"when_to_set_to_true":"Set to true if the LVEF measurement was obtained within the previous 30 days.","when_to_set_to_false":"Set to false if the LVEF measurement was not obtained within the previous 30 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the LVEF measurement was obtained within the previous 30 days.","meaning":"Boolean indicating whether the LVEF measurement was obtained within the previous 30 days."} ;; "within the previous 30 days"
(declare-const patient_has_evidence_of_old_myocardial_infarction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence for old myocardial infarction in the patient's medical history.","when_to_set_to_false":"Set to false if there is no evidence for old myocardial infarction in the patient's medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is evidence for old myocardial infarction in the patient's medical history.","meaning":"Boolean indicating whether the patient has evidence for old myocardial infarction in their medical history."} ;; "evidence for old myocardial infarction"
(declare-const patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_electrocardiogram Bool) ;; {"when_to_set_to_true":"Set to true if the evidence for old myocardial infarction in the patient's medical history is established by electrocardiogram.","when_to_set_to_false":"Set to false if the evidence for old myocardial infarction in the patient's medical history is not established by electrocardiogram.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evidence for old myocardial infarction in the patient's medical history is established by electrocardiogram.","meaning":"Boolean indicating whether the evidence for old myocardial infarction in the patient's medical history is established by electrocardiogram."} ;; "evidence by electrocardiogram"
(declare-const patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_echocardiography Bool) ;; {"when_to_set_to_true":"Set to true if the evidence for old myocardial infarction in the patient's medical history is established by echocardiography.","when_to_set_to_false":"Set to false if the evidence for old myocardial infarction in the patient's medical history is not established by echocardiography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evidence for old myocardial infarction in the patient's medical history is established by echocardiography.","meaning":"Boolean indicating whether the evidence for old myocardial infarction in the patient's medical history is established by echocardiography."} ;; "evidence by echocardiography"
(declare-const patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_ventriculography Bool) ;; {"when_to_set_to_true":"Set to true if the evidence for old myocardial infarction in the patient's medical history is established by ventriculography.","when_to_set_to_false":"Set to false if the evidence for old myocardial infarction in the patient's medical history is not established by ventriculography.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the evidence for old myocardial infarction in the patient's medical history is established by ventriculography.","meaning":"Boolean indicating whether the evidence for old myocardial infarction in the patient's medical history is established by ventriculography."} ;; "evidence by ventriculography"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable for myocardial infarction evidence
(assert
  (! (=> patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_electrocardiogram
         patient_has_evidence_of_old_myocardial_infarction_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "evidence for old myocardial infarction (evidence by electrocardiogram)"

(assert
  (! (=> patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_echocardiography
         patient_has_evidence_of_old_myocardial_infarction_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "evidence for old myocardial infarction (evidence by echocardiography)"

(assert
  (! (=> patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_ventriculography
         patient_has_evidence_of_old_myocardial_infarction_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "evidence for old myocardial infarction (evidence by ventriculography)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: LVEF ≤ 50% as estimated by echocardiography OR contrast ventriculography within previous 30 days
(assert
  (! (and (<= patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent 50.0)
          patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent@@estimated_by_echocardiography_or_contrast_ventriculography
          patient_left_ventricular_ejection_fraction_value_recorded_inthehistory_withunit_percent@@temporalcontext_within_30_days)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "left ventricular ejection fraction ≤ 50% (as estimated by echocardiography OR as estimated by contrast ventriculography within the previous 30 days)"

;; Component 1: Evidence for old myocardial infarction (by ECG OR echo OR ventriculography)
(assert
  (! (or patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_electrocardiogram
         patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_echocardiography
         patient_has_evidence_of_old_myocardial_infarction_inthehistory@@evidence_by_ventriculography)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "evidence for old myocardial infarction (evidence by electrocardiogram OR evidence by echocardiography OR evidence by ventriculography)"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_ventricular_tachycardia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had documented stable clinical ventricular tachycardia at any point in their history.","when_to_set_to_false":"Set to false if the patient has never had documented stable clinical ventricular tachycardia in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had documented stable clinical ventricular tachycardia.","meaning":"Boolean indicating whether the patient has ever had documented stable clinical ventricular tachycardia in their history."}
(declare-const patient_has_finding_of_ventricular_tachycardia_inthehistory@@exactly_one_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had exactly one episode of documented stable clinical ventricular tachycardia in their history.","when_to_set_to_false":"Set to false if the patient has had zero or more than one episode of documented stable clinical ventricular tachycardia in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many episodes of documented stable clinical ventricular tachycardia the patient has had.","meaning":"Boolean indicating whether the patient has had exactly one episode of documented stable clinical ventricular tachycardia in their history."}
(declare-const patient_has_finding_of_reversible_cause_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any reversible cause for ventricular tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have any reversible cause for ventricular tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any reversible cause for ventricular tachycardia.","meaning":"Boolean indicating whether the patient currently has any reversible cause for ventricular tachycardia."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_ventricular_tachycardia_inthehistory@@exactly_one_episode
         patient_has_finding_of_ventricular_tachycardia_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "To be included, the patient must have had one episode of documented stable clinical ventricular tachycardia"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Must have had one episode of documented stable clinical ventricular tachycardia
(assert
  (! patient_has_finding_of_ventricular_tachycardia_inthehistory@@exactly_one_episode
     :named REQ2_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have had one episode of documented stable clinical ventricular tachycardia"

;; Component 1: Must NOT have any reversible causes
(assert
  (! (not patient_has_finding_of_reversible_cause_now)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have any reversible causes."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_provided_written_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has provided written informed consent.","when_to_set_to_false":"Set to false if the patient has not provided written informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has provided written informed consent.","meaning":"Boolean indicating whether the patient has provided written informed consent."} ;; "To be included, the patient must have provided written informed consent."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_provided_written_informed_consent
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have provided written informed consent."
