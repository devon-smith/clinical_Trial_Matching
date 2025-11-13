;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_body_weight_value_recorded_now_withunit_pounds Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's body weight in pounds is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body weight in pounds, recorded now."} ;; "body weight > 300 pounds (136 kilograms)."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (> patient_body_weight_value_recorded_now_withunit_pounds 300))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has body weight > 300 pounds (136 kilograms)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_used_medication_affecting_metabolism_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any medication affecting metabolism within the last 3 months.","when_to_set_to_false":"Set to false if the patient has not used any medication affecting metabolism within the last 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any medication affecting metabolism within the last 3 months.","meaning":"Boolean indicating whether the patient has used any medication affecting metabolism within the last 3 months."} ;; "the patient has used medication affecting metabolism within the last 3 months."
(declare-const patient_has_used_medication_affecting_appetite_within_last_3_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any medication affecting appetite within the last 3 months.","when_to_set_to_false":"Set to false if the patient has not used any medication affecting appetite within the last 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any medication affecting appetite within the last 3 months.","meaning":"Boolean indicating whether the patient has used any medication affecting appetite within the last 3 months."} ;; "the patient has used medication affecting appetite within the last 3 months."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (or patient_has_used_medication_affecting_metabolism_within_last_3_months
              patient_has_used_medication_affecting_appetite_within_last_3_months))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has used medication affecting metabolism within the last 3 months) OR (the patient has used medication affecting appetite within the last 3 months)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently pregnant.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is currently pregnant"
