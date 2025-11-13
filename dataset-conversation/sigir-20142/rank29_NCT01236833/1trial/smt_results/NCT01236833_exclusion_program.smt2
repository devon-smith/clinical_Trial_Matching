;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_reached_full_enteral_feeding_for_at_least_seventy_two_hours Bool) ;; {"when_to_set_to_true":"Set to true if the patient has already reached full enteral feeding and this state has persisted for at least seventy-two hours.","when_to_set_to_false":"Set to false if the patient has not reached full enteral feeding for at least seventy-two hours.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has reached full enteral feeding for at least seventy-two hours.","meaning":"Boolean indicating whether the patient has already reached full enteral feeding for greater than or equal to seventy-two hours."} ;; "has already reached full enteral feeding for greater than or equal to seventy-two hours"
(declare-const enteral_feeding_volume_per_kg_per_day_value_recorded_now_withunit_ml_per_kg_per_day Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current enteral feeding volume per kilogram per day in milliliters per kilogram per day.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current enteral feeding volume per kilogram per day, measured in milliliters per kilogram per day."} ;; "a minimum of one hundred thirty milliliters per kilogram per day enteral feeding"
(declare-const enteral_feeding_is_provided_without_parenteral_supplementation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current enteral feeding is provided without any parenteral supplementation.","when_to_set_to_false":"Set to false if the patient's current enteral feeding is provided with parenteral supplementation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current enteral feeding is provided without parenteral supplementation.","meaning":"Boolean indicating whether the patient's current enteral feeding is provided without parenteral supplementation."} ;; "without parenteral supplementation"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not (and patient_has_reached_full_enteral_feeding_for_at_least_seventy_two_hours
               (>= enteral_feeding_volume_per_kg_per_day_value_recorded_now_withunit_ml_per_kg_per_day 130)
               enteral_feeding_is_provided_without_parenteral_supplementation_now))
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has already reached full enteral feeding for greater than or equal to seventy-two hours) AND (the patient has a minimum of one hundred thirty milliliters per kilogram per day enteral feeding without parenteral supplementation)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_kg Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body weight in kilograms is available and recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in kilograms."} ;; "weight"
(declare-const patient_body_weight_value_recorded_now_withunit_kg@@measured_using_fenton_growth_chart Bool) ;; {"when_to_set_to_true":"Set to true if the patient's body weight measurement was obtained using the Fenton growth chart.","when_to_set_to_false":"Set to false if the patient's body weight measurement was not obtained using the Fenton growth chart.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the Fenton growth chart was used for the measurement.","meaning":"Boolean indicating whether the patient's body weight measurement was obtained using the Fenton growth chart."} ;; "weight ... on the Fenton growth chart"
(declare-const patient_has_finding_of_small_for_gestational_age_fetus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently small for gestational age (SGA) as determined by clinical standards.","when_to_set_to_false":"Set to false if the patient is currently not small for gestational age (SGA).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently small for gestational age (SGA).","meaning":"Boolean indicating whether the patient is currently small for gestational age (SGA)."} ;; "small for gestational age"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: small for gestational age = weight ≤ 3rd percentile on the Fenton growth chart
(assert
(! (= patient_has_finding_of_small_for_gestational_age_fetus_now
    (and patient_body_weight_value_recorded_now_withunit_kg@@measured_using_fenton_growth_chart
         (<= patient_body_weight_value_recorded_now_withunit_kg 3)))
:named REQ1_AUXILIARY0)) ;; "defined as weight less than or equal to the third percentile on the Fenton growth chart"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_small_for_gestational_age_fetus_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is small for gestational age, defined as weight less than or equal to the third percentile on the Fenton growth chart."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_necrotizing_enterocolitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has necrotizing enterocolitis.","when_to_set_to_false":"Set to false if the patient currently does not have necrotizing enterocolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has necrotizing enterocolitis.","meaning":"Boolean indicating whether the patient currently has necrotizing enterocolitis."} ;; "the patient has necrotizing enterocolitis"

