;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_4_quinolones_adverse_reaction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity (adverse reaction) to quinolone drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity (adverse reaction) to quinolone drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity (adverse reaction) to quinolone drugs.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity (adverse reaction) to quinolone drugs."} ;; "the patient has known hypersensitivity to quinolone drugs"

(declare-const patient_has_finding_of_allergy_to_carbapenem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity (allergy/adverse reaction) to carbapenem drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity (allergy/adverse reaction) to carbapenem drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity (allergy/adverse reaction) to carbapenem drugs.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity (allergy/adverse reaction) to carbapenem drugs."} ;; "the patient has known hypersensitivity to carbapenem drugs"

(declare-const patient_has_hypersensitivity_to_beta_lactam_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity (adverse reaction) to any beta lactam antibiotic drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity (adverse reaction) to any beta lactam antibiotic drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity (adverse reaction) to any beta lactam antibiotic drugs.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity (adverse reaction) to any beta lactam antibiotic drugs."} ;; "the patient has known hypersensitivity to any other type of beta lactam antibiotic drugs with non-exhaustive examples (penicillin drugs, cephalosporin drugs)"

(declare-const patient_has_finding_of_adverse_reaction_to_pharmaceutical_excipient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity (adverse reaction) to any pharmaceutical excipient substances.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity (adverse reaction) to any pharmaceutical excipient substances.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity (adverse reaction) to any pharmaceutical excipient substances.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity (adverse reaction) to any pharmaceutical excipient substances."} ;; "the patient has known hypersensitivity to any of the excipient substances"

;; Additional variables for non-exhaustive examples (penicillin drugs, cephalosporin drugs)
(declare-const patient_has_hypersensitivity_to_penicillin_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity (adverse reaction) to any penicillin antibacterial drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity (adverse reaction) to any penicillin antibacterial drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity (adverse reaction) to any penicillin antibacterial drugs.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity (adverse reaction) to any penicillin antibacterial drugs."} ;; "penicillin drugs (non-exhaustive example of beta lactam antibiotic drugs)"

(declare-const patient_has_hypersensitivity_to_cephalosporin_antibacterial_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity (adverse reaction) to any cephalosporin antibacterial drugs.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity (adverse reaction) to any cephalosporin antibacterial drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity (adverse reaction) to any cephalosporin antibacterial drugs.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity (adverse reaction) to any cephalosporin antibacterial drugs."} ;; "cephalosporin drugs (non-exhaustive example of beta lactam antibiotic drugs)"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_hypersensitivity_to_penicillin_antibacterial_now
           patient_has_hypersensitivity_to_cephalosporin_antibacterial_now)
     patient_has_hypersensitivity_to_beta_lactam_antibacterial_now)
:named REQ0_AUXILIARY0)) ;; "non-exhaustive examples (penicillin drugs, cephalosporin drugs) for beta lactam antibiotic drugs"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_4_quinolones_adverse_reaction_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to quinolone drugs."

(assert
(! (not patient_has_finding_of_allergy_to_carbapenem_now)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to carbapenem drugs."

(assert
(! (not patient_has_hypersensitivity_to_beta_lactam_antibacterial_now)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to any other type of beta lactam antibiotic drugs with non-exhaustive examples (penicillin drugs, cephalosporin drugs)."

(assert
(! (not patient_has_finding_of_adverse_reaction_to_pharmaceutical_excipient_now)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to any of the excipient substances."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as male or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "the patient is a woman"

(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is a woman who is pregnant"

(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as lactating.","when_to_set_to_false":"Set to false if the patient is currently documented as not lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently lactating."} ;; "the patient is a woman who is lactating"

(declare-const patient_is_able_to_be_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as able to become pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not able to become pregnant.","when_to_set_to_null":"Set to null if the patient's current ability to become pregnant is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently able to become pregnant."} ;; "the patient is a woman in whom pregnancy cannot be excluded"

(declare-const pregnancy_cannot_be_excluded_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the current time, pregnancy cannot be excluded in the patient (i.e., it is not possible to definitively determine that the patient is not pregnant).","when_to_set_to_false":"Set to false if, at the current time, pregnancy can be definitively excluded in the patient (i.e., it is possible to determine that the patient is not pregnant).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether pregnancy can be excluded in the patient at the current time.","meaning":"Boolean indicating whether it is currently not possible to exclude pregnancy in the patient."} ;; "the patient is a woman in whom pregnancy cannot be excluded"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Pregnancy cannot be excluded only applies to women who are able to be pregnant
(assert
(! (=> (and patient_sex_is_female_now patient_is_able_to_be_pregnant_now)
pregnancy_cannot_be_excluded_now)
:named REQ1_AUXILIARY0)) ;; "the patient is a woman in whom pregnancy cannot be excluded"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is a woman who is pregnant
(assert
(! (not (and patient_sex_is_female_now patient_is_pregnant_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is a woman who is pregnant"

;; Exclusion: patient is a woman who is lactating
(assert
(! (not (and patient_sex_is_female_now patient_is_lactating_now))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is a woman who is lactating"

;; Exclusion: patient is a woman in whom pregnancy cannot be excluded
(assert
(! (not (and patient_sex_is_female_now pregnancy_cannot_be_excluded_now))
:named REQ1_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is a woman in whom pregnancy cannot be excluded"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_tendon_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a disorder of tendon (tendon disease) at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a disorder of tendon (tendon disease) at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a disorder of tendon (tendon disease) in their history.","meaning":"Boolean indicating whether the patient has ever had a disorder of tendon (tendon disease) in their medical history."} ;; "tendon disease"
(declare-const patient_has_finding_of_disorder_of_tendon_inthehistory@@related_to_quinolone_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's history of disorder of tendon (tendon disease) is related to quinolone treatment.","when_to_set_to_false":"Set to false if the patient's history of disorder of tendon (tendon disease) is not related to quinolone treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's history of disorder of tendon (tendon disease) is related to quinolone treatment.","meaning":"Boolean indicating whether the patient's history of disorder of tendon (tendon disease) is related to quinolone treatment."} ;; "tendon disease related to quinolone treatment" or "tendon disorder related to quinolone treatment"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_tendon_inthehistory@@related_to_quinolone_treatment
       patient_has_finding_of_disorder_of_tendon_inthehistory)
   :named REQ2_AUXILIARY0)) ;; "tendon disease related to quinolone treatment" or "tendon disorder related to quinolone treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_of_tendon_inthehistory@@related_to_quinolone_treatment)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of tendon disease related to quinolone treatment."
(assert
(! (not patient_has_finding_of_disorder_of_tendon_inthehistory@@related_to_quinolone_treatment)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of tendon disorder related to quinolone treatment."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of congenital long QT syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of congenital long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of congenital long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of congenital long QT syndrome."} ;; "the patient has known congenital QT prolongation"
(declare-const patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of congenital long QT syndrome is known.","when_to_set_to_false":"Set to false if the patient's diagnosis of congenital long QT syndrome is not known.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the patient's diagnosis of congenital long QT syndrome is known."} ;; "the patient has known congenital QT prolongation"
(declare-const patient_has_diagnosis_of_acquired_long_qt_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acquired long QT syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acquired long QT syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acquired long QT syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acquired long QT syndrome."} ;; "the patient has documented acquired QT prolongation"
(declare-const patient_has_diagnosis_of_acquired_long_qt_syndrome_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of acquired long QT syndrome is documented.","when_to_set_to_false":"Set to false if the patient's diagnosis of acquired long QT syndrome is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is documented.","meaning":"Boolean indicating whether the patient's diagnosis of acquired long QT syndrome is documented."} ;; "the patient has documented acquired QT prolongation"
(declare-const patient_has_finding_of_hypokalemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypokalemia.","when_to_set_to_false":"Set to false if the patient currently does not have hypokalemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypokalemia.","meaning":"Boolean indicating whether the patient currently has hypokalemia."} ;; "the patient has uncorrected hypokalemia"
(declare-const patient_has_finding_of_hypokalemia_now@@uncorrected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypokalemia is uncorrected.","when_to_set_to_false":"Set to false if the patient's hypokalemia is corrected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypokalemia is uncorrected.","meaning":"Boolean indicating whether the patient's hypokalemia is uncorrected."} ;; "the patient has uncorrected hypokalemia"
(declare-const patient_has_finding_of_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bradycardia.","meaning":"Boolean indicating whether the patient currently has bradycardia."} ;; "the patient has clinically relevant bradycardia"
(declare-const patient_has_finding_of_bradycardia_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bradycardia is clinically relevant.","when_to_set_to_false":"Set to false if the patient's bradycardia is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the bradycardia is clinically relevant.","meaning":"Boolean indicating whether the patient's bradycardia is clinically relevant."} ;; "the patient has clinically relevant bradycardia"
(declare-const patient_has_finding_of_heart_failure_with_reduced_ejection_fraction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure with reduced left ventricular ejection fraction.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure with reduced left ventricular ejection fraction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure with reduced left ventricular ejection fraction.","meaning":"Boolean indicating whether the patient currently has heart failure with reduced left ventricular ejection fraction."} ;; "the patient has clinically relevant heart failure with reduced left ventricular ejection fraction"
(declare-const patient_has_finding_of_heart_failure_with_reduced_ejection_fraction_now@@clinically_relevant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's heart failure with reduced left ventricular ejection fraction is clinically relevant.","when_to_set_to_false":"Set to false if the patient's heart failure with reduced left ventricular ejection fraction is not clinically relevant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the heart failure is clinically relevant.","meaning":"Boolean indicating whether the patient's heart failure with reduced left ventricular ejection fraction is clinically relevant."} ;; "the patient has clinically relevant heart failure with reduced left ventricular ejection fraction"
(declare-const patient_has_history_of_symptomatic_arrhythmia Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a previous history of symptomatic arrhythmia.","when_to_set_to_false":"Set to false if the patient does not have a previous history of symptomatic arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a previous history of symptomatic arrhythmia.","meaning":"Boolean indicating whether the patient has a previous history of symptomatic arrhythmia."} ;; "the patient has previous history of symptomatic arrhythmia"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known
      patient_has_diagnosis_of_congenital_long_qt_syndrome_now)
   :named REQ3_AUXILIARY0)) ;; "the patient has known congenital QT prolongation"

(assert
(! (=> patient_has_diagnosis_of_acquired_long_qt_syndrome_now@@documented
      patient_has_diagnosis_of_acquired_long_qt_syndrome_now)
   :named REQ3_AUXILIARY1)) ;; "the patient has documented acquired QT prolongation"

(assert
(! (=> patient_has_finding_of_hypokalemia_now@@uncorrected
      patient_has_finding_of_hypokalemia_now)
   :named REQ3_AUXILIARY2)) ;; "the patient has uncorrected hypokalemia"

(assert
(! (=> patient_has_finding_of_bradycardia_now@@clinically_relevant
      patient_has_finding_of_bradycardia_now)
   :named REQ3_AUXILIARY3)) ;; "the patient has clinically relevant bradycardia"

(assert
(! (=> patient_has_finding_of_heart_failure_with_reduced_ejection_fraction_now@@clinically_relevant
      patient_has_finding_of_heart_failure_with_reduced_ejection_fraction_now)
   :named REQ3_AUXILIARY4)) ;; "the patient has clinically relevant heart failure with reduced left ventricular ejection fraction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_congenital_long_qt_syndrome_now@@known)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient has known congenital QT prolongation"

(assert
(! (not patient_has_diagnosis_of_acquired_long_qt_syndrome_now@@documented)
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has documented acquired QT prolongation"

(assert
(! (not patient_has_finding_of_hypokalemia_now@@uncorrected)
   :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient has uncorrected hypokalemia"

(assert
(! (not patient_has_finding_of_bradycardia_now@@clinically_relevant)
   :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has clinically relevant bradycardia"

(assert
(! (not patient_has_finding_of_heart_failure_with_reduced_ejection_fraction_now@@clinically_relevant)
   :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "the patient has clinically relevant heart failure with reduced left ventricular ejection fraction"

(assert
(! (not patient_has_history_of_symptomatic_arrhythmia)
   :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "the patient has previous history of symptomatic arrhythmia"

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_exposed_to_class_ia_antiarrhythmic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to class IA antiarrhythmic agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to class IA antiarrhythmic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to class IA antiarrhythmic agents.","meaning":"Boolean indicating whether the patient is currently exposed to class IA antiarrhythmic agents."} ;; "class IA antiarrhythmic drugs"
(declare-const patient_is_exposed_to_class_iii_antiarrhythmic_agent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to class III antiarrhythmic agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to class III antiarrhythmic agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to class III antiarrhythmic agents.","meaning":"Boolean indicating whether the patient is currently exposed to class III antiarrhythmic agents."} ;; "class III antiarrhythmic drugs"
(declare-const patient_is_exposed_to_neuroleptic_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to neuroleptic drugs.","when_to_set_to_false":"Set to false if the patient is currently not exposed to neuroleptic drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to neuroleptic drugs.","meaning":"Boolean indicating whether the patient is currently exposed to neuroleptic drugs."} ;; "neuroleptic drugs"
(declare-const patient_is_exposed_to_tricyclic_antidepressant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to tricyclic antidepressant agents.","when_to_set_to_false":"Set to false if the patient is currently not exposed to tricyclic antidepressant agents.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to tricyclic antidepressant agents.","meaning":"Boolean indicating whether the patient is currently exposed to tricyclic antidepressant agents."} ;; "tricyclic antidepressive agent drugs"
(declare-const patient_is_exposed_to_antimicrobial_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antimicrobial drugs.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antimicrobial drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antimicrobial drugs.","meaning":"Boolean indicating whether the patient is currently exposed to antimicrobial drugs."} ;; "certain antimicrobial drugs"
(declare-const patient_is_exposed_to_antihistaminic_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antihistaminic drugs.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antihistaminic drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antihistaminic drugs.","meaning":"Boolean indicating whether the patient is currently exposed to antihistaminic drugs."} ;; "certain antihistaminic drugs"
(declare-const patient_is_exposed_to_other_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to other drugs reported to increase the QT interval.","when_to_set_to_false":"Set to false if the patient is currently not exposed to other drugs reported to increase the QT interval.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to other drugs reported to increase the QT interval.","meaning":"Boolean indicating whether the patient is currently exposed to other drugs reported to increase the QT interval."} ;; "other drugs reported to increase the QT interval"

;; Specific drug examples (non-exhaustive) for class IA antiarrhythmic drugs
(declare-const patient_is_exposed_to_quinidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to quinidine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to quinidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to quinidine.","meaning":"Boolean indicating whether the patient is currently exposed to quinidine."} ;; "quinidine"
(declare-const patient_is_exposed_to_hydroquinidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to hydroquinidine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to hydroquinidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to hydroquinidine.","meaning":"Boolean indicating whether the patient is currently exposed to hydroquinidine."} ;; "hydroquinidine"
(declare-const patient_is_exposed_to_disopyramide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to disopyramide.","when_to_set_to_false":"Set to false if the patient is currently not exposed to disopyramide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to disopyramide.","meaning":"Boolean indicating whether the patient is currently exposed to disopyramide."} ;; "disopyramide"

;; Specific drug examples (non-exhaustive) for class III antiarrhythmic drugs
(declare-const patient_is_exposed_to_amiodarone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to amiodarone.","when_to_set_to_false":"Set to false if the patient is currently not exposed to amiodarone.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to amiodarone.","meaning":"Boolean indicating whether the patient is currently exposed to amiodarone."} ;; "amiodarone"
(declare-const patient_is_exposed_to_sotalol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sotalol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sotalol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sotalol.","meaning":"Boolean indicating whether the patient is currently exposed to sotalol."} ;; "sotalol"
(declare-const patient_is_exposed_to_dofetilide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to dofetilide.","when_to_set_to_false":"Set to false if the patient is currently not exposed to dofetilide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to dofetilide.","meaning":"Boolean indicating whether the patient is currently exposed to dofetilide."} ;; "dofetilide"
(declare-const patient_is_exposed_to_ibutilide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to ibutilide.","when_to_set_to_false":"Set to false if the patient is currently not exposed to ibutilide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to ibutilide.","meaning":"Boolean indicating whether the patient is currently exposed to ibutilide."} ;; "ibutilide"

;; Specific drug examples (non-exhaustive) for neuroleptic drugs
(declare-const patient_is_exposed_to_phenothiazine_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to phenothiazine drugs.","when_to_set_to_false":"Set to false if the patient is currently not exposed to phenothiazine drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to phenothiazine drugs.","meaning":"Boolean indicating whether the patient is currently exposed to phenothiazine drugs."} ;; "phenothiazine drugs"
(declare-const patient_is_exposed_to_pimozide_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to pimozide.","when_to_set_to_false":"Set to false if the patient is currently not exposed to pimozide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to pimozide.","meaning":"Boolean indicating whether the patient is currently exposed to pimozide."} ;; "pimozide"
(declare-const patient_is_exposed_to_sertindole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sertindole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sertindole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sertindole.","meaning":"Boolean indicating whether the patient is currently exposed to sertindole."} ;; "sertindole"
(declare-const patient_is_exposed_to_haloperidol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to haloperidol.","when_to_set_to_false":"Set to false if the patient is currently not exposed to haloperidol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to haloperidol.","meaning":"Boolean indicating whether the patient is currently exposed to haloperidol."} ;; "haloperidol"
(declare-const patient_is_exposed_to_sultopride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sultopride.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sultopride.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sultopride.","meaning":"Boolean indicating whether the patient is currently exposed to sultopride."} ;; "sultopride"

;; Specific drug examples (non-exhaustive) for antimicrobial drugs
(declare-const patient_is_exposed_to_sparfloxacin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to sparfloxacin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to sparfloxacin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to sparfloxacin.","meaning":"Boolean indicating whether the patient is currently exposed to sparfloxacin."} ;; "sparfloxacin"
(declare-const patient_is_exposed_to_intravenous_erythromycin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to intravenous erythromycin.","when_to_set_to_false":"Set to false if the patient is currently not exposed to intravenous erythromycin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to intravenous erythromycin.","meaning":"Boolean indicating whether the patient is currently exposed to intravenous erythromycin."} ;; "intravenous erythromycin"
(declare-const patient_is_exposed_to_pentamidine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to pentamidine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to pentamidine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to pentamidine.","meaning":"Boolean indicating whether the patient is currently exposed to pentamidine."} ;; "pentamidine"
(declare-const patient_is_exposed_to_antimalarial_drug_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to antimalarial drugs.","when_to_set_to_false":"Set to false if the patient is currently not exposed to antimalarial drugs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to antimalarial drugs.","meaning":"Boolean indicating whether the patient is currently exposed to antimalarial drugs."} ;; "antimalarial drugs"
(declare-const patient_is_exposed_to_halofantrine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to halofantrine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to halofantrine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to halofantrine.","meaning":"Boolean indicating whether the patient is currently exposed to halofantrine."} ;; "halofantrine"

;; Specific drug examples (non-exhaustive) for antihistaminic drugs
(declare-const patient_is_exposed_to_terfenadine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to terfenadine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to terfenadine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to terfenadine.","meaning":"Boolean indicating whether the patient is currently exposed to terfenadine."} ;; "terfenadine"
(declare-const patient_is_exposed_to_astemizole_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to astemizole.","when_to_set_to_false":"Set to false if the patient is currently not exposed to astemizole.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to astemizole.","meaning":"Boolean indicating whether the patient is currently exposed to astemizole."} ;; "astemizole"
(declare-const patient_is_exposed_to_mizolastine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to mizolastine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to mizolastine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to mizolastine.","meaning":"Boolean indicating whether the patient is currently exposed to mizolastine."} ;; "mizolastine"

;; Specific drug examples (non-exhaustive) for other drugs
(declare-const patient_is_exposed_to_cisapride_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to cisapride.","when_to_set_to_false":"Set to false if the patient is currently not exposed to cisapride.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to cisapride.","meaning":"Boolean indicating whether the patient is currently exposed to cisapride."} ;; "cisapride"
(declare-const patient_is_exposed_to_intravenous_vincamine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to intravenous vincamine.","when_to_set_to_false":"Set to false if the patient is currently not exposed to intravenous vincamine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to intravenous vincamine.","meaning":"Boolean indicating whether the patient is currently exposed to intravenous vincamine."} ;; "intravenous vincamine"
(declare-const patient_is_exposed_to_bepridil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to bepridil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to bepridil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to bepridil.","meaning":"Boolean indicating whether the patient is currently exposed to bepridil."} ;; "bepridil"
(declare-const patient_is_exposed_to_diphemanil_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to diphemanil.","when_to_set_to_false":"Set to false if the patient is currently not exposed to diphemanil.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to diphemanil.","meaning":"Boolean indicating whether the patient is currently exposed to diphemanil."} ;; "diphemanil"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples for class IA antiarrhythmic drugs
(assert
(! (=> (or patient_is_exposed_to_quinidine_now
           patient_is_exposed_to_hydroquinidine_now
           patient_is_exposed_to_disopyramide_now)
    patient_is_exposed_to_class_ia_antiarrhythmic_agent_now)
:named REQ4_AUXILIARY0)) ;; "class IA antiarrhythmic drugs with non-exhaustive examples (quinidine, hydroquinidine, disopyramide)"

;; Non-exhaustive examples for class III antiarrhythmic drugs
(assert
(! (=> (or patient_is_exposed_to_amiodarone_now
           patient_is_exposed_to_sotalol_now
           patient_is_exposed_to_dofetilide_now
           patient_is_exposed_to_ibutilide_now)
    patient_is_exposed_to_class_iii_antiarrhythmic_agent_now)
:named REQ4_AUXILIARY1)) ;; "class III antiarrhythmic drugs with non-exhaustive examples (amiodarone, sotalol, dofetilide, ibutilide)"

;; Non-exhaustive examples for neuroleptic drugs
(assert
(! (=> (or patient_is_exposed_to_phenothiazine_drug_now
           patient_is_exposed_to_pimozide_now
           patient_is_exposed_to_sertindole_now
           patient_is_exposed_to_haloperidol_now
           patient_is_exposed_to_sultopride_now)
    patient_is_exposed_to_neuroleptic_drug_now)
:named REQ4_AUXILIARY2)) ;; "neuroleptic drugs with non-exhaustive examples (phenothiazine drugs, pimozide, sertindole, haloperidol, sultopride)"

;; Non-exhaustive examples for antimicrobial drugs
(assert
(! (=> (or patient_is_exposed_to_sparfloxacin_now
           patient_is_exposed_to_intravenous_erythromycin_now
           patient_is_exposed_to_pentamidine_now
           patient_is_exposed_to_antimalarial_drug_now)
    patient_is_exposed_to_antimicrobial_drug_now)
:named REQ4_AUXILIARY3)) ;; "certain antimicrobial drugs with non-exhaustive examples (sparfloxacin, intravenous erythromycin, pentamidine, antimalarial drugs)"

;; Non-exhaustive examples for antimalarial drugs
(assert
(! (=> patient_is_exposed_to_halofantrine_now
    patient_is_exposed_to_antimalarial_drug_now)
:named REQ4_AUXILIARY4)) ;; "antimalarial drugs with non-exhaustive examples (halofantrine)"

;; Non-exhaustive examples for antihistaminic drugs
(assert
(! (=> (or patient_is_exposed_to_terfenadine_now
           patient_is_exposed_to_astemizole_now
           patient_is_exposed_to_mizolastine_now)
    patient_is_exposed_to_antihistaminic_drug_now)
:named REQ4_AUXILIARY5)) ;; "certain antihistaminic drugs with non-exhaustive examples (terfenadine, astemizole, mizolastine)"

;; Non-exhaustive examples for other drugs
(assert
(! (=> (or patient_is_exposed_to_cisapride_now
           patient_is_exposed_to_intravenous_vincamine_now
           patient_is_exposed_to_bepridil_now
           patient_is_exposed_to_diphemanil_now)
    patient_is_exposed_to_other_drug_now)
:named REQ4_AUXILIARY6)) ;; "other drugs with non-exhaustive examples (cisapride, intravenous vincamine, bepridil, diphemanil)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (or patient_is_exposed_to_class_ia_antiarrhythmic_agent_now
            patient_is_exposed_to_class_iii_antiarrhythmic_agent_now
            patient_is_exposed_to_neuroleptic_drug_now
            patient_is_exposed_to_tricyclic_antidepressant_now
            patient_is_exposed_to_antimicrobial_drug_now
            patient_is_exposed_to_antihistaminic_drug_now
            patient_is_exposed_to_other_drug_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has concomitant use of at least one of the following drugs reported to increase the QT interval..."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_end_stage_liver_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of end stage liver disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of end stage liver disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has end stage liver disease.","meaning":"Boolean indicating whether the patient currently has end stage liver disease."} ;; "end stage liver disease"
(declare-const patient_has_finding_of_end_stage_liver_disease_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's end stage liver disease is known (diagnosed or documented).","when_to_set_to_false":"Set to false if the patient's end stage liver disease is not known (not diagnosed or not documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's end stage liver disease is known.","meaning":"Boolean indicating whether the patient's end stage liver disease is known."} ;; "known"
(declare-const patient_has_finding_of_end_stage_liver_disease_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's end stage liver disease is severe.","when_to_set_to_false":"Set to false if the patient's end stage liver disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's end stage liver disease is severe.","meaning":"Boolean indicating whether the patient's end stage liver disease is severe."} ;; "severe"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_end_stage_liver_disease_now@@known
       patient_has_finding_of_end_stage_liver_disease_now)
   :named REQ5_AUXILIARY0)) ;; "known severe end stage liver disease"

(assert
(! (=> patient_has_finding_of_end_stage_liver_disease_now@@severe
       patient_has_finding_of_end_stage_liver_disease_now)
   :named REQ5_AUXILIARY1)) ;; "known severe end stage liver disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_finding_of_end_stage_liver_disease_now@@known
             patient_has_finding_of_end_stage_liver_disease_now@@severe))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known severe end stage liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's creatinine clearance is recorded now in milliliters per minute per 1.73 square meters.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's creatinine clearance measured now, in milliliters per minute per 1.73 square meters."} ;; "creatinine clearance ≤ 30 milliliters per minute per 1.73 square meters"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (<= patient_creatinine_renal_clearance_value_recorded_now_withunit_milliliters_per_minute_per_1_73_square_meters 30))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has creatinine clearance ≤ 30 milliliters per minute per 1.73 square meters."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const duration_of_systemic_antibacterial_therapy_received_by_patient_within_7_days_prior_to_enrollment_in_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours of systemic antibacterial therapy received by the patient within the 7 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many hours of systemic antibacterial therapy the patient received within the 7 days prior to enrollment.","meaning":"Numeric value representing the total hours of systemic antibacterial therapy received by the patient within the 7 days prior to enrollment."} ;; "systemic antibacterial therapy for more than 24 hours within 7 days of enrollment"

(declare-const patient_has_undergone_antibiotic_therapy_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time within the 7 days prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not undergone antibiotic therapy within the 7 days prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy within the 7 days prior to enrollment.","meaning":"Boolean indicating whether the patient has undergone antibiotic therapy within the 7 days prior to enrollment."} ;; "antibacterial therapy within 7 days of enrollment"

(declare-const patient_has_undergone_antibiotic_therapy_inthepast7days@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the antibiotic therapy undergone by the patient within the past 7 days was systemic.","when_to_set_to_false":"Set to false if the antibiotic therapy was not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy was systemic.","meaning":"Boolean indicating whether the antibiotic therapy within the past 7 days was systemic."} ;; "systemic antibacterial therapy within 7 days of enrollment"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthepast7days@@systemic
      patient_has_undergone_antibiotic_therapy_inthepast7days)
:named REQ7_AUXILIARY0)) ;; "systemic antibacterial therapy within 7 days of enrollment"

;; If patient has undergone systemic antibacterial therapy, duration must be > 0
(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthepast7days@@systemic
      (> duration_of_systemic_antibacterial_therapy_received_by_patient_within_7_days_prior_to_enrollment_in_hours 0))
:named REQ7_AUXILIARY1)) ;; "has received systemic antibacterial therapy within 7 days of enrollment"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have received >24 hours of systemic antibacterial therapy within 7 days of enrollment
(assert
(! (not (> duration_of_systemic_antibacterial_therapy_received_by_patient_within_7_days_prior_to_enrollment_in_hours 24))
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic antibacterial therapy for more than 24 hours within 7 days of enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy."} ;; "antibacterial therapy"
(declare-const patient_is_undergoing_antibiotic_therapy_now@@systemic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy and the therapy is systemic.","when_to_set_to_false":"Set to false if the patient is currently undergoing antibiotic therapy and the therapy is not systemic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy is systemic.","meaning":"Boolean indicating whether the patient is currently undergoing systemic antibiotic therapy."} ;; "systemic antibacterial therapy"
(declare-const patient_is_undergoing_antibiotic_therapy_now@@with_antibacterial_agent_drugs_other_than_those_described_in_study_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy and the antibacterial agent drugs used are other than those described in the study protocol.","when_to_set_to_false":"Set to false if the patient is currently undergoing antibiotic therapy and the antibacterial agent drugs used are only those described in the study protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibacterial agent drugs used are other than those described in the study protocol.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy with antibacterial agent drugs other than those described in the study protocol."} ;; "antibacterial agent drugs other than those described in the study protocol"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_undergoing_antibiotic_therapy_now@@systemic
      patient_is_undergoing_antibiotic_therapy_now)
:named REQ8_AUXILIARY0)) ;; "systemic antibacterial therapy"

(assert
(! (=> patient_is_undergoing_antibiotic_therapy_now@@with_antibacterial_agent_drugs_other_than_those_described_in_study_protocol
      patient_is_undergoing_antibiotic_therapy_now)
:named REQ8_AUXILIARY1)) ;; "antibacterial agent drugs other than those described in the study protocol"

;; Systemic therapy AND use of non-protocol drugs implies the exclusion scenario
(assert
(! (=> (and patient_is_undergoing_antibiotic_therapy_now@@systemic
            patient_is_undergoing_antibiotic_therapy_now@@with_antibacterial_agent_drugs_other_than_those_described_in_study_protocol)
      patient_is_undergoing_antibiotic_therapy_now)
:named REQ8_AUXILIARY2)) ;; "needs systemic antibacterial therapy with antibacterial agent drugs other than those described in the study protocol"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (and patient_is_undergoing_antibiotic_therapy_now@@systemic
             patient_is_undergoing_antibiotic_therapy_now@@with_antibacterial_agent_drugs_other_than_those_described_in_study_protocol))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs systemic antibacterial therapy with antibacterial agent drugs other than those described in the study protocol."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_indwelling_peritoneal_catheter_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an indwelling peritoneal catheter.","when_to_set_to_false":"Set to false if the patient currently does not have an indwelling peritoneal catheter.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an indwelling peritoneal catheter.","meaning":"Boolean indicating whether the patient currently has an indwelling peritoneal catheter."} ;; "The patient is excluded if the patient has an indwelling peritoneal catheter."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_indwelling_peritoneal_catheter_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an indwelling peritoneal catheter."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_ascites_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has ascites.","when_to_set_to_false":"Set to false if the patient currently does not have ascites.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has ascites.","meaning":"Boolean indicating whether the patient currently has ascites."} ;; "the patient has pre-existing ascites"
(declare-const patient_has_finding_of_ascites_now@@pre_existing Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current ascites is pre-existing (present prior to the current evaluation or event).","when_to_set_to_false":"Set to false if the patient's current ascites is not pre-existing (i.e., newly developed or not present prior to the current evaluation or event).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current ascites is pre-existing.","meaning":"Boolean indicating whether the patient's current ascites is pre-existing (present prior to the current evaluation or event)."} ;; "the patient has pre-existing ascites"
(declare-const patient_has_finding_of_primary_bacterial_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of primary (spontaneous) bacterial peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of primary (spontaneous) bacterial peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has primary (spontaneous) bacterial peritonitis.","meaning":"Boolean indicating whether the patient currently has primary (spontaneous) bacterial peritonitis."} ;; "the patient has presumed spontaneous bacterial peritonitis"
(declare-const patient_has_finding_of_primary_bacterial_peritonitis_now@@presumed Bool) ;; {"when_to_set_to_true":"Set to true if the diagnosis of primary (spontaneous) bacterial peritonitis is presumed (not confirmed).","when_to_set_to_false":"Set to false if the diagnosis of primary (spontaneous) bacterial peritonitis is not presumed (i.e., confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is presumed.","meaning":"Boolean indicating whether the diagnosis of primary (spontaneous) bacterial peritonitis is presumed (not confirmed)."} ;; "the patient has presumed spontaneous bacterial peritonitis"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable for ascites implies stem variable
(assert
(! (=> patient_has_finding_of_ascites_now@@pre_existing
      patient_has_finding_of_ascites_now)
:named REQ10_AUXILIARY0)) ;; "the patient has pre-existing ascites"

;; Qualifier variable for presumed spontaneous bacterial peritonitis implies stem variable
(assert
(! (=> patient_has_finding_of_primary_bacterial_peritonitis_now@@presumed
      patient_has_finding_of_primary_bacterial_peritonitis_now)
:named REQ10_AUXILIARY1)) ;; "the patient has presumed spontaneous bacterial peritonitis"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not (and patient_has_finding_of_ascites_now@@pre_existing
             patient_has_finding_of_primary_bacterial_peritonitis_now@@presumed))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has pre-existing ascites) AND (the patient has presumed spontaneous bacterial peritonitis)."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const duration_of_perforation_value_recorded_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the onset of perforation (stomach or duodenum) for the patient.","when_to_set_to_null":"Set to null if the duration since onset of perforation cannot be determined, is unknown, or not documented.","meaning":"Numeric value indicating the duration in hours since the onset of perforation (either of the stomach or duodenum) for the patient."} ;; "the duration of perforation is less than 24 hours"
(declare-const patient_has_finding_of_duodenal_perforation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of perforation of the duodenum.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of perforation of the duodenum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a perforation of the duodenum.","meaning":"Boolean indicating whether the patient currently has a perforation of the duodenum."} ;; "the patient has perforation of the duodenum"
(declare-const patient_has_finding_of_perforation_of_stomach_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of perforation of the stomach.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of perforation of the stomach.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a perforation of the stomach.","meaning":"Boolean indicating whether the patient currently has a perforation of the stomach."} ;; "the patient has perforation of the stomach"
(declare-const patient_has_undergone_operation_within_24_hours_of_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an operation within 24 hours of the onset of perforation (stomach or duodenum).","when_to_set_to_false":"Set to false if the patient has not undergone an operation within 24 hours of the onset of perforation (stomach or duodenum).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an operation within 24 hours of the onset of perforation (stomach or duodenum).","meaning":"Boolean indicating whether the patient has undergone an operation within 24 hours of the onset of perforation (either of the stomach or duodenum)."} ;; "the patient is operated on within 24 hours of perforation"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (and
         (or patient_has_finding_of_perforation_of_stomach_now
             patient_has_finding_of_duodenal_perforation_now)
         (or (< duration_of_perforation_value_recorded_in_hours 24)
             patient_has_undergone_operation_within_24_hours_of_perforation)))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has perforation of the stomach) OR (the patient has perforation of the duodenum)) AND ((the duration of perforation is less than 24 hours) OR (the patient is operated on within 24 hours of perforation))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_perforation_of_small_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a perforation of the small intestine, excluding the duodenum.","when_to_set_to_false":"Set to false if the patient currently does not have a perforation of the small intestine, excluding the duodenum.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a perforation of the small intestine, excluding the duodenum.","meaning":"Boolean indicating whether the patient currently has a perforation of the small intestine, excluding the duodenum."} ;; "the patient has perforation of the small bowel (excluding the duodenum)"
(declare-const patient_has_finding_of_perforation_of_large_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a perforation of the large intestine.","when_to_set_to_false":"Set to false if the patient currently does not have a perforation of the large intestine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a perforation of the large intestine.","meaning":"Boolean indicating whether the patient currently has a perforation of the large intestine."} ;; "the patient has perforation of the large bowel"
(declare-const duration_of_bowel_perforation_value_in_hours Real) ;; {"when_to_set_to_value":"Set to the number of hours since the onset of the patient's bowel perforation (either small bowel excluding the duodenum, or large bowel).","when_to_set_to_null":"Set to null if the duration since onset of bowel perforation is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours since the onset of the patient's bowel perforation (either small bowel excluding the duodenum, or large bowel)."} ;; "the duration of perforation is less than 12 hours"
(declare-const patient_has_undergone_operation_within_12_hours_of_bowel_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone an operation within 12 hours of the onset of bowel perforation (either small bowel excluding the duodenum, or large bowel).","when_to_set_to_false":"Set to false if the patient has not undergone an operation within 12 hours of the onset of bowel perforation (either small bowel excluding the duodenum, or large bowel).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone an operation within 12 hours of the onset of bowel perforation (either small bowel excluding the duodenum, or large bowel).","meaning":"Boolean indicating whether the patient has undergone an operation within 12 hours of the onset of bowel perforation (either small bowel excluding the duodenum, or large bowel)."} ;; "the patient is operated on within 12 hours of perforation"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (and
          (or patient_has_finding_of_perforation_of_small_intestine_now
              patient_has_finding_of_perforation_of_large_intestine_now)
          (or (< duration_of_bowel_perforation_value_in_hours 12)
              patient_has_undergone_operation_within_12_hours_of_bowel_perforation)))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has perforation of the small bowel (excluding the duodenum)) OR (the patient has perforation of the large bowel)) AND ((the duration of perforation is less than 12 hours) OR (the patient is operated on within 12 hours of perforation))."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_finding_of_pancreatic_process_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any pancreatic process (any clinical finding or diagnosis involving the pancreas, including but not limited to sepsis or infection).","when_to_set_to_false":"Set to false if the patient currently does not have any pancreatic process.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any pancreatic process.","meaning":"Boolean indicating whether the patient currently has any pancreatic process."} ;; "the patient has any pancreatic process"

(declare-const patient_has_finding_of_pancreatic_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has pancreatic sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have pancreatic sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has pancreatic sepsis.","meaning":"Boolean indicating whether the patient currently has pancreatic sepsis."} ;; "pancreatic sepsis"

(declare-const patient_has_finding_of_peri_pancreatic_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peri-pancreatic sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have peri-pancreatic sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peri-pancreatic sepsis.","meaning":"Boolean indicating whether the patient currently has peri-pancreatic sepsis."} ;; "peri-pancreatic sepsis"

(declare-const patient_has_finding_of_intra_abdominal_infection_secondary_to_pancreatitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intra-abdominal infection that is secondary to pancreatitis.","when_to_set_to_false":"Set to false if the patient currently does not have intra-abdominal infection that is secondary to pancreatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intra-abdominal infection that is secondary to pancreatitis.","meaning":"Boolean indicating whether the patient currently has intra-abdominal infection that is secondary to pancreatitis."} ;; "intra-abdominal infection secondary to pancreatitis"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pancreatic_sepsis_now
           patient_has_finding_of_peri_pancreatic_sepsis_now
           patient_has_finding_of_intra_abdominal_infection_secondary_to_pancreatitis_now)
       patient_has_finding_of_pancreatic_process_now)
:named REQ13_AUXILIARY0)) ;; "with non-exhaustive examples (pancreatic sepsis, peri-pancreatic sepsis, intra-abdominal infection secondary to pancreatitis)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_pancreatic_sepsis_now
       patient_has_finding_of_pancreatic_process_now)
:named REQ13_AUXILIARY1)) ;; "pancreatic sepsis is a pancreatic process"

(assert
(! (=> patient_has_finding_of_peri_pancreatic_sepsis_now
       patient_has_finding_of_pancreatic_process_now)
:named REQ13_AUXILIARY2)) ;; "peri-pancreatic sepsis is a pancreatic process"

(assert
(! (=> patient_has_finding_of_intra_abdominal_infection_secondary_to_pancreatitis_now
       patient_has_finding_of_pancreatic_process_now)
:named REQ13_AUXILIARY3)) ;; "intra-abdominal infection secondary to pancreatitis is a pancreatic process"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_finding_of_pancreatic_process_now)
:named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any pancreatic process with non-exhaustive examples (pancreatic sepsis, peri-pancreatic sepsis, intra-abdominal infection secondary to pancreatitis)."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_finding_of_abscess_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of abscess of the liver.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of abscess of the liver.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of abscess of the liver.","meaning":"Boolean indicating whether the patient currently has an abscess of the liver."} ;; "liver abscess"
(declare-const patient_has_finding_of_splenic_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of splenic abscess.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of splenic abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of splenic abscess.","meaning":"Boolean indicating whether the patient currently has a splenic abscess."} ;; "splenic abscess"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_finding_of_abscess_of_liver_now)
:named REQ14_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has liver abscess."

(assert
(! (not patient_has_finding_of_splenic_abscess_now)
:named REQ14_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has splenic abscess."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_has_finding_of_transmural_bowel_ischemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has transmural bowel ischemia.","when_to_set_to_false":"Set to false if the patient currently does not have transmural bowel ischemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has transmural bowel ischemia.","meaning":"Boolean indicating whether the patient currently has transmural bowel ischemia."} ;; "the patient has transmural bowel ischemia"
(declare-const patient_has_finding_of_transmural_bowel_ischemia_now@@without_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current transmural bowel ischemia occurs without perforation.","when_to_set_to_false":"Set to false if the patient's current transmural bowel ischemia occurs with perforation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether perforation is present with the patient's current transmural bowel ischemia.","meaning":"Boolean indicating whether the patient's transmural bowel ischemia occurs without perforation."} ;; "the patient has transmural bowel ischemia without perforation"
(declare-const patient_has_finding_of_massive_necrosis_of_intestine_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of massive necrosis of intestine (transmural bowel necrosis).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of massive necrosis of intestine (transmural bowel necrosis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has massive necrosis of intestine (transmural bowel necrosis).","meaning":"Boolean indicating whether the patient currently has massive necrosis of intestine (transmural bowel necrosis)."} ;; "the patient has transmural bowel necrosis"
(declare-const patient_has_finding_of_massive_necrosis_of_intestine_now@@without_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has massive necrosis of intestine (transmural bowel necrosis) and this finding occurs without perforation.","when_to_set_to_false":"Set to false if the patient currently has massive necrosis of intestine (transmural bowel necrosis) and this finding occurs with perforation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether perforation is present with massive necrosis of intestine (transmural bowel necrosis).","meaning":"Boolean indicating whether the patient's massive necrosis of intestine (transmural bowel necrosis) occurs without perforation."} ;; "the patient has transmural bowel necrosis without perforation"
(declare-const patient_has_finding_of_peritonitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peritonitis.","when_to_set_to_false":"Set to false if the patient currently does not have peritonitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peritonitis.","meaning":"Boolean indicating whether the patient currently has peritonitis."} ;; "the patient has peritonitis"
(declare-const patient_has_finding_of_peritonitis_now@@established Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current peritonitis is established.","when_to_set_to_false":"Set to false if the patient's current peritonitis is not established.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current peritonitis is established.","meaning":"Boolean indicating whether the patient's peritonitis is established."} ;; "the patient has established peritonitis"
(declare-const patient_has_finding_of_abscess_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abscess.","when_to_set_to_false":"Set to false if the patient currently does not have an abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abscess.","meaning":"Boolean indicating whether the patient currently has an abscess."} ;; "the patient has abscess"
(declare-const patient_has_finding_of_abscess_now@@established Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current abscess is established.","when_to_set_to_false":"Set to false if the patient's current abscess is not established.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current abscess is established.","meaning":"Boolean indicating whether the patient's abscess is established."} ;; "the patient has established abscess"

;; ===================== Auxiliary Assertions (REQ 15) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_transmural_bowel_ischemia_now@@without_perforation
      patient_has_finding_of_transmural_bowel_ischemia_now)
    :named REQ15_AUXILIARY0)) ;; "the patient has transmural bowel ischemia without perforation"

(assert
(! (=> patient_has_finding_of_massive_necrosis_of_intestine_now@@without_perforation
      patient_has_finding_of_massive_necrosis_of_intestine_now)
    :named REQ15_AUXILIARY1)) ;; "the patient has transmural bowel necrosis without perforation"

(assert
(! (=> patient_has_finding_of_peritonitis_now@@established
      patient_has_finding_of_peritonitis_now)
    :named REQ15_AUXILIARY2)) ;; "the patient has established peritonitis"

(assert
(! (=> patient_has_finding_of_abscess_now@@established
      patient_has_finding_of_abscess_now)
    :named REQ15_AUXILIARY3)) ;; "the patient has established abscess"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_has_finding_of_transmural_bowel_ischemia_now@@without_perforation)
    :named REQ15_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has transmural bowel ischemia without perforation."

(assert
(! (not patient_has_finding_of_massive_necrosis_of_intestine_now@@without_perforation)
    :named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has transmural bowel necrosis without perforation."

(assert
(! (not patient_has_finding_of_peritonitis_now@@established)
    :named REQ15_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has established peritonitis."

(assert
(! (not patient_has_finding_of_abscess_now@@established)
    :named REQ15_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has established abscess."

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_finding_of_acute_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of acute cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of acute cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of acute cholecystitis.","meaning":"Boolean indicating whether the patient currently has acute cholecystitis."} ;; "acute cholecystitis"
(declare-const patient_has_finding_of_acute_cholecystitis_now@@without_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current episode of acute cholecystitis is not associated with perforation.","when_to_set_to_false":"Set to false if the patient's current episode of acute cholecystitis is associated with perforation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current episode of acute cholecystitis is associated with perforation.","meaning":"Boolean indicating whether the patient's current acute cholecystitis is without perforation."} ;; "acute cholecystitis without perforation"
(declare-const patient_has_finding_of_acute_gangrenous_cholecystitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gangrenous cholecystitis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gangrenous cholecystitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of gangrenous cholecystitis.","meaning":"Boolean indicating whether the patient currently has gangrenous cholecystitis."} ;; "gangrenous cholecystitis"
(declare-const patient_has_finding_of_acute_gangrenous_cholecystitis_now@@without_perforation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current episode of gangrenous cholecystitis is not associated with perforation.","when_to_set_to_false":"Set to false if the patient's current episode of gangrenous cholecystitis is associated with perforation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current episode of gangrenous cholecystitis is associated with perforation.","meaning":"Boolean indicating whether the patient's current gangrenous cholecystitis is without perforation."} ;; "gangrenous cholecystitis without perforation"

;; ===================== Auxiliary Assertions (REQ 16) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_cholecystitis_now@@without_perforation
      patient_has_finding_of_acute_cholecystitis_now)
    :named REQ16_AUXILIARY0)) ;; "acute cholecystitis without perforation"

(assert
(! (=> patient_has_finding_of_acute_gangrenous_cholecystitis_now@@without_perforation
      patient_has_finding_of_acute_gangrenous_cholecystitis_now)
    :named REQ16_AUXILIARY1)) ;; "gangrenous cholecystitis without perforation"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not patient_has_finding_of_acute_cholecystitis_now@@without_perforation)
    :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute cholecystitis without perforation."

(assert
(! (not patient_has_finding_of_acute_gangrenous_cholecystitis_now@@without_perforation)
    :named REQ16_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gangrenous cholecystitis without perforation."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_has_diagnosis_of_acute_cholangitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute cholangitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute cholangitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute cholangitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute cholangitis."} ;; "acute cholangitis"

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
  (! (not patient_has_diagnosis_of_acute_cholangitis_now)
     :named REQ17_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has acute cholangitis."

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const patient_has_finding_of_early_acute_non_perforated_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has early acute non-perforated appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have early acute non-perforated appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has early acute non-perforated appendicitis.","meaning":"Boolean indicating whether the patient currently has early acute non-perforated appendicitis."} ;; "the patient has early acute non-perforated appendicitis"
(declare-const patient_has_finding_of_early_suppurative_non_perforated_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has early suppurative non-perforated appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have early suppurative non-perforated appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has early suppurative non-perforated appendicitis.","meaning":"Boolean indicating whether the patient currently has early suppurative non-perforated appendicitis."} ;; "the patient has early suppurative non-perforated appendicitis"
(declare-const patient_has_finding_of_early_gangrenous_non_perforated_appendicitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has early gangrenous non-perforated appendicitis.","when_to_set_to_false":"Set to false if the patient currently does not have early gangrenous non-perforated appendicitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has early gangrenous non-perforated appendicitis.","meaning":"Boolean indicating whether the patient currently has early gangrenous non-perforated appendicitis."} ;; "the patient has early gangrenous non-perforated appendicitis"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not patient_has_finding_of_early_acute_non_perforated_appendicitis_now)
:named REQ18_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has early acute non-perforated appendicitis."

(assert
(! (not patient_has_finding_of_early_suppurative_non_perforated_appendicitis_now)
:named REQ18_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has early suppurative non-perforated appendicitis."

(assert
(! (not patient_has_finding_of_early_gangrenous_non_perforated_appendicitis_now)
:named REQ18_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has early gangrenous non-perforated appendicitis."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_undergoing_introduction_of_antibiotic_into_peritoneal_cavity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing introduction of antibiotic into the peritoneal cavity (antibiotic irrigation of the abdominal cavity).","when_to_set_to_false":"Set to false if the patient is currently not undergoing introduction of antibiotic into the peritoneal cavity (antibiotic irrigation of the abdominal cavity).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing introduction of antibiotic into the peritoneal cavity.","meaning":"Boolean indicating whether the patient is currently undergoing introduction of antibiotic into the peritoneal cavity."} ;; "the patient requires antibiotic irrigation of the abdominal cavity"
(declare-const patient_is_undergoing_antibiotic_irrigation_of_surgical_wound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic irrigation of the surgical wound.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antibiotic irrigation of the surgical wound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antibiotic irrigation of the surgical wound.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic irrigation of the surgical wound."} ;; "the patient requires antibiotic irrigation of the surgical wound"

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_is_undergoing_introduction_of_antibiotic_into_peritoneal_cavity_now)
    :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires antibiotic irrigation of the abdominal cavity."

(assert
(! (not patient_is_undergoing_antibiotic_irrigation_of_surgical_wound_now)
    :named REQ19_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires antibiotic irrigation of the surgical wound."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_is_undergoing_open_abdomen_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently being treated with open abdomen.","when_to_set_to_false":"Set to false if the patient is not currently being treated with open abdomen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently being treated with open abdomen.","meaning":"Boolean indicating whether the patient is currently being treated with open abdomen."} ;; "the patient is treated with open abdomen"
(declare-const patient_is_undergoing_marsupialization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing marsupialization treatment.","when_to_set_to_false":"Set to false if the patient is not currently undergoing marsupialization treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing marsupialization treatment.","meaning":"Boolean indicating whether the patient is currently undergoing marsupialization."} ;; "the patient is treated with marsupialization"
(declare-const patient_reopening_of_laparotomy_site_value_recorded_now_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of planned re-laparotomy procedures if this count is available for the patient now.","when_to_set_to_null":"Set to null if the number of planned re-laparotomy procedures is unknown, not documented, or cannot be determined for the patient now.","meaning":"Numeric count of planned re-laparotomy procedures for the patient at present."} ;; "number of planned re-laparotomies ≥ 2"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not patient_is_undergoing_open_abdomen_treatment_now)
:named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is treated with open abdomen."

(assert
(! (not patient_is_undergoing_marsupialization_now)
:named REQ20_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is treated with marsupialization."

(assert
(! (not (>= patient_reopening_of_laparotomy_site_value_recorded_now_withunit_count 2))
:named REQ20_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has multiple planned re-laparotomies (number of planned re-laparotomies ≥ 2)."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_has_finding_of_female_genital_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of infection originating from the female genital tract.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of infection originating from the female genital tract.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of infection originating from the female genital tract.","meaning":"Boolean indicating whether the patient currently has a female genital tract infection."} ;; "infection originating from the female genital tract"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not patient_has_finding_of_female_genital_tract_infection_now)
:named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infection originating from the female genital tract."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection (including peri-nephric infection).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_peri_nephric_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has peri-nephric infection.","when_to_set_to_false":"Set to false if the patient currently does not have peri-nephric infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has peri-nephric infection.","meaning":"Boolean indicating whether the patient currently has peri-nephric infection."} ;; "peri-nephric infection"

;; ===================== Auxiliary Assertions (REQ 22) =====================
;; Peri-nephric infection is a type of disorder due to infection
(assert
(! (=> patient_has_finding_of_peri_nephric_infection_now
      patient_has_finding_of_disorder_due_to_infection_now)
    :named REQ22_AUXILIARY0)) ;; "The patient is excluded if the patient has peri-nephric infection."

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not patient_has_finding_of_peri_nephric_infection_now)
    :named REQ22_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peri-nephric infection."

;; ===================== Declarations for the exclusion criterion (REQ 23) =====================
(declare-const patient_has_finding_of_septic_shock_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of septic shock (sepsis with shock).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of septic shock (sepsis with shock).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has septic shock (sepsis with shock).","meaning":"Boolean indicating whether the patient currently has septic shock (sepsis with shock)."} ;; "sepsis with shock"
(declare-const vasopressor_drug_administration_duration_consecutive_hours Real) ;; {"when_to_set_to_value":"Set to the total number of consecutive hours that vasopressor drugs have been administered to the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many consecutive hours vasopressor drugs have been administered to the patient.","meaning":"Numeric value representing the total consecutive hours of vasopressor drug administration for the patient."} ;; "duration of vasopressor drug administration > 4 hours, consecutive"

;; ===================== Constraint Assertions (REQ 23) =====================
(assert
(! (not (and patient_has_finding_of_septic_shock_now
             (> vasopressor_drug_administration_duration_consecutive_hours 4)))
   :named REQ23_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of sepsis with shock requiring administration of vasopressor drugs for more than four consecutive hours (duration of vasopressor drug administration > 4 hours, consecutive)."

;; ===================== Declarations for the exclusion criterion (REQ 24) =====================
(declare-const patient_expected_survival_time_value_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value (in months) of the patient's expected survival time as estimated based on the underlying disease.","when_to_set_to_null":"Set to null if the patient's expected survival time is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's expected survival time in months, as estimated based on the underlying disease."} ;; "expected survival time < 6 months"

(declare-const patient_has_diagnosis_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of any disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of any disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of any disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of any disease."} ;; "underlying disease"

(declare-const patient_has_diagnosis_of_disease_now@@rapidly_fatal Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disease and that disease is rapidly fatal.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a disease and that disease is not rapidly fatal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed disease is rapidly fatal.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disease that is rapidly fatal."} ;; "rapidly fatal underlying disease"

(declare-const patient_has_diagnosis_of_disease_now@@expected_survival_time_less_than_6_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of a disease and that disease has an expected survival time less than 6 months.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of a disease and that disease does not have an expected survival time less than 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosed disease has an expected survival time less than 6 months.","meaning":"Boolean indicating whether the patient currently has a diagnosis of a disease with expected survival time less than 6 months."} ;; "expected survival time < 6 months"

;; ===================== Auxiliary Assertions (REQ 24) =====================
;; Definition: expected survival time less than 6 months
(assert
(! (= patient_has_diagnosis_of_disease_now@@expected_survival_time_less_than_6_months
(and patient_has_diagnosis_of_disease_now
(< patient_expected_survival_time_value_in_months 6)))
:named REQ24_AUXILIARY0)) ;; "expected survival time < 6 months"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_disease_now@@rapidly_fatal
patient_has_diagnosis_of_disease_now)
:named REQ24_AUXILIARY1)) ;; "rapidly fatal underlying disease"

(assert
(! (=> patient_has_diagnosis_of_disease_now@@expected_survival_time_less_than_6_months
patient_has_diagnosis_of_disease_now)
:named REQ24_AUXILIARY2)) ;; "expected survival time < 6 months"

;; ===================== Constraint Assertions (REQ 24) =====================
(assert
(! (not (and patient_has_diagnosis_of_disease_now@@rapidly_fatal
             patient_has_diagnosis_of_disease_now@@expected_survival_time_less_than_6_months))
:named REQ24_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known rapidly fatal underlying disease (expected survival time < 6 months)."
