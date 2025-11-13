;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_symptoms_of_stridor_now@@due_to_any_other_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current symptoms of stridor are due to any cause other than the primary condition of interest.","when_to_set_to_false":"Set to false if the patient's current symptoms of stridor are not due to any other cause (i.e., are due to the primary condition of interest or cause is unknown).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current symptoms of stridor are due to any other cause.","meaning":"Boolean indicating whether the patient's current symptoms of stridor are due to any other cause."} ;; "the patient has symptoms of any other cause of stridor"
(declare-const patient_has_clinical_signs_of_stridor_now@@due_to_any_other_cause Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current clinical signs of stridor are due to any cause other than the primary condition of interest.","when_to_set_to_false":"Set to false if the patient's current clinical signs of stridor are not due to any other cause (i.e., are due to the primary condition of interest or cause is unknown).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current clinical signs of stridor are due to any other cause.","meaning":"Boolean indicating whether the patient's current clinical signs of stridor are due to any other cause."} ;; "the patient has signs of any other cause of stridor"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_symptoms_of_stridor_now@@due_to_any_other_cause)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of any other cause of stridor."

(assert
  (! (not patient_has_clinical_signs_of_stridor_now@@due_to_any_other_cause)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of any other cause of stridor."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_angioedema_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a documented episode of angioedema (acute angioneurotic oedema) at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a documented episode of angioedema (acute angioneurotic oedema) in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had angioedema (acute angioneurotic oedema) in their medical history.","meaning":"Boolean indicating whether the patient has ever had angioedema (acute angioneurotic oedema) in their medical history."} ;; "has a history of previous episode of acute angioneurotic oedema"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_angioedema_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of previous episode of acute angioneurotic oedema."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_croup_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of croup.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of croup.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of croup.","meaning":"Boolean indicating whether the patient currently has a diagnosis of croup."} ;; "diagnosis of croup"
(declare-const patient_has_diagnosis_of_croup_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of croup and the croup is severe (Westley score > 8).","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of croup and the croup is not severe (Westley score ≤ 8).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the croup is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of croup and the croup is severe (Westley score > 8)."} ;; "diagnosis of severe croup (Westley score > 8)"
(declare-const westley_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current Westley croup score in points, if available.","when_to_set_to_null":"Set to null if the patient's current Westley croup score is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current Westley croup score, recorded now, in points."} ;; "Westley score > 8"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Definition: severe croup = croup diagnosis AND Westley score > 8
(assert
(! (= patient_has_diagnosis_of_croup_now@@severe
     (and patient_has_diagnosis_of_croup_now
          (> westley_score_value_recorded_now_withunit_points 8)))
   :named REQ2_AUXILIARY0)) ;; "severe croup (Westley score > 8)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_diagnosis_of_croup_now@@severe
       patient_has_diagnosis_of_croup_now)
   :named REQ2_AUXILIARY1)) ;; "diagnosis of severe croup implies diagnosis of croup"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_croup_now@@severe)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of severe croup (Westley score > 8)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_congenital_laryngeal_stridor_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had the clinical finding of congenital laryngeal stridor.","when_to_set_to_false":"Set to false if the patient has never had the clinical finding of congenital laryngeal stridor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had congenital laryngeal stridor.","meaning":"Boolean indicating whether the patient has ever had congenital laryngeal stridor."} ;; "the patient has a history of congenital stridor"
