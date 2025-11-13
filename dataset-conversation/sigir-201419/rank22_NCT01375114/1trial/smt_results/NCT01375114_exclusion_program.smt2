;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_allergy_to_ginseng_extract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented allergy to ginseng extract.","when_to_set_to_false":"Set to false if the patient currently does not have a documented allergy to ginseng extract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergy to ginseng extract.","meaning":"Boolean indicating whether the patient currently has an allergy to ginseng extract."} ;; "allergy to Panax species"
(declare-const patient_has_hypersensitivity_to_panax_species_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented hypersensitivity to Panax species.","when_to_set_to_false":"Set to false if the patient currently does not have a documented hypersensitivity to Panax species.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity to Panax species.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity to Panax species."} ;; "hypersensitivity to Panax species"
(declare-const patient_has_hypersensitivity_to_ginseng_extract_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a documented hypersensitivity to ginseng extract.","when_to_set_to_false":"Set to false if the patient currently does not have a documented hypersensitivity to ginseng extract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity to ginseng extract.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity to ginseng extract."} ;; "hypersensitivity to constituents of Panax species"
(declare-const patient_has_finding_of_arrhythmia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of arrhythmias.","when_to_set_to_false":"Set to false if the patient does not have a documented history of arrhythmias.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of arrhythmias.","meaning":"Boolean indicating whether the patient has a history of arrhythmias."} ;; "history of arrhythmias"
(declare-const patient_has_finding_of_feeling_agitated_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of agitation.","when_to_set_to_false":"Set to false if the patient does not have a documented history of agitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of agitation.","meaning":"Boolean indicating whether the patient has a history of feeling agitated."} ;; "history of agitation"
(declare-const patient_has_finding_of_motor_tic_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of motor tic disorder.","when_to_set_to_false":"Set to false if the patient does not have a documented history of motor tic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of motor tic disorder.","meaning":"Boolean indicating whether the patient has a history of motor tic disorder."} ;; "history of motor tics"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of angina pectoris.","when_to_set_to_false":"Set to false if the patient does not have a documented history of angina pectoris.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of angina pectoris.","meaning":"Boolean indicating whether the patient has a history of angina pectoris."} ;; "history of angina pectoris"
(declare-const patient_has_finding_of_angina_pectoris_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of severe angina pectoris.","when_to_set_to_false":"Set to false if the patient has a history of angina pectoris but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the angina pectoris is severe.","meaning":"Boolean indicating whether the patient's angina pectoris is severe."} ;; "history of severe angina pectoris"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_angina_pectoris_inthehistory@@severe
       patient_has_finding_of_angina_pectoris_inthehistory)
   :named REQ0_AUXILIARY0)) ;; "history of severe angina pectoris" implies "history of angina pectoris"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Exclusion: patient must NOT have any major contraindication to ginseng, defined as the following OR of components
(assert
(! (not (or patient_has_allergy_to_ginseng_extract_now
            patient_has_hypersensitivity_to_panax_species_now
            patient_has_hypersensitivity_to_ginseng_extract_now
            patient_has_finding_of_arrhythmia_inthehistory
            patient_has_finding_of_feeling_agitated_inthehistory
            patient_has_finding_of_motor_tic_disorder_inthehistory
            patient_has_finding_of_angina_pectoris_inthehistory@@severe))
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "major contraindication to ginseng, defined as ((allergy to Panax species) OR (hypersensitivity to Panax species) OR (allergy to constituents of Panax species) OR (hypersensitivity to constituents of Panax species) OR (history of arrhythmias) OR (history of agitation) OR (history of motor tics) OR (history of severe angina pectoris))"

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_currently_taking_panax_ginseng Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking Panax ginseng.","when_to_set_to_false":"Set to false if the patient is not currently taking Panax ginseng.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking Panax ginseng.","meaning":"Boolean indicating whether the patient is currently taking Panax ginseng."} ;; "the patient is currently taking Panax ginseng"
(declare-const patient_is_currently_taking_methylphenidate Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking methylphenidate.","when_to_set_to_false":"Set to false if the patient is not currently taking methylphenidate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking methylphenidate.","meaning":"Boolean indicating whether the patient is currently taking methylphenidate."} ;; "the patient is currently taking methylphenidate"
(declare-const patient_is_currently_taking_modafinil Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking modafinil.","when_to_set_to_false":"Set to false if the patient is not currently taking modafinil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking modafinil.","meaning":"Boolean indicating whether the patient is currently taking modafinil."} ;; "the patient is currently taking modafinil"
(declare-const patient_has_taken_panax_ginseng_within_previous_10_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken Panax ginseng within the previous ten days.","when_to_set_to_false":"Set to false if the patient has not taken Panax ginseng within the previous ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken Panax ginseng within the previous ten days.","meaning":"Boolean indicating whether the patient has taken Panax ginseng within the previous ten days."} ;; "the patient has taken Panax ginseng within the previous ten days"
(declare-const patient_has_taken_methylphenidate_within_previous_10_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken methylphenidate within the previous ten days.","when_to_set_to_false":"Set to false if the patient has not taken methylphenidate within the previous ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken methylphenidate within the previous ten days.","meaning":"Boolean indicating whether the patient has taken methylphenidate within the previous ten days."} ;; "the patient has taken methylphenidate within the previous ten days"
(declare-const patient_has_taken_modafinil_within_previous_10_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken modafinil within the previous ten days.","when_to_set_to_false":"Set to false if the patient has not taken modafinil within the previous ten days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken modafinil within the previous ten days.","meaning":"Boolean indicating whether the patient has taken modafinil within the previous ten days."} ;; "the patient has taken modafinil within the previous ten days"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or patient_is_currently_taking_panax_ginseng
            patient_is_currently_taking_methylphenidate
            patient_is_currently_taking_modafinil
            patient_has_taken_panax_ginseng_within_previous_10_days
            patient_has_taken_methylphenidate_within_previous_10_days
            patient_has_taken_modafinil_within_previous_10_days))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is currently taking Panax ginseng) OR (the patient is currently taking methylphenidate) OR (the patient is currently taking modafinil) OR (the patient has taken Panax ginseng within the previous ten days) OR (the patient has taken methylphenidate within the previous ten days) OR (the patient has taken modafinil within the previous ten days))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_unable_to_complete_baseline_assessment_forms Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to complete the baseline assessment forms.","when_to_set_to_false":"Set to false if the patient is able to complete the baseline assessment forms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to complete the baseline assessment forms.","meaning":"Boolean indicating whether the patient is unable to complete the baseline assessment forms."} ;; "the patient is unable to complete the baseline assessment forms"
(declare-const patient_is_unable_to_understand_recommendations_for_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to understand the recommendations for participation in the study.","when_to_set_to_false":"Set to false if the patient is able to understand the recommendations for participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to understand the recommendations for participation in the study.","meaning":"Boolean indicating whether the patient is unable to understand the recommendations for participation in the study."} ;; "the patient is unable to understand the recommendations for participation in the study"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_unable_to_complete_baseline_assessment_forms)
:named REQ2_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to complete the baseline assessment forms."

(assert
(! (not patient_is_unable_to_understand_recommendations_for_study_participation)
:named REQ2_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to understand the recommendations for participation in the study."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of major depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder."} ;; "the patient currently has a diagnosis of major depression"
(declare-const patient_has_diagnosis_of_bipolar_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bipolar disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bipolar disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bipolar disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bipolar disorder."} ;; "the patient currently has a diagnosis of manic depressive disorder"
(declare-const patient_has_diagnosis_of_obsessive_compulsive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of obsessive-compulsive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of obsessive-compulsive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of obsessive-compulsive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of obsessive-compulsive disorder."} ;; "the patient currently has a diagnosis of obsessive-compulsive disorder"
(declare-const patient_has_diagnosis_of_schizophrenia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of schizophrenia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of schizophrenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of schizophrenia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of schizophrenia."} ;; "the patient currently has a diagnosis of schizophrenia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_major_depressive_disorder_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has a diagnosis of major depression."

(assert
(! (not patient_has_diagnosis_of_bipolar_disorder_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has a diagnosis of manic depressive disorder."

(assert
(! (not patient_has_diagnosis_of_obsessive_compulsive_disorder_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has a diagnosis of obsessive-compulsive disorder."

(assert
(! (not patient_has_diagnosis_of_schizophrenia_now)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient currently has a diagnosis of schizophrenia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_symptoms_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of tachycardia.","meaning":"Boolean indicating whether the patient currently has symptoms of tachycardia."} ;; "symptomatic tachycardia"

(declare-const patient_has_finding_of_poor_hypertension_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has uncontrolled hypertension.","when_to_set_to_false":"Set to false if the patient currently does not have uncontrolled hypertension.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled hypertension.","meaning":"Boolean indicating whether the patient currently has uncontrolled hypertension."} ;; "uncontrolled hypertension"

(declare-const patient_has_finding_of_poor_hypertension_control_now@@clinically_significant_as_determined_by_principal_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient's uncontrolled hypertension is determined to be clinically significant by the principal investigator.","when_to_set_to_false":"Set to false if the patient's uncontrolled hypertension is not determined to be clinically significant by the principal investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the principal investigator has determined the clinical significance of the patient's uncontrolled hypertension.","meaning":"Boolean indicating whether the patient's uncontrolled hypertension is determined to be clinically significant by the principal investigator."} ;; "uncontrolled hypertension, as determined to be clinically significant by the principal investigator"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_poor_hypertension_control_now@@clinically_significant_as_determined_by_principal_investigator
      patient_has_finding_of_poor_hypertension_control_now)
:named REQ4_AUXILIARY0)) ;; "uncontrolled hypertension, as determined to be clinically significant by the principal investigator"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_has_symptoms_of_tachycardia_now
             patient_has_finding_of_poor_hypertension_control_now@@clinically_significant_as_determined_by_principal_investigator))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has symptomatic tachycardia) AND (the patient has uncontrolled hypertension, as determined to be clinically significant by the principal investigator))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_phenobarbital_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to phenobarbital.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to phenobarbital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to phenobarbital.","meaning":"Boolean indicating whether the patient is currently exposed to phenobarbital."} ;; "the patient is currently receiving phenobarbital"
(declare-const patient_is_exposed_to_diphenylhydantoin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to diphenylhydantoin.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to diphenylhydantoin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to diphenylhydantoin.","meaning":"Boolean indicating whether the patient is currently receiving or exposed to diphenylhydantoin."} ;; "the patient is currently receiving diphenylhydantoin"
(declare-const patient_is_exposed_to_primidone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to primidone.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to primidone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to primidone.","meaning":"Boolean indicating whether the patient is currently exposed to primidone."} ;; "the patient is currently receiving primidone"
(declare-const patient_is_exposed_to_phenylbutazone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to phenylbutazone.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to phenylbutazone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to phenylbutazone.","meaning":"Boolean indicating whether the patient is currently exposed to phenylbutazone."} ;; "the patient is currently receiving phenylbutazone"
(declare-const patient_is_exposed_to_monoamine_oxidase_inhibitor_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to monoamine oxidase inhibitor drugs.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to monoamine oxidase inhibitor drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to monoamine oxidase inhibitor drugs.","meaning":"Boolean indicating whether the patient is currently receiving or exposed to monoamine oxidase inhibitor drugs."} ;; "the patient is currently receiving monoamine oxidase inhibitor drugs"
(declare-const patient_is_exposed_to_clonidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to clonidine.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to clonidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to clonidine.","meaning":"Boolean indicating whether the patient is currently exposed to clonidine."} ;; "the patient is currently receiving clonidine"
(declare-const patient_is_exposed_to_tricyclic_antidepressant_drugs_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to tricyclic antidepressant drugs.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to tricyclic antidepressant drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving or exposed to tricyclic antidepressant drugs.","meaning":"Boolean indicating whether the patient is currently receiving or exposed to tricyclic antidepressant drugs."} ;; "the patient is currently receiving tricyclic antidepressant drugs"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_phenobarbital_now)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving phenobarbital."

(assert
(! (not patient_is_exposed_to_diphenylhydantoin_now)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving diphenylhydantoin."

(assert
(! (not patient_is_exposed_to_primidone_now)
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving primidone."

(assert
(! (not patient_is_exposed_to_phenylbutazone_now)
    :named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving phenylbutazone."

(assert
(! (not patient_is_exposed_to_monoamine_oxidase_inhibitor_drugs_now)
    :named REQ5_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving monoamine oxidase inhibitor drugs."

(assert
(! (not patient_is_exposed_to_clonidine_now)
    :named REQ5_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving clonidine."

(assert
(! (not patient_is_exposed_to_tricyclic_antidepressant_drugs_now)
    :named REQ5_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently receiving tricyclic antidepressant drugs."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uncontrolled diabetes mellitus (poorly controlled diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uncontrolled diabetes mellitus (poorly controlled diabetes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uncontrolled diabetes mellitus (poorly controlled diabetes).","meaning":"Boolean indicating whether the patient currently has uncontrolled diabetes mellitus (poorly controlled diabetes)."} ;; "uncontrolled diabetes mellitus"

(declare-const patient_is_undergoing_random_blood_glucose_measurement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing random blood glucose measurement.","when_to_set_to_false":"Set to false if the patient is currently not undergoing random blood glucose measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing random blood glucose measurement.","meaning":"Boolean indicating whether the patient is currently undergoing random blood glucose measurement."} ;; "random blood sugar"

(declare-const patient_is_undergoing_random_blood_glucose_measurement_now@@monitored_by_primary_care_physician Bool) ;; {"when_to_set_to_true":"Set to true if the patient's random blood glucose measurement is being monitored by the primary care physician.","when_to_set_to_false":"Set to false if the patient's random blood glucose measurement is not being monitored by the primary care physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's random blood glucose measurement is being monitored by the primary care physician.","meaning":"Boolean indicating whether the patient's random blood glucose measurement is being monitored by the primary care physician."} ;; "random blood sugar is not being monitored by the primary care physician of the patient"

(declare-const patient_random_blood_glucose_measurement_value_recorded_now_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a random blood glucose measurement in milligrams per deciliter is recorded for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current random blood glucose measurement in milligrams per deciliter."} ;; "random blood sugar > 200 milligrams per deciliter"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: uncontrolled diabetes mellitus = (random blood sugar > 200 mg/dl) AND (random blood sugar is not being monitored by the primary care physician)
(assert
(! (= patient_has_finding_of_diabetic_poor_control_now
(and
(> patient_random_blood_glucose_measurement_value_recorded_now_withunit_milligrams_per_deciliter 200)
(not patient_is_undergoing_random_blood_glucose_measurement_now@@monitored_by_primary_care_physician)))
:named REQ6_AUXILIARY0)) ;; "defined as (random blood sugar > 200 milligrams per deciliter) AND (random blood sugar is not being monitored by the primary care physician of the patient)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_random_blood_glucose_measurement_now@@monitored_by_primary_care_physician
patient_is_undergoing_random_blood_glucose_measurement_now)
:named REQ6_AUXILIARY1)) ;; "random blood sugar is being monitored by the primary care physician"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_diabetic_poor_control_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled diabetes mellitus, defined as (random blood sugar > 200 milligrams per deciliter) AND (random blood sugar is not being monitored by the primary care physician of the patient)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulant therapy"
(declare-const patient_is_undergoing_anticoagulant_therapy_now@@full_dose Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy at full dose.","when_to_set_to_false":"Set to false if the patient is currently undergoing anticoagulant therapy but not at full dose.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the anticoagulant therapy is at full dose.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy at full dose."} ;; "full dose anticoagulant therapy"
(declare-const patient_is_exposed_to_warfarin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to warfarin (coumadin).","when_to_set_to_false":"Set to false if the patient is currently not exposed to warfarin (coumadin).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to warfarin (coumadin).","meaning":"Boolean indicating whether the patient is currently exposed to warfarin (coumadin)."} ;; "coumadin"
(declare-const patient_is_exposed_to_warfarin_now@@dose_one_milligram_per_day_or_less Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to warfarin (coumadin) at a dose of one milligram per day or less.","when_to_set_to_false":"Set to false if the patient is currently exposed to warfarin (coumadin) at a dose greater than one milligram per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dose of warfarin (coumadin) is one milligram per day or less.","meaning":"Boolean indicating whether the patient is currently exposed to warfarin (coumadin) at a dose of one milligram per day or less."} ;; "dose of one milligram per day or less"
(declare-const patient_is_exposed_to_warfarin_now@@for_preventing_catheter_clots Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to warfarin (coumadin) for the purpose of preventing catheter clots.","when_to_set_to_false":"Set to false if the patient is currently exposed to warfarin (coumadin) for a different indication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the indication for warfarin (coumadin) exposure is prevention of catheter clots.","meaning":"Boolean indicating whether the patient is currently exposed to warfarin (coumadin) for the purpose of preventing catheter clots."} ;; "for preventing catheter clots"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_anticoagulant_therapy_now@@full_dose
      patient_is_undergoing_anticoagulant_therapy_now)
    :named REQ7_AUXILIARY0)) ;; "full dose anticoagulant therapy"

(assert
(! (=> patient_is_exposed_to_warfarin_now@@dose_one_milligram_per_day_or_less
      patient_is_exposed_to_warfarin_now)
    :named REQ7_AUXILIARY1)) ;; "dose of one milligram per day or less"

(assert
(! (=> patient_is_exposed_to_warfarin_now@@for_preventing_catheter_clots
      patient_is_exposed_to_warfarin_now)
    :named REQ7_AUXILIARY2)) ;; "for preventing catheter clots"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient is receiving concurrent full dose anticoagulant therapy AND NOT (receiving coumadin at ≤1 mg/day for preventing catheter clots)
(assert
(! (not (and patient_is_undergoing_anticoagulant_therapy_now@@full_dose
             (not (and patient_is_exposed_to_warfarin_now@@dose_one_milligram_per_day_or_less
                       patient_is_exposed_to_warfarin_now@@for_preventing_catheter_clots))))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is receiving concurrent full dose anticoagulant therapy) AND NOT ((the patient is receiving coumadin at a dose of one milligram per day or less for preventing catheter clots)))."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_viral_hepatitis_type_a_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatitis A at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatitis A at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatitis A.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatitis A in their history."} ;; "the patient has a history of hepatitis A"
(declare-const patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatitis B at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatitis B at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatitis B.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatitis B in their history."} ;; "the patient has a history of hepatitis B"
(declare-const patient_has_diagnosis_of_viral_hepatitis_c_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with hepatitis C at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with hepatitis C at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with hepatitis C.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of hepatitis C in their history."} ;; "the patient has a history of hepatitis C"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_viral_hepatitis_type_a_inthehistory)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hepatitis A."

(assert
(! (not patient_has_diagnosis_of_type_b_viral_hepatitis_inthehistory)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hepatitis B."

(assert
(! (not patient_has_diagnosis_of_viral_hepatitis_c_inthehistory)
:named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hepatitis C."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "the patient is a woman who is nursing"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as male or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "the patient is a woman who is nursing"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (and patient_sex_is_female_now patient_is_breastfeeding_now))
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a woman who is nursing."
