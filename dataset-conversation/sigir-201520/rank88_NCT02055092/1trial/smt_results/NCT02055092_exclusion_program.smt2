;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has currently provided informed consent.","when_to_set_to_false":"Set to false if the patient has not currently provided informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has currently provided informed consent.","meaning":"Boolean indicating whether the patient currently has provided informed consent."} ;; "The patient is excluded if the patient lacks informed consent."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_informed_consent_now)
:named REQ0_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient lacks informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_appropriate_family_member_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one appropriate family member.","when_to_set_to_false":"Set to false if the patient currently has no appropriate family member.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an appropriate family member.","meaning":"Boolean indicating whether the patient currently has at least one appropriate family member."} ;; "the patient has no appropriate family member"
(declare-const patient_has_close_family_member_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one close family member.","when_to_set_to_false":"Set to false if the patient currently has no close family member.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a close family member.","meaning":"Boolean indicating whether the patient currently has at least one close family member."} ;; "the patient has no close family member"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (or (not patient_has_close_family_member_now)
            (not patient_has_appropriate_family_member_now)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has no close family member) OR (the patient has no appropriate family member)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_cerebral_infarction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cerebral infarction.","when_to_set_to_false":"Set to false if the patient currently does not have cerebral infarction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cerebral infarction.","meaning":"Boolean indicating whether the patient currently has cerebral infarction."} ;; "cerebral infarction"
(declare-const patient_has_finding_of_frontal_lobe_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has frontal lobe dysfunction (frontal lobe syndrome).","when_to_set_to_false":"Set to false if the patient currently does not have frontal lobe dysfunction (frontal lobe syndrome).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has frontal lobe dysfunction (frontal lobe syndrome).","meaning":"Boolean indicating whether the patient currently has frontal lobe dysfunction (frontal lobe syndrome)."} ;; "frontal lobe dysfunction"
(declare-const patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_non_progressive_injury Bool) ;; {"when_to_set_to_true":"Set to true if the patient's frontal lobe dysfunction (frontal lobe syndrome) is caused by a non-progressive injury.","when_to_set_to_false":"Set to false if the patient's frontal lobe dysfunction (frontal lobe syndrome) is not caused by a non-progressive injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's frontal lobe dysfunction (frontal lobe syndrome) is caused by a non-progressive injury.","meaning":"Boolean indicating whether the patient's frontal lobe dysfunction (frontal lobe syndrome) is caused by a non-progressive injury."} ;; "frontal lobe dysfunction due to non-progressive injury"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive example: cerebral infarction is one possible cause of non-progressive injury
(assert
(! (=> patient_has_finding_of_cerebral_infarction_now
     patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_non_progressive_injury)
:named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (cerebral infarction)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_non_progressive_injury
     patient_has_finding_of_frontal_lobe_syndrome_now)
:named REQ2_AUXILIARY1)) ;; "frontal lobe dysfunction due to non-progressive injury"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_non_progressive_injury)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has frontal lobe dysfunction due to non-progressive injury with non-exhaustive examples (cerebral infarction)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_amyotrophic_lateral_sclerosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of amyotrophic lateral sclerosis (ALS).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of amyotrophic lateral sclerosis (ALS).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has amyotrophic lateral sclerosis (ALS).","meaning":"Boolean indicating whether the patient currently has amyotrophic lateral sclerosis (ALS)."} ;; "amyotrophic lateral sclerosis"

(declare-const patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_amyotrophic_lateral_sclerosis Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current frontal lobe dysfunction (frontal lobe syndrome) is caused by amyotrophic lateral sclerosis (motor neuron disease).","when_to_set_to_false":"Set to false if the patient's current frontal lobe dysfunction (frontal lobe syndrome) is not caused by amyotrophic lateral sclerosis (motor neuron disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current frontal lobe dysfunction (frontal lobe syndrome) is caused by amyotrophic lateral sclerosis (motor neuron disease).","meaning":"Boolean indicating whether the patient's current frontal lobe dysfunction (frontal lobe syndrome) is caused by amyotrophic lateral sclerosis (motor neuron disease)."} ;; "frontal lobe dysfunction due to motor neuron disease (amyotrophic lateral sclerosis)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_amyotrophic_lateral_sclerosis
      patient_has_finding_of_frontal_lobe_syndrome_now)
:named REQ3_AUXILIARY0)) ;; "frontal lobe dysfunction due to motor neuron disease (amyotrophic lateral sclerosis)"

;; Qualifier variable implies cause variable
(assert
(! (=> patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_amyotrophic_lateral_sclerosis
      patient_has_finding_of_amyotrophic_lateral_sclerosis_now)
:named REQ3_AUXILIARY1)) ;; "frontal lobe dysfunction due to motor neuron disease (amyotrophic lateral sclerosis)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_frontal_lobe_syndrome_now@@caused_by_amyotrophic_lateral_sclerosis)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has frontal lobe dysfunction due to motor neuron disease (amyotrophic lateral sclerosis)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_another_dementia_specific_condition_with_frontal_lobe_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has another dementia-specific condition (other than Down syndrome, alcoholic dementia, Huntington disease, or human immunodeficiency virus infection) and this condition is accompanied by frontal lobe dysfunction.","when_to_set_to_false":"Set to false if the patient currently does not have another dementia-specific condition with frontal lobe dysfunction (excluding the listed conditions).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has another dementia-specific condition with frontal lobe dysfunction (excluding the listed conditions).","meaning":"Boolean indicating whether the patient currently has another dementia-specific condition with frontal lobe dysfunction, excluding Down syndrome, alcoholic dementia, Huntington disease, and human immunodeficiency virus infection."} ;; "another dementia-specific condition with frontal lobe dysfunction, excluding Down syndrome, alcoholic dementia, Huntington disease, and human immunodeficiency virus infection"

