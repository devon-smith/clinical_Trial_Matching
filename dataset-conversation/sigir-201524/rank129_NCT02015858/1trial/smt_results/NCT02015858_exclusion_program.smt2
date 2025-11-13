;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently lactating as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not lactating as documented or reported.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is lactating"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
  (! (not patient_is_lactating_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is lactating."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of insulin-dependent diabetes mellitus (type 1 diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of insulin-dependent diabetes mellitus (type 1 diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has insulin-dependent diabetes mellitus (type 1 diabetes mellitus).","meaning":"Boolean indicating whether the patient currently has insulin-dependent diabetes mellitus (type 1 diabetes mellitus)."} ;; "insulin-dependent diabetes mellitus"
(declare-const patient_has_finding_of_type_1_diabetes_mellitus_now@@occurs_with_dysautonomia Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has insulin-dependent diabetes mellitus (type 1 diabetes mellitus) and this finding occurs together with dysautonomia.","when_to_set_to_false":"Set to false if the patient currently has insulin-dependent diabetes mellitus (type 1 diabetes mellitus) but it does not occur together with dysautonomia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether dysautonomia co-occurs with insulin-dependent diabetes mellitus (type 1 diabetes mellitus).","meaning":"Boolean indicating whether insulin-dependent diabetes mellitus (type 1 diabetes mellitus) occurs together with dysautonomia."} ;; "insulin-dependent diabetes mellitus with dysautonomia"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_type_1_diabetes_mellitus_now@@occurs_with_dysautonomia
      patient_has_finding_of_type_1_diabetes_mellitus_now)
:named REQ1_AUXILIARY0)) ;; "insulin-dependent diabetes mellitus with dysautonomia" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_type_1_diabetes_mellitus_now@@occurs_with_dysautonomia)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has insulin-dependent diabetes mellitus with dysautonomia."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_the_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the central nervous system (central neurological disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the central nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the central nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the central nervous system."} ;; "central neurological disease"
(declare-const patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the peripheral nervous system (peripheral neurological disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the peripheral nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the peripheral nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder of the peripheral nervous system."} ;; "peripheral neurological disease"
(declare-const patient_has_finding_of_feeling_agitated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has agitation (is feeling agitated).","when_to_set_to_false":"Set to false if the patient currently does not have agitation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has agitation.","meaning":"Boolean indicating whether the patient currently has agitation (is feeling agitated)."} ;; "agitation"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_of_the_central_nervous_system_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has central neurological disease."

(assert
(! (not patient_has_finding_of_disorder_of_the_peripheral_nervous_system_now)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peripheral neurological disease."

(assert
(! (not patient_has_finding_of_feeling_agitated_now)
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has agitation."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_inability_to_understand_protocol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to understand the protocol.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to understand the protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to understand the protocol.","meaning":"Boolean indicating whether the patient currently has an inability to understand the protocol."} ;; "has an inability to understand the protocol"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_inability_to_understand_protocol_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to understand the protocol."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_inability_to_use_pain_monitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to use the Pain Monitor device.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to use the Pain Monitor device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to use the Pain Monitor device.","meaning":"Boolean indicating whether the patient currently has an inability to use the Pain Monitor device."} ;; "inability to use the Pain Monitor"

(declare-const patient_has_finding_of_skin_appearance_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an abnormal skin appearance (skin abnormality).","when_to_set_to_false":"Set to false if the patient currently does not have an abnormal skin appearance (skin abnormality).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an abnormal skin appearance (skin abnormality).","meaning":"Boolean indicating whether the patient currently has an abnormal skin appearance (skin abnormality)."} ;; "skin abnormality"

(declare-const patient_has_finding_of_skin_appearance_abnormal_now@@located_at_site_of_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the patient's abnormal skin appearance (skin abnormality) is located at the site of measurement.","when_to_set_to_false":"Set to false if the patient's abnormal skin appearance (skin abnormality) is not located at the site of measurement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal skin appearance (skin abnormality) is located at the site of measurement.","meaning":"Boolean indicating whether the patient's abnormal skin appearance (skin abnormality) is located at the site of measurement."} ;; "skin abnormality at the site of measurement"

(declare-const patient_has_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a pacemaker implanted.","when_to_set_to_false":"Set to false if the patient currently does not have a pacemaker implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a pacemaker implanted.","meaning":"Boolean indicating whether the patient currently has a pacemaker implanted."} ;; "pacemaker"

(declare-const patient_has_implantable_defibrillator_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an implantable defibrillator.","when_to_set_to_false":"Set to false if the patient currently does not have an implantable defibrillator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an implantable defibrillator.","meaning":"Boolean indicating whether the patient currently has an implantable defibrillator."} ;; "implantable defibrillator"

(declare-const patient_has_finding_of_disorder_of_sympathetic_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder affecting the sympathetic nervous system.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder affecting the sympathetic nervous system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder affecting the sympathetic nervous system.","meaning":"Boolean indicating whether the patient currently has a disorder affecting the sympathetic nervous system."} ;; "condition affecting the sympathetic nervous system"

(declare-const patient_has_finding_of_tremor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tremor.","when_to_set_to_false":"Set to false if the patient currently does not have tremor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tremor.","meaning":"Boolean indicating whether the patient currently has tremor."} ;; "tremor"

(declare-const patient_has_finding_of_tremor_now@@present_in_extremities Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tremor is present in the extremities.","when_to_set_to_false":"Set to false if the patient's tremor is not present in the extremities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the tremor is present in the extremities.","meaning":"Boolean indicating whether the patient's tremor is present in the extremities."} ;; "tremor of the extremities"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable (skin abnormality at site of measurement)
(assert
(! (=> patient_has_finding_of_skin_appearance_abnormal_now@@located_at_site_of_measurement
     patient_has_finding_of_skin_appearance_abnormal_now)
:named REQ4_AUXILIARY0)) ;; "skin abnormality at the site of measurement"

;; Qualifier variable implies corresponding stem variable (tremor present in extremities)
(assert
(! (=> patient_has_finding_of_tremor_now@@present_in_extremities
     patient_has_finding_of_tremor_now)
:named REQ4_AUXILIARY1)) ;; "tremor of the extremities"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: inability to use Pain Monitor due to skin abnormality at site of measurement
(assert
(! (not (and patient_has_inability_to_use_pain_monitor_now
             patient_has_finding_of_skin_appearance_abnormal_now@@located_at_site_of_measurement))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "inability to use the Pain Monitor due to skin abnormality at the site of measurement"

;; Exclusion: inability to use Pain Monitor due to pacemaker
(assert
(! (not (and patient_has_inability_to_use_pain_monitor_now
             patient_has_pacemaker_now))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "inability to use the Pain Monitor due to pacemaker"

;; Exclusion: inability to use Pain Monitor due to implantable defibrillator
(assert
(! (not (and patient_has_inability_to_use_pain_monitor_now
             patient_has_implantable_defibrillator_now))
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "inability to use the Pain Monitor due to implantable defibrillator"

;; Exclusion: inability to use Pain Monitor due to condition affecting the sympathetic nervous system
(assert
(! (not (and patient_has_inability_to_use_pain_monitor_now
             patient_has_finding_of_disorder_of_sympathetic_nervous_system_now))
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "inability to use the Pain Monitor due to condition affecting the sympathetic nervous system"

;; Exclusion: inability to use Pain Monitor due to tremor of the extremities
(assert
(! (not (and patient_has_inability_to_use_pain_monitor_now
             patient_has_finding_of_tremor_now@@present_in_extremities))
:named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "inability to use the Pain Monitor due to tremor of the extremities"

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_contraindication_to_morphine_containing_product_in_oral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to morphine-containing products in oral dose form.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to morphine-containing products in oral dose form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to morphine-containing products in oral dose form.","meaning":"Boolean indicating whether the patient currently has a contraindication to morphine-containing products in oral dose form."} ;; "oral morphine"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_contraindication_to_morphine_containing_product_in_oral_dose_form_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a contraindication to oral morphine."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_respiratory_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has respiratory failure.","when_to_set_to_false":"Set to false if the patient currently does not have respiratory failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has respiratory failure.","meaning":"Boolean indicating whether the patient currently has respiratory failure."} ;; "the patient has respiratory failure"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure.","meaning":"Boolean indicating whether the patient currently has hepatic failure."} ;; "the patient has severe hepatic insufficiency"
(declare-const patient_has_finding_of_raised_intracranial_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has raised intracranial pressure.","when_to_set_to_false":"Set to false if the patient currently does not have raised intracranial pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has raised intracranial pressure.","meaning":"Boolean indicating whether the patient currently has raised intracranial pressure."} ;; "the patient has intracranial hypertension"
(declare-const patient_has_finding_of_epilepsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has epilepsy.","when_to_set_to_false":"Set to false if the patient currently does not have epilepsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has epilepsy.","meaning":"Boolean indicating whether the patient currently has epilepsy."} ;; "the patient has epilepsy association"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_respiratory_failure_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has respiratory failure."

(assert
(! (not patient_has_finding_of_hepatic_failure_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hepatic insufficiency."

(assert
(! (not patient_has_finding_of_raised_intracranial_pressure_now)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intracranial hypertension."

(assert
(! (not patient_has_finding_of_epilepsy_now)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has epilepsy association."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_had_recent_administration_of_neostigmine Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had recent administration of neostigmine.","when_to_set_to_false":"Set to false if the patient has not had recent administration of neostigmine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had recent administration of neostigmine.","meaning":"Boolean indicating whether the patient has had recent administration of neostigmine."} ;; "the patient has had recent administration of neostigmine"
(declare-const patient_has_had_recent_administration_of_atropine Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had recent administration of atropine.","when_to_set_to_false":"Set to false if the patient has not had recent administration of atropine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had recent administration of atropine.","meaning":"Boolean indicating whether the patient has had recent administration of atropine."} ;; "the patient has had recent administration of atropine"
(declare-const patient_has_taken_neostigmine_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken a neostigmine-containing product at any time in the history.","when_to_set_to_false":"Set to false if the patient has never taken a neostigmine-containing product at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken a neostigmine-containing product.","meaning":"Boolean indicating whether the patient has ever taken a neostigmine-containing product at any time in the history."} ;; "neostigmine"
(declare-const patient_has_taken_atropine_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken an atropine-containing product at any time in the history.","when_to_set_to_false":"Set to false if the patient has never taken an atropine-containing product at any time in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken an atropine-containing product.","meaning":"Boolean indicating whether the patient has ever taken an atropine-containing product at any time in the history."} ;; "atropine"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_had_recent_administration_of_neostigmine)
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had recent administration of neostigmine."

(assert
(! (not patient_has_had_recent_administration_of_atropine)
    :named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had recent administration of atropine."