(declare-const patient_has_finding_of_necrotizing_enterocolitis_now@@bells_stage_ii_or_higher Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current necrotizing enterocolitis is classified as Bell's stage II or higher.","when_to_set_to_false":"Set to false if the patient's current necrotizing enterocolitis is not classified as Bell's stage II or higher.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current necrotizing enterocolitis is classified as Bell's stage II or higher.","meaning":"Boolean indicating whether the patient's current necrotizing enterocolitis is classified as Bell's stage II or higher."} ;; "Bell's stage II or higher"

(declare-const patient_has_finding_of_necrotizing_enterocolitis_now@@radiologic_evidence_present Bool) ;; {"when_to_set_to_true":"Set to true if there is radiologic evidence of necrotizing enterocolitis in the patient currently.","when_to_set_to_false":"Set to false if there is no radiologic evidence of necrotizing enterocolitis in the patient currently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is radiologic evidence of necrotizing enterocolitis in the patient currently.","meaning":"Boolean indicating whether there is radiologic evidence of necrotizing enterocolitis in the patient currently."} ;; "radiologic evidence of necrotizing enterocolitis"

(declare-const patient_has_finding_of_pneumatosis_cystoides_intestinalis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumatosis cystoides intestinalis (pneumatosis intestinalis).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumatosis cystoides intestinalis (pneumatosis intestinalis).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumatosis cystoides intestinalis (pneumatosis intestinalis).","meaning":"Boolean indicating whether the patient currently has pneumatosis cystoides intestinalis (pneumatosis intestinalis)."} ;; "pneumatosis intestinalis"

(declare-const patient_has_finding_of_pneumoperitoneum_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of pneumoperitoneum (free intraperitoneal air).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of pneumoperitoneum (free intraperitoneal air).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of pneumoperitoneum (free intraperitoneal air).","meaning":"Boolean indicating whether the patient currently has pneumoperitoneum (free intraperitoneal air)."} ;; "free intraperitoneal air"

(declare-const patient_has_history_of_necrotizing_enterocolitis Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of necrotizing enterocolitis.","when_to_set_to_false":"Set to false if the patient does not have a documented history of necrotizing enterocolitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of necrotizing enterocolitis.","meaning":"Boolean indicating whether the patient has a history of necrotizing enterocolitis."} ;; "history of necrotizing enterocolitis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
(! (= patient_has_finding_of_necrotizing_enterocolitis_now
(or patient_has_finding_of_necrotizing_enterocolitis_now@@bells_stage_ii_or_higher
    patient_has_finding_of_necrotizing_enterocolitis_now@@radiologic_evidence_present
    patient_has_finding_of_pneumatosis_cystoides_intestinalis_now
    patient_has_finding_of_pneumoperitoneum_now))
:named REQ2_AUXILIARY0)) ;; "necrotizing enterocolitis with exhaustive subcategories ((Bell's stage II or higher) OR (radiologic evidence of necrotizing enterocolitis) OR (pneumatosis intestinalis) OR (free intraperitoneal air))"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_necrotizing_enterocolitis_now@@bells_stage_ii_or_higher
       patient_has_finding_of_necrotizing_enterocolitis_now)
:named REQ2_AUXILIARY1)) ;; "Bell's stage II or higher is a type of necrotizing enterocolitis"