(declare-const patient_has_finding_of_complete_trisomy_21_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Down syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Down syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of Down syndrome.","meaning":"Boolean indicating whether the patient currently has Down syndrome."} ;; "Down syndrome"

(declare-const patient_has_finding_of_dementia_associated_with_alcoholism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of alcoholic dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of alcoholic dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of alcoholic dementia.","meaning":"Boolean indicating whether the patient currently has alcoholic dementia."} ;; "alcoholic dementia"

(declare-const patient_has_finding_of_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dementia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of dementia.","meaning":"Boolean indicating whether the patient currently has dementia."} ;; "dementia"

(declare-const patient_has_finding_of_dementia_now@@accompanied_by_frontal_lobe_dysfunction Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dementia is accompanied by frontal lobe dysfunction.","when_to_set_to_false":"Set to false if the patient's current dementia is not accompanied by frontal lobe dysfunction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dementia is accompanied by frontal lobe dysfunction.","meaning":"Boolean indicating whether the patient's current dementia is accompanied by frontal lobe dysfunction."} ;; "dementia accompanied by frontal lobe dysfunction"

(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"

(declare-const patient_has_finding_of_huntington_s_chorea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of Huntington disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of Huntington disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of Huntington disease.","meaning":"Boolean indicating whether the patient currently has Huntington disease."} ;; "Huntington disease"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_huntington_s_chorea_now
           patient_has_finding_of_human_immunodeficiency_virus_infection_now
           patient_has_finding_of_complete_trisomy_21_syndrome_now
           patient_has_finding_of_dementia_associated_with_alcoholism_now)
       patient_has_finding_of_another_dementia_specific_condition_with_frontal_lobe_dysfunction_now)
:named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (Huntington disease, human immunodeficiency virus infection, Down syndrome, alcoholic dementia)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dementia_now@@accompanied_by_frontal_lobe_dysfunction
       patient_has_finding_of_dementia_now)
:named REQ4_AUXILIARY1)) ;; "dementia accompanied by frontal lobe dysfunction"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_another_dementia_specific_condition_with_frontal_lobe_dysfunction_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has another dementia-specific condition with frontal lobe dysfunction with non-exhaustive examples (Huntington disease, human immunodeficiency virus infection, Down syndrome, alcoholic dementia)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_intellectual_disability_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of intellectual disability.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of intellectual disability.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of intellectual disability.","meaning":"Boolean indicating whether the patient currently has intellectual disability."} ;; "mental retardation"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_intellectual_disability_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mental retardation."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has substance abuse of any kind (including but not limited to alcohol, drugs, or other substances).","when_to_set_to_false":"Set to false if the patient currently does not have substance abuse of any kind.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has substance abuse of any kind.","meaning":"Boolean indicating whether the patient currently has substance abuse of any kind (including but not limited to alcohol, drugs, or other substances)."} ;; "current substance abuse"
(declare-const patient_has_finding_of_substance_misuse_behavior_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has substance misuse behavior (substance abuse).","when_to_set_to_false":"Set to false if the patient currently does not have substance misuse behavior (substance abuse).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has substance misuse behavior (substance abuse).","meaning":"Boolean indicating whether the patient currently has substance misuse behavior (substance abuse)."} ;; "substance abuse"
(declare-const patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had alcohol intake above recommended sensible limits at any time in their history.","when_to_set_to_false":"Set to false if the patient has never had alcohol intake above recommended sensible limits in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had alcohol intake above recommended sensible limits in their history.","meaning":"Boolean indicating whether the patient has had alcohol intake above recommended sensible limits at any time in their history."} ;; "excessive alcohol consumption"
(declare-const patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_inthehistory@@temporalcontext_within_past_12_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had alcohol intake above recommended sensible limits within the past twelve months.","when_to_set_to_false":"Set to false if the patient has not had alcohol intake above recommended sensible limits within the past twelve months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had alcohol intake above recommended sensible limits within the past twelve months.","meaning":"Boolean indicating whether the patient has had alcohol intake above recommended sensible limits within the past twelve months."} ;; "excessive alcohol consumption for the past twelve months"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Non-exhaustive example: excessive alcohol consumption for the past twelve months implies current substance abuse
(assert
(! (=> patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_inthehistory@@temporalcontext_within_past_12_months
      patient_has_finding_of_substance_abuse_now)
:named REQ6_AUXILIARY0)) ;; "with non-exhaustive examples (excessive alcohol consumption for the past twelve months)."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_inthehistory@@temporalcontext_within_past_12_months
      patient_has_finding_of_alcohol_intake_above_recommended_sensible_limits_inthehistory)
:named REQ6_AUXILIARY1)) ;; "excessive alcohol consumption for the past twelve months" implies "excessive alcohol consumption (ever)"

;; Substance misuse behavior is a type of substance abuse
(assert
(! (=> patient_has_finding_of_substance_misuse_behavior_now
      patient_has_finding_of_substance_abuse_now)
:named REQ6_AUXILIARY2)) ;; "substance misuse behavior" is a type of "substance abuse"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_substance_abuse_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current substance abuse with non-exhaustive examples (excessive alcohol consumption for the past twelve months)."
