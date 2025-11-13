;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "age > 64 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (> patient_age_value_recorded_now_in_years 64)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be (age > 64 years)."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of major depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of major depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of major depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of major depressive disorder."}  ;; "diagnosis of major depressive disorder"
(declare-const patient_has_diagnosis_of_major_depressive_disorder_now@@determined_by_structured_clinical_interview_for_dsm_using_dsm_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of major depressive disorder is determined by Structured Clinical Interview for the DSM using DSM criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of major depressive disorder is not determined by Structured Clinical Interview for the DSM using DSM criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was determined by Structured Clinical Interview for the DSM using DSM criteria.","meaning":"Boolean indicating whether the patient's diagnosis of major depressive disorder is determined by Structured Clinical Interview for the DSM using DSM criteria."}  ;; "diagnosis of major depressive disorder, as determined by Structured Clinical Interview for the DSM using DSM criteria"
(declare-const patient_has_diagnosis_of_unipolar_depressive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of unipolar depressive disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of unipolar depressive disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of unipolar depressive disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of unipolar depressive disorder."}  ;; "diagnosis of unipolar depressive disorder"
(declare-const patient_has_diagnosis_of_unipolar_depressive_disorder_now@@determined_by_structured_clinical_interview_for_dsm_using_dsm_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of unipolar depressive disorder is determined by Structured Clinical Interview for the DSM using DSM criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of unipolar depressive disorder is not determined by Structured Clinical Interview for the DSM using DSM criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis was determined by Structured Clinical Interview for the DSM using DSM criteria.","meaning":"Boolean indicating whether the patient's diagnosis of unipolar depressive disorder is determined by Structured Clinical Interview for the DSM using DSM criteria."}  ;; "diagnosis of unipolar depressive disorder, as determined by Structured Clinical Interview for the DSM using DSM criteria"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_major_depressive_disorder_now@@determined_by_structured_clinical_interview_for_dsm_using_dsm_criteria
         patient_has_diagnosis_of_major_depressive_disorder_now)
     :named REQ1_AUXILIARY0)) ;; "diagnosis of major depressive disorder, as determined by Structured Clinical Interview for the DSM using DSM criteria"

(assert
  (! (=> patient_has_diagnosis_of_unipolar_depressive_disorder_now@@determined_by_structured_clinical_interview_for_dsm_using_dsm_criteria
         patient_has_diagnosis_of_unipolar_depressive_disorder_now)
     :named REQ1_AUXILIARY1)) ;; "diagnosis of unipolar depressive disorder, as determined by Structured Clinical Interview for the DSM using DSM criteria"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must have (diagnosis of major depressive disorder OR diagnosis of unipolar depressive disorder), as determined by Structured Clinical Interview for DSM using DSM criteria
