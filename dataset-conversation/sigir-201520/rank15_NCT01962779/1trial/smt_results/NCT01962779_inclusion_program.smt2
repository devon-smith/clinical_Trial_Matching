;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."}  ;; "male or female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male at the current time."}  ;; "male or female"
(declare-const patient_has_finding_of_normal_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of normal cognition.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of normal cognition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has normal cognition.","meaning":"Boolean indicating whether the patient currently has normal cognition."}  ;; "normal cognition"
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "older than 50 years of age"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: To be included, the patient must be male or female.
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; Component 1: To be included, the patient must have normal cognition.
(assert
  (! patient_has_finding_of_normal_cognition_now
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have normal cognition."

;; Component 2: To be included, the patient must be older than 50 years of age.
(assert
  (! (> patient_age_value_recorded_now_in_years 50)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be older than 50 years of age."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_neurological_diagnostic_procedure_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently within normal limits on neurological examination.","when_to_set_to_false":"Set to false if the patient is currently not within normal limits on neurological examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently within normal limits on neurological examination.","meaning":"Boolean indicating whether the patient is currently within normal limits on neurological examination."} ;; "within normal limits on neurological examination"
(declare-const patient_has_finding_of_psychiatric_diagnostic_procedure_normal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently within normal limits on psychiatric examination.","when_to_set_to_false":"Set to false if the patient is currently not within normal limits on psychiatric examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently within normal limits on psychiatric examination.","meaning":"Boolean indicating whether the patient is currently within normal limits on psychiatric examination."} ;; "within normal limits on psychiatric examination"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Patient must be within normal limits on neurological examination
(assert
  (! patient_has_finding_of_neurological_diagnostic_procedure_normal_now
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be within normal limits on neurological examination."

;; Component 1: Patient must be within normal limits on psychiatric examination
(assert
  (! patient_has_finding_of_psychiatric_diagnostic_procedure_normal_now
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be within normal limits on psychiatric examination."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_cdr_clinical_dementia_rating_score_value_recorded_now_withunit_score Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric CDR score is recorded for the patient now.","when_to_set_to_null":"Set to null if no CDR score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Clinical Dementia Rating (CDR) score recorded now."}  ;; "Clinical Dementia Rating (CDR)"
(declare-const patient_global_deterioration_scale_level_value_recorded_now_withunit_level Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric GDS level is recorded for the patient now.","when_to_set_to_null":"Set to null if no GDS level is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's Global Deterioration Scale (GDS) level recorded now."}  ;; "Global Deterioration Scale (GDS)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: Clinical Dementia Rating (CDR) must be equal to 0
(assert
  (! (= patient_cdr_clinical_dementia_rating_score_value_recorded_now_withunit_score 0)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Clinical Dementia Rating (CDR) equal to 0."

;; Component 1: Global Deterioration Scale (GDS) must be less than 3
(assert
  (! (< patient_global_deterioration_scale_level_value_recorded_now_withunit_level 3)
     :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a Global Deterioration Scale (GDS) less than 3."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const education_years_value_recorded_in_years Real) ;; {"when_to_set_to_value":"Set to the total number of years of education the patient has completed, in years, if this information is available.","when_to_set_to_null":"Set to null if the total number of years of education completed by the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the total years of education completed by the patient, in years."} ;; "the patient must have had at least 12 years of education"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (>= education_years_value_recorded_in_years 12)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have had at least 12 years of education"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const informed_family_member_interviewed_to_confirm_reliability_of_subject_interview Bool) ;; {"when_to_set_to_true":"Set to true if an informed family member was interviewed specifically to confirm the reliability of the subject interview.","when_to_set_to_false":"Set to false if an informed family member was not interviewed to confirm the reliability of the subject interview.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an informed family member was interviewed to confirm the reliability of the subject interview.","meaning":"Boolean indicating whether an informed family member was interviewed to confirm the reliability of the subject interview."} ;; "an informed family member interviewed to confirm the reliability of the subject interview"
(declare-const informed_life_partner_interviewed_to_confirm_reliability_of_subject_interview Bool) ;; {"when_to_set_to_true":"Set to true if an informed life partner was interviewed specifically to confirm the reliability of the subject interview.","when_to_set_to_false":"Set to false if an informed life partner was not interviewed to confirm the reliability of the subject interview.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether an informed life partner was interviewed to confirm the reliability of the subject interview.","meaning":"Boolean indicating whether an informed life partner was interviewed to confirm the reliability of the subject interview."} ;; "an informed life partner interviewed to confirm the reliability of the subject interview"

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must have (an informed family member interviewed to confirm the reliability of the subject interview) OR (an informed life partner interviewed to confirm the reliability of the subject interview).
(assert
  (! (or informed_family_member_interviewed_to_confirm_reliability_of_subject_interview
         informed_life_partner_interviewed_to_confirm_reliability_of_subject_interview)
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the inclusion criterion (REQ 5) =====================
(declare-const patient_can_undergo_magnetic_resonance_imaging_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees and is able to undergo magnetic resonance imaging (MRI) now.","when_to_set_to_false":"Set to false if the patient does not agree or is unable to undergo magnetic resonance imaging (MRI) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to undergo MRI now.","meaning":"Boolean indicating whether the patient agrees and is able to undergo magnetic resonance imaging (MRI) now."} ;; "the patient must agree to magnetic resonance imaging (MRI)"
(declare-const patient_can_undergo_lumbar_puncture_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees and is able to undergo lumbar puncture now.","when_to_set_to_false":"Set to false if the patient does not agree or is unable to undergo lumbar puncture now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to undergo lumbar puncture now.","meaning":"Boolean indicating whether the patient agrees and is able to undergo lumbar puncture now."} ;; "the patient must agree to lumbar puncture"
(declare-const patient_can_undergo_apolipoprotein_e_genotype_determination_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees and is able to undergo apolipoprotein E (APOE) genotyping now.","when_to_set_to_false":"Set to false if the patient does not agree or is unable to undergo apolipoprotein E (APOE) genotyping now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to undergo APOE genotyping now.","meaning":"Boolean indicating whether the patient agrees and is able to undergo apolipoprotein E (APOE) genotyping now."} ;; "the patient must agree to apolipoprotein E (APOE) genotyping"
(declare-const patient_is_exposed_to_deoxyribonucleic_acid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is exposed to deoxyribonucleic acid (DNA) now.","when_to_set_to_false":"Set to false if the patient is not exposed to deoxyribonucleic acid (DNA) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is exposed to DNA now.","meaning":"Boolean indicating whether the patient is exposed to deoxyribonucleic acid (DNA) now."} ;; "deoxyribonucleic acid (DNA)"
(declare-const patient_is_exposed_to_deoxyribonucleic_acid_now@@agrees_to_banking Bool) ;; {"when_to_set_to_true":"Set to true if the patient agrees to banking of their deoxyribonucleic acid (DNA) now.","when_to_set_to_false":"Set to false if the patient does not agree to banking of their deoxyribonucleic acid (DNA) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient agrees to banking of their DNA now.","meaning":"Boolean indicating whether the patient agrees to banking of their deoxyribonucleic acid (DNA) now."} ;; "the patient must agree to deoxyribonucleic acid (DNA) banking"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for DNA banking implies exposure to DNA
(assert
  (! (=> patient_is_exposed_to_deoxyribonucleic_acid_now@@agrees_to_banking
         patient_is_exposed_to_deoxyribonucleic_acid_now)
     :named REQ5_AUXILIARY0)) ;; "the patient must agree to deoxyribonucleic acid (DNA) banking"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Component 0: patient must agree to MRI
(assert
  (! patient_can_undergo_magnetic_resonance_imaging_now
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must agree to magnetic resonance imaging (MRI)"

;; Component 1: patient must agree to lumbar puncture
(assert
  (! patient_can_undergo_lumbar_puncture_now
     :named REQ5_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must agree to lumbar puncture"

;; Component 2: patient must agree to apolipoprotein E (APOE) genotyping
(assert
  (! patient_can_undergo_apolipoprotein_e_genotype_determination_now
     :named REQ5_COMPONENT2_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must agree to apolipoprotein E (APOE) genotyping"

;; Component 3: patient must agree to DNA banking
(assert
  (! patient_is_exposed_to_deoxyribonucleic_acid_now@@agrees_to_banking
     :named REQ5_COMPONENT3_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must agree to deoxyribonucleic acid (DNA) banking"
