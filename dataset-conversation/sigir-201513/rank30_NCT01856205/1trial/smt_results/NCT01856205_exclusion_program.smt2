;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_asexual_plasmodium_falciparum_parasitemia_in_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has asexual Plasmodium falciparum parasitemia present in blood.","when_to_set_to_false":"Set to false if the patient currently does not have asexual Plasmodium falciparum parasitemia present in blood.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has asexual Plasmodium falciparum parasitemia present in blood.","meaning":"Boolean indicating whether the patient currently has asexual Plasmodium falciparum parasitemia present in blood."} ;; "The patient is excluded if the patient has asexual Plasmodium falciparum parasitemia in blood."

(declare-const patient_is_exposed_to_blood_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to blood as a substance (e.g., blood is present in the patient as a biological substrate).","when_to_set_to_false":"Set to false if the patient is not currently exposed to blood as a substance.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to blood as a substance.","meaning":"Boolean indicating whether the patient is currently exposed to blood as a substance."} ;; "blood"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_asexual_plasmodium_falciparum_parasitemia_in_blood_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has asexual Plasmodium falciparum parasitemia in blood."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_coma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of coma.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of coma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of coma.","meaning":"Boolean indicating whether the patient currently has coma."} ;; "coma"
(declare-const patient_has_finding_of_coma_now@@secondary_to_another_systemic_condition Bool) ;; {"when_to_set_to_true":"Set to true if the patient's coma appears secondary to another systemic condition (such as hepatic failure, cardiac failure, or toxin exposure).","when_to_set_to_false":"Set to false if the patient's coma does not appear secondary to another systemic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's coma is secondary to another systemic condition.","meaning":"Boolean indicating whether the patient's coma is secondary to another systemic condition."} ;; "coma that appears secondary to another systemic condition"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_coma_now@@secondary_to_another_systemic_condition
      patient_has_finding_of_coma_now)
   :named REQ1_AUXILIARY0)) ;; "coma that appears secondary to another systemic condition"

;; Non-exhaustive examples imply the umbrella (coma secondary to another systemic condition)
;; (hepatic failure, cardiac failure, toxin exposure) are only examples, not an exhaustive list.
;; No further variables for the examples are declared, as the umbrella variable covers the requirement.

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_coma_now@@secondary_to_another_systemic_condition)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has coma that appears secondary to another systemic condition with non-exhaustive examples (hepatic failure, cardiac failure, toxin exposure)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const partially_treated_bacterial_meningitis_appears_more_likely_than_encephalitis_now Bool) ;; {"when_to_set_to_true":"Set to true if, at the current time, partially treated bacterial meningitis appears more likely than encephalitis for the patient.","when_to_set_to_false":"Set to false if, at the current time, partially treated bacterial meningitis does not appear more likely than encephalitis for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether partially treated bacterial meningitis appears more likely than encephalitis for the patient at the current time.","meaning":"Boolean indicating whether, at the current time, partially treated bacterial meningitis appears more likely than encephalitis for the patient."} ;; "partially treated bacterial meningitis appears more likely than encephalitis"

(declare-const patient_has_diagnosis_of_bacterial_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bacterial meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bacterial meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bacterial meningitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bacterial meningitis."} ;; "bacterial meningitis"

(declare-const patient_has_diagnosis_of_bacterial_meningitis_now@@partially_treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current diagnosis of bacterial meningitis is partially treated.","when_to_set_to_false":"Set to false if the patient's current diagnosis of bacterial meningitis is not partially treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current diagnosis of bacterial meningitis is partially treated.","meaning":"Boolean indicating whether the patient's current diagnosis of bacterial meningitis is partially treated."} ;; "partially treated bacterial meningitis"

(declare-const patient_has_diagnosis_of_encephalitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of encephalitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of encephalitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of encephalitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of encephalitis."} ;; "encephalitis"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone antibiotic therapy at any time in the past (before now).","when_to_set_to_false":"Set to false if the patient has never undergone antibiotic therapy at any time in the past (before now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone antibiotic therapy in the past.","meaning":"Boolean indicating whether the patient has ever undergone antibiotic therapy at any time in the past."} ;; "antibiotic treatment"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@documented Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic therapy in the past is documented in the medical record.","when_to_set_to_false":"Set to false if the patient's antibiotic therapy in the past is not documented in the medical record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's antibiotic therapy in the past is documented.","meaning":"Boolean indicating whether the patient's antibiotic therapy in the past is documented."} ;; "documented antibiotic treatment"

(declare-const patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_before_admission Bool) ;; {"when_to_set_to_true":"Set to true if the patient's antibiotic therapy in the past occurred before hospital admission.","when_to_set_to_false":"Set to false if the patient's antibiotic therapy in the past did not occur before hospital admission.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's antibiotic therapy in the past occurred before hospital admission.","meaning":"Boolean indicating whether the patient's antibiotic therapy in the past occurred before hospital admission."} ;; "antibiotic treatment before admission"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_bacterial_meningitis_now@@partially_treated
      patient_has_diagnosis_of_bacterial_meningitis_now)
:named REQ2_AUXILIARY0)) ;; "partially treated bacterial meningitis"

(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@documented
      patient_has_undergone_antibiotic_therapy_inthehistory)
:named REQ2_AUXILIARY1)) ;; "documented antibiotic treatment"