(assert
  (! (or patient_has_diagnosis_of_major_depressive_disorder_now@@determined_by_structured_clinical_interview_for_dsm_using_dsm_criteria
         patient_has_diagnosis_of_unipolar_depressive_disorder_now@@determined_by_structured_clinical_interview_for_dsm_using_dsm_criteria)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "diagnosis of major depressive disorder OR diagnosis of unipolar depressive disorder, as determined by Structured Clinical Interview for the DSM using DSM criteria"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Montgomery Asberg Depression Rating Scale score is recorded now.","when_to_set_to_null":"Set to null if no such score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Montgomery Asberg Depression Rating Scale score."}  ;; "Montgomery Asberg Depression Rating Scale score ≥ 18"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_madrs_montgomery_asberg_depression_rating_scale_score_value_recorded_now_withunit_score 18)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (Montgomery Asberg Depression Rating Scale score ≥ 18)."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const number_of_instrumental_activities_of_daily_living_impaired_now_measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale Real) ;; {"when_to_set_to_value":"Set to the number of instrumental activities of daily living in which the patient is currently impaired, as measured by the Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many instrumental activities of daily living are impaired as measured by the specified instrument.","meaning":"Numeric value representing the number of instrumental activities of daily living in which the patient is currently impaired, as measured by the Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale."}  ;; "impairment in ≥ 1 instrumental activity of daily living as measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale"
(declare-const patient_has_finding_of_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of disability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has disability.","meaning":"Boolean indicating whether the patient currently has disability."}  ;; "disability"
(declare-const patient_has_finding_of_disability_now@@defined_as_impairment_in_at_least_one_instrumental_activity_of_daily_living_measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's disability is defined as impairment in at least one instrumental activity of daily living measured by the Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale.","when_to_set_to_false":"Set to false if the patient's disability is not defined in this way.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's disability is defined as impairment in at least one instrumental activity of daily living measured by the specified instrument.","meaning":"Boolean indicating whether the patient's disability is defined as impairment in at least one instrumental activity of daily living measured by the Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale."}  ;; "disability defined as impairment in ≥ 1 instrumental activity of daily living as measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale"
(declare-const patients_instrumental_activity_of_daily_living_is_abnormal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's instrumental activity of daily living is currently abnormal (impaired).","when_to_set_to_false":"Set to false if the patient's instrumental activity of daily living is currently normal (not impaired).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's instrumental activity of daily living is abnormal.","meaning":"Boolean indicating whether the patient's instrumental activity of daily living is currently abnormal (impaired)."}  ;; "instrumental activity of daily living is abnormal (impaired)"
(declare-const patients_instrumental_activity_of_daily_living_is_abnormal_now@@measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale Bool) ;; {"when_to_set_to_true":"Set to true if the patient's instrumental activity of daily living abnormality is measured by the Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale.","when_to_set_to_false":"Set to false if the abnormality is not measured by this instrument.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormality is measured by the specified instrument.","meaning":"Boolean indicating whether the patient's instrumental activity of daily living abnormality is measured by the Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale."}  ;; "instrumental activity of daily living abnormality measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_disability_now@@defined_as_impairment_in_at_least_one_instrumental_activity_of_daily_living_measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale
        patient_has_finding_of_disability_now)
     :named REQ3_AUXILIARY0)) ;; "disability defined as impairment in ≥ 1 instrumental activity of daily living as measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale"

;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patients_instrumental_activity_of_daily_living_is_abnormal_now@@measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale
        patients_instrumental_activity_of_daily_living_is_abnormal_now)
     :named REQ3_AUXILIARY1)) ;; "instrumental activity of daily living abnormality measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale"

