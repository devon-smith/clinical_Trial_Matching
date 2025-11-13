;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const partial_pressure_of_oxygen_in_arterial_blood_to_fraction_of_inspired_oxygen_ratio_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the numeric value of the ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen, as measured now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the ratio of partial pressure of oxygen in arterial blood to fraction of inspired oxygen, recorded now, unitless."} ;; "partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio < 120"

(declare-const patient_has_finding_of_hypoxia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypoxia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypoxia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypoxia.","meaning":"Boolean indicating whether the patient currently has hypoxia."} ;; "hypoxia"

(declare-const patient_has_finding_of_hypoxia_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypoxia and the hypoxia is severe.","when_to_set_to_false":"Set to false if the patient currently has hypoxia but it is not severe, or if the patient does not have hypoxia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypoxia is severe.","meaning":"Boolean indicating whether the patient's current hypoxia is severe."} ;; "severe hypoxia"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Definition: severe hypoxia = (hypoxia) AND (partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio < 120)
(assert
(! (= patient_has_finding_of_hypoxia_now@@severe
(and patient_has_finding_of_hypoxia_now
     (< partial_pressure_of_oxygen_in_arterial_blood_to_fraction_of_inspired_oxygen_ratio_value_recorded_now_withunit_none 120)))
:named REQ0_AUXILIARY0)) ;; "defined as (partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio < 120)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypoxia_now@@severe
       patient_has_finding_of_hypoxia_now)
:named REQ0_AUXILIARY1)) ;; "severe hypoxia implies hypoxia"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_hypoxia_now@@severe)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe hypoxia (defined as (partial pressure of oxygen in arterial blood to fraction of inspired oxygen ratio < 120))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_raised_intracranial_pressure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of increased intracranial pressure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of increased intracranial pressure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has increased intracranial pressure.","meaning":"Boolean indicating whether the patient currently has increased intracranial pressure."} ;; "increased intracranial pressure"
(declare-const patient_has_finding_of_raised_intracranial_pressure_now@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's increased intracranial pressure is documented.","when_to_set_to_false":"Set to false if the patient's increased intracranial pressure is not documented.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's increased intracranial pressure is documented.","meaning":"Boolean indicating whether the patient's increased intracranial pressure is documented."} ;; "documented increased intracranial pressure"
(declare-const patient_has_finding_of_raised_intracranial_pressure_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's increased intracranial pressure is suspected.","when_to_set_to_false":"Set to false if the patient's increased intracranial pressure is not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's increased intracranial pressure is suspected.","meaning":"Boolean indicating whether the patient's increased intracranial pressure is suspected."} ;; "suspected increased intracranial pressure"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_raised_intracranial_pressure_now@@documented
      patient_has_finding_of_raised_intracranial_pressure_now)
:named REQ1_AUXILIARY0)) ;; "documented increased intracranial pressure"

(assert
(! (=> patient_has_finding_of_raised_intracranial_pressure_now@@suspected
      patient_has_finding_of_raised_intracranial_pressure_now)
:named REQ1_AUXILIARY1)) ;; "suspected increased intracranial pressure"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_raised_intracranial_pressure_now@@documented)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has documented increased intracranial pressure."

