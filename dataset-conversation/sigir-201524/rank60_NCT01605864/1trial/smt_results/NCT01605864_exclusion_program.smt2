;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_bacterial_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has bacterial pneumonia."} ;; "bacterial pneumonia"

(declare-const patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_i Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacterial pneumonia is classified as PORT Risk class I.","when_to_set_to_false":"Set to false if the patient's bacterial pneumonia is not classified as PORT Risk class I.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bacterial pneumonia is classified as PORT Risk class I.","meaning":"Boolean indicating whether the patient's bacterial pneumonia is classified as PORT Risk class I."} ;; "PORT Risk class I"

(declare-const patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_ii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacterial pneumonia is classified as PORT Risk class II.","when_to_set_to_false":"Set to false if the patient's bacterial pneumonia is not classified as PORT Risk class II.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bacterial pneumonia is classified as PORT Risk class II.","meaning":"Boolean indicating whether the patient's bacterial pneumonia is classified as PORT Risk class II."} ;; "PORT Risk class II"

(declare-const patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_iii Bool) ;; {"when_to_set_to_true":"Set to true if the patient's bacterial pneumonia is classified as PORT Risk class III.","when_to_set_to_false":"Set to false if the patient's bacterial pneumonia is not classified as PORT Risk class III.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's bacterial pneumonia is classified as PORT Risk class III.","meaning":"Boolean indicating whether the patient's bacterial pneumonia is classified as PORT Risk class III."} ;; "PORT Risk class III"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_i
      patient_has_finding_of_bacterial_pneumonia_now)
:named REQ0_AUXILIARY0)) ;; "community-acquired bacterial pneumonia with PORT Risk class I"

(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_ii
      patient_has_finding_of_bacterial_pneumonia_now)
:named REQ0_AUXILIARY1)) ;; "community-acquired bacterial pneumonia with PORT Risk class II"

(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_iii
      patient_has_finding_of_bacterial_pneumonia_now)
:named REQ0_AUXILIARY2)) ;; "community-acquired bacterial pneumonia with PORT Risk class III"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_i)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has community-acquired bacterial pneumonia with PORT Risk class I."

(assert
(! (not patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_ii)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has community-acquired bacterial pneumonia with PORT Risk class II."

(assert
(! (not patient_has_finding_of_bacterial_pneumonia_now@@port_risk_class_iii)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has community-acquired bacterial pneumonia with PORT Risk class III."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_community_acquired_pneumonia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of community-acquired bacterial pneumonia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of community-acquired bacterial pneumonia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has community-acquired bacterial pneumonia.","meaning":"Boolean indicating whether the patient currently has community-acquired bacterial pneumonia."} ;; "community-acquired bacterial pneumonia"
(declare-const patient_has_finding_of_community_acquired_pneumonia_now@@requires_admission_to_intensive_care_unit Bool) ;; {"when_to_set_to_true":"Set to true if the patient's community-acquired bacterial pneumonia requires admission to an intensive care unit.","when_to_set_to_false":"Set to false if the patient's community-acquired bacterial pneumonia does not require admission to an intensive care unit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's community-acquired bacterial pneumonia requires admission to an intensive care unit.","meaning":"Boolean indicating whether the patient's community-acquired bacterial pneumonia requires admission to an intensive care unit."} ;; "requiring admission to an intensive care unit"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_community_acquired_pneumonia_now@@requires_admission_to_intensive_care_unit
      patient_has_finding_of_community_acquired_pneumonia_now)
:named REQ1_AUXILIARY0)) ;; "requiring admission to an intensive care unit"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_community_acquired_pneumonia_now@@requires_admission_to_intensive_care_unit)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has community-acquired bacterial pneumonia requiring admission to an intensive care unit."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_bacterial_pneumonia_now@@suitable_for_outpatient_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bacterial pneumonia is suitable for outpatient therapy.","when_to_set_to_false":"Set to false if the patient's current bacterial pneumonia is not suitable for outpatient therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bacterial pneumonia is suitable for outpatient therapy.","meaning":"Boolean indicating whether the patient's current bacterial pneumonia is suitable for outpatient therapy."} ;; "suitable for outpatient therapy"
(declare-const patient_has_finding_of_bacterial_pneumonia_now@@suitable_for_outpatient_therapy_with_oral_antimicrobial_agent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has community-acquired bacterial pneumonia and it is suitable for outpatient therapy with an oral antimicrobial agent.","when_to_set_to_false":"Set to false if the patient currently has community-acquired bacterial pneumonia and it is not suitable for outpatient therapy with an oral antimicrobial agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has community-acquired bacterial pneumonia suitable for outpatient therapy with an oral antimicrobial agent.","meaning":"Boolean indicating whether the patient currently has community-acquired bacterial pneumonia suitable for outpatient therapy with an oral antimicrobial agent."} ;; "suitable for outpatient therapy with an oral antimicrobial agent"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_now@@suitable_for_outpatient_therapy
     patient_has_finding_of_bacterial_pneumonia_now)