;; Definitional equality: disability defined as impairment in ≥ 1 instrumental activity of daily living as measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale
(assert
  (! (= patient_has_finding_of_disability_now@@defined_as_impairment_in_at_least_one_instrumental_activity_of_daily_living_measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale
        (>= number_of_instrumental_activities_of_daily_living_impaired_now_measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale 1))
     :named REQ3_AUXILIARY2)) ;; "disability defined as impairment in ≥ 1 instrumental activity of daily living as measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_has_finding_of_disability_now@@defined_as_impairment_in_at_least_one_instrumental_activity_of_daily_living_measured_by_philadelphia_multilevel_assessment_instrument_instrumental_activities_of_daily_living_subscale
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (disability defined as impairment in ≥ 1 instrumental activity of daily living as measured by Philadelphia Multilevel Assessment Instrument - Instrumental Activities of Daily Living subscale)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const dementia_rating_scale_total_score_value_recorded_now_withunit_points Real) ;; {"when_to_set_to_value":"Set to the value of the patient's Dementia Rating Scale total score, recorded at the current time, in points.","when_to_set_to_null":"Set to null if the Dementia Rating Scale total score is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric variable representing the patient's Dementia Rating Scale total score, recorded at the current time, in points."}  ;; "Dementia Rating Scale total score ≥ 90 AND Dementia Rating Scale total score ≤ 133"
(declare-const patient_has_finding_of_mild_cognitive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of mild cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of mild cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of mild cognitive impairment.","meaning":"Boolean indicating whether the patient currently has evidence of mild cognitive impairment."}  ;; "evidence of at least mild cognitive impairment"
(declare-const patient_has_finding_of_severe_cognitive_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of severe cognitive impairment.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of severe cognitive impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of severe cognitive impairment.","meaning":"Boolean indicating whether the patient currently has evidence of severe cognitive impairment."}  ;; "NOT evidence of severe cognitive impairment"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: Dementia Rating Scale total score between 90 and 133 inclusive defines (at least mild cognitive impairment AND NOT severe cognitive impairment)
(assert
  (! (= patient_has_finding_of_mild_cognitive_disorder_now
        (and (>= dementia_rating_scale_total_score_value_recorded_now_withunit_points 90)
             (<= dementia_rating_scale_total_score_value_recorded_now_withunit_points 133)))
     :named REQ4_AUXILIARY0)) ;; "evidence of at least mild cognitive impairment, defined as Dementia Rating Scale total score ≥ 90 AND ≤ 133"

;; Definition: Dementia Rating Scale total score < 90 defines severe cognitive impairment
(assert
  (! (= patient_has_finding_of_severe_cognitive_impairment_now
        (< dementia_rating_scale_total_score_value_recorded_now_withunit_points 90))
     :named REQ4_AUXILIARY1)) ;; "evidence of severe cognitive impairment, defined as Dementia Rating Scale total score < 90"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Inclusion: must have at least mild cognitive impairment AND NOT severe cognitive impairment
(assert
  (! (and patient_has_finding_of_mild_cognitive_disorder_now
          (not patient_has_finding_of_severe_cognitive_impairment_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have (evidence of at least mild cognitive impairment AND NOT evidence of severe cognitive impairment), defined as (Dementia Rating Scale total score ≥ 90 AND Dementia Rating Scale total score ≤ 133)."

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_has_caregiver_participating_in_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a caregiver who is both able and willing to participate in treatment.","when_to_set_to_false":"Set to false if the patient currently does not have a caregiver who is both able and willing to participate in treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a caregiver who is both able and willing to participate in treatment.","meaning":"Boolean indicating whether the patient currently has a caregiver who is able and willing to participate in treatment."}  ;; "the patient must have (a caregiver ... who is able AND willing to participate in treatment)"
(declare-const patient_has_family_member_caregiver_participating_in_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a family member caregiver who is both able and willing to participate in treatment.","when_to_set_to_false":"Set to false if the patient currently does not have a family member caregiver who is both able and willing to participate in treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a family member caregiver who is both able and willing to participate in treatment.","meaning":"Boolean indicating whether the patient currently has a family member caregiver who is able and willing to participate in treatment."}  ;; "family member ... who is able AND willing to participate in treatment"
(declare-const patient_has_professional_caregiver_participating_in_treatment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a professional caregiver who is both able and willing to participate in treatment.","when_to_set_to_false":"Set to false if the patient currently does not have a professional caregiver who is both able and willing to participate in treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a professional caregiver who is both able and willing to participate in treatment.","meaning":"Boolean indicating whether the patient currently has a professional caregiver who is able and willing to participate in treatment."}  ;; "professional caregiver ... who is able AND willing to participate in treatment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Exhaustive subcategories: caregiver ≡ (family member OR professional caregiver)
(assert
  (! (= patient_has_caregiver_participating_in_treatment_now
        (or patient_has_family_member_caregiver_participating_in_treatment_now
            patient_has_professional_caregiver_participating_in_treatment_now))
     :named REQ5_AUXILIARY0)) ;; "caregiver (with exhaustive subcategories (family member OR professional caregiver)) who is able AND willing to participate in treatment"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_caregiver_participating_in_treatment_now
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have (a caregiver ... who is able AND willing to participate in treatment)"

;; ===================== Declarations for the inclusion criterion (REQ 6) =====================
(declare-const patient_is_taking_antidepressant_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antidepressant medication.","when_to_set_to_false":"Set to false if the patient is currently not taking an antidepressant medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking an antidepressant medication.","meaning":"Boolean indicating whether the patient is currently taking an antidepressant medication."}  ;; "antidepressant medication"
(declare-const patient_is_taking_antidepressant_medication_now@@stable_dosage_for_at_least_12_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antidepressant medication and the dosage has been stable for at least 12 weeks.","when_to_set_to_false":"Set to false if the patient is currently taking an antidepressant medication and the dosage has not been stable for at least 12 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dosage has been stable for at least 12 weeks.","meaning":"Boolean indicating whether the patient, if currently taking an antidepressant medication, has been on a stable dosage for at least 12 weeks."}  ;; "stable dosage for ≥ 12 weeks" (antidepressant)
(declare-const patient_is_taking_antidepressant_medication_now@@no_medical_recommendation_for_change_in_near_future Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking an antidepressant medication and there is no medical recommendation for change of that agent in the near future.","when_to_set_to_false":"Set to false if the patient is currently taking an antidepressant medication and there is a medical recommendation for change of that agent in the near future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a medical recommendation for change in the near future.","meaning":"Boolean indicating whether the patient, if currently taking an antidepressant medication, has no medical recommendation for change of that agent in the near future."}  ;; "no medical recommendation for change of that agent in the near future" (antidepressant)

(declare-const patient_is_taking_cholinesterase_inhibitor_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a cholinesterase inhibitor medication.","when_to_set_to_false":"Set to false if the patient is currently not taking a cholinesterase inhibitor medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a cholinesterase inhibitor medication.","meaning":"Boolean indicating whether the patient is currently taking a cholinesterase inhibitor medication."}  ;; "cholinesterase inhibitor medication"
(declare-const patient_is_taking_cholinesterase_inhibitor_medication_now@@stable_dosage_for_at_least_12_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a cholinesterase inhibitor medication and the dosage has been stable for at least 12 weeks.","when_to_set_to_false":"Set to false if the patient is currently taking a cholinesterase inhibitor medication and the dosage has not been stable for at least 12 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dosage has been stable for at least 12 weeks.","meaning":"Boolean indicating whether the patient, if currently taking a cholinesterase inhibitor medication, has been on a stable dosage for at least 12 weeks."}  ;; "stable dosage for ≥ 12 weeks" (cholinesterase inhibitor)
(declare-const patient_is_taking_cholinesterase_inhibitor_medication_now@@no_medical_recommendation_for_change_in_near_future Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a cholinesterase inhibitor medication and there is no medical recommendation for change of that agent in the near future.","when_to_set_to_false":"Set to false if the patient is currently taking a cholinesterase inhibitor medication and there is a medical recommendation for change of that agent in the near future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a medical recommendation for change in the near future.","meaning":"Boolean indicating whether the patient, if currently taking a cholinesterase inhibitor medication, has no medical recommendation for change of that agent in the near future."}  ;; "no medical recommendation for change of that agent in the near future" (cholinesterase inhibitor)

(declare-const patient_is_taking_memantine_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a memantine-containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a memantine-containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a memantine-containing product.","meaning":"Boolean indicating whether the patient is currently taking a memantine-containing product."}  ;; "memantine medication"
(declare-const patient_is_taking_memantine_containing_product_now@@stable_dosage_for_at_least_12_weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a memantine-containing product and the dosage has been stable for at least 12 weeks.","when_to_set_to_false":"Set to false if the patient is currently taking a memantine-containing product and the dosage has not been stable for at least 12 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the dosage has been stable for at least 12 weeks.","meaning":"Boolean indicating whether the patient, if currently taking memantine, has been on a stable dosage for at least 12 weeks."}  ;; "stable dosage for ≥ 12 weeks" (memantine)
(declare-const patient_is_taking_memantine_containing_product_now@@no_medical_recommendation_for_change_in_near_future Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a memantine-containing product and there is no medical recommendation for change of that agent in the near future.","when_to_set_to_false":"Set to false if the patient is currently taking a memantine-containing product and there is a medical recommendation for change of that agent in the near future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether there is a medical recommendation for change in the near future.","meaning":"Boolean indicating whether the patient, if currently taking memantine, has no medical recommendation for change of that agent in the near future."}  ;; "no medical recommendation for change of that agent in the near future" (memantine)

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variables imply corresponding stem variables (antidepressant)
(assert
  (! (=> patient_is_taking_antidepressant_medication_now@@stable_dosage_for_at_least_12_weeks
         patient_is_taking_antidepressant_medication_now)
     :named REQ6_AUXILIARY0)) ;; "if stable dosage for ≥ 12 weeks, must be taking antidepressant medication"

(assert
  (! (=> patient_is_taking_antidepressant_medication_now@@no_medical_recommendation_for_change_in_near_future
         patient_is_taking_antidepressant_medication_now)
     :named REQ6_AUXILIARY1)) ;; "if no medical recommendation for change, must be taking antidepressant medication"

;; Qualifier variables imply corresponding stem variables (cholinesterase inhibitor)
(assert
  (! (=> patient_is_taking_cholinesterase_inhibitor_medication_now@@stable_dosage_for_at_least_12_weeks
         patient_is_taking_cholinesterase_inhibitor_medication_now)
     :named REQ6_AUXILIARY2)) ;; "if stable dosage for ≥ 12 weeks, must be taking cholinesterase inhibitor medication"

(assert
  (! (=> patient_is_taking_cholinesterase_inhibitor_medication_now@@no_medical_recommendation_for_change_in_near_future
         patient_is_taking_cholinesterase_inhibitor_medication_now)
     :named REQ6_AUXILIARY3)) ;; "if no medical recommendation for change, must be taking cholinesterase inhibitor medication"

;; Qualifier variables imply corresponding stem variables (memantine)
(assert
  (! (=> patient_is_taking_memantine_containing_product_now@@stable_dosage_for_at_least_12_weeks
         patient_is_taking_memantine_containing_product_now)
     :named REQ6_AUXILIARY4)) ;; "if stable dosage for ≥ 12 weeks, must be taking memantine"

(assert
  (! (=> patient_is_taking_memantine_containing_product_now@@no_medical_recommendation_for_change_in_near_future
         patient_is_taking_memantine_containing_product_now)
     :named REQ6_AUXILIARY5)) ;; "if no medical recommendation for change, must be taking memantine"

;; ===================== Constraint Assertions (REQ 6) =====================
;; For each medication, patient must EITHER not be taking it, OR (if taking, must have stable dosage for ≥12 weeks AND no medical recommendation for change in near future)
(assert
  (! (or (not patient_is_taking_antidepressant_medication_now)
         (and patient_is_taking_antidepressant_medication_now@@stable_dosage_for_at_least_12_weeks
              patient_is_taking_antidepressant_medication_now@@no_medical_recommendation_for_change_in_near_future))
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "for antidepressant medication: NOT taking OR (stable dosage ≥12 weeks AND no recommendation for change)"

(assert
  (! (or (not patient_is_taking_cholinesterase_inhibitor_medication_now)
         (and patient_is_taking_cholinesterase_inhibitor_medication_now@@stable_dosage_for_at_least_12_weeks
              patient_is_taking_cholinesterase_inhibitor_medication_now@@no_medical_recommendation_for_change_in_near_future))
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "for cholinesterase inhibitor medication: NOT taking OR (stable dosage ≥12 weeks AND no recommendation for change)"

(assert
  (! (or (not patient_is_taking_memantine_containing_product_now)
         (and patient_is_taking_memantine_containing_product_now@@stable_dosage_for_at_least_12_weeks
              patient_is_taking_memantine_containing_product_now@@no_medical_recommendation_for_change_in_near_future))
     :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "for memantine medication: NOT taking OR (stable dosage ≥12 weeks AND no recommendation for change)"

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const patient_has_command_of_english_sufficient_for_therapy_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has command of English sufficient to participate in therapy.","when_to_set_to_false":"Set to false if the patient does not have command of English sufficient to participate in therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has command of English sufficient to participate in therapy.","meaning":"Boolean indicating whether the patient has command of English sufficient to participate in therapy."}  ;; "command of English sufficient to participate in therapy"
(declare-const patient_has_command_of_english_sufficient_for_research_assessment_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has command of English sufficient to participate in research assessments.","when_to_set_to_false":"Set to false if the patient does not have command of English sufficient to participate in research assessments.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has command of English sufficient to participate in research assessments.","meaning":"Boolean indicating whether the patient has command of English sufficient to participate in research assessments."}  ;; "command of English sufficient to participate in research assessments"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! patient_has_command_of_english_sufficient_for_therapy_participation
     :named REQ7_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "command of English sufficient to participate in therapy"

(assert
  (! patient_has_command_of_english_sufficient_for_research_assessment_participation
     :named REQ7_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "command of English sufficient to participate in research assessments"