(assert
(! (not patient_has_finding_of_raised_intracranial_pressure_now@@suspected)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected increased intracranial pressure."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_hemodynamic_instability_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has hemodynamic instability in the 4 hours preceding study entry.","when_to_set_to_false":"Set to false if the patient does not have hemodynamic instability in the 4 hours preceding study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has hemodynamic instability in the 4 hours preceding study entry.","meaning":"Boolean indicating whether the patient has hemodynamic instability in the 4 hours preceding study entry."} ;; "hemodynamic instability in the 4 hours preceding study entry"

(declare-const patient_has_initiation_of_inotropic_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had initiation of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_false":"Set to false if the patient has not had initiation of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had initiation of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","meaning":"Boolean indicating whether the patient has had initiation of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry."} ;; "initiation of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry"

(declare-const patient_has_initiation_of_vasopressor_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had initiation of any vasopressor agent at any dose to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_false":"Set to false if the patient has not had initiation of any vasopressor agent at any dose to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had initiation of any vasopressor agent at any dose to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","meaning":"Boolean indicating whether the patient has had initiation of any vasopressor agent at any dose to improve blood pressure or tissue perfusion in the 4 hours preceding study entry."} ;; "initiation of any vasopressor agent at any dose to improve blood pressure or tissue perfusion in the 4 hours preceding study entry"

(declare-const patient_has_increase_in_infusion_rate_of_inotropic_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an increase in infusion rate of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_false":"Set to false if the patient has not had an increase in infusion rate of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an increase in infusion rate of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","meaning":"Boolean indicating whether the patient has had an increase in infusion rate of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry."} ;; "increase in infusion rate of any inotropic agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry"

(declare-const patient_has_increase_in_infusion_rate_of_vasopressor_agent_inthepast4hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an increase in infusion rate of any vasopressor agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_false":"Set to false if the patient has not had an increase in infusion rate of any vasopressor agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an increase in infusion rate of any vasopressor agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry.","meaning":"Boolean indicating whether the patient has had an increase in infusion rate of any vasopressor agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry."} ;; "increase in infusion rate of any vasopressor agent to improve blood pressure or tissue perfusion in the 4 hours preceding study entry"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: hemodynamic instability in the 4 hours preceding study entry
(assert
(! (= patient_has_finding_of_hemodynamic_instability_inthepast4hours
(or patient_has_initiation_of_inotropic_agent_inthepast4hours
    patient_has_initiation_of_vasopressor_agent_inthepast4hours
    patient_has_increase_in_infusion_rate_of_inotropic_agent_inthepast4hours
    patient_has_increase_in_infusion_rate_of_vasopressor_agent_inthepast4hours))
:named REQ2_AUXILIARY0)) ;; "defined as ((initiation of any inotropic agent to improve blood pressure or tissue perfusion) OR (initiation of any vasopressor agent at any dose to improve blood pressure or tissue perfusion) OR (increase in infusion rate of any inotropic agent to improve blood pressure or tissue perfusion) OR (increase in infusion rate of any vasopressor agent to improve blood pressure or tissue perfusion))"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_hemodynamic_instability_inthepast4hours)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hemodynamic instability in the 4 hours preceding study entry (defined as ...)"

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_undergone_intravenous_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone intravenous antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone intravenous antibiotic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone intravenous antibiotic therapy.","meaning":"Boolean indicating whether the patient has ever undergone intravenous antibiotic therapy at any time in the past."} ;; "intravenous antibiotic"
(declare-const patient_has_undergone_intravenous_antibiotic_therapy_inthehistory@@indication_suspected_bacterial_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the intravenous antibiotic therapy was given for the indication of suspected bacterial pneumonia.","when_to_set_to_false":"Set to false if the intravenous antibiotic therapy was not given for suspected bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intravenous antibiotic therapy was for suspected bacterial pneumonia.","meaning":"Boolean indicating whether the intravenous antibiotic therapy was for suspected bacterial pneumonia."} ;; "for suspected bacterial pneumonia"
(declare-const patient_has_undergone_intravenous_antibiotic_therapy_inthehistory@@duration_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the intravenous antibiotic therapy for suspected bacterial pneumonia was administered.","when_to_set_to_null":"Set to null if the duration in hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours of intravenous antibiotic therapy for suspected bacterial pneumonia."} ;; "for ≥ 12 hours"
(declare-const patient_has_undergone_intravenous_antibiotic_therapy_inthehistory@@temporalcontext_prior_to_non_bronchoscopic_bronchoalveolar_lavage Bool) ;; {"when_to_set_to_true":"Set to true if the intravenous antibiotic therapy for suspected bacterial pneumonia occurred prior to non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_false":"Set to false if the intravenous antibiotic therapy did not occur prior to non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy occurred prior to non-bronchoscopic bronchoalveolar lavage.","meaning":"Boolean indicating whether the intravenous antibiotic therapy for suspected bacterial pneumonia occurred prior to non-bronchoscopic bronchoalveolar lavage."} ;; "prior to non-bronchoscopic bronchoalveolar lavage"

(declare-const patient_has_undergone_oral_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone oral antibiotic therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone oral antibiotic therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone oral antibiotic therapy.","meaning":"Boolean indicating whether the patient has ever undergone oral antibiotic therapy at any time in the past."} ;; "oral antibiotic"
(declare-const patient_has_undergone_oral_antibiotic_therapy_inthehistory@@indication_suspected_bacterial_pneumonia Bool) ;; {"when_to_set_to_true":"Set to true if the oral antibiotic therapy was given for the indication of suspected bacterial pneumonia.","when_to_set_to_false":"Set to false if the oral antibiotic therapy was not given for suspected bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the oral antibiotic therapy was for suspected bacterial pneumonia.","meaning":"Boolean indicating whether the oral antibiotic therapy was for suspected bacterial pneumonia."} ;; "for suspected bacterial pneumonia"
(declare-const patient_has_undergone_oral_antibiotic_therapy_inthehistory@@duration_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the oral antibiotic therapy for suspected bacterial pneumonia was administered.","when_to_set_to_null":"Set to null if the duration in hours is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in hours of oral antibiotic therapy for suspected bacterial pneumonia."} ;; "for ≥ 12 hours"
(declare-const patient_has_undergone_oral_antibiotic_therapy_inthehistory@@temporalcontext_prior_to_non_bronchoscopic_bronchoalveolar_lavage Bool) ;; {"when_to_set_to_true":"Set to true if the oral antibiotic therapy for suspected bacterial pneumonia occurred prior to non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_false":"Set to false if the oral antibiotic therapy did not occur prior to non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy occurred prior to non-bronchoscopic bronchoalveolar lavage.","meaning":"Boolean indicating whether the oral antibiotic therapy for suspected bacterial pneumonia occurred prior to non-bronchoscopic bronchoalveolar lavage."} ;; "prior to non-bronchoscopic bronchoalveolar lavage"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not (and
    patient_has_undergone_intravenous_antibiotic_therapy_inthehistory
    patient_has_undergone_intravenous_antibiotic_therapy_inthehistory@@indication_suspected_bacterial_pneumonia
    (>= patient_has_undergone_intravenous_antibiotic_therapy_inthehistory@@duration_hours 12)
    patient_has_undergone_intravenous_antibiotic_therapy_inthehistory@@temporalcontext_prior_to_non_bronchoscopic_bronchoalveolar_lavage
  ))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received intravenous antibiotic for suspected bacterial pneumonia for ≥ 12 hours prior to non-bronchoscopic bronchoalveolar lavage."

(assert
(! (not (and
    patient_has_undergone_oral_antibiotic_therapy_inthehistory
    patient_has_undergone_oral_antibiotic_therapy_inthehistory@@indication_suspected_bacterial_pneumonia
    (>= patient_has_undergone_oral_antibiotic_therapy_inthehistory@@duration_hours 12)
    patient_has_undergone_oral_antibiotic_therapy_inthehistory@@temporalcontext_prior_to_non_bronchoscopic_bronchoalveolar_lavage
  ))
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received oral antibiotic for suspected bacterial pneumonia for ≥ 12 hours prior to non-bronchoscopic bronchoalveolar lavage."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const days_between_treatment_for_suspected_bacterial_pneumonia_and_non_bronchoscopic_bronchoalveolar_lavage_value_recorded_in_days Real) ;; {"when_to_set_to_value":"Set to the number of days between the patient's most recent treatment for a previous episode of suspected bacterial pneumonia and the non-bronchoscopic bronchoalveolar lavage procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days elapsed between the patient's most recent treatment for suspected bacterial pneumonia and the non-bronchoscopic bronchoalveolar lavage procedure.","meaning":"Numeric value indicating the number of days between the patient's most recent treatment for a previous episode of suspected bacterial pneumonia and the non-bronchoscopic bronchoalveolar lavage procedure."} ;; "within 3 days prior to non-bronchoscopic bronchoalveolar lavage"

(declare-const patient_has_finding_of_bacterial_pneumonia_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of bacterial pneumonia at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of bacterial pneumonia at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of bacterial pneumonia.","meaning":"Boolean indicating whether the patient has ever had a finding of bacterial pneumonia in their history."} ;; "bacterial pneumonia"

(declare-const patient_has_finding_of_bacterial_pneumonia_inthehistory@@suspicion Bool) ;; {"when_to_set_to_true":"Set to true if the finding of bacterial pneumonia in the patient's history was a suspected episode.","when_to_set_to_false":"Set to false if the finding was not suspected.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the episode was suspected.","meaning":"Boolean indicating whether the historical finding of bacterial pneumonia was suspected."} ;; "suspected bacterial pneumonia"

(declare-const patient_has_finding_of_bacterial_pneumonia_inthehistory@@temporalcontext_within_3_days_prior_to_non_bronchoscopic_bronchoalveolar_lavage Bool) ;; {"when_to_set_to_true":"Set to true if the finding of bacterial pneumonia in the patient's history occurred within 3 days prior to non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_false":"Set to false if the finding did not occur within this window.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the finding occurred within 3 days prior to non-bronchoscopic bronchoalveolar lavage.","meaning":"Boolean indicating whether the historical finding of bacterial pneumonia occurred within 3 days prior to non-bronchoscopic bronchoalveolar lavage."} ;; "within 3 days prior to non-bronchoscopic bronchoalveolar lavage"

(declare-const patient_has_received_treatment_for_suspected_bacterial_pneumonia_within_3_days_prior_to_non_bronchoscopic_bronchoalveolar_lavage Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any treatment for a previous episode of suspected bacterial pneumonia within 3 days prior to non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_false":"Set to false if the patient has not received any treatment for a previous episode of suspected bacterial pneumonia within 3 days prior to non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received any treatment for a previous episode of suspected bacterial pneumonia within 3 days prior to non-bronchoscopic bronchoalveolar lavage.","meaning":"Boolean indicating whether the patient has received any treatment for a previous episode of suspected bacterial pneumonia within 3 days prior to non-bronchoscopic bronchoalveolar lavage."} ;; "has received treatment for a previous episode of suspected bacterial pneumonia within 3 days prior to non-bronchoscopic bronchoalveolar lavage"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Link the Boolean variable to the numeric days variable and suspicion qualifier
(assert
(! (= patient_has_received_treatment_for_suspected_bacterial_pneumonia_within_3_days_prior_to_non_bronchoscopic_bronchoalveolar_lavage
(and patient_has_finding_of_bacterial_pneumonia_inthehistory@@suspicion
     (< days_between_treatment_for_suspected_bacterial_pneumonia_and_non_bronchoscopic_bronchoalveolar_lavage_value_recorded_in_days 3)))
:named REQ4_AUXILIARY0)) ;; "has received treatment for a previous episode of suspected bacterial pneumonia within 3 days prior to non-bronchoscopic bronchoalveolar lavage"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_inthehistory@@suspicion
      patient_has_finding_of_bacterial_pneumonia_inthehistory)
:named REQ4_AUXILIARY1)) ;; "suspected bacterial pneumonia"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_inthehistory@@temporalcontext_within_3_days_prior_to_non_bronchoscopic_bronchoalveolar_lavage
      patient_has_finding_of_bacterial_pneumonia_inthehistory)
:named REQ4_AUXILIARY2)) ;; "within 3 days prior to non-bronchoscopic bronchoalveolar lavage"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_received_treatment_for_suspected_bacterial_pneumonia_within_3_days_prior_to_non_bronchoscopic_bronchoalveolar_lavage)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment for a previous episode of suspected bacterial pneumonia within 3 days prior to non-bronchoscopic bronchoalveolar lavage."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_blood_coagulation_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) at the time of enrollment.","when_to_set_to_false":"Set to false if the patient currently does not have a blood coagulation disorder (coagulopathy) at the time of enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a blood coagulation disorder (coagulopathy) at the time of enrollment.","meaning":"Boolean indicating whether the patient currently has a blood coagulation disorder (coagulopathy) at the time of enrollment."} ;; "coagulopathy"

(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@clinically_apparent_bleeding_deemed_important_by_investigator_or_intensivist Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) and the coagulopathy is clinically apparent bleeding deemed important by either the principal investigator or attending intensivist.","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder (coagulopathy) but it is not clinically apparent bleeding deemed important by either the principal investigator or attending intensivist.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coagulopathy is clinically apparent bleeding deemed important by either the principal investigator or attending intensivist.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (coagulopathy) is clinically apparent bleeding deemed important by either the principal investigator or attending intensivist."} ;; "clinically apparent bleeding deemed important by either the principal investigator OR attending intensivist"

(declare-const patient_has_finding_of_blood_coagulation_disorder_now@@due_to_extracorporeal_circuit_requiring_anticoagulation Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a blood coagulation disorder (coagulopathy) and the coagulopathy is due to an extra-corporeal circuit requiring anticoagulation.","when_to_set_to_false":"Set to false if the patient currently has a blood coagulation disorder (coagulopathy) but it is not due to an extra-corporeal circuit requiring anticoagulation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the coagulopathy is due to an extra-corporeal circuit requiring anticoagulation.","meaning":"Boolean indicating whether the patient's current blood coagulation disorder (coagulopathy) is due to an extra-corporeal circuit requiring anticoagulation."} ;; "extra-corporeal circuit requiring anticoagulation"

(declare-const platelet_count_value_recorded_at_time_of_enrollment_withunit_10e6_per_ml Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's platelet count recorded at the time of enrollment, in units of 10^6 per mL.","when_to_set_to_null":"Set to null if the patient's platelet count at the time of enrollment is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's platelet count at the time of enrollment, in units of 10^6 per mL."} ;; "documented platelet count < 50,000 x 10^6/mL at the time of enrollment"

(declare-const patient_has_received_platelet_infusion_as_part_of_routine_care_completed_within_1_hour_of_non_bronchoscopic_bronchoalveolar_lavage_initiation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received a platelet infusion as part of routine care and the infusion was completed within 1 hour of non-bronchoscopic bronchoalveolar lavage initiation.","when_to_set_to_false":"Set to false if the patient has not received a platelet infusion as part of routine care completed within 1 hour of non-bronchoscopic bronchoalveolar_lavage initiation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received a platelet infusion as part of routine care completed within 1 hour of non-bronchoscopic bronchoalveolar lavage initiation.","meaning":"Boolean indicating whether the patient has received a platelet infusion as part of routine care completed within 1 hour of non-bronchoscopic bronchoalveolar lavage initiation."} ;; "the patient does NOT receive a platelet infusion as part of routine care that is completed within 1 hour of non-bronchoscopic bronchoalveolar lavage initiation"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: coagulopathy = (documented platelet count < 50,000 x 10^6/mL at the time of enrollment AND NOT received platelet infusion as part of routine care completed within 1 hour of non-bronchoscopic bronchoalveolar lavage initiation) OR (extra-corporeal circuit requiring anticoagulation) OR (clinically apparent bleeding deemed important by either the principal investigator OR attending intensivist)
(assert
(! (= patient_has_finding_of_blood_coagulation_disorder_now
(or
  (and (< platelet_count_value_recorded_at_time_of_enrollment_withunit_10e6_per_ml 50000)
       (not patient_has_received_platelet_infusion_as_part_of_routine_care_completed_within_1_hour_of_non_bronchoscopic_bronchoalveolar_lavage_initiation))
  patient_has_finding_of_blood_coagulation_disorder_now@@due_to_extracorporeal_circuit_requiring_anticoagulation
  patient_has_finding_of_blood_coagulation_disorder_now@@clinically_apparent_bleeding_deemed_important_by_investigator_or_intensivist))
:named REQ5_AUXILIARY0)) ;; "coagulopathy (defined as ((documented platelet count < 50,000 x 10^6/mL at the time of enrollment AND the patient does NOT receive a platelet infusion as part of routine care that is completed within 1 hour of non-bronchoscopic bronchoalveolar lavage initiation) OR (extra-corporeal circuit requiring anticoagulation) OR (clinically apparent bleeding deemed important by either the principal investigator OR attending intensivist)))"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@clinically_apparent_bleeding_deemed_important_by_investigator_or_intensivist
      patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ5_AUXILIARY1)) ;; "clinically apparent bleeding deemed important by either the principal investigator OR attending intensivist"

(assert
(! (=> patient_has_finding_of_blood_coagulation_disorder_now@@due_to_extracorporeal_circuit_requiring_anticoagulation
      patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ5_AUXILIARY2)) ;; "extra-corporeal circuit requiring anticoagulation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_blood_coagulation_disorder_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coagulopathy (defined as ((documented platelet count < 50,000 x 10^6/mL at the time of enrollment AND the patient does NOT receive a platelet infusion as part of routine care that is completed within 1 hour of non-bronchoscopic bronchoalveolar lavage initiation) OR (extra-corporeal circuit requiring anticoagulation) OR (clinically apparent bleeding deemed important by either the principal investigator OR attending intensivist)))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_previously_enrolled_in_this_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient has previously enrolled in this specific study.","when_to_set_to_false":"Set to false if the patient has not previously enrolled in this specific study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has previously enrolled in this specific study.","meaning":"Boolean indicating whether the patient has previously enrolled in this specific study."} ;; "The patient is excluded if the patient has previously enrolled into this study."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_previously_enrolled_in_this_study)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previously enrolled into this study."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_cardiopulmonary_instability_during_routine_suctioning_within_6_hours_of_non_bronchoscopic_bronchoalveolar_lavage Bool) ;; {"when_to_set_to_true":"Set to true if the patient has cardiopulmonary instability that occurs during routine suctioning within 6 hours of non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_false":"Set to false if the patient does not have cardiopulmonary instability during routine suctioning within 6 hours of non-bronchoscopic bronchoalveolar lavage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has cardiopulmonary instability during routine suctioning within 6 hours of non-bronchoscopic bronchoalveolar lavage.","meaning":"Boolean indicating whether the patient has cardiopulmonary instability during routine suctioning within 6 hours of non-bronchoscopic bronchoalveolar lavage."} ;; "cardiopulmonary instability during routine suctioning within 6 hours of non-bronchoscopic bronchoalveolar lavage"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_finding_of_cardiopulmonary_instability_during_routine_suctioning_within_6_hours_of_non_bronchoscopic_bronchoalveolar_lavage)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cardiopulmonary instability during routine suctioning within 6 hours of non-bronchoscopic bronchoalveolar lavage."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_undergoing_high_frequency_oscillatory_ventilation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving high frequency oscillatory ventilation.","when_to_set_to_false":"Set to false if the patient is currently not receiving high frequency oscillatory ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving high frequency oscillatory ventilation.","meaning":"Boolean indicating whether the patient is currently receiving high frequency oscillatory ventilation."} ;; "oscillatory ventilation"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_undergoing_high_frequency_oscillatory_ventilation_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving oscillatory ventilation."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_diagnosis_of_cystic_fibrosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cystic fibrosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cystic fibrosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cystic fibrosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cystic fibrosis."} ;; "cystic fibrosis"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_diagnosis_of_cystic_fibrosis_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cystic fibrosis."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_functional_single_ventricle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of single ventricle physiology (functional single ventricle).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of single ventricle physiology (functional single ventricle).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has single ventricle physiology (functional single ventricle).","meaning":"Boolean indicating whether the patient currently has single ventricle physiology (functional single ventricle)."} ;; "single ventricle physiology"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_functional_single_ventricle_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has single ventricle physiology."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a microbial culture with a positive result at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone a microbial culture with a positive result at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a microbial culture with a positive result.","meaning":"Boolean indicating whether the patient has ever undergone a microbial culture with a positive result."} ;; "culture"

(declare-const patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@specimen_is_pleural_fluid Bool) ;; {"when_to_set_to_true":"Set to true if the positive microbial culture was performed on pleural fluid.","when_to_set_to_false":"Set to false if the positive microbial culture was not performed on pleural fluid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the specimen was pleural fluid.","meaning":"Boolean indicating whether the positive microbial culture was performed on pleural fluid."} ;; "pleural fluid culture"

(declare-const patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@occurred_prior_to_day_minus_one Bool) ;; {"when_to_set_to_true":"Set to true if the positive pleural fluid microbial culture occurred prior to Day minus one.","when_to_set_to_false":"Set to false if the positive pleural fluid microbial culture did not occur prior to Day minus one.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive pleural fluid microbial culture occurred prior to Day minus one.","meaning":"Boolean indicating whether the positive pleural fluid microbial culture occurred prior to Day minus one."} ;; "prior to Day minus one"

(declare-const patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@during_current_hospitalization Bool) ;; {"when_to_set_to_true":"Set to true if the positive pleural fluid microbial culture occurred during the current hospitalization.","when_to_set_to_false":"Set to false if the positive pleural fluid microbial culture did not occur during the current hospitalization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the positive pleural fluid microbial culture occurred during the current hospitalization.","meaning":"Boolean indicating whether the positive pleural fluid microbial culture occurred during the current hospitalization."} ;; "during the current hospitalization"

(declare-const patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@specimen_is_pleural_fluid@@during_current_hospitalization@@occurred_prior_to_day_minus_one Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a microbial culture with a positive result on pleural fluid during the current hospitalization and the result occurred prior to Day minus one.","when_to_set_to_false":"Set to false if the patient has never undergone a microbial culture with a positive result on pleural fluid during the current hospitalization prior to Day minus one.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a microbial culture with a positive result on pleural fluid during the current hospitalization prior to Day minus one.","meaning":"Boolean indicating whether the patient has ever undergone a microbial culture with a positive result on pleural fluid during the current hospitalization prior to Day minus one."} ;; "positive pleural fluid culture result prior to Day minus one during the current hospitalization"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Definitional: The fully qualified variable is true iff all relevant qualifiers are true
(assert
(! (= patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@specimen_is_pleural_fluid@@during_current_hospitalization@@occurred_prior_to_day_minus_one
     (and patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive
          patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@specimen_is_pleural_fluid
          patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@during_current_hospitalization
          patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@occurred_prior_to_day_minus_one))
:named REQ11_AUXILIARY0)) ;; "positive pleural fluid culture result prior to Day minus one during the current hospitalization"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@specimen_is_pleural_fluid
       patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive)
:named REQ11_AUXILIARY1)) ;; "pleural fluid culture"

(assert
(! (=> patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@during_current_hospitalization
       patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive)
:named REQ11_AUXILIARY2)) ;; "during the current hospitalization"

(assert
(! (=> patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@occurred_prior_to_day_minus_one
       patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive)
:named REQ11_AUXILIARY3)) ;; "prior to Day minus one"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_undergone_microbial_culture_inthehistory_outcome_is_positive@@specimen_is_pleural_fluid@@during_current_hospitalization@@occurred_prior_to_day_minus_one)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a positive pleural fluid culture result prior to Day minus one during the current hospitalization."