:named REQ2_AUXILIARY0)) ;; "suitable for outpatient therapy"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_bacterial_pneumonia_now@@suitable_for_outpatient_therapy_with_oral_antimicrobial_agent
     patient_has_finding_of_bacterial_pneumonia_now)
:named REQ2_AUXILIARY1)) ;; "suitable for outpatient therapy with an oral antimicrobial agent"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_bacterial_pneumonia_now@@suitable_for_outpatient_therapy_with_oral_antimicrobial_agent)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has community-acquired bacterial pneumonia suitable for outpatient therapy with an oral microbial agent."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_respiratory_tract_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a respiratory tract infection.","when_to_set_to_false":"Set to false if the patient currently does not have a respiratory tract infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a respiratory tract infection.","meaning":"Boolean indicating whether the patient currently has a respiratory tract infection."} ;; "respiratory tract infection"
(declare-const patient_has_finding_of_respiratory_tract_infection_now@@confirmed Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current respiratory tract infection is confirmed (e.g., by laboratory or clinical criteria).","when_to_set_to_false":"Set to false if the patient's current respiratory tract infection is not confirmed (e.g., only suspected or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is confirmed.","meaning":"Boolean indicating whether the patient's current respiratory tract infection is confirmed."} ;; "confirmed respiratory tract infection"
(declare-const patient_has_finding_of_respiratory_tract_infection_now@@suspected Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current respiratory tract infection is suspected (e.g., based on clinical suspicion without confirmation).","when_to_set_to_false":"Set to false if the infection is not suspected (e.g., confirmed or ruled out).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is suspected.","meaning":"Boolean indicating whether the patient's current respiratory tract infection is suspected."} ;; "suspected respiratory tract infection"
(declare-const patient_has_finding_of_respiratory_tract_infection_now@@attributed_to_source_other_than_community_acquired_bacterial_pneumonia_pathogens Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current respiratory tract infection is attributed to a source other than community-acquired bacterial pneumonia pathogens.","when_to_set_to_false":"Set to false if the infection is attributed to community-acquired bacterial pneumonia pathogens or if the source is not other than these pathogens.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the infection is attributed to a source other than community-acquired bacterial pneumonia pathogens.","meaning":"Boolean indicating whether the patient's current respiratory tract infection is attributed to a source other than community-acquired bacterial pneumonia pathogens."} ;; "attributed to a source other than community-acquired bacterial pneumonia pathogens"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_respiratory_tract_infection_now@@confirmed
       patient_has_finding_of_respiratory_tract_infection_now)
   :named REQ3_AUXILIARY0)) ;; "confirmed respiratory tract infection implies respiratory tract infection"

(assert
(! (=> patient_has_finding_of_respiratory_tract_infection_now@@suspected
       patient_has_finding_of_respiratory_tract_infection_now)
   :named REQ3_AUXILIARY1)) ;; "suspected respiratory tract infection implies respiratory tract infection"