(declare-const patient_is_pregnant_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been pregnant at any time within the past 6 months.","when_to_set_to_false":"Set to false if the patient has not been pregnant at any time within the past 6 months.","when_to_set_to_null":"Set to null if the patient's pregnancy status within the past 6 months is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient has been pregnant at any time within the past 6 months."} ;; "the patient has been pregnant within the past 6 months"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is confirmed to be currently lactating.","when_to_set_to_false":"Set to false if the patient is confirmed not to be currently lactating.","when_to_set_to_null":"Set to null if the patient's current lactation status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently lactating."} ;; "the patient is currently lactating"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently pregnant."

(assert
(! (not patient_is_pregnant_inthepast6months)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has been pregnant within the past 6 months."

(assert
(! (not patient_is_lactating_now)
:named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is currently lactating."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of acute disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of acute disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of acute disease.","meaning":"Boolean indicating whether the patient has a history of acute disease."} ;; "history of acute disorder"
(declare-const patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the acute disease in the patient's history may affect appetite.","when_to_set_to_false":"Set to false if the acute disease in the patient's history does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute disease in the patient's history may affect appetite.","meaning":"Boolean indicating whether the acute disease in the patient's history may affect appetite."} ;; "history of acute disorder that may affect appetite"
(declare-const patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the acute disease in the patient's history may affect energy expenditure.","when_to_set_to_false":"Set to false if the acute disease in the patient's history does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute disease in the patient's history may affect energy expenditure.","meaning":"Boolean indicating whether the acute disease in the patient's history may affect energy expenditure."} ;; "history of acute disorder that may affect energy expenditure"
(declare-const patient_has_clinical_signs_of_acute_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical manifestations of acute disease.","when_to_set_to_false":"Set to false if the patient currently does not have clinical manifestations of acute disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical manifestations of acute disease.","meaning":"Boolean indicating whether the patient currently has clinical manifestations of acute disease."} ;; "clinical manifestations of acute disorder"
(declare-const patient_has_clinical_signs_of_acute_disease_now@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the acute disease currently manifesting in the patient may affect appetite.","when_to_set_to_false":"Set to false if the acute disease currently manifesting in the patient does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute disease currently manifesting in the patient may affect appetite.","meaning":"Boolean indicating whether the acute disease currently manifesting in the patient may affect appetite."} ;; "clinical manifestations of acute disorder that may affect appetite"
(declare-const patient_has_clinical_signs_of_acute_disease_now@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the acute disease currently manifesting in the patient may affect energy expenditure.","when_to_set_to_false":"Set to false if the acute disease currently manifesting in the patient does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute disease currently manifesting in the patient may affect energy expenditure.","meaning":"Boolean indicating whether the acute disease currently manifesting in the patient may affect energy expenditure."} ;; "clinical manifestations of acute disorder that may affect energy expenditure"
(declare-const patient_has_diagnosis_of_acute_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of acute condition.","when_to_set_to_false":"Set to false if the patient does not have a documented history of acute condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of acute condition.","meaning":"Boolean indicating whether the patient has a history of acute condition."} ;; "history of acute condition"
(declare-const patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the acute condition in the patient's history may affect appetite.","when_to_set_to_false":"Set to false if the acute condition in the patient's history does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute condition in the patient's history may affect appetite.","meaning":"Boolean indicating whether the acute condition in the patient's history may affect appetite."} ;; "history of acute condition that may affect appetite"
(declare-const patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the acute condition in the patient's history may affect energy expenditure.","when_to_set_to_false":"Set to false if the acute condition in the patient's history does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute condition in the patient's history may affect energy expenditure.","meaning":"Boolean indicating whether the acute condition in the patient's history may affect energy expenditure."} ;; "history of acute condition that may affect energy expenditure"
(declare-const patient_has_clinical_signs_of_acute_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical manifestations of acute condition.","when_to_set_to_false":"Set to false if the patient currently does not have clinical manifestations of acute condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical manifestations of acute condition.","meaning":"Boolean indicating whether the patient currently has clinical manifestations of acute condition."} ;; "clinical manifestations of acute condition"
(declare-const patient_has_clinical_signs_of_acute_condition_now@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the acute condition currently manifesting in the patient may affect appetite.","when_to_set_to_false":"Set to false if the acute condition currently manifesting in the patient does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute condition currently manifesting in the patient may affect appetite.","meaning":"Boolean indicating whether the acute condition currently manifesting in the patient may affect appetite."} ;; "clinical manifestations of acute condition that may affect appetite"
(declare-const patient_has_clinical_signs_of_acute_condition_now@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the acute condition currently manifesting in the patient may affect energy expenditure.","when_to_set_to_false":"Set to false if the acute condition currently manifesting in the patient does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute condition currently manifesting in the patient may affect energy expenditure.","meaning":"Boolean indicating whether the acute condition currently manifesting in the patient may affect energy expenditure."} ;; "clinical manifestations of acute condition that may affect energy expenditure"
(declare-const patient_has_diagnosis_of_chronic_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chronic disease.","when_to_set_to_false":"Set to false if the patient does not have a documented history of chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chronic disease.","meaning":"Boolean indicating whether the patient has a history of chronic disease."} ;; "history of chronic disorder"
(declare-const patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the chronic disease in the patient's history may affect appetite.","when_to_set_to_false":"Set to false if the chronic disease in the patient's history does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease in the patient's history may affect appetite.","meaning":"Boolean indicating whether the chronic disease in the patient's history may affect appetite."} ;; "history of chronic disorder that may affect appetite"
(declare-const patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the chronic disease in the patient's history may affect energy expenditure.","when_to_set_to_false":"Set to false if the chronic disease in the patient's history does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease in the patient's history may affect energy expenditure.","meaning":"Boolean indicating whether the chronic disease in the patient's history may affect energy expenditure."} ;; "history of chronic disorder that may affect energy expenditure"
(declare-const patient_has_clinical_signs_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical manifestations of chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have clinical manifestations of chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical manifestations of chronic disease.","meaning":"Boolean indicating whether the patient currently has clinical manifestations of chronic disease."} ;; "clinical manifestations of chronic disorder"
(declare-const patient_has_clinical_signs_of_chronic_disease_now@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the chronic disease currently manifesting in the patient may affect appetite.","when_to_set_to_false":"Set to false if the chronic disease currently manifesting in the patient does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease currently manifesting in the patient may affect appetite.","meaning":"Boolean indicating whether the chronic disease currently manifesting in the patient may affect appetite."} ;; "clinical manifestations of chronic disorder that may affect appetite"
(declare-const patient_has_clinical_signs_of_chronic_disease_now@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the chronic disease currently manifesting in the patient may affect energy expenditure.","when_to_set_to_false":"Set to false if the chronic disease currently manifesting in the patient does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic disease currently manifesting in the patient may affect energy expenditure.","meaning":"Boolean indicating whether the chronic disease currently manifesting in the patient may affect energy expenditure."} ;; "clinical manifestations of chronic disorder that may affect energy expenditure"
(declare-const patient_has_diagnosis_of_chronic_condition_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented history of chronic condition.","when_to_set_to_false":"Set to false if the patient does not have a documented history of chronic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of chronic condition.","meaning":"Boolean indicating whether the patient has a history of chronic condition."} ;; "history of chronic condition"
(declare-const patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the chronic condition in the patient's history may affect appetite.","when_to_set_to_false":"Set to false if the chronic condition in the patient's history does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic condition in the patient's history may affect appetite.","meaning":"Boolean indicating whether the chronic condition in the patient's history may affect appetite."} ;; "history of chronic condition that may affect appetite"
(declare-const patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the chronic condition in the patient's history may affect energy expenditure.","when_to_set_to_false":"Set to false if the chronic condition in the patient's history does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic condition in the patient's history may affect energy expenditure.","meaning":"Boolean indicating whether the chronic condition in the patient's history may affect energy expenditure."} ;; "history of chronic condition that may affect energy expenditure"
(declare-const patient_has_clinical_signs_of_chronic_condition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has clinical manifestations of chronic condition.","when_to_set_to_false":"Set to false if the patient currently does not have clinical manifestations of chronic condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has clinical manifestations of chronic condition.","meaning":"Boolean indicating whether the patient currently has clinical manifestations of chronic condition."} ;; "clinical manifestations of chronic condition"
(declare-const patient_has_clinical_signs_of_chronic_condition_now@@may_affect_appetite Bool) ;; {"when_to_set_to_true":"Set to true if the chronic condition currently manifesting in the patient may affect appetite.","when_to_set_to_false":"Set to false if the chronic condition currently manifesting in the patient does not affect appetite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic condition currently manifesting in the patient may affect appetite.","meaning":"Boolean indicating whether the chronic condition currently manifesting in the patient may affect appetite."} ;; "clinical manifestations of chronic condition that may affect appetite"
(declare-const patient_has_clinical_signs_of_chronic_condition_now@@may_affect_energy_expenditure Bool) ;; {"when_to_set_to_true":"Set to true if the chronic condition currently manifesting in the patient may affect energy expenditure.","when_to_set_to_false":"Set to false if the chronic condition currently manifesting in the patient does not affect energy expenditure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chronic condition currently manifesting in the patient may affect energy expenditure.","meaning":"Boolean indicating whether the chronic condition currently manifesting in the patient may affect energy expenditure."} ;; "clinical manifestations of chronic condition that may affect energy expenditure"
(declare-const patient_has_finding_of_cushings_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of Cushing's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of Cushing's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of Cushing's disease.","meaning":"Boolean indicating whether the patient currently has a clinical finding of Cushing's disease."} ;; "Cushing's disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_appetite
      patient_has_diagnosis_of_acute_disease_inthehistory)
    :named REQ3_AUXILIARY0)) ;; "history of acute disorder that may affect appetite"

(assert
(! (=> patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_energy_expenditure
      patient_has_diagnosis_of_acute_disease_inthehistory)
    :named REQ3_AUXILIARY1)) ;; "history of acute disorder that may affect energy expenditure"

(assert
(! (=> patient_has_clinical_signs_of_acute_disease_now@@may_affect_appetite
      patient_has_clinical_signs_of_acute_disease_now)
    :named REQ3_AUXILIARY2)) ;; "clinical manifestations of acute disorder that may affect appetite"

(assert
(! (=> patient_has_clinical_signs_of_acute_disease_now@@may_affect_energy_expenditure
      patient_has_clinical_signs_of_acute_disease_now)
    :named REQ3_AUXILIARY3)) ;; "clinical manifestations of acute disorder that may affect energy expenditure"

(assert
(! (=> patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_appetite
      patient_has_diagnosis_of_acute_condition_inthehistory)
    :named REQ3_AUXILIARY4)) ;; "history of acute condition that may affect appetite"

(assert
(! (=> patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_energy_expenditure
      patient_has_diagnosis_of_acute_condition_inthehistory)
    :named REQ3_AUXILIARY5)) ;; "history of acute condition that may affect energy expenditure"

(assert
(! (=> patient_has_clinical_signs_of_acute_condition_now@@may_affect_appetite
      patient_has_clinical_signs_of_acute_condition_now)
    :named REQ3_AUXILIARY6)) ;; "clinical manifestations of acute condition that may affect appetite"

(assert
(! (=> patient_has_clinical_signs_of_acute_condition_now@@may_affect_energy_expenditure
      patient_has_clinical_signs_of_acute_condition_now)
    :named REQ3_AUXILIARY7)) ;; "clinical manifestations of acute condition that may affect energy expenditure"

(assert
(! (=> patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_appetite
      patient_has_diagnosis_of_chronic_disease_inthehistory)
    :named REQ3_AUXILIARY8)) ;; "history of chronic disorder that may affect appetite"

(assert
(! (=> patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_energy_expenditure
      patient_has_diagnosis_of_chronic_disease_inthehistory)
    :named REQ3_AUXILIARY9)) ;; "history of chronic disorder that may affect energy expenditure"

(assert
(! (=> patient_has_clinical_signs_of_chronic_disease_now@@may_affect_appetite
      patient_has_clinical_signs_of_chronic_disease_now)
    :named REQ3_AUXILIARY10)) ;; "clinical manifestations of chronic disorder that may affect appetite"

(assert
(! (=> patient_has_clinical_signs_of_chronic_disease_now@@may_affect_energy_expenditure
      patient_has_clinical_signs_of_chronic_disease_now)
    :named REQ3_AUXILIARY11)) ;; "clinical manifestations of chronic disorder that may affect energy expenditure"

(assert
(! (=> patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_appetite
      patient_has_diagnosis_of_chronic_condition_inthehistory)
    :named REQ3_AUXILIARY12)) ;; "history of chronic condition that may affect appetite"

(assert
(! (=> patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_energy_expenditure
      patient_has_diagnosis_of_chronic_condition_inthehistory)
    :named REQ3_AUXILIARY13)) ;; "history of chronic condition that may affect energy expenditure"

(assert
(! (=> patient_has_clinical_signs_of_chronic_condition_now@@may_affect_appetite
      patient_has_clinical_signs_of_chronic_condition_now)
    :named REQ3_AUXILIARY14)) ;; "clinical manifestations of chronic condition that may affect appetite"

(assert
(! (=> patient_has_clinical_signs_of_chronic_condition_now@@may_affect_energy_expenditure
      patient_has_clinical_signs_of_chronic_condition_now)
    :named REQ3_AUXILIARY15)) ;; "clinical manifestations of chronic condition that may affect energy expenditure"

;; Non-exhaustive examples imply umbrella (for all relevant umbrella terms)
(assert
(! (=> (or patient_has_finding_of_cushings_disease_now)
        (or patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_appetite
            patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_energy_expenditure
            patient_has_clinical_signs_of_acute_disease_now@@may_affect_appetite
            patient_has_clinical_signs_of_acute_disease_now@@may_affect_energy_expenditure
            patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_appetite
            patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_energy_expenditure
            patient_has_clinical_signs_of_acute_condition_now@@may_affect_appetite
            patient_has_clinical_signs_of_acute_condition_now@@may_affect_energy_expenditure
            patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_appetite
            patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_energy_expenditure
            patient_has_clinical_signs_of_chronic_disease_now@@may_affect_appetite
            patient_has_clinical_signs_of_chronic_disease_now@@may_affect_energy_expenditure
            patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_appetite
            patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_energy_expenditure
            patient_has_clinical_signs_of_chronic_condition_now@@may_affect_appetite
            patient_has_clinical_signs_of_chronic_condition_now@@may_affect_energy_expenditure))
    :named REQ3_AUXILIARY16)) ;; "with non-exhaustive examples (type 1 diabetes mellitus, type 2 diabetes mellitus, Cushing's disease, thyroid disorder, coccidioidomycosis)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_appetite)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acute disorder that may affect appetite."

(assert
(! (not patient_has_diagnosis_of_acute_disease_inthehistory@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acute disorder that may affect energy expenditure."

(assert
(! (not patient_has_clinical_signs_of_acute_disease_now@@may_affect_appetite)
    :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of acute disorder that may affect appetite."

(assert
(! (not patient_has_clinical_signs_of_acute_disease_now@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of acute disorder that may affect energy expenditure."

(assert
(! (not patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_appetite)
    :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acute condition that may affect appetite."

(assert
(! (not patient_has_diagnosis_of_acute_condition_inthehistory@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of acute condition that may affect energy expenditure."

(assert
(! (not patient_has_clinical_signs_of_acute_condition_now@@may_affect_appetite)
    :named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of acute condition that may affect appetite."

(assert
(! (not patient_has_clinical_signs_of_acute_condition_now@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of acute condition that may affect energy expenditure."

(assert
(! (not patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_appetite)
    :named REQ3_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic disorder that may affect appetite."

(assert
(! (not patient_has_diagnosis_of_chronic_disease_inthehistory@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic disorder that may affect energy expenditure."

(assert
(! (not patient_has_clinical_signs_of_chronic_disease_now@@may_affect_appetite)
    :named REQ3_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of chronic disorder that may affect appetite."

(assert
(! (not patient_has_clinical_signs_of_chronic_disease_now@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of chronic disorder that may affect energy expenditure."

(assert
(! (not patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_appetite)
    :named REQ3_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic condition that may affect appetite."

(assert
(! (not patient_has_diagnosis_of_chronic_condition_inthehistory@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic condition that may affect energy expenditure."

(assert
(! (not patient_has_clinical_signs_of_chronic_condition_now@@may_affect_appetite)
    :named REQ3_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of chronic condition that may affect appetite."

(assert
(! (not patient_has_clinical_signs_of_chronic_condition_now@@may_affect_energy_expenditure)
    :named REQ3_COMPONENT15_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has clinical manifestations of chronic condition that may affect energy expenditure."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_gastrointestinal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastrointestinal disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastrointestinal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastrointestinal disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastrointestinal disease."} ;; "gastrointestinal disease"

(declare-const patient_has_diagnosis_of_inflammatory_bowel_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of inflammatory bowel disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of inflammatory bowel disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of inflammatory bowel disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of inflammatory bowel disease."} ;; "inflammatory bowel disease"

(declare-const patient_has_diagnosis_of_crohn_s_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Crohn's disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Crohn's disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Crohn's disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Crohn's disease."} ;; "Crohn's disease"

(declare-const patient_has_diagnosis_of_ulcerative_colitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ulcerative colitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ulcerative colitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ulcerative colitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ulcerative colitis."} ;; "ulcerative colitis"

(declare-const patient_has_diagnosis_of_malabsorption_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malabsorption syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malabsorption syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malabsorption syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malabsorption syndrome."} ;; "malabsorption syndrome"

(declare-const patient_has_diagnosis_of_celiac_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of celiac disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of celiac disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of celiac disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of celiac disease."} ;; "celiac disease"

(declare-const patient_has_diagnosis_of_gastric_ulcer_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastric ulcer.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of gastric ulcer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of gastric ulcer.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastric ulcer."} ;; "gastric ulcer"

(declare-const patient_has_diagnosis_of_gastric_ulcer_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastric ulcer and the ulcer is active.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of gastric ulcer but the ulcer is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastric ulcer is active.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastric ulcer and the ulcer is active."} ;; "active gastric ulcer"

(declare-const patient_has_diagnosis_of_gastric_ulcer_now@@may_alter_metabolism Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of gastric ulcer and the ulcer may alter metabolism.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of gastric ulcer but the ulcer does not alter metabolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the gastric ulcer may alter metabolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of gastric ulcer and the ulcer may alter metabolism."} ;; "active gastric ulcer which may alter metabolism"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples: Crohn's disease and ulcerative colitis imply inflammatory bowel disease
(assert
(! (=> (or patient_has_diagnosis_of_crohn_s_disease_now
          patient_has_diagnosis_of_ulcerative_colitis_now)
        patient_has_diagnosis_of_inflammatory_bowel_disease_now)
    :named REQ4_AUXILIARY0)) ;; "inflammatory bowel disease with non-exhaustive examples (Crohn's disease, ulcerative colitis)"

;; Non-exhaustive example: inflammatory bowel disease implies gastrointestinal disease
(assert
(! (=> patient_has_diagnosis_of_inflammatory_bowel_disease_now
        patient_has_diagnosis_of_gastrointestinal_disease_now)
    :named REQ4_AUXILIARY1)) ;; "gastrointestinal disease with non-exhaustive examples (inflammatory bowel disease...)"

;; Non-exhaustive example: Crohn's disease and ulcerative colitis also imply gastrointestinal disease via IBD
(assert
(! (=> (or patient_has_diagnosis_of_crohn_s_disease_now
          patient_has_diagnosis_of_ulcerative_colitis_now)
        patient_has_diagnosis_of_gastrointestinal_disease_now)
    :named REQ4_AUXILIARY2)) ;; "gastrointestinal disease with non-exhaustive examples (inflammatory bowel disease with non-exhaustive examples (Crohn's disease, ulcerative colitis))"

;; Non-exhaustive example: celiac disease implies malabsorption syndrome
(assert
(! (=> patient_has_diagnosis_of_celiac_disease_now
        patient_has_diagnosis_of_malabsorption_syndrome_now)
    :named REQ4_AUXILIARY3)) ;; "malabsorption syndrome with non-exhaustive examples (celiac disease)"

;; Qualifier variable: active gastric ulcer implies gastric ulcer
(assert
(! (=> patient_has_diagnosis_of_gastric_ulcer_now@@active
        patient_has_diagnosis_of_gastric_ulcer_now)
    :named REQ4_AUXILIARY4)) ;; "active gastric ulcer"

;; Qualifier variable: gastric ulcer that may alter metabolism implies gastric ulcer
(assert
(! (=> patient_has_diagnosis_of_gastric_ulcer_now@@may_alter_metabolism
        patient_has_diagnosis_of_gastric_ulcer_now)
    :named REQ4_AUXILIARY5)) ;; "gastric ulcer which may alter metabolism"

;; Both qualifiers: active gastric ulcer which may alter metabolism implies both active and may_alter_metabolism
(assert
(! (=> (and patient_has_diagnosis_of_gastric_ulcer_now@@active
            patient_has_diagnosis_of_gastric_ulcer_now@@may_alter_metabolism)
        patient_has_diagnosis_of_gastric_ulcer_now)
    :named REQ4_AUXILIARY6)) ;; "active gastric ulcer which may alter metabolism"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have gastrointestinal disease (with non-exhaustive examples)
(assert
(! (not patient_has_diagnosis_of_gastrointestinal_disease_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gastrointestinal disease with non-exhaustive examples (inflammatory bowel disease with non-exhaustive examples (Crohn's disease, ulcerative colitis))."

;; Exclusion: patient must NOT have malabsorption syndrome (with non-exhaustive examples)
(assert
(! (not patient_has_diagnosis_of_malabsorption_syndrome_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malabsorption syndrome with non-exhaustive examples (celiac disease)."

;; Exclusion: patient must NOT have active gastric ulcer which may alter metabolism
(assert
(! (not (and patient_has_diagnosis_of_gastric_ulcer_now@@active
             patient_has_diagnosis_of_gastric_ulcer_now@@may_alter_metabolism))
    :named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has active gastric ulcer which may alter metabolism."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_patient_s_condition_unstable_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an unstable medical condition.","when_to_set_to_false":"Set to false if the patient currently does not have an unstable medical condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an unstable medical condition.","meaning":"Boolean indicating whether the patient currently has an unstable medical condition."} ;; "unstable medical condition"
(declare-const patient_has_finding_of_patient_s_condition_unstable_now@@assessed_by_history_and_physical_examination Bool) ;; {"when_to_set_to_true":"Set to true if the patient's unstable medical condition is assessed by history and physical examination.","when_to_set_to_false":"Set to false if the patient's unstable medical condition is not assessed by history and physical examination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the assessment was by history and physical examination.","meaning":"Boolean indicating whether the patient's unstable medical condition is assessed by history and physical examination."} ;; "as assessed by history and physical examination"
(declare-const patient_has_finding_of_inflammatory_disease_of_liver_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatitis.","when_to_set_to_false":"Set to false if the patient currently does not have hepatitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatitis.","meaning":"Boolean indicating whether the patient currently has hepatitis."} ;; "hepatitis"
(declare-const patient_has_finding_of_renal_insufficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has renal insufficiency.","when_to_set_to_false":"Set to false if the patient currently does not have renal insufficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has renal insufficiency.","meaning":"Boolean indicating whether the patient currently has renal insufficiency."} ;; "renal insufficiency"
(declare-const patient_has_finding_of_cancer_requiring_treatment_in_last_5_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had cancer requiring treatment at any time in the last 5 years.","when_to_set_to_false":"Set to false if the patient has not had cancer requiring treatment at any time in the last 5 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had cancer requiring treatment at any time in the last 5 years.","meaning":"Boolean indicating whether the patient has had cancer requiring treatment at any time in the last 5 years."} ;; "cancer requiring treatment in the last 5 years"
(declare-const patient_has_finding_of_disorder_of_the_central_nervous_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a central nervous system disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a central nervous system disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a central nervous system disorder.","meaning":"Boolean indicating whether the patient currently has a central nervous system disorder."} ;; "central nervous system disorder"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_inflammatory_disease_of_liver_now
          patient_has_finding_of_renal_insufficiency_now
          patient_has_finding_of_cancer_requiring_treatment_in_last_5_years
          patient_has_finding_of_disorder_of_the_central_nervous_system_now)
patient_has_finding_of_patient_s_condition_unstable_now@@assessed_by_history_and_physical_examination)
:named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (hepatitis, renal insufficiency, cancer requiring treatment in the last 5 years, central nervous system disorder) as assessed by history and physical examination."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_patient_s_condition_unstable_now@@assessed_by_history_and_physical_examination
patient_has_finding_of_patient_s_condition_unstable_now)
:named REQ5_AUXILIARY1)) ;; "as assessed by history and physical examination"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_patient_s_condition_unstable_now@@assessed_by_history_and_physical_examination)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has current unstable medical condition with non-exhaustive examples (hepatitis, renal insufficiency, cancer requiring treatment in the last 5 years, central nervous system disorder)) as assessed by history and physical examination."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const audit_score_value_recorded_most_recent_withunit_points Real) ;; {"when_to_set_to_value":"Set to the most recent recorded value of the patient's AUDIT questionnaire score in points.","when_to_set_to_null":"Set to null if the patient's most recent AUDIT questionnaire score is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the most recent AUDIT questionnaire score in points."} ;; "Alcohol Use Disorders Identification Test questionnaire score ≥ 8 points in adults."
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years.","when_to_set_to_null":"Set to null if the patient's current age is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the patient's current age in years."} ;; "in adults"
(declare-const patient_has_finding_of_alcohol_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has evidence of alcohol abuse.","when_to_set_to_false":"Set to false if the patient currently does not have evidence of alcohol abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has evidence of alcohol abuse.","meaning":"Boolean indicating whether the patient currently has evidence of alcohol abuse."} ;; "evidence of alcohol abuse"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: alcohol abuse as defined by AUDIT score ≥ 8 points in adults (age ≥ 18)
(assert
(! (= patient_has_finding_of_alcohol_abuse_now
     (and (>= patient_age_value_recorded_now_in_years 18)
          (>= audit_score_value_recorded_most_recent_withunit_points 8)))
:named REQ6_AUXILIARY0)) ;; "as defined by Alcohol Use Disorders Identification Test questionnaire score ≥ 8 points in adults."

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_alcohol_abuse_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has evidence of alcohol abuse as defined by Alcohol Use Disorders Identification Test questionnaire score ≥ 8 points in adults."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_evidence_of_nicotine_use_ever Bool) ;; {"when_to_set_to_true":"Set to true if there is any evidence that the patient has used nicotine at any time in their history.","when_to_set_to_false":"Set to false if there is evidence that the patient has never used nicotine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used nicotine.","meaning":"Boolean indicating whether the patient has any evidence of nicotine use at any time in their history."} ;; "the patient has evidence of nicotine use"

(declare-const patient_has_evidence_of_drug_use_ever Bool) ;; {"when_to_set_to_true":"Set to true if there is any evidence that the patient has used drugs (including but not limited to amphetamine, cocaine, heroin, marijuana) at any time in their history.","when_to_set_to_false":"Set to false if there is evidence that the patient has never used drugs (including but not limited to amphetamine, cocaine, heroin, marijuana).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used drugs (including but not limited to amphetamine, cocaine, heroin, marijuana).","meaning":"Boolean indicating whether the patient has any evidence of drug use (including but not limited to amphetamine, cocaine, heroin, marijuana) at any time in their history."} ;; "the patient has evidence of drug use with non-exhaustive examples (amphetamine use, cocaine use, heroin use, marijuana use)"

(declare-const patient_has_evidence_of_amphetamine_use_ever Bool) ;; {"when_to_set_to_true":"Set to true if there is any evidence that the patient has used amphetamines at any time in their history.","when_to_set_to_false":"Set to false if there is evidence that the patient has never used amphetamines.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used amphetamines.","meaning":"Boolean indicating whether the patient has any evidence of amphetamine use at any time in their history."} ;; "amphetamine use"

(declare-const patient_has_evidence_of_cocaine_use_ever Bool) ;; {"when_to_set_to_true":"Set to true if there is any evidence that the patient has used cocaine at any time in their history.","when_to_set_to_false":"Set to false if there is evidence that the patient has never used cocaine.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used cocaine.","meaning":"Boolean indicating whether the patient has any evidence of cocaine use at any time in their history."} ;; "cocaine use"

(declare-const patient_has_evidence_of_heroin_use_ever Bool) ;; {"when_to_set_to_true":"Set to true if there is any evidence that the patient has used heroin at any time in their history.","when_to_set_to_false":"Set to false if there is evidence that the patient has never used heroin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used heroin.","meaning":"Boolean indicating whether the patient has any evidence of heroin use at any time in their history."} ;; "heroin use"

(declare-const patient_has_evidence_of_marijuana_use_ever Bool) ;; {"when_to_set_to_true":"Set to true if there is any evidence that the patient has used marijuana at any time in their history.","when_to_set_to_false":"Set to false if there is evidence that the patient has never used marijuana.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever used marijuana.","meaning":"Boolean indicating whether the patient has any evidence of marijuana use at any time in their history."} ;; "marijuana use"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term for drug use
(assert
(! (=> (or patient_has_evidence_of_amphetamine_use_ever
           patient_has_evidence_of_cocaine_use_ever
           patient_has_evidence_of_heroin_use_ever
           patient_has_evidence_of_marijuana_use_ever)
        patient_has_evidence_of_drug_use_ever)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (amphetamine use, cocaine use, heroin use, marijuana use)"

;; ===================== Constraint Assertions (REQ 7) =====================
;; Exclusion: patient must NOT have evidence of nicotine use
(assert
(! (not patient_has_evidence_of_nicotine_use_ever)
:named REQ7_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has evidence of nicotine use"

;; Exclusion: patient must NOT have evidence of drug use (including non-exhaustive examples)
(assert
(! (not patient_has_evidence_of_drug_use_ever)
:named REQ7_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient has evidence of drug use with non-exhaustive examples (amphetamine use, cocaine use, heroin use, marijuana use)"

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_is_postmenopausal_woman_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a postmenopausal woman.","when_to_set_to_false":"Set to false if the patient is currently not a postmenopausal woman.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a postmenopausal woman.","meaning":"Boolean indicating whether the patient is currently a postmenopausal woman."} ;; "The patient is excluded if the patient is a postmenopausal woman."

(declare-const patient_has_symptoms_of_perimenopause_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of perimenopause.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of perimenopause.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of perimenopause.","meaning":"Boolean indicating whether the patient currently has symptoms of perimenopause."} ;; "The patient is excluded if the patient has symptoms of perimenopause..."

(declare-const patient_has_symptoms_of_menopausal_flushing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of menopausal flushing (hot flashes).","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of menopausal flushing (hot flashes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of menopausal flushing (hot flashes).","meaning":"Boolean indicating whether the patient currently has symptoms of menopausal flushing (hot flashes)."} ;; "hot flashes"

(declare-const patient_has_symptoms_of_irregular_periods_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of irregular periods.","when_to_set_to_false":"Set to false if the patient currently does not have symptoms of irregular periods.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has symptoms of irregular periods.","meaning":"Boolean indicating whether the patient currently has symptoms of irregular periods."} ;; "irregular periods"

(declare-const patient_has_symptoms_of_irregular_periods_now@@onset_following_age_40_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has symptoms of irregular periods and the onset of these symptoms occurred following age 40 years.","when_to_set_to_false":"Set to false if the patient currently has symptoms of irregular periods but the onset occurred at or before age 40 years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the onset of irregular periods occurred following age 40 years.","meaning":"Boolean indicating whether the patient currently has symptoms of irregular periods and the onset of these symptoms occurred following age 40 years."} ;; "onset of irregular periods following age 40 years"

(declare-const patient_pituitary_follicle_stimulating_hormone_value_recorded_now_withunit_international_units Real) ;; {"when_to_set_to_value":"Set to the measured value if a numeric measurement of follicle-stimulating hormone (FSH) in international units is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current follicle-stimulating hormone (FSH) level in international units."} ;; "elevation of follicle-stimulating hormone > 20 international units following age 40 years"

(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is female.","when_to_set_to_false":"Set to false if the patient's current sex is not female.","when_to_set_to_null":"Set to null if the patient's current sex is unknown or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "postmenopausal woman"

(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years.","when_to_set_to_null":"Set to null if the patient's current age is unknown, not documented, or cannot be determined.","meaning":"Numeric value for the patient's current age in years."} ;; "following age 40 years"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples imply umbrella term (perimenopause symptoms)
(assert
(! (=> (or patient_has_symptoms_of_menopausal_flushing_now
          patient_has_symptoms_of_irregular_periods_now@@onset_following_age_40_years
          (and (> patient_pituitary_follicle_stimulating_hormone_value_recorded_now_withunit_international_units 20)
               (> patient_age_value_recorded_now_in_years 40)))
    patient_has_symptoms_of_perimenopause_now)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples (hot flashes, onset of irregular periods following age 40 years, elevation of follicle-stimulating hormone > 20 international units following age 40 years)"

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_symptoms_of_irregular_periods_now@@onset_following_age_40_years
       patient_has_symptoms_of_irregular_periods_now)
:named REQ8_AUXILIARY1)) ;; "onset of irregular periods following age 40 years"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_is_postmenopausal_woman_now)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a postmenopausal woman."

(assert
(! (not patient_has_symptoms_of_perimenopause_now)
:named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has symptoms of perimenopause with non-exhaustive examples (hot flashes, onset of irregular periods following age 40 years, elevation of follicle-stimulating hormone > 20 international units following age 40 years)."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_condition_contraindicated_for_magnetic_resonance_imaging_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had any condition that is contraindicated for magnetic resonance imaging at any time in their history.","when_to_set_to_false":"Set to false if it is known that the patient has never had any condition contraindicated for magnetic resonance imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had any condition contraindicated for magnetic resonance imaging.","meaning":"Boolean indicating whether the patient has ever had any condition contraindicated for magnetic resonance imaging at any time in their history."} ;; "any condition contraindicated for magnetic resonance imaging"

(declare-const patient_has_finding_of_pacemaker_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a pacemaker implanted at any time in their history.","when_to_set_to_false":"Set to false if it is known that the patient has never had a pacemaker implanted.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a pacemaker implanted.","meaning":"Boolean indicating whether the patient has ever had a pacemaker at any time in their history."} ;; "pacemaker"

(declare-const patient_has_finding_of_metal_foreign_body_in_head_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a metal foreign body in the head (cranial cavity), regardless of when it occurred.","when_to_set_to_false":"Set to false if it is known that the patient has never had a metal foreign body in the head (cranial cavity).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a metal foreign body in the head (cranial cavity).","meaning":"Boolean indicating whether the patient has ever had a metal foreign body in the head (cranial cavity) at any time in their history."} ;; "metal in the cranial cavity"

(declare-const patient_has_finding_of_significant_claustrophobia_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had significant claustrophobia at any time in their history.","when_to_set_to_false":"Set to false if it is known that the patient has never had significant claustrophobia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had significant claustrophobia.","meaning":"Boolean indicating whether the patient has ever had significant claustrophobia at any time in their history."} ;; "significant claustrophobia"

(declare-const patient_has_finding_of_holes_in_skull_made_by_trauma_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had holes in the skull made by trauma at any time in their history.","when_to_set_to_false":"Set to false if it is known that the patient has never had holes in the skull made by trauma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had holes in the skull made by trauma.","meaning":"Boolean indicating whether the patient has ever had holes in the skull made by trauma at any time in their history."} ;; "holes in the skull made by trauma"

(declare-const patient_has_finding_of_holes_in_skull_made_by_surgery_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had holes in the skull made by surgery at any time in their history.","when_to_set_to_false":"Set to false if it is known that the patient has never had holes in the skull made by surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had holes in the skull made by surgery.","meaning":"Boolean indicating whether the patient has ever had holes in the skull made by surgery at any time in their history."} ;; "holes in the skull made by surgery"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_pacemaker_in_the_history
           patient_has_finding_of_metal_foreign_body_in_head_inthehistory
           patient_has_finding_of_significant_claustrophobia_in_the_history
           patient_has_finding_of_holes_in_skull_made_by_trauma_in_the_history
           patient_has_finding_of_holes_in_skull_made_by_surgery_in_the_history)
        patient_has_condition_contraindicated_for_magnetic_resonance_imaging_in_the_history)
   :named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (pacemaker, metal in the cranial cavity, significant claustrophobia, holes in the skull made by trauma, holes in the skull made by surgery)."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_condition_contraindicated_for_magnetic_resonance_imaging_in_the_history)
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition contraindicated for magnetic resonance imaging with non-exhaustive examples (pacemaker, metal in the cranial cavity, significant claustrophobia, holes in the skull made by trauma, holes in the skull made by surgery)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@not_specifically_mentioned_above Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or finding is NOT specifically mentioned above in the eligibility criteria.","when_to_set_to_false":"Set to false if the disease, condition, or finding IS specifically mentioned above.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease, condition, or finding is specifically mentioned above.","meaning":"Boolean indicating whether the disease, condition, or finding is NOT specifically mentioned above in the eligibility criteria."} ;; "NOT specifically mentioned above"

(declare-const patient_has_finding_of_disease_condition_finding_now@@determined_in_opinion_of_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or finding is determined in the opinion of the investigator.","when_to_set_to_false":"Set to false if the disease, condition, or finding is NOT determined in the opinion of the investigator.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease, condition, or finding is determined in the opinion of the investigator.","meaning":"Boolean indicating whether the disease, condition, or finding is determined in the opinion of the investigator."} ;; "in the opinion of the investigator"

(declare-const patient_has_finding_of_disease_condition_finding_now@@may_interfere_with_study_or_prove_unsafe_for_participation Bool) ;; {"when_to_set_to_true":"Set to true if the disease, condition, or finding may interfere with the study OR may prove unsafe for participation.","when_to_set_to_false":"Set to false if the disease, condition, or finding does NOT interfere with the study and does NOT prove unsafe for participation.","when_to_set_to_null":"Set to null if it is unknown or cannot be determined whether the disease, condition, or finding may interfere with the study or prove unsafe for participation.","meaning":"Boolean indicating whether the disease, condition, or finding may interfere with the study OR may prove unsafe for participation."} ;; "may interfere with the study OR may prove unsafe for participation"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@not_specifically_mentioned_above
      patient_has_finding_of_disease_condition_finding_now)
:named REQ10_AUXILIARY0)) ;; "condition NOT specifically mentioned above"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@determined_in_opinion_of_investigator
      patient_has_finding_of_disease_condition_finding_now)
:named REQ10_AUXILIARY1)) ;; "in the opinion of the investigator"

(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_interfere_with_study_or_prove_unsafe_for_participation
      patient_has_finding_of_disease_condition_finding_now)
:named REQ10_AUXILIARY2)) ;; "may interfere with the study OR may prove unsafe for participation"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Exclusion: patient must NOT have any condition NOT specifically mentioned above that, in the opinion of the investigator, may interfere with the study
(assert
(! (not (and patient_has_finding_of_disease_condition_finding_now@@not_specifically_mentioned_above
             patient_has_finding_of_disease_condition_finding_now@@determined_in_opinion_of_investigator
             patient_has_finding_of_disease_condition_finding_now@@may_interfere_with_study_or_prove_unsafe_for_participation))
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition NOT specifically mentioned above that, in the opinion of the investigator, may interfere with the study."

;; Exclusion: patient must NOT have any condition NOT specifically mentioned above that, in the opinion of the investigator, may prove unsafe for participation
;; (Note: The variable patient_has_finding_of_disease_condition_finding_now@@may_interfere_with_study_or_prove_unsafe_for_participation covers both 'may interfere with the study' OR 'may prove unsafe for participation', so both components are covered by the same assertion above.)
;; No additional assertion needed for the second component, as it is subsumed by the first.
