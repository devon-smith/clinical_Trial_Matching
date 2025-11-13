;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as confirmed by clinical documentation or reliable patient report.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_is_pregnant_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_allergy_to_hydrogel Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to hydrogel.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to hydrogel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy to hydrogel.","meaning":"Boolean indicating whether the patient has an allergy to hydrogel."} ;; "the patient has an allergy to hydrogel"
(declare-const patient_has_allergy_to_becaplermin_gel Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented or known allergy to becaplermin gel.","when_to_set_to_false":"Set to false if the patient does not have a documented or known allergy to becaplermin gel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an allergy to becaplermin gel.","meaning":"Boolean indicating whether the patient has an allergy to becaplermin gel."} ;; "the patient has an allergy to becaplermin gel"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_allergy_to_hydrogel)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to hydrogel."

(assert
  (! (not patient_has_allergy_to_becaplermin_gel)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an allergy to becaplermin gel."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_systemic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a systemic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a systemic disease.","meaning":"Boolean indicating whether the patient currently has a systemic disease."} ;; "systemic disease"
(declare-const patient_has_finding_of_systemic_disease_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic disease and the disease is uncontrolled.","when_to_set_to_false":"Set to false if the patient currently has a systemic disease and the disease is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic disease is uncontrolled.","meaning":"Boolean indicating whether the patient's current systemic disease is uncontrolled."} ;; "uncontrolled systemic disease"
(declare-const patient_has_finding_of_systemic_disease_now@@evolving Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a systemic disease and the disease is evolving.","when_to_set_to_false":"Set to false if the patient currently has a systemic disease and the disease is not evolving.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic disease is evolving.","meaning":"Boolean indicating whether the patient's current systemic disease is evolving."} ;; "evolving systemic disease"
(declare-const patient_has_finding_of_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart failure.","meaning":"Boolean indicating whether the patient currently has heart failure."} ;; "cardiac failure"
(declare-const patient_has_finding_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has renal failure syndrome."} ;; "renal failure"
(declare-const patient_has_finding_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic failure.","meaning":"Boolean indicating whether the patient currently has hepatic failure."} ;; "hepatic insufficiency"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."} ;; "malignant disease"
(declare-const patient_has_finding_of_thrombosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombosis.","meaning":"Boolean indicating whether the patient currently has thrombosis."} ;; "thrombotic disease"
(declare-const patient_has_finding_of_vasculitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vasculitis.","when_to_set_to_false":"Set to false if the patient currently does not have vasculitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vasculitis.","meaning":"Boolean indicating whether the patient currently has vasculitis."} ;; "vasculitis"
(declare-const patient_has_finding_of_disorder_of_connective_tissue_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of connective tissue.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of connective tissue.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of connective tissue.","meaning":"Boolean indicating whether the patient currently has a disorder of connective tissue."} ;; "connective tissue disorder"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply uncontrolled systemic disease
(assert
(! (=> (or patient_has_finding_of_heart_failure_now
           patient_has_finding_of_renal_failure_syndrome_now
           patient_has_finding_of_hepatic_failure_now
           patient_has_finding_of_malignant_neoplastic_disease_now
           patient_has_finding_of_thrombosis_now
           patient_has_finding_of_vasculitis_now
           patient_has_finding_of_disorder_of_connective_tissue_now)
        patient_has_finding_of_systemic_disease_now@@uncontrolled)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (cardiac failure, renal failure, hepatic insufficiency, malignant disease, thrombotic disease, vasculitis, other connective tissue disorder)" for uncontrolled systemic disease

;; Non-exhaustive examples imply evolving systemic disease
(assert
(! (=> (or patient_has_finding_of_heart_failure_now
           patient_has_finding_of_renal_failure_syndrome_now
           patient_has_finding_of_hepatic_failure_now
           patient_has_finding_of_malignant_neoplastic_disease_now
           patient_has_finding_of_thrombosis_now
           patient_has_finding_of_vasculitis_now
           patient_has_finding_of_disorder_of_connective_tissue_now)
        patient_has_finding_of_systemic_disease_now@@evolving)
   :named REQ2_AUXILIARY1)) ;; "with non-exhaustive examples (cardiac failure, renal failure, hepatic insufficiency, malignant disease, thrombotic disease, vasculitis, other connective tissue disorder)" for evolving systemic disease

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_systemic_disease_now@@uncontrolled
       patient_has_finding_of_systemic_disease_now)
   :named REQ2_AUXILIARY2)) ;; "uncontrolled systemic disease" implies "systemic disease"

(assert
(! (=> patient_has_finding_of_systemic_disease_now@@evolving
       patient_has_finding_of_systemic_disease_now)
   :named REQ2_AUXILIARY3)) ;; "evolving systemic disease" implies "systemic disease"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_systemic_disease_now@@uncontrolled)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an uncontrolled systemic disease with non-exhaustive examples..."

(assert
(! (not patient_has_finding_of_systemic_disease_now@@evolving)
   :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an evolving systemic disease with non-exhaustive examples..."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_cryoglobulinemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cryoglobulinemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cryoglobulinemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cryoglobulinemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of cryoglobulinemia."} ;; "cryoglobulinemia"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_cryoglobulinemia_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cryoglobulinemia."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in micromoles per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current serum creatinine concentration in micromoles per liter."} ;; "serum creatinine concentration > 200 micromoles per liter"

(declare-const patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_grams_per_liter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current fasting blood glucose in grams per liter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's current fasting blood glucose in grams per liter."} ;; "fasting blood glucose > 2.5 grams per liter"

(declare-const patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_grams_per_liter@@measured_under_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the fasting blood glucose measurement was taken while the patient was under treatment.","when_to_set_to_false":"Set to false if the measurement was not taken under treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken under treatment.","meaning":"Boolean indicating whether the fasting blood glucose measurement was taken under treatment."} ;; "fasting blood glucose > 2.5 grams per liter under treatment"

(declare-const patient_has_finding_of_diabetic_poor_control_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has poorly controlled diabetes (uncontrolled diabetes).","when_to_set_to_false":"Set to false if the patient currently does not have poorly controlled diabetes.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poorly controlled diabetes.","meaning":"Boolean indicating whether the patient currently has poorly controlled diabetes."} ;; "uncontrolled diabetes"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition: uncontrolled diabetes (fasting blood glucose > 2.5 grams per liter under treatment)
(assert
(! (= patient_has_finding_of_diabetic_poor_control_now
(and patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_grams_per_liter@@measured_under_treatment
     (> patient_fasting_blood_glucose_measurement_value_recorded_now_withunit_grams_per_liter 2.5)))
:named REQ4_AUXILIARY0)) ;; "uncontrolled diabetes (fasting blood glucose > 2.5 grams per liter under treatment)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: serum creatinine > 200 µmol/L OR uncontrolled diabetes (as defined above)
(assert
(! (not (or (> patient_serum_creatinine_level_finding_value_recorded_now_withunit_micromoles_per_liter 200)
            patient_has_finding_of_diabetic_poor_control_now))
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a serum creatinine concentration > 200 micromoles per liter) OR (the patient has uncontrolled diabetes (fasting blood glucose > 2.5 grams per liter under treatment))."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_exposed_to_iloprost_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving or exposed to iloprost.","when_to_set_to_false":"Set to false if the patient is currently not receiving or exposed to iloprost.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to iloprost.","meaning":"Boolean indicating whether the patient is currently exposed to iloprost."} ;; "iloprost"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_exposed_to_iloprost_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving concomitant treatment with iloprost."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_skin_loss_exposing_bone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has skin loss with exposed bone in the wound.","when_to_set_to_false":"Set to false if the patient currently does not have skin loss with exposed bone in the wound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has skin loss with exposed bone in the wound.","meaning":"Boolean indicating whether the patient currently has skin loss with exposed bone in the wound."} ;; "bone exposed in the wound"
(declare-const patient_has_joint_exposed_in_the_wound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a joint exposed in the wound.","when_to_set_to_false":"Set to false if the patient currently does not have a joint exposed in the wound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a joint exposed in the wound.","meaning":"Boolean indicating whether the patient currently has a joint exposed in the wound."} ;; "joint exposed in the wound"
(declare-const patient_has_tendon_exposed_in_the_wound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a tendon exposed in the wound.","when_to_set_to_false":"Set to false if the patient currently does not have a tendon exposed in the wound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a tendon exposed in the wound.","meaning":"Boolean indicating whether the patient currently has a tendon exposed in the wound."} ;; "tendon exposed in the wound"
(declare-const patient_has_tendon_exposed_in_the_wound_now@@tendon_exposed_is_not_achilles_tendon Bool) ;; {"when_to_set_to_true":"Set to true if the exposed tendon in the wound is NOT the Achilles tendon.","when_to_set_to_false":"Set to false if the exposed tendon in the wound is the Achilles tendon.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposed tendon in the wound is the Achilles tendon.","meaning":"Boolean indicating whether the exposed tendon in the wound is NOT the Achilles tendon."} ;; "the exposed tendon is NOT Achilles tendon"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_tendon_exposed_in_the_wound_now@@tendon_exposed_is_not_achilles_tendon
      patient_has_tendon_exposed_in_the_wound_now)
   :named REQ6_AUXILIARY0)) ;; "the exposed tendon is NOT Achilles tendon" implies "tendon exposed in the wound"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have bone exposed in the wound
(assert
(! (not patient_has_finding_of_skin_loss_exposing_bone_now)
   :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bone exposed in the wound."

;; Exclusion: patient must NOT have joint exposed in the wound
(assert
(! (not patient_has_joint_exposed_in_the_wound_now)
   :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has joint exposed in the wound."

;; Exclusion: patient must NOT have tendon exposed in the wound where the exposed tendon is NOT Achilles tendon
(assert
(! (not patient_has_tendon_exposed_in_the_wound_now@@tendon_exposed_is_not_achilles_tendon)
   :named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has tendon exposed in the wound) AND (the exposed tendon is NOT Achilles tendon)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_is_exposed_to_corticosteroid_inthepast3months@@systemic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to corticosteroid agents within the past 3 months was as a systemic treatment.","when_to_set_to_false":"Set to false if the patient's exposure to corticosteroid agents within the past 3 months was not as a systemic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to corticosteroid agents within the past 3 months was as a systemic treatment.","meaning":"Boolean indicating whether the patient's exposure to corticosteroid agents within the past 3 months was as a systemic treatment."} ;; "systemic treatment with corticosteroid agents in the past 3 months before inclusion"

(declare-const patient_is_exposed_to_cytotoxic_inthepast3months Bool) ;; {"when_to_set_to_true":"Set to true if the patient was exposed to cytotoxic drugs at any time within the past 3 months before inclusion.","when_to_set_to_false":"Set to false if the patient was not exposed to cytotoxic drugs within the past 3 months before inclusion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient was exposed to cytotoxic drugs within the past 3 months before inclusion.","meaning":"Boolean indicating whether the patient was exposed to cytotoxic drugs within the past 3 months before inclusion."} ;; "cytotoxic drugs in the past 3 months before inclusion"

(declare-const patient_is_exposed_to_cytotoxic_inthepast3months@@systemic_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to cytotoxic drugs within the past 3 months was as a systemic treatment.","when_to_set_to_false":"Set to false if the patient's exposure to cytotoxic drugs within the past 3 months was not as a systemic treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure to cytotoxic drugs within the past 3 months was as a systemic treatment.","meaning":"Boolean indicating whether the patient's exposure to cytotoxic drugs within the past 3 months was as a systemic treatment."} ;; "systemic treatment with cytotoxic drugs in the past 3 months before inclusion"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Qualifier variable implies corresponding stem variable for corticosteroids
(assert
(! (=> patient_is_exposed_to_corticosteroid_inthepast3months@@systemic_treatment
      true)
:named REQ7_AUXILIARY0)) ;; "systemic treatment with corticosteroid agents in the past 3 months before inclusion"

;; Qualifier variable implies corresponding stem variable for cytotoxic drugs
(assert
(! (=> patient_is_exposed_to_cytotoxic_inthepast3months@@systemic_treatment
      patient_is_exposed_to_cytotoxic_inthepast3months)
:named REQ7_AUXILIARY1)) ;; "systemic treatment with cytotoxic drugs in the past 3 months before inclusion"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_is_exposed_to_corticosteroid_inthepast3months@@systemic_treatment)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic treatment with corticosteroid agents in the past 3 months before inclusion."

(assert
(! (not patient_is_exposed_to_cytotoxic_inthepast3months@@systemic_treatment)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic treatment with cytotoxic drugs in the past 3 months before inclusion."