(assert
(! (=> patient_has_finding_of_respiratory_tract_infection_now@@attributed_to_source_other_than_community_acquired_bacterial_pneumonia_pathogens
       patient_has_finding_of_respiratory_tract_infection_now)
   :named REQ3_AUXILIARY2)) ;; "attributed to a source other than community-acquired bacterial pneumonia pathogens implies respiratory tract infection"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have a confirmed respiratory tract infection attributed to a source other than community-acquired bacterial pneumonia pathogens
(assert
(! (not (and patient_has_finding_of_respiratory_tract_infection_now@@confirmed
             patient_has_finding_of_respiratory_tract_infection_now@@attributed_to_source_other_than_community_acquired_bacterial_pneumonia_pathogens))
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a confirmed respiratory tract infection attributed to a source other than community-acquired bacterial pneumonia pathogens."

;; Exclusion: patient must NOT have a suspected respiratory tract infection attributed to a source other than community-acquired bacterial pneumonia pathogens
(assert
(! (not (and patient_has_finding_of_respiratory_tract_infection_now@@suspected
             patient_has_finding_of_respiratory_tract_infection_now@@attributed_to_source_other_than_community_acquired_bacterial_pneumonia_pathogens))
   :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a suspected respiratory tract infection attributed to a source other than community-acquired bacterial pneumonia pathogens."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of radiologic infiltrate of the lung (pulmonary infiltrates), regardless of etiology.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of radiologic infiltrate of the lung (pulmonary infiltrates), regardless of etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has radiologic infiltrate of the lung.","meaning":"Boolean indicating whether the patient currently has radiologic infiltrate of the lung (pulmonary infiltrates), regardless of etiology."} ;; "pulmonary infiltrates"
(declare-const patient_has_finding_of_radiologic_infiltrate_of_lung_now@@noninfectious_origin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's radiologic infiltrate of the lung (pulmonary infiltrates) is noninfectious in origin.","when_to_set_to_false":"Set to false if the patient's radiologic infiltrate of the lung (pulmonary infiltrates) is infectious in origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the origin of the pulmonary infiltrates is noninfectious.","meaning":"Boolean indicating whether the patient's radiologic infiltrate of the lung (pulmonary infiltrates) is noninfectious in origin."} ;; "noninfectious case of pulmonary infiltrates"
(declare-const patient_has_finding_of_empyema_of_pleura_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of empyema of the pleura (pleural empyema), regardless of etiology.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of empyema of the pleura (pleural empyema), regardless of etiology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has empyema of the pleura.","meaning":"Boolean indicating whether the patient currently has empyema of the pleura (pleural empyema), regardless of etiology."} ;; "pleural empyema"
(declare-const patient_has_finding_of_empyema_of_pleura_now@@noninfectious_origin Bool) ;; {"when_to_set_to_true":"Set to true if the patient's empyema of the pleura (pleural empyema) is noninfectious in origin.","when_to_set_to_false":"Set to false if the patient's empyema of the pleura (pleural empyema) is infectious in origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the origin of the pleural empyema is noninfectious.","meaning":"Boolean indicating whether the patient's empyema of the pleura (pleural empyema) is noninfectious in origin."} ;; "noninfectious case of pleural empyema"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_radiologic_infiltrate_of_lung_now@@noninfectious_origin
      patient_has_finding_of_radiologic_infiltrate_of_lung_now)
   :named REQ4_AUXILIARY0)) ;; "noninfectious case of pulmonary infiltrates"

(assert
(! (=> patient_has_finding_of_empyema_of_pleura_now@@noninfectious_origin
      patient_has_finding_of_empyema_of_pleura_now)
   :named REQ4_AUXILIARY1)) ;; "noninfectious case of pleural empyema"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_radiologic_infiltrate_of_lung_now@@noninfectious_origin)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a noninfectious case of pulmonary infiltrates."

(assert
(! (not patient_has_finding_of_empyema_of_pleura_now@@noninfectious_origin)
   :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a noninfectious case of pleural empyema."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of infection.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of infection.","meaning":"Boolean indicating whether the patient currently has an infection now."} ;; "infection"

(declare-const patient_has_finding_of_disorder_due_to_infection_now@@with_pathogen_known_to_be_resistant_to_ceftaroline Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current infection is with a pathogen known to be resistant to ceftaroline.","when_to_set_to_false":"Set to false if the patient's current infection is not with a pathogen known to be resistant to ceftaroline.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current infection is with a pathogen known to be resistant to ceftaroline.","meaning":"Boolean indicating whether the patient's current infection is with a pathogen known to be resistant to ceftaroline."} ;; "infection with a pathogen known to be resistant to ceftaroline"

(declare-const patient_is_in_epidemiological_context_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in an epidemiological context.","when_to_set_to_false":"Set to false if the patient is currently not in an epidemiological context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in an epidemiological context.","meaning":"Boolean indicating whether the patient is currently in an epidemiological context."} ;; "epidemiological context"

(declare-const patient_is_in_epidemiological_context_now@@suggests_high_likelihood_of_resistant_pathogen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current epidemiological context suggests a high likelihood of a resistant pathogen.","when_to_set_to_false":"Set to false if the patient's current epidemiological context does not suggest a high likelihood of a resistant pathogen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current epidemiological context suggests a high likelihood of a resistant pathogen.","meaning":"Boolean indicating whether the patient's current epidemiological context suggests a high likelihood of a resistant pathogen."} ;; "epidemiological context suggesting a high likelihood of a resistant pathogen"

(declare-const patient_is_in_clinical_context_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently in a clinical context.","when_to_set_to_false":"Set to false if the patient is currently not in a clinical context.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently in a clinical context.","meaning":"Boolean indicating whether the patient is currently in a clinical context."} ;; "clinical context"

(declare-const patient_is_in_clinical_context_now@@suggests_high_likelihood_of_resistant_pathogen Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical context suggests a high likelihood of a resistant pathogen.","when_to_set_to_false":"Set to false if the patient's current clinical context does not suggest a high likelihood of a resistant pathogen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current clinical context suggests a high likelihood of a resistant pathogen.","meaning":"Boolean indicating whether the patient's current clinical context suggests a high likelihood of a resistant pathogen."} ;; "clinical context suggesting a high likelihood of a resistant pathogen"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@with_pathogen_known_to_be_resistant_to_ceftaroline
      patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ5_AUXILIARY0)) ;; "infection with a pathogen known to be resistant to ceftaroline"

(assert
(! (=> patient_is_in_epidemiological_context_now@@suggests_high_likelihood_of_resistant_pathogen
      patient_is_in_epidemiological_context_now)
   :named REQ5_AUXILIARY1)) ;; "epidemiological context suggesting a high likelihood of a resistant pathogen"

(assert
(! (=> patient_is_in_clinical_context_now@@suggests_high_likelihood_of_resistant_pathogen
      patient_is_in_clinical_context_now)
   :named REQ5_AUXILIARY2)) ;; "clinical context suggesting a high likelihood of a resistant pathogen"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (or patient_has_finding_of_disorder_due_to_infection_now@@with_pathogen_known_to_be_resistant_to_ceftaroline
            patient_is_in_epidemiological_context_now@@suggests_high_likelihood_of_resistant_pathogen
            patient_is_in_clinical_context_now@@suggests_high_likelihood_of_resistant_pathogen))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has an infection with a pathogen known to be resistant to ceftaroline) OR (the patient is in an epidemiological context suggesting a high likelihood of a resistant pathogen) OR (the patient is in a clinical context suggesting a high likelihood of a resistant pathogen)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_beta_lactam_value_recorded_inthepast96hours_withunit_hours Real) ;; {"when_to_set_to_value":"Set to the total number of hours the patient received intravenous beta-lactam therapy for community-acquired bacterial pneumonia in the 96 hours prior to randomization.","when_to_set_to_null":"Set to null if the duration is unknown, not documented, or cannot be determined for the 96 hours prior to randomization.","meaning":"Numeric value representing the total duration in hours of intravenous beta-lactam therapy for community-acquired bacterial pneumonia received by the patient in the 96 hours prior to randomization."} ;; "for a duration ≥ 24 hours AND ≤ 96 hours prior to randomization"
(declare-const patient_has_received_intravenous_beta_lactam_for_cabp_in_the_past_96_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received any intravenous beta-lactam therapy for community-acquired bacterial pneumonia in the 96 hours prior to randomization.","when_to_set_to_false":"Set to false if the patient has not received any intravenous beta-lactam therapy for community-acquired bacterial pneumonia in the 96 hours prior to randomization.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received intravenous beta-lactam therapy for community-acquired bacterial pneumonia in the 96 hours prior to randomization.","meaning":"Boolean indicating whether the patient has received intravenous beta-lactam therapy for community-acquired bacterial pneumonia in the 96 hours prior to randomization."} ;; "received previous therapy with another intravenous beta-lactam for community-acquired bacterial pneumonia in the past 96 hours"
(declare-const patient_has_received_intravenous_beta_lactam_for_cabp_in_the_past_96_hours@@with_another_intravenous_beta_lactam Bool) ;; {"when_to_set_to_true":"Set to true if the intravenous beta-lactam therapy received by the patient for community-acquired bacterial pneumonia in the 96 hours prior to randomization was with a beta-lactam other than the study drug.","when_to_set_to_false":"Set to false if the intravenous beta-lactam therapy received by the patient for community-acquired bacterial pneumonia in the 96 hours prior to randomization was not with a beta-lactam other than the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the intravenous beta-lactam therapy received by the patient for community-acquired bacterial pneumonia in the 96 hours prior to randomization was with a beta-lactam other than the study drug.","meaning":"Boolean indicating whether the intravenous beta-lactam therapy received by the patient for community-acquired bacterial pneumonia in the 96 hours prior to randomization was with a beta-lactam other than the study drug."} ;; "with another intravenous beta-lactam"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_received_intravenous_beta_lactam_for_cabp_in_the_past_96_hours@@with_another_intravenous_beta_lactam
      patient_has_received_intravenous_beta_lactam_for_cabp_in_the_past_96_hours)
:named REQ6_AUXILIARY0)) ;; "therapy with another intravenous beta-lactam for community-acquired bacterial pneumonia in the past 96 hours"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have received previous therapy with another intravenous beta-lactam for CABP for a duration ≥ 24 hours AND ≤ 96 hours prior to randomization
(assert
(! (not (and patient_has_received_intravenous_beta_lactam_for_cabp_in_the_past_96_hours@@with_another_intravenous_beta_lactam
             (>= patient_beta_lactam_value_recorded_inthepast96hours_withunit_hours 24)
             (<= patient_beta_lactam_value_recorded_inthepast96hours_withunit_hours 96)))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received previous therapy with another intravenous beta-lactam for community-acquired bacterial pneumonia for a duration ≥ 24 hours AND ≤ 96 hours prior to randomization."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_long_term_systemic_steroid_user_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received chronic concomitant systemic steroid therapy at any time in the past.","when_to_set_to_false":"Set to false if the patient has never received chronic concomitant systemic steroid therapy at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received chronic concomitant systemic steroid therapy.","meaning":"Boolean indicating whether the patient has ever received chronic concomitant systemic steroid therapy."} ;; "chronic concomitant systemic steroid therapy"

(declare-const prednisone_equivalent_dose_value_recorded_during_chronic_concomitant_systemic_steroid_therapy_in_mg_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value of the daily dose (in mg per day of prednisone equivalent) if the patient has received chronic concomitant systemic steroid therapy and the dose is known.","when_to_set_to_null":"Set to null if the patient has not received chronic concomitant systemic steroid therapy, or if the dose is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the daily dose of systemic steroid therapy in mg per day of prednisone equivalent during chronic concomitant systemic steroid therapy."} ;; "dose > 40 mg of prednisone equivalent"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not (and patient_has_finding_of_long_term_systemic_steroid_user_inthehistory
             (> prednisone_equivalent_dose_value_recorded_during_chronic_concomitant_systemic_steroid_therapy_in_mg_per_day 40)))
   :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received chronic concomitant systemic steroid therapy with a dose > 40 mg of prednisone equivalent."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of liver disease (hepatic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of liver disease (hepatic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of liver disease (hepatic disease).","meaning":"Boolean indicating whether the patient currently has a diagnosis of liver disease (hepatic disease)."} ;; "hepatic disease"