(assert
(! (=> patient_has_finding_of_necrotizing_enterocolitis_now@@radiologic_evidence_present
       patient_has_finding_of_necrotizing_enterocolitis_now)
:named REQ2_AUXILIARY2)) ;; "radiologic evidence is a type of necrotizing enterocolitis"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_necrotizing_enterocolitis_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has necrotizing enterocolitis with exhaustive subcategories ((Bell's stage II or higher) OR (radiologic evidence of necrotizing enterocolitis) OR (pneumatosis intestinalis) OR (free intraperitoneal air))."

(assert
(! (not patient_has_history_of_necrotizing_enterocolitis)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of necrotizing enterocolitis."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_gastric_occlusion_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has gastric occlusion (gastric obstruction).","when_to_set_to_false":"Set to false if the patient currently does not have gastric occlusion (gastric obstruction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has gastric occlusion (gastric obstruction).","meaning":"Boolean indicating whether the patient currently has gastric occlusion (gastric obstruction)."} ;; "the patient has gastric occlusion"
(declare-const patient_has_finding_of_intestinal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intestinal obstruction (occlusion).","when_to_set_to_false":"Set to false if the patient currently does not have intestinal obstruction (occlusion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has intestinal obstruction (occlusion).","meaning":"Boolean indicating whether the patient currently has intestinal obstruction."} ;; "the patient has intestinal occlusion"
(declare-const patient_has_finding_of_no_gastrointestinal_transit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has no gastrointestinal transit (no passage of contents through the gastrointestinal tract).","when_to_set_to_false":"Set to false if the patient currently does not have no gastrointestinal transit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has no gastrointestinal transit.","meaning":"Boolean indicating whether the patient currently has no gastrointestinal transit (no passage of contents through the gastrointestinal tract)."} ;; "no transit"
(declare-const patient_has_finding_of_bowel_sounds_absent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absent bowel sounds.","when_to_set_to_false":"Set to false if the patient currently does not have absent bowel sounds.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absent bowel sounds.","meaning":"Boolean indicating whether the patient currently has absent bowel sounds."} ;; "absent bowel sounds"
(declare-const patient_has_finding_of_incessant_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has incessant vomiting (continuous or persistent vomiting).","when_to_set_to_false":"Set to false if the patient currently does not have incessant vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has incessant vomiting.","meaning":"Boolean indicating whether the patient currently has incessant vomiting (continuous or persistent vomiting)."} ;; "incessant vomiting"
(declare-const patient_has_finding_of_bilious_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has bilious (bile-stained) vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have bilious (bile-stained) vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bilious (bile-stained) vomiting.","meaning":"Boolean indicating whether the patient currently has bilious vomiting."} ;; "bile stained vomiting"
(declare-const patient_has_finding_of_air_fluid_levels_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has air fluid levels (as seen on imaging, suggestive of obstruction).","when_to_set_to_false":"Set to false if the patient currently does not have air fluid levels.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has air fluid levels.","meaning":"Boolean indicating whether the patient currently has air fluid levels (as seen on imaging, suggestive of obstruction)."} ;; "air fluid levels"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Exhaustive subcategories define gastric occlusion exactly:
(assert
(! (= patient_has_finding_of_gastric_occlusion_now
(or patient_has_finding_of_no_gastrointestinal_transit_now
    patient_has_finding_of_bowel_sounds_absent_now
    patient_has_finding_of_incessant_vomiting_now
    patient_has_finding_of_bilious_vomiting_now
    patient_has_finding_of_air_fluid_levels_now))
:named REQ3_AUXILIARY0)) ;; "gastric occlusion with exhaustive subcategories ((no transit) OR (absent bowel sounds) OR (incessant vomiting) OR (bile stained vomiting) OR (air fluid levels))"

;; Exhaustive subcategories define intestinal occlusion exactly:
(assert
(! (= patient_has_finding_of_intestinal_obstruction_now
(or patient_has_finding_of_no_gastrointestinal_transit_now
    patient_has_finding_of_bowel_sounds_absent_now
    patient_has_finding_of_incessant_vomiting_now
    patient_has_finding_of_bilious_vomiting_now
    patient_has_finding_of_air_fluid_levels_now))
:named REQ3_AUXILIARY1)) ;; "intestinal occlusion with exhaustive subcategories ((no transit) OR (absent bowel sounds) OR (incessant vomiting) OR (bile stained vomiting) OR (air fluid levels))"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_gastric_occlusion_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gastric occlusion with exhaustive subcategories..."

(assert
(! (not patient_has_finding_of_intestinal_obstruction_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intestinal occlusion with exhaustive subcategories..."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_congenital_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a congenital malformation.","when_to_set_to_false":"Set to false if the patient currently does not have a congenital malformation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital malformation.","meaning":"Boolean indicating whether the patient currently has a congenital malformation."} ;; "congenital malformation"
(declare-const patient_has_finding_of_congenital_malformation_now@@major Bool) ;; {"when_to_set_to_true":"Set to true if the patient's congenital malformation is major.","when_to_set_to_false":"Set to false if the patient's congenital malformation is not major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's congenital malformation is major.","meaning":"Boolean indicating whether the patient's congenital malformation is major."} ;; "major congenital malformation"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_congenital_malformation_now@@major
      patient_has_finding_of_congenital_malformation_now)
:named REQ4_AUXILIARY0)) ;; "major congenital malformation"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_congenital_malformation_now@@major)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a major congenital malformation."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_sepsis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sepsis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sepsis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sepsis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sepsis."} ;; "sepsis"
(declare-const patient_is_undergoing_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy."} ;; "antibiotic therapy"
(declare-const patient_is_undergoing_antibiotic_therapy_now@@is_therapeutic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antibiotic therapy and the therapy is therapeutic.","when_to_set_to_false":"Set to false if the patient is currently undergoing antibiotic therapy and the therapy is not therapeutic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antibiotic therapy is therapeutic.","meaning":"Boolean indicating whether the patient is currently undergoing antibiotic therapy and the therapy is therapeutic."} ;; "therapeutic antibiotic therapy"
(declare-const patient_is_undergoing_antifungal_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antifungal (antimycotic) therapy.","when_to_set_to_false":"Set to false if the patient is currently not undergoing antifungal (antimycotic) therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing antifungal (antimycotic) therapy.","meaning":"Boolean indicating whether the patient is currently undergoing antifungal (antimycotic) therapy."} ;; "antimycotic therapy"
(declare-const patient_is_undergoing_antifungal_therapy_now@@is_therapeutic Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing antifungal (antimycotic) therapy and the therapy is therapeutic.","when_to_set_to_false":"Set to false if the patient is currently undergoing antifungal (antimycotic) therapy and the therapy is not therapeutic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the antifungal (antimycotic) therapy is therapeutic.","meaning":"Boolean indicating whether the patient is currently undergoing antifungal (antimycotic) therapy and the therapy is therapeutic."} ;; "therapeutic antimycotic therapy"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_undergoing_antibiotic_therapy_now@@is_therapeutic
      patient_is_undergoing_antibiotic_therapy_now)
   :named REQ5_AUXILIARY0)) ;; "therapeutic antibiotic therapy" implies "antibiotic therapy"

(assert
(! (=> patient_is_undergoing_antifungal_therapy_now@@is_therapeutic
      patient_is_undergoing_antifungal_therapy_now)
   :named REQ5_AUXILIARY1)) ;; "therapeutic antimycotic therapy" implies "antimycotic therapy"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_diagnosis_of_sepsis_now
             (or patient_is_undergoing_antibiotic_therapy_now@@is_therapeutic
                 patient_is_undergoing_antifungal_therapy_now@@is_therapeutic)))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has sepsis) AND ((the patient requires therapeutic antibiotic therapy) OR (the patient requires therapeutic antimycotic therapy))."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing mechanical ventilation (artificial respiration).","when_to_set_to_false":"Set to false if the patient is currently not undergoing mechanical ventilation (artificial respiration).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing mechanical ventilation (artificial respiration).","meaning":"Boolean indicating whether the patient is currently undergoing mechanical ventilation (artificial respiration)."} ;; "mechanical ventilation"
(declare-const fraction_of_inspired_oxygen_value_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the current measured value of the fraction of inspired oxygen (FiO2) the patient is receiving, in percent.","when_to_set_to_null":"Set to null if the current fraction of inspired oxygen (FiO2) is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the current fraction of inspired oxygen (FiO2) the patient is receiving, expressed as a percentage."} ;; "greater than fifty percent fraction of inspired oxygen"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not (and patient_is_undergoing_artificial_respiration_now
             (> fraction_of_inspired_oxygen_value_now_withunit_percent 50)))
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient requires mechanical ventilation with greater than fifty percent fraction of inspired oxygen."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_patent_ductus_arteriosus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of patent ductus arteriosus.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of patent ductus arteriosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of patent ductus arteriosus.","meaning":"Boolean indicating whether the patient currently has patent ductus arteriosus."} ;; "patent ductus arteriosus"
(declare-const patient_has_finding_of_patent_ductus_arteriosus_now@@requires_ibuprofen_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's patent ductus arteriosus requires ibuprofen therapy.","when_to_set_to_false":"Set to false if the patient's patent ductus arteriosus does not require ibuprofen therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether ibuprofen therapy is required for the patient's patent ductus arteriosus.","meaning":"Boolean indicating whether the patient's patent ductus arteriosus requires ibuprofen therapy."} ;; "patent ductus arteriosus requiring ibuprofen therapy"
(declare-const patient_has_finding_of_patent_ductus_arteriosus_now@@requires_indomethacin_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's patent ductus arteriosus requires indomethacin therapy.","when_to_set_to_false":"Set to false if the patient's patent ductus arteriosus does not require indomethacin therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether indomethacin therapy is required for the patient's patent ductus arteriosus.","meaning":"Boolean indicating whether the patient's patent ductus arteriosus requires indomethacin therapy."} ;; "patent ductus arteriosus requiring indomethacin therapy"
(declare-const patient_has_finding_of_patent_ductus_arteriosus_now@@requires_surgical_ligature Bool) ;; {"when_to_set_to_true":"Set to true if the patient's patent ductus arteriosus requires surgical ligature.","when_to_set_to_false":"Set to false if the patient's patent ductus arteriosus does not require surgical ligature.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether surgical ligature is required for the patient's patent ductus arteriosus.","meaning":"Boolean indicating whether the patient's patent ductus arteriosus requires surgical ligature."} ;; "patent ductus arteriosus requiring surgical ligature"
(declare-const time_since_end_of_patent_ductus_arteriosus_treatment_value_recorded_now_withunit_days Real) ;; {"when_to_set_to_value":"Set to the number of days that have passed since the end of the most recent treatment for patent ductus arteriosus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many days have passed since the end of the most recent treatment for patent ductus arteriosus.","meaning":"Numeric value representing the number of days since the end of the most recent treatment for patent ductus arteriosus."} ;; "less than one week has passed since the end of treatment"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_patent_ductus_arteriosus_now@@requires_ibuprofen_therapy
      patient_has_finding_of_patent_ductus_arteriosus_now)
    :named REQ7_AUXILIARY0)) ;; "patent ductus arteriosus requiring ibuprofen therapy"

(assert
(! (=> patient_has_finding_of_patent_ductus_arteriosus_now@@requires_indomethacin_therapy
      patient_has_finding_of_patent_ductus_arteriosus_now)
    :named REQ7_AUXILIARY1)) ;; "patent ductus arteriosus requiring indomethacin therapy"

(assert
(! (=> patient_has_finding_of_patent_ductus_arteriosus_now@@requires_surgical_ligature
      patient_has_finding_of_patent_ductus_arteriosus_now)
    :named REQ7_AUXILIARY2)) ;; "patent ductus arteriosus requiring surgical ligature"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have PDA requiring ibuprofen, indomethacin, or surgical ligature AND less than one week since end of treatment
(assert
(! (not (and
         (or patient_has_finding_of_patent_ductus_arteriosus_now@@requires_ibuprofen_therapy
             patient_has_finding_of_patent_ductus_arteriosus_now@@requires_indomethacin_therapy
             patient_has_finding_of_patent_ductus_arteriosus_now@@requires_surgical_ligature)
         (< time_since_end_of_patent_ductus_arteriosus_treatment_value_recorded_now_withunit_days 7)))
    :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "((the patient has patent ductus arteriosus requiring ibuprofen therapy) OR (the patient has patent ductus arteriosus requiring indomethacin therapy) OR (the patient has patent ductus arteriosus requiring surgical ligature)) AND less than one week has passed since the end of treatment."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_ventricular_hemorrhage_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of intraventricular (ventricular) hemorrhage.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of intraventricular (ventricular) hemorrhage.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of intraventricular (ventricular) hemorrhage.","meaning":"Boolean indicating whether the patient currently has intraventricular (ventricular) hemorrhage."} ;; "intraventricular hemorrhage"
(declare-const patient_has_finding_of_ventricular_hemorrhage_now@@grade_three Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intraventricular (ventricular) hemorrhage and the hemorrhage is grade three.","when_to_set_to_false":"Set to false if the patient currently has intraventricular (ventricular) hemorrhage but the grade is not three.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hemorrhage is grade three.","meaning":"Boolean indicating whether the patient's intraventricular (ventricular) hemorrhage is grade three."} ;; "intraventricular hemorrhage grade three"
(declare-const patient_has_finding_of_ventricular_hemorrhage_now@@grade_four Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has intraventricular (ventricular) hemorrhage and the hemorrhage is grade four.","when_to_set_to_false":"Set to false if the patient currently has intraventricular (ventricular) hemorrhage but the grade is not four.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hemorrhage is grade four.","meaning":"Boolean indicating whether the patient's intraventricular (ventricular) hemorrhage is grade four."} ;; "intraventricular hemorrhage grade four"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_ventricular_hemorrhage_now@@grade_three
      patient_has_finding_of_ventricular_hemorrhage_now)
:named REQ8_AUXILIARY0)) ;; "intraventricular hemorrhage grade three"

(assert
(! (=> patient_has_finding_of_ventricular_hemorrhage_now@@grade_four
      patient_has_finding_of_ventricular_hemorrhage_now)
:named REQ8_AUXILIARY1)) ;; "intraventricular hemorrhage grade four"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_ventricular_hemorrhage_now@@grade_three)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intraventricular hemorrhage grade three."

(assert
(! (not patient_has_finding_of_ventricular_hemorrhage_now@@grade_four)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has intraventricular hemorrhage grade four."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_hypernatremia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypernatremia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypernatremia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypernatremia.","meaning":"Boolean indicating whether the patient currently has hypernatremia."} ;; "hypernatremia"
(declare-const patient_sodium_value_recorded_now_in_millimoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the patient's current sodium level in millimoles per liter if available.","when_to_set_to_null":"Set to null if the patient's current sodium level is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current sodium level in millimoles per liter."} ;; "sodium level greater than or equal to one hundred fifty millimoles per liter"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Definition: hypernatremia with sodium level >= 150 mmol/L
(assert
(! (= patient_has_finding_of_hypernatremia_now
    (>= patient_sodium_value_recorded_now_in_millimoles_per_liter 150))
:named REQ9_AUXILIARY0)) ;; "hypernatremia with sodium level greater than or equal to one hundred fifty millimoles per liter"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_hypernatremia_now)
:named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypernatremia with sodium level greater than or equal to one hundred fifty millimoles per liter."