(declare-const patient_has_finding_of_stridor_inthehistory@@acquired Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had acquired stridor.","when_to_set_to_false":"Set to false if the patient has only had congenital stridor or no stridor at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's stridor is acquired.","meaning":"Boolean indicating whether the patient's stridor is acquired."} ;; "the patient has a history of acquired stridor"
(declare-const patient_has_diagnosis_of_epiglottitis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of epiglottitis.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of epiglottitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of epiglottitis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of epiglottitis."} ;; "the patient has a diagnosis of epiglottitis"
(declare-const patient_has_diagnosis_of_chronic_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of chronic lung disease.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of chronic lung disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of chronic lung disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of chronic lung disease."} ;; "the patient has a diagnosis of chronic pulmonary disease"
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of asthma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of asthma."} ;; "the patient has a diagnosis of asthma"
(declare-const patient_has_diagnosis_of_systemic_disease_inthehistory@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of severe systemic disease.","when_to_set_to_false":"Set to false if the patient has only had non-severe systemic disease or no systemic disease at all.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's systemic disease is severe.","meaning":"Boolean indicating whether the patient's systemic disease is severe."} ;; "the patient has a diagnosis of severe systemic disease"
(declare-const patient_has_finding_of_varicella_inthepast21days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had the clinical finding of varicella (chickenpox) within the past 21 days.","when_to_set_to_false":"Set to false if the patient has not had the clinical finding of varicella (chickenpox) within the past 21 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had varicella (chickenpox) within the past 21 days.","meaning":"Boolean indicating whether the patient has had varicella (chickenpox) within the past 21 days."} ;; "the patient has exposure to chickenpox virus within the previous 21 days"
(declare-const patient_has_diagnosis_of_disorder_of_immune_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of immune dysfunction.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of immune dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of immune dysfunction.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of immune dysfunction."} ;; "the patient has a diagnosis of immune dysfunction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_congenital_laryngeal_stridor_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of congenital stridor."

(assert
(! (not patient_has_finding_of_stridor_inthehistory@@acquired)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acquired stridor."

(assert
(! (not patient_has_diagnosis_of_epiglottitis_inthehistory)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of epiglottitis."

(assert
(! (not patient_has_diagnosis_of_chronic_lung_disease_inthehistory)
:named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of chronic pulmonary disease."

(assert
(! (not patient_has_diagnosis_of_asthma_inthehistory)
:named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of asthma."

(assert
(! (not patient_has_diagnosis_of_systemic_disease_inthehistory@@severe)
:named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of severe systemic disease."

(assert
(! (not patient_has_finding_of_varicella_inthepast21days)
:named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has exposure to chickenpox virus within the previous 21 days."

(assert
(! (not patient_has_diagnosis_of_disorder_of_immune_function_inthehistory)
:named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a diagnosis of immune dysfunction."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an acute disease.","when_to_set_to_false":"Set to false if the patient currently does not have an acute disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an acute disease.","meaning":"Boolean indicating whether the patient currently has an acute disease."} ;; "acute medical condition"
(declare-const patient_has_finding_of_acute_disease_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the acute disease is severe.","when_to_set_to_false":"Set to false if the acute disease is not severe.","when_to_set_to_null":"Set to null if severity of the acute disease is unknown or indeterminate.","meaning":"Boolean indicating whether the acute disease is severe."} ;; "severe acute medical condition"
(declare-const patient_has_finding_of_acute_disease_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate Bool) ;; {"when_to_set_to_true":"Set to true if the acute disease may increase risk associated with study participation or drug administration, or may interfere with interpretation of study results, and in the investigator's judgment, would make the patient inappropriate for study entry.","when_to_set_to_false":"Set to false if none of these conditions apply.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether these conditions apply.","meaning":"Boolean indicating whether the acute disease meets the risk/interference/investigator judgment exclusion criteria."} ;; "the condition may increase the risk associated with study participation OR the condition may increase the risk associated with study drug administration OR the condition may interfere with the interpretation of study results AND in the judgment of the investigator, the condition would make the patient inappropriate for entry into this study"
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic medical condition"
(declare-const patient_has_finding_of_chronic_disease_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate Bool) ;; {"when_to_set_to_true":"Set to true if the chronic disease may increase risk associated with study participation or drug administration, or may interfere with interpretation of study results, and in the investigator's judgment, would make the patient inappropriate for study entry.","when_to_set_to_false":"Set to false if none of these conditions apply.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether these conditions apply.","meaning":"Boolean indicating whether the chronic disease meets the risk/interference/investigator judgment exclusion criteria."} ;; "the condition may increase the risk associated with study participation OR the condition may increase the risk associated with study drug administration OR the condition may interfere with the interpretation of study results AND in the judgment of the investigator, the condition would make the patient inappropriate for entry into this study"
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@is_acute Bool) ;; {"when_to_set_to_true":"Set to true if the mental disorder is acute.","when_to_set_to_false":"Set to false if the mental disorder is not acute.","when_to_set_to_null":"Set to null if acuity of the mental disorder is unknown or indeterminate.","meaning":"Boolean indicating whether the mental disorder is acute."} ;; "acute psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the mental disorder is severe.","when_to_set_to_false":"Set to false if the mental disorder is not severe.","when_to_set_to_null":"Set to null if severity of the mental disorder is unknown or indeterminate.","meaning":"Boolean indicating whether the mental disorder is severe."} ;; "severe psychiatric condition"
(declare-const patient_has_finding_of_mental_disorder_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate Bool) ;; {"when_to_set_to_true":"Set to true if the mental disorder may increase risk associated with study participation or drug administration, or may interfere with interpretation of study results, and in the investigator's judgment, would make the patient inappropriate for study entry.","when_to_set_to_false":"Set to false if none of these conditions apply.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether these conditions apply.","meaning":"Boolean indicating whether the mental disorder meets the risk/interference/investigator judgment exclusion criteria."} ;; "the condition may increase the risk associated with study participation OR the condition may increase the risk associated with study drug administration OR the condition may interfere with the interpretation of study results AND in the judgment of the investigator, the condition would make the patient inappropriate for entry into this study"
(declare-const patient_has_finding_of_chronic_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic mental disorder.","meaning":"Boolean indicating whether the patient currently has a chronic mental disorder."} ;; "chronic psychiatric condition"
(declare-const patient_has_finding_of_chronic_mental_disorder_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the chronic mental disorder is severe.","when_to_set_to_false":"Set to false if the chronic mental disorder is not severe.","when_to_set_to_null":"Set to null if severity of the chronic mental disorder is unknown or indeterminate.","meaning":"Boolean indicating whether the chronic mental disorder is severe."} ;; "severe chronic psychiatric condition"
(declare-const patient_has_finding_of_chronic_mental_disorder_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate Bool) ;; {"when_to_set_to_true":"Set to true if the chronic mental disorder may increase risk associated with study participation or drug administration, or may interfere with interpretation of study results, and in the investigator's judgment, would make the patient inappropriate for study entry.","when_to_set_to_false":"Set to false if none of these conditions apply.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether these conditions apply.","meaning":"Boolean indicating whether the chronic mental disorder meets the risk/interference/investigator judgment exclusion criteria."} ;; "the condition may increase the risk associated with study participation OR the condition may increase the risk associated with study drug administration OR the condition may interfere with the interpretation of study results AND in the judgment of the investigator, the condition would make the patient inappropriate for entry into this study"
(declare-const patient_has_finding_of_severe_acute_laboratory_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other severe acute laboratory abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have any other severe acute laboratory abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other severe acute laboratory abnormality.","meaning":"Boolean indicating whether the patient currently has any other severe acute laboratory abnormality."} ;; "severe acute laboratory abnormality"
(declare-const patient_has_finding_of_severe_acute_laboratory_abnormality_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate Bool) ;; {"when_to_set_to_true":"Set to true if the severe acute laboratory abnormality may increase risk associated with study participation or drug administration, or may interfere with interpretation of study results, and in the investigator's judgment, would make the patient inappropriate for study entry.","when_to_set_to_false":"Set to false if none of these conditions apply.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether these conditions apply.","meaning":"Boolean indicating whether the severe acute laboratory abnormality meets the risk/interference/investigator judgment exclusion criteria."} ;; "the condition may increase the risk associated with study participation OR the condition may increase the risk associated with study drug administration OR the condition may interfere with the interpretation of study results AND in the judgment of the investigator, the condition would make the patient inappropriate for entry into this study"
(declare-const patient_has_finding_of_severe_chronic_laboratory_abnormality_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any other severe chronic laboratory abnormality.","when_to_set_to_false":"Set to false if the patient currently does not have any other severe chronic laboratory abnormality.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any other severe chronic laboratory abnormality.","meaning":"Boolean indicating whether the patient currently has any other severe chronic laboratory abnormality."} ;; "severe chronic laboratory abnormality"
(declare-const patient_has_finding_of_severe_chronic_laboratory_abnormality_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate Bool) ;; {"when_to_set_to_true":"Set to true if the severe chronic laboratory abnormality may increase risk associated with study participation or drug administration, or may interfere with interpretation of study results, and in the investigator's judgment, would make the patient inappropriate for study entry.","when_to_set_to_false":"Set to false if none of these conditions apply.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether these conditions apply.","meaning":"Boolean indicating whether the severe chronic laboratory abnormality meets the risk/interference/investigator judgment exclusion criteria."} ;; "the condition may increase the risk associated with study participation OR the condition may increase the risk associated with study drug administration OR the condition may interfere with the interpretation of study results AND in the judgment of the investigator, the condition would make the patient inappropriate for entry into this study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_acute_disease_now@@is_severe
      patient_has_finding_of_acute_disease_now)
    :named REQ4_AUXILIARY0)) ;; "severe acute medical condition"

(assert
(! (=> patient_has_finding_of_acute_disease_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate
      patient_has_finding_of_acute_disease_now)
    :named REQ4_AUXILIARY1)) ;; "acute medical condition with risk/interference/investigator judgment exclusion"

(assert
(! (=> patient_has_finding_of_chronic_disease_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate
      patient_has_finding_of_chronic_disease_now)
    :named REQ4_AUXILIARY2)) ;; "chronic medical condition with risk/interference/investigator judgment exclusion"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@is_acute
      patient_has_finding_of_mental_disorder_now)
    :named REQ4_AUXILIARY3)) ;; "acute psychiatric condition"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@is_severe
      patient_has_finding_of_mental_disorder_now)
    :named REQ4_AUXILIARY4)) ;; "severe psychiatric condition"

(assert
(! (=> patient_has_finding_of_mental_disorder_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate
      patient_has_finding_of_mental_disorder_now)
    :named REQ4_AUXILIARY5)) ;; "psychiatric condition with risk/interference/investigator judgment exclusion"

(assert
(! (=> patient_has_finding_of_chronic_mental_disorder_now@@is_severe
      patient_has_finding_of_chronic_mental_disorder_now)
    :named REQ4_AUXILIARY6)) ;; "severe chronic psychiatric condition"

(assert
(! (=> patient_has_finding_of_chronic_mental_disorder_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate
      patient_has_finding_of_chronic_mental_disorder_now)
    :named REQ4_AUXILIARY7)) ;; "chronic psychiatric condition with risk/interference/investigator judgment exclusion"

(assert
(! (=> patient_has_finding_of_severe_acute_laboratory_abnormality_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate
      patient_has_finding_of_severe_acute_laboratory_abnormality_now)
    :named REQ4_AUXILIARY8)) ;; "severe acute laboratory abnormality with risk/interference/investigator judgment exclusion"

(assert
(! (=> patient_has_finding_of_severe_chronic_laboratory_abnormality_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate
      patient_has_finding_of_severe_chronic_laboratory_abnormality_now)
    :named REQ4_AUXILIARY9)) ;; "severe chronic laboratory abnormality with risk/interference/investigator judgment exclusion"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have any of the following (each ANDed with the risk/interference/investigator judgment qualifier)
(assert
(! (not
      (or
        (and patient_has_finding_of_acute_disease_now@@is_severe
             patient_has_finding_of_acute_disease_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate)
        (and patient_has_finding_of_chronic_disease_now
             patient_has_finding_of_chronic_disease_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate)
        (and patient_has_finding_of_mental_disorder_now@@is_acute
             patient_has_finding_of_mental_disorder_now@@is_severe
             patient_has_finding_of_mental_disorder_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate)
        (and patient_has_finding_of_chronic_mental_disorder_now@@is_severe
             patient_has_finding_of_chronic_mental_disorder_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate)
        (and patient_has_finding_of_severe_acute_laboratory_abnormality_now
             patient_has_finding_of_severe_acute_laboratory_abnormality_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate)
        (and patient_has_finding_of_severe_chronic_laboratory_abnormality_now
             patient_has_finding_of_severe_chronic_laboratory_abnormality_now@@may_increase_risk_or_interfere_or_investigator_judgment_inappropriate)
      )
   )
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has any other severe acute medical condition) OR (the patient has any other severe chronic medical condition) OR (the patient has any other severe acute psychiatric condition) OR (the patient has any other severe chronic psychiatric condition) OR (the patient has any other severe acute laboratory abnormality) OR (the patient has any other severe chronic laboratory abnormality)) AND (((the condition may increase the risk associated with study participation) OR (the condition may increase the risk associated with study drug administration) OR (the condition may interfere with the interpretation of study results)) AND (in the judgment of the investigator, the condition would make the patient inappropriate for entry into this study))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks, by any route.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks, by any route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks.","meaning":"Boolean indicating whether the patient has taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks, regardless of route."} ;; "the patient has received treatment with oral corticosteroids within the previous 2 weeks" OR "the patient has received treatment with parenteral corticosteroids within the previous 2 weeks"

(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks@@route_oral Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks by the oral route.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks by the oral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route was oral.","meaning":"Boolean indicating whether the route of administration for corticosteroid or corticosteroid-derivative containing product taken within the past 2 weeks was oral."} ;; "the patient has received treatment with oral corticosteroids within the previous 2 weeks"

(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks@@route_parenteral Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks by the parenteral route.","when_to_set_to_false":"Set to false if the patient has not taken any corticosteroid or corticosteroid-derivative containing product within the past 2 weeks by the parenteral route.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the route was parenteral.","meaning":"Boolean indicating whether the route of administration for corticosteroid or corticosteroid-derivative containing product taken within the past 2 weeks was parenteral."} ;; "the patient has received treatment with parenteral corticosteroids within the previous 2 weeks"

(declare-const patient_is_exposed_to_epinephrine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to epinephrine at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to epinephrine at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to epinephrine.","meaning":"Boolean indicating whether the patient has ever been exposed to epinephrine at any time in the past."} ;; "the patient has received treatment with epinephrine for respiratory distress before enrollment"

(declare-const patient_is_exposed_to_epinephrine_inthehistory@@indication_respiratory_distress Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to epinephrine at any time in the past and the indication was respiratory distress.","when_to_set_to_false":"Set to false if the patient has ever been exposed to epinephrine at any time in the past and the indication was not respiratory distress.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the indication was respiratory distress.","meaning":"Boolean indicating whether the indication for epinephrine exposure was respiratory distress."} ;; "the patient has received treatment with epinephrine for respiratory distress before enrollment"

(declare-const patient_is_exposed_to_epinephrine_inthehistory@@temporalcontext_before_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to epinephrine at any time in the past and the exposure occurred before enrollment.","when_to_set_to_false":"Set to false if the patient has ever been exposed to epinephrine at any time in the past and the exposure did not occur before enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred before enrollment.","meaning":"Boolean indicating whether the exposure to epinephrine occurred before enrollment."} ;; "the patient has received treatment with epinephrine for respiratory distress before enrollment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variables imply corresponding stem variables for corticosteroids
(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks@@route_oral
       patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks)
    :named REQ5_AUXILIARY0)) ;; "the patient has received treatment with oral corticosteroids within the previous 2 weeks"

(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks@@route_parenteral
       patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks)
    :named REQ5_AUXILIARY1)) ;; "the patient has received treatment with parenteral corticosteroids within the previous 2 weeks"

;; Qualifier variables imply corresponding stem variables for epinephrine
(assert
(! (=> patient_is_exposed_to_epinephrine_inthehistory@@indication_respiratory_distress
       patient_is_exposed_to_epinephrine_inthehistory)
    :named REQ5_AUXILIARY2)) ;; "the patient has received treatment with epinephrine for respiratory distress before enrollment"

(assert
(! (=> patient_is_exposed_to_epinephrine_inthehistory@@temporalcontext_before_enrollment
       patient_is_exposed_to_epinephrine_inthehistory)
    :named REQ5_AUXILIARY3)) ;; "the patient has received treatment with epinephrine for respiratory distress before enrollment"

;; Epinephrine for respiratory distress before enrollment: both qualifiers must be true
(assert
(! (= (and patient_is_exposed_to_epinephrine_inthehistory@@indication_respiratory_distress
           patient_is_exposed_to_epinephrine_inthehistory@@temporalcontext_before_enrollment)
      (and patient_is_exposed_to_epinephrine_inthehistory@@indication_respiratory_distress
           patient_is_exposed_to_epinephrine_inthehistory@@temporalcontext_before_enrollment))
    :named REQ5_AUXILIARY4)) ;; "the patient has received treatment with epinephrine for respiratory distress before enrollment"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have received oral corticosteroids within previous 2 weeks
(assert
(! (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks@@route_oral)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with oral corticosteroids within the previous 2 weeks."

;; Exclusion: patient must NOT have received parenteral corticosteroids within previous 2 weeks
(assert
(! (not patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast2weeks@@route_parenteral)
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with parenteral corticosteroids within the previous 2 weeks."

;; Exclusion: patient must NOT have received epinephrine for respiratory distress before enrollment
(assert
(! (not (and patient_is_exposed_to_epinephrine_inthehistory@@indication_respiratory_distress
             patient_is_exposed_to_epinephrine_inthehistory@@temporalcontext_before_enrollment))
    :named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received treatment with epinephrine for respiratory distress before enrollment."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const number_of_previous_visits_to_emergency_room_department_due_to_croup_during_this_episode_of_the_disease_value_recorded_in_integer Real) ;; {"when_to_set_to_value":"Set to the integer value representing the number of previous visits to an emergency room department due to croup during the current episode of the disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many previous visits to an emergency room department due to croup occurred during the current episode of the disease.","meaning":"Integer value indicating the number of previous visits to an emergency room department due to croup during the current episode of the disease."} ;; "number of previous visits to an emergency room department due to croup during this episode of the disease"

(declare-const patient_has_diagnosis_of_croup_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been diagnosed with croup at any time in their history.","when_to_set_to_false":"Set to false if the patient has never been diagnosed with croup at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been diagnosed with croup.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of croup in their history."} ;; "croup"

(declare-const patient_has_diagnosis_of_croup_inthehistory@@diagnosis_occurred_during_this_episode_of_the_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of croup occurred during the current episode of the disease.","when_to_set_to_false":"Set to false if the patient's diagnosis of croup did not occur during the current episode of the disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of croup occurred during the current episode of the disease.","meaning":"Boolean indicating whether the patient's diagnosis of croup occurred during the current episode of the disease."} ;; "diagnosis of croup occurred during this episode of the disease"

(declare-const patient_has_previous_visit_to_emergency_room_department_due_to_croup_during_this_episode_of_the_disease Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a previous visit to an emergency room department due to croup during the current episode of the disease.","when_to_set_to_false":"Set to false if the patient has not had a previous visit to an emergency room department due to croup during the current episode of the disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a previous visit to an emergency room department due to croup during the current episode of the disease.","meaning":"Boolean indicating whether the patient has had a previous visit to an emergency room department due to croup during the current episode of the disease."} ;; "previous visit to an emergency room department due to croup during this episode of the disease"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Link the Boolean variable to the numeric count: if number_of_previous_visits > 0, then patient_has_previous_visit_to_emergency_room_department_due_to_croup_during_this_episode_of_the_disease is true
(assert
(! (=> (> number_of_previous_visits_to_emergency_room_department_due_to_croup_during_this_episode_of_the_disease_value_recorded_in_integer 0)
     patient_has_previous_visit_to_emergency_room_department_due_to_croup_during_this_episode_of_the_disease)
:named REQ6_AUXILIARY0)) ;; "has had a previous visit to an emergency room department due to croup during this episode of the disease"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_previous_visit_to_emergency_room_department_due_to_croup_during_this_episode_of_the_disease)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a previous visit to an emergency room department due to croup during this episode of the disease."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const parent_is_unable_to_understand_nature_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is unable to understand the nature of the study.","when_to_set_to_false":"Set to false if the patient's parent is able to understand the nature of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is unable to understand the nature of the study.","meaning":"Boolean indicating whether the patient's parent is unable to understand the nature of the study."} ;; "the patient has a parent who is unable to understand the nature of the study"
(declare-const parent_is_unable_to_understand_scope_of_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is unable to understand the scope of the study.","when_to_set_to_false":"Set to false if the patient's parent is able to understand the scope of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is unable to understand the scope of the study.","meaning":"Boolean indicating whether the patient's parent is unable to understand the scope of the study."} ;; "the patient has a parent who is unable to understand the scope of the study"
(declare-const parent_is_unable_to_understand_possible_benefits_of_study_treatments Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is unable to understand the possible benefits of the study treatments.","when_to_set_to_false":"Set to false if the patient's parent is able to understand the possible benefits of the study treatments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is unable to understand the possible benefits of the study treatments.","meaning":"Boolean indicating whether the patient's parent is unable to understand the possible benefits of the study treatments."} ;; "the patient has a parent who is unable to understand the possible benefits of the study treatments"
(declare-const parent_is_unable_to_understand_unwanted_effects_of_study_treatments Bool) ;; {"when_to_set_to_true":"Set to true if the patient's parent is unable to understand the unwanted effects of the study treatments.","when_to_set_to_false":"Set to false if the patient's parent is able to understand the unwanted effects of the study treatments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's parent is unable to understand the unwanted effects of the study treatments.","meaning":"Boolean indicating whether the patient's parent is unable to understand the unwanted effects of the study treatments."} ;; "the patient has a parent who is unable to understand the unwanted effects of the study treatments"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not parent_is_unable_to_understand_nature_of_study)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a parent who is unable to understand the nature of the study."

(assert
(! (not parent_is_unable_to_understand_scope_of_study)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a parent who is unable to understand the scope of the study."

(assert
(! (not parent_is_unable_to_understand_possible_benefits_of_study_treatments)
:named REQ7_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a parent who is unable to understand the possible benefits of the study treatments."

(assert
(! (not parent_is_unable_to_understand_unwanted_effects_of_study_treatments)
:named REQ7_COMPONENT3_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has a parent who is unable to understand the unwanted effects of the study treatments."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_undergone_clinical_trial_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been enrolled in or undergone a clinical trial procedure at any time in the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not been enrolled in or undergone a clinical trial procedure in the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a clinical trial procedure in the past 4 weeks.","meaning":"Boolean indicating whether the patient has undergone a clinical trial procedure in the past 4 weeks."} ;; "the patient has been enrolled in another clinical trial in the previous 4 weeks"

(declare-const patient_is_enrolled_in_this_study_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently admitted or enrolled in this study.","when_to_set_to_false":"Set to false if the patient is not currently admitted or enrolled in this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently admitted or enrolled in this study.","meaning":"Boolean indicating whether the patient is currently admitted or enrolled in this study."} ;; "the patient is already admitted in this study"

(declare-const patient_is_enrolled_in_this_study_now@@this_study Bool) ;; {"when_to_set_to_true":"Set to true if the study in which the patient is currently admitted or enrolled is this study (the one for which the patient is being considered).","when_to_set_to_false":"Set to false if the study in which the patient is currently admitted or enrolled is not this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the study in which the patient is currently admitted or enrolled is this study.","meaning":"Boolean indicating whether the study in which the patient is currently admitted or enrolled is this study."} ;; "the patient is already admitted in this study"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_enrolled_in_this_study_now@@this_study
      patient_is_enrolled_in_this_study_now)
:named REQ8_AUXILIARY0)) ;; "the study in which the patient is currently admitted or enrolled is this study"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not (or patient_has_undergone_clinical_trial_inthepast4weeks
            patient_is_enrolled_in_this_study_now@@this_study))
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has been enrolled in another clinical trial in the previous 4 weeks) OR (the patient is already admitted in this study)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_telephone_at_home_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a telephone at home.","when_to_set_to_false":"Set to false if the patient currently does not have a telephone at home.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a telephone at home.","meaning":"Boolean indicating whether the patient currently has a telephone at home."} ;; "the patient lacks a telephone at home"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (not patient_has_telephone_at_home_now))
:named REQ9_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lacks a telephone at home."