(declare-const patient_has_diagnosis_of_disease_of_liver_now@@significant Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of liver disease (hepatic disease) is significant.","when_to_set_to_false":"Set to false if the patient's current diagnosis of liver disease (hepatic disease) is not significant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of liver disease (hepatic disease) is significant.","meaning":"Boolean indicating whether the patient's current diagnosis of liver disease (hepatic disease) is significant."} ;; "significant hepatic disease"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_diagnosis_of_disease_of_liver_now@@significant
       patient_has_diagnosis_of_disease_of_liver_now)
   :named REQ8_AUXILIARY0)) ;; "significant hepatic disease"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_now@@significant)
   :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has significant hepatic disease."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_disorder_of_cellular_component_of_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of the cellular component of blood (hematologic disease).","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of the cellular component of blood (hematologic disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of the cellular component of blood (hematologic disease).","meaning":"Boolean indicating whether the patient currently has a disorder of the cellular component of blood (hematologic disease)."} ;; "hematologic disease"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_disorder_of_cellular_component_of_blood_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hematologic disease."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_disorder_of_immune_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of disorder of immune function (immunological disease).","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of disorder of immune function (immunological disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of disorder of immune function (immunological disease).","meaning":"Boolean indicating whether the patient currently has a disorder of immune function (immunological disease)."} ;; "immunological disease"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
  (! (not patient_has_finding_of_disorder_of_immune_function_now)
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has immunological disease."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_has_finding_of_hypersensitivity_reaction_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity reaction at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity reaction at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity reaction.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity reaction in their history."} ;; "hypersensitivity reaction"
(declare-const patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_beta_lactam_antibiotics Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity reaction in their history and the reaction was caused by beta-lactam antibiotics.","when_to_set_to_false":"Set to false if the patient has ever had a hypersensitivity reaction in their history but the reaction was not caused by beta-lactam antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity reaction was caused by beta-lactam antibiotics.","meaning":"Boolean indicating whether the patient's historical hypersensitivity reaction was caused by beta-lactam antibiotics."} ;; "hypersensitivity reaction to beta-lactam antibiotics"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_beta_lactam_antibiotics
      patient_has_finding_of_hypersensitivity_reaction_inthehistory)
:named REQ11_AUXILIARY0)) ;; "hypersensitivity reaction to beta-lactam antibiotics""

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_has_finding_of_hypersensitivity_reaction_inthehistory@@caused_by_beta_lactam_antibiotics)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of a hypersensitivity reaction to beta-lactam antibiotics."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently pregnant."} ;; "pregnant female"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient's sex is female at the current time."} ;; "pregnant female"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is documented as not currently breastfeeding.","when_to_set_to_null":"Set to null if the patient's breastfeeding status is unknown, not documented, or cannot be determined at the current time.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "nursing female"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not (and patient_is_pregnant_now patient_sex_is_female_now))
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant female."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a nursing female."
