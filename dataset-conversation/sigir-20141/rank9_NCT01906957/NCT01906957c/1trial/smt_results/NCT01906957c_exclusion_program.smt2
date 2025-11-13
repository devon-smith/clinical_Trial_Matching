;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary arteriosclerosis (coronary heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary arteriosclerosis (coronary heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary heart disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary heart disease)." } ;; "coronary heart disease"
(declare-const patient_has_expressed_written_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has expressed written consent.","when_to_set_to_false":"Set to false if the patient currently does not have expressed written consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has expressed written consent.","meaning":"Boolean indicating whether the patient currently has expressed written consent."} ;; "lacks expressed written consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_diagnosis_of_coronary_arteriosclerosis_now
               (not patient_has_expressed_written_consent_now)))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary heart disease AND the patient lacks expressed written consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
;; "coronary heart disease"
;; Already declared: (declare-const patient_has_diagnosis_of_coronary_arteriosclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary arteriosclerosis (coronary heart disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary arteriosclerosis (coronary heart disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary heart disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary arteriosclerosis (coronary heart disease)." } ;; "coronary heart disease"

(declare-const patient_has_history_of_acute_coronary_event Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an acute coronary event at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an acute coronary event at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an acute coronary event.","meaning":"Boolean indicating whether the patient has ever had an acute coronary event in the past."} ;; "the patient has had a recent acute coronary event within less than three months"

(declare-const patient_has_history_of_acute_coronary_event@@recent_within_less_than_three_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient's acute coronary event occurred within less than three months prior to the reference time.","when_to_set_to_false":"Set to false if the patient's acute coronary event did not occur within less than three months prior to the reference time.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's acute coronary event occurred within less than three months prior to the reference time.","meaning":"Boolean indicating whether the patient's acute coronary event occurred within less than three months prior to the reference time."} ;; "the patient has had a recent acute coronary event within less than three months"

(declare-const time_since_most_recent_acute_coronary_event_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months since the patient's most recent acute coronary event, if known.","when_to_set_to_null":"Set to null if the time since the most recent acute coronary event is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the number of months since the patient's most recent acute coronary event."} ;; "within less than three months"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_history_of_acute_coronary_event@@recent_within_less_than_three_months
       patient_has_history_of_acute_coronary_event)
   :named REQ1_AUXILIARY0)) ;; "the patient has had a recent acute coronary event within less than three months"

;; Definition: recent acute coronary event within less than three months
(assert
(! (= patient_has_history_of_acute_coronary_event@@recent_within_less_than_three_months
      (and patient_has_history_of_acute_coronary_event
           (< time_since_most_recent_acute_coronary_event_in_months 3)))
   :named REQ1_AUXILIARY1)) ;; "recent acute coronary event within less than three months"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (and patient_has_diagnosis_of_coronary_arteriosclerosis_now
             patient_has_history_of_acute_coronary_event@@recent_within_less_than_three_months))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary heart disease AND the patient has had a recent acute coronary event within less than three months."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T22:17:10.621964 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_chronic_systolic_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic systolic heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic systolic heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic systolic heart failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic systolic heart failure."} ;; "chronic systolic heart failure"
(declare-const patient_has_diagnosis_of_coronary_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of coronary heart disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of coronary heart disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of coronary heart disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of coronary heart disease."} ;; "coronary heart disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_has_diagnosis_of_chronic_systolic_heart_failure_now))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary heart disease AND the patient has chronic systolic heart failure."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of the patient's current left ventricular ejection fraction is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's current left ventricular ejection fraction."} ;; "left ventricular ejection fraction"
(declare-const patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@resting_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the left ventricular ejection fraction value was measured while the patient was at rest.","when_to_set_to_false":"Set to false if the measurement was not taken at rest.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at rest.","meaning":"Boolean indicating whether the left ventricular ejection fraction measurement was taken at rest."} ;; "resting left ventricular ejection fraction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
               patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent@@resting_measurement
               (< patient_left_ventricular_ejection_fraction_value_recorded_now_withunit_percent 40)))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary heart disease AND the patient has a resting left ventricular ejection fraction < 40%."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aortic valve stenosis."} ;; "aortic stenosis"
(declare-const patient_has_diagnosis_of_aortic_valve_stenosis_now@@symptomatic Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic valve stenosis and the stenosis is symptomatic.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of aortic valve stenosis but the stenosis is not symptomatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the aortic valve stenosis is symptomatic.","meaning":"Boolean indicating whether the patient's current aortic valve stenosis is symptomatic."} ;; "symptomatic aortic stenosis"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_aortic_valve_stenosis_now@@symptomatic
      patient_has_diagnosis_of_aortic_valve_stenosis_now)