(assert
(! (=> patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_before_admission
      patient_has_undergone_antibiotic_therapy_inthehistory)
:named REQ2_AUXILIARY2)) ;; "antibiotic treatment before admission"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT satisfy BOTH (documented antibiotic treatment before admission) AND (partially treated bacterial meningitis appears more likely than encephalitis)
(assert
(! (not (and patient_has_undergone_antibiotic_therapy_inthehistory@@documented
             patient_has_undergone_antibiotic_therapy_inthehistory@@temporalcontext_before_admission
             partially_treated_bacterial_meningitis_appears_more_likely_than_encephalitis_now))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has documented antibiotic treatment before admission) AND (partially treated bacterial meningitis appears more likely than encephalitis)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "child"
(declare-const patient_has_diagnosis_of_simple_febrile_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of simple febrile seizure (simple febrile convulsion).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of simple febrile seizure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of simple febrile seizure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of simple febrile seizure."} ;; "simple febrile convulsion"
(declare-const patient_has_full_recovery_of_consciousness_within_sixty_minutes_after_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has achieved full recovery of consciousness within sixty minutes after the seizure episode recorded now.","when_to_set_to_false":"Set to false if the patient has not achieved full recovery of consciousness within sixty minutes after the seizure episode recorded now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has achieved full recovery of consciousness within sixty minutes after the seizure episode recorded now.","meaning":"Boolean indicating whether the patient has achieved full recovery of consciousness within sixty minutes after the seizure episode recorded now."} ;; "full recovery of consciousness within sixty minutes"
(declare-const patient_seizure_value_recorded_now_withunit_minutes Real) ;; {"when_to_set_to_value":"Set to the measured duration in minutes if a seizure episode duration is recorded now.","when_to_set_to_null":"Set to null if no seizure duration is recorded now or the value is indeterminate.","meaning":"Numeric value representing the duration in minutes of the patient's seizure episode recorded now."} ;; "a single seizure lasting less than fifteen minutes"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: "simple febrile convulsion" = (a single seizure lasting <15 min) AND (full recovery of consciousness within 60 min)
(assert
(! (= patient_has_diagnosis_of_simple_febrile_seizure_now
(and (< patient_seizure_value_recorded_now_withunit_minutes 15)
    patient_has_full_recovery_of_consciousness_within_sixty_minutes_after_seizure_now))
:named REQ3_AUXILIARY0)) ;; "simple febrile convulsion, defined as (a single seizure lasting less than fifteen minutes) AND (full recovery of consciousness within sixty minutes)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient is a child (age < 18) AND has simple febrile convulsion
(assert
(! (not (and (< patient_age_value_recorded_now_in_years 18)
             patient_has_diagnosis_of_simple_febrile_seizure_now))
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a child with simple febrile convulsion, defined as (a single seizure lasting less than fifteen minutes) AND (full recovery of consciousness within sixty minutes))."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "pregnant female"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as male or other.","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "pregnant female"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently documented as not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently breastfeeding."} ;; "breastfeeding female"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not (and patient_is_pregnant_now patient_sex_is_female_now))
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant female."

(assert
(! (not patient_is_breastfeeding_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a breastfeeding female."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_child_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a child.","when_to_set_to_false":"Set to false if the patient is currently not classified as a child.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as a child.","meaning":"Boolean indicating whether the patient is currently classified as a child."} ;; "the patient is a child"

(declare-const patient_glasgow_coma_score_value_recorded_now_withunit_none Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's Glasgow Coma Scale score is recorded now.","when_to_set_to_null":"Set to null if no Glasgow Coma Scale score is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's current Glasgow Coma Scale score."} ;; "Glasgow Coma Scale score equal to three out of fifteen"

(declare-const patient_is_undergoing_artificial_respiration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving artificial ventilation.","when_to_set_to_false":"Set to false if the patient is currently not receiving artificial ventilation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving artificial ventilation.","meaning":"Boolean indicating whether the patient is currently receiving artificial ventilation."} ;; "the patient is receiving artificial ventilation"

(declare-const patient_is_undergoing_artificial_respiration_now@@without_signs_of_spontaneous_respiration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving artificial ventilation and there are no signs of spontaneous respiration.","when_to_set_to_false":"Set to false if the patient is currently receiving artificial ventilation and there are signs of spontaneous respiration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether signs of spontaneous respiration are present while the patient is receiving artificial ventilation.","meaning":"Boolean indicating whether the patient is currently receiving artificial ventilation without signs of spontaneous respiration."} ;; "without signs of spontaneous respiration"

(declare-const patient_has_finding_of_doll_s_head_reflex_absent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an absent oculocephalic reflex.","when_to_set_to_false":"Set to false if the patient currently does not have an absent oculocephalic reflex.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an absent oculocephalic reflex.","meaning":"Boolean indicating whether the patient currently has an absent oculocephalic reflex."} ;; "absent oculocephalic reflex"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_is_undergoing_artificial_respiration_now@@without_signs_of_spontaneous_respiration
      patient_is_undergoing_artificial_respiration_now)
   :named REQ5_AUXILIARY0)) ;; "the patient is receiving artificial ventilation without signs of spontaneous respiration"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and
          patient_is_child_now
          (= patient_glasgow_coma_score_value_recorded_now_withunit_none 3)
          patient_is_undergoing_artificial_respiration_now@@without_signs_of_spontaneous_respiration
          patient_has_finding_of_doll_s_head_reflex_absent_now))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a child with Glasgow Coma Scale score equal to three out of fifteen) AND (the patient is receiving artificial ventilation without signs of spontaneous respiration) AND (the patient has absent oculocephalic reflex)."