:named REQ4_AUXILIARY0)) ;; "symptomatic aortic stenosis" implies "aortic stenosis"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have BOTH coronary heart disease AND symptomatic aortic stenosis
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_has_diagnosis_of_aortic_valve_stenosis_now@@symptomatic))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has coronary heart disease) AND (the patient has symptomatic aortic stenosis)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of left main coronary artery disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of left main coronary artery disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has left main coronary artery disease.","meaning":"Boolean indicating whether the patient currently has left main coronary artery disease."} ;; "left main coronary stenosis"
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left main coronary artery disease is severe.","when_to_set_to_false":"Set to false if the patient's left main coronary artery disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left main coronary artery disease is severe.","meaning":"Boolean indicating whether the patient's left main coronary artery disease is severe."} ;; "severe left main coronary stenosis"
(declare-const patient_has_finding_of_left_main_coronary_artery_disease_now@@non_revascularized Bool) ;; {"when_to_set_to_true":"Set to true if the patient's left main coronary artery disease is non-revascularized.","when_to_set_to_false":"Set to false if the patient's left main coronary artery disease is revascularized.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's left main coronary artery disease is non-revascularized.","meaning":"Boolean indicating whether the patient's left main coronary artery disease is non-revascularized."} ;; "non-revascularized left main coronary stenosis"
(declare-const patient_has_finding_of_severe_non_revascularized_coronary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe non-revascularized coronary disease.","when_to_set_to_false":"Set to false if the patient currently does not have severe non-revascularized coronary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe non-revascularized coronary disease.","meaning":"Boolean indicating whether the patient currently has severe non-revascularized coronary disease."} ;; "severe non-revascularized coronary disease"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive example: severe non-revascularized left main coronary stenosis implies severe non-revascularized coronary disease
(assert
(! (=> (and patient_has_finding_of_left_main_coronary_artery_disease_now@@severe
            patient_has_finding_of_left_main_coronary_artery_disease_now@@non_revascularized)
       patient_has_finding_of_severe_non_revascularized_coronary_disease_now)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (severe non-revascularized left main coronary stenosis)"

;; Qualifier variables imply corresponding stem variable for left main coronary artery disease
(assert
(! (=> patient_has_finding_of_left_main_coronary_artery_disease_now@@severe
       patient_has_finding_of_left_main_coronary_artery_disease_now)
:named REQ5_AUXILIARY1)) ;; "severe left main coronary stenosis"

(assert
(! (=> patient_has_finding_of_left_main_coronary_artery_disease_now@@non_revascularized
       patient_has_finding_of_left_main_coronary_artery_disease_now)
:named REQ5_AUXILIARY2)) ;; "non-revascularized left main coronary stenosis"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have BOTH coronary heart disease AND severe non-revascularized coronary disease
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_has_finding_of_severe_non_revascularized_coronary_disease_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has coronary heart disease) AND (the patient has severe non-revascularized coronary disease with non-exhaustive examples (severe non-revascularized left main coronary stenosis))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_will_undergo_coronary_artery_bypass_graft_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently awaiting coronary artery bypass graft surgery (the procedure is scheduled or planned for the near future).","when_to_set_to_false":"Set to false if the patient is not currently awaiting coronary artery bypass graft surgery (no procedure is scheduled or planned).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently awaiting coronary artery bypass graft surgery.","meaning":"Boolean indicating whether the patient is currently awaiting coronary artery bypass graft surgery."} ;; "the patient is awaiting coronary artery bypass surgery"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_will_undergo_coronary_artery_bypass_graft_now))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has coronary heart disease) AND (the patient is awaiting coronary artery bypass surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_chronic_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic atrial fibrillation."} ;; "chronic atrial fibrillation"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_has_diagnosis_of_chronic_atrial_fibrillation_now))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary heart disease AND the patient has chronic atrial fibrillation."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_permanent_ventricular_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a permanent ventricular pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have a permanent ventricular pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a permanent ventricular pacemaker.","meaning":"Boolean indicating whether the patient currently has a permanent ventricular pacemaker."} ;; "the patient has a permanent ventricular pacemaker"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
               patient_has_permanent_ventricular_pacemaker_now))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has coronary heart disease) AND (the patient has a permanent ventricular pacemaker)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_malignant_exertional_arrhythmias_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malignant exertional arrhythmias.","when_to_set_to_false":"Set to false if the patient currently does not have malignant exertional arrhythmias.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malignant exertional arrhythmias.","meaning":"Boolean indicating whether the patient currently has malignant exertional arrhythmias."} ;; "malignant exertional arrhythmias"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_has_finding_of_malignant_exertional_arrhythmias_now))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary heart disease AND the patient has malignant exertional arrhythmias."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_non_cardiopulmonary_limitation_to_exercise_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a non-cardiopulmonary limitation to exercise (e.g., arthritis, claudication).","when_to_set_to_false":"Set to false if the patient currently does not have any non-cardiopulmonary limitation to exercise.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a non-cardiopulmonary limitation to exercise.","meaning":"Boolean indicating whether the patient currently has a non-cardiopulmonary limitation to exercise, such as arthritis or claudication."} ;; "non-cardiopulmonary limitation to exercise with non-exhaustive examples (arthritis, claudication)"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have BOTH coronary heart disease AND a non-cardiopulmonary limitation to exercise
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_has_non_cardiopulmonary_limitation_to_exercise_now))
   :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has coronary heart disease) AND (the patient has a non-cardiopulmonary limitation to exercise with non-exhaustive examples (arthritis, claudication))."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_impaired_exercise_tolerance_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired exercise tolerance.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired exercise tolerance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired exercise intolerance.","meaning":"Boolean indicating whether the patient currently has impaired exercise tolerance."} ;; "exercise intolerance"
(declare-const patient_has_finding_of_impaired_exercise_tolerance_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired exercise tolerance is severe.","when_to_set_to_false":"Set to false if the patient's impaired exercise tolerance is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired exercise tolerance is severe.","meaning":"Boolean indicating whether the patient's impaired exercise tolerance is severe."} ;; "severe exercise intolerance"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_exercise_tolerance_now@@severity_severe
       patient_has_finding_of_impaired_exercise_tolerance_now)
   :named REQ11_AUXILIARY0)) ;; "severe exercise intolerance"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Exclusion: patient must NOT have BOTH coronary heart disease AND severe exercise intolerance
(assert
(! (not (and patient_has_diagnosis_of_coronary_heart_disease_now
             patient_has_finding_of_impaired_exercise_tolerance_now@@severity_severe))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coronary heart disease AND the patient has severe exercise intolerance."
