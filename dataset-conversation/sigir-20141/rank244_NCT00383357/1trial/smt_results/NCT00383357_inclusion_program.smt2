;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female (e.g., male or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is female as currently recorded."} // "To be included, the patient must be male or female."
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as male at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not male (e.g., female or other) at the current time.","when_to_set_to_null":"Set to null if the patient's sex is unknown, not documented, or cannot be determined at the current time.","meaning":"Boolean value indicating whether the patient's sex is male as currently recorded."} // "To be included, the patient must be male or female."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (or patient_sex_is_female_now
         patient_sex_is_male_now)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be male or female."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged 18 to 35, or aged 60 to 85"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (or (and (>= patient_age_value_recorded_now_in_years 18.0)
              (<= patient_age_value_recorded_now_in_years 35.0))
         (and (>= patient_age_value_recorded_now_in_years 60.0)
              (<= patient_age_value_recorded_now_in_years 85.0)))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged 18 to 35, or aged 60 to 85."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const duration_of_residence_at_denver_altitude_years Real) ;; {"when_to_set_to_value":"Set to the number of years the patient has continuously resided at Denver altitude or higher.","when_to_set_to_null":"Set to null if the duration of residence at Denver altitude or higher is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the total duration, in years, that the patient has continuously resided at Denver altitude or higher."} // "To be included, the patient must have residence at Denver altitude or higher for at least one year."
(declare-const patient_has_residence_at_denver_altitude_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides at Denver altitude or higher.","when_to_set_to_false":"Set to false if the patient currently does not reside at Denver altitude or higher.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides at Denver altitude or higher.","meaning":"Boolean indicating whether the patient currently has residence at Denver altitude or higher."} // "To be included, the patient must have residence at Denver altitude or higher for at least one year."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (and patient_has_residence_at_denver_altitude_now
          (>= duration_of_residence_at_denver_altitude_years 1.0))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have residence at Denver altitude or higher for at least one year."

;; ===================== Declarations for the inclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_thyroid_dysfunction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has thyroid dysfunction (including hypothyroidism and hyperthyroidism).","when_to_set_to_false":"Set to false if the patient currently does not have thyroid dysfunction (including hypothyroidism and hyperthyroidism).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thyroid dysfunction (including hypothyroidism and hyperthyroidism).","meaning":"Boolean indicating whether the patient currently has thyroid dysfunction (including hypothyroidism and hyperthyroidism)."} // "To be included, the patient must have stable treated diseases, which may include thyroid dysfunction (including hypothyroidism and hyperthyroidism)..."
(declare-const patient_has_finding_of_thyroid_dysfunction_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is stable.","when_to_set_to_false":"Set to false if the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is stable.","meaning":"Boolean indicating whether the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is stable."} // "stable"
(declare-const patient_has_finding_of_thyroid_dysfunction_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is treated.","when_to_set_to_false":"Set to false if the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is treated.","meaning":"Boolean indicating whether the patient's thyroid dysfunction (including hypothyroidism and hyperthyroidism) is treated."} // "treated"
(declare-const patient_has_finding_of_hypothyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypothyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypothyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypothyroidism.","meaning":"Boolean indicating whether the patient currently has hypothyroidism."} // "including hypothyroidism"
(declare-const patient_has_finding_of_hypothyroidism_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypothyroidism is stable.","when_to_set_to_false":"Set to false if the patient's hypothyroidism is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypothyroidism is stable.","meaning":"Boolean indicating whether the patient's hypothyroidism is stable."} // "stable"
(declare-const patient_has_finding_of_hypothyroidism_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypothyroidism is treated.","when_to_set_to_false":"Set to false if the patient's hypothyroidism is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypothyroidism is treated.","meaning":"Boolean indicating whether the patient's hypothyroidism is treated."} // "treated"
(declare-const patient_has_finding_of_hyperthyroidism_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hyperthyroidism.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hyperthyroidism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hyperthyroidism.","meaning":"Boolean indicating whether the patient currently has hyperthyroidism."} // "including hyperthyroidism"
(declare-const patient_has_finding_of_hyperthyroidism_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hyperthyroidism is stable.","when_to_set_to_false":"Set to false if the patient's hyperthyroidism is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hyperthyroidism is stable.","meaning":"Boolean indicating whether the patient's hyperthyroidism is stable."} // "stable"
(declare-const patient_has_finding_of_hyperthyroidism_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hyperthyroidism is treated.","when_to_set_to_false":"Set to false if the patient's hyperthyroidism is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hyperthyroidism is treated.","meaning":"Boolean indicating whether the patient's hyperthyroidism is treated."} // "treated"
(declare-const patient_has_finding_of_hypertensive_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hypertensive disorder (hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have hypertensive disorder (hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hypertensive disorder (hypertension).","meaning":"Boolean indicating whether the patient currently has hypertensive disorder (hypertension)."} // "hypertension"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder is stable.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive disorder is stable.","meaning":"Boolean indicating whether the patient's hypertensive disorder is stable."} // "stable"
(declare-const patient_has_finding_of_hypertensive_disorder_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypertensive disorder is treated.","when_to_set_to_false":"Set to false if the patient's hypertensive disorder is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypertensive disorder is treated.","meaning":"Boolean indicating whether the patient's hypertensive disorder is treated."} // "treated"
(declare-const patient_has_finding_of_hypercholesterolemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of hypercholesterolemia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of hypercholesterolemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of hypercholesterolemia.","meaning":"Boolean indicating whether the patient currently has hypercholesterolemia."} // "hypercholesterolemia"
(declare-const patient_has_finding_of_hypercholesterolemia_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypercholesterolemia is stable.","when_to_set_to_false":"Set to false if the patient's hypercholesterolemia is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypercholesterolemia is stable.","meaning":"Boolean indicating whether the patient's hypercholesterolemia is stable."} // "stable"
(declare-const patient_has_finding_of_hypercholesterolemia_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypercholesterolemia is treated.","when_to_set_to_false":"Set to false if the patient's hypercholesterolemia is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hypercholesterolemia is treated.","meaning":"Boolean indicating whether the patient's hypercholesterolemia is treated."} // "treated"
(declare-const patient_has_finding_of_urinary_incontinence_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of urinary incontinence.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of urinary incontinence.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of urinary incontinence.","meaning":"Boolean indicating whether the patient currently has urinary incontinence."} // "urinary incontinence"
(declare-const patient_has_finding_of_urinary_incontinence_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's urinary incontinence is stable.","when_to_set_to_false":"Set to false if the patient's urinary incontinence is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's urinary incontinence is stable.","meaning":"Boolean indicating whether the patient's urinary incontinence is stable."} // "stable"
(declare-const patient_has_finding_of_urinary_incontinence_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's urinary incontinence is treated.","when_to_set_to_false":"Set to false if the patient's urinary incontinence is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's urinary incontinence is treated.","meaning":"Boolean indicating whether the patient's urinary incontinence is treated."} // "treated"
(declare-const patient_has_finding_of_large_prostate_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of large prostate (prostate enlargement).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of large prostate (prostate enlargement).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of large prostate (prostate enlargement).","meaning":"Boolean indicating whether the patient currently has large prostate (prostate enlargement)."} // "prostate enlargement"
(declare-const patient_has_finding_of_large_prostate_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's large prostate is stable.","when_to_set_to_false":"Set to false if the patient's large prostate is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's large prostate is stable.","meaning":"Boolean indicating whether the patient's large prostate is stable."} // "stable"
(declare-const patient_has_finding_of_large_prostate_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's large prostate is treated.","when_to_set_to_false":"Set to false if the patient's large prostate is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's large prostate is treated.","meaning":"Boolean indicating whether the patient's large prostate is treated."} // "treated"
(declare-const patient_has_finding_of_gastroesophageal_reflux_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of gastroesophageal reflux disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of gastroesophageal reflux disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of gastroesophageal reflux disease.","meaning":"Boolean indicating whether the patient currently has gastroesophageal reflux disease."} // "gastroesophageal reflux disease"
(declare-const patient_has_finding_of_gastroesophageal_reflux_disease_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastroesophageal reflux disease is stable.","when_to_set_to_false":"Set to false if the patient's gastroesophageal reflux disease is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastroesophageal reflux disease is stable.","meaning":"Boolean indicating whether the patient's gastroesophageal reflux disease is stable."} // "stable"
(declare-const patient_has_finding_of_gastroesophageal_reflux_disease_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's gastroesophageal reflux disease is treated.","when_to_set_to_false":"Set to false if the patient's gastroesophageal reflux disease is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's gastroesophageal reflux disease is treated.","meaning":"Boolean indicating whether the patient's gastroesophageal reflux disease is treated."} // "treated"
(declare-const patient_has_finding_of_irritable_bowel_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of irritable bowel syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of irritable bowel syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of irritable bowel syndrome.","meaning":"Boolean indicating whether the patient currently has irritable bowel syndrome."} // "irritable bowel syndrome"
(declare-const patient_has_finding_of_irritable_bowel_syndrome_now@@stable Bool) ;; {"when_to_set_to_true":"Set to true if the patient's irritable bowel syndrome is stable.","when_to_set_to_false":"Set to false if the patient's irritable bowel syndrome is not stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's irritable bowel syndrome is stable.","meaning":"Boolean indicating whether the patient's irritable bowel syndrome is stable."} // "stable"
(declare-const patient_has_finding_of_irritable_bowel_syndrome_now@@treated Bool) ;; {"when_to_set_to_true":"Set to true if the patient's irritable bowel syndrome is treated.","when_to_set_to_false":"Set to false if the patient's irritable bowel syndrome is not treated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's irritable bowel syndrome is treated.","meaning":"Boolean indicating whether the patient's irritable bowel syndrome is treated."} // "treated"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive examples: hypothyroidism and hyperthyroidism imply thyroid dysfunction
(assert
  (! (=> (or patient_has_finding_of_hypothyroidism_now
            patient_has_finding_of_hyperthyroidism_now)
         patient_has_finding_of_thyroid_dysfunction_now)
     :named REQ3_AUXILIARY0)) ;; "including hypothyroidism and hyperthyroidism"

;; Qualifier variables imply corresponding stem variables for thyroid dysfunction
(assert
  (! (=> patient_has_finding_of_thyroid_dysfunction_now@@stable
         patient_has_finding_of_thyroid_dysfunction_now)
     :named REQ3_AUXILIARY1)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_thyroid_dysfunction_now@@treated
         patient_has_finding_of_thyroid_dysfunction_now)
     :named REQ3_AUXILIARY2)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for hypothyroidism
(assert
  (! (=> patient_has_finding_of_hypothyroidism_now@@stable
         patient_has_finding_of_hypothyroidism_now)
     :named REQ3_AUXILIARY3)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_hypothyroidism_now@@treated
         patient_has_finding_of_hypothyroidism_now)
     :named REQ3_AUXILIARY4)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for hyperthyroidism
(assert
  (! (=> patient_has_finding_of_hyperthyroidism_now@@stable
         patient_has_finding_of_hyperthyroidism_now)
     :named REQ3_AUXILIARY5)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_hyperthyroidism_now@@treated
         patient_has_finding_of_hyperthyroidism_now)
     :named REQ3_AUXILIARY6)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for hypertension
(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@stable
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ3_AUXILIARY7)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_hypertensive_disorder_now@@treated
         patient_has_finding_of_hypertensive_disorder_now)
     :named REQ3_AUXILIARY8)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for hypercholesterolemia
(assert
  (! (=> patient_has_finding_of_hypercholesterolemia_now@@stable
         patient_has_finding_of_hypercholesterolemia_now)
     :named REQ3_AUXILIARY9)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_hypercholesterolemia_now@@treated
         patient_has_finding_of_hypercholesterolemia_now)
     :named REQ3_AUXILIARY10)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for urinary incontinence
(assert
  (! (=> patient_has_finding_of_urinary_incontinence_now@@stable
         patient_has_finding_of_urinary_incontinence_now)
     :named REQ3_AUXILIARY11)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_urinary_incontinence_now@@treated
         patient_has_finding_of_urinary_incontinence_now)
     :named REQ3_AUXILIARY12)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for large prostate
(assert
  (! (=> patient_has_finding_of_large_prostate_now@@stable
         patient_has_finding_of_large_prostate_now)
     :named REQ3_AUXILIARY13)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_large_prostate_now@@treated
         patient_has_finding_of_large_prostate_now)
     :named REQ3_AUXILIARY14)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for gastroesophageal reflux disease
(assert
  (! (=> patient_has_finding_of_gastroesophageal_reflux_disease_now@@stable
         patient_has_finding_of_gastroesophageal_reflux_disease_now)
     :named REQ3_AUXILIARY15)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_gastroesophageal_reflux_disease_now@@treated
         patient_has_finding_of_gastroesophageal_reflux_disease_now)
     :named REQ3_AUXILIARY16)) ;; "stable treated diseases"

;; Qualifier variables imply corresponding stem variables for irritable bowel syndrome
(assert
  (! (=> patient_has_finding_of_irritable_bowel_syndrome_now@@stable
         patient_has_finding_of_irritable_bowel_syndrome_now)
     :named REQ3_AUXILIARY17)) ;; "stable treated diseases"

(assert
  (! (=> patient_has_finding_of_irritable_bowel_syndrome_now@@treated
         patient_has_finding_of_irritable_bowel_syndrome_now)
     :named REQ3_AUXILIARY18)) ;; "stable treated diseases"

;; Non-exhaustive examples: hypothyroidism and hyperthyroidism stable/treated imply thyroid dysfunction stable/treated
(assert
  (! (=> (or patient_has_finding_of_hypothyroidism_now@@stable
            patient_has_finding_of_hyperthyroidism_now@@stable)
         patient_has_finding_of_thyroid_dysfunction_now@@stable)
     :named REQ3_AUXILIARY19)) ;; "including hypothyroidism and hyperthyroidism" + "stable"

(assert
  (! (=> (or patient_has_finding_of_hypothyroidism_now@@treated
            patient_has_finding_of_hyperthyroidism_now@@treated)
         patient_has_finding_of_thyroid_dysfunction_now@@treated)
     :named REQ3_AUXILIARY20)) ;; "including hypothyroidism and hyperthyroidism" + "treated"

;; ===================== Constraint Assertions (REQ 3) =====================
;; At least one stable and treated disease from the list (non-exhaustive: "may include ...")
(assert
  (! (or
        (and patient_has_finding_of_thyroid_dysfunction_now@@stable
             patient_has_finding_of_thyroid_dysfunction_now@@treated)
        (and patient_has_finding_of_hypertensive_disorder_now@@stable
             patient_has_finding_of_hypertensive_disorder_now@@treated)
        (and patient_has_finding_of_hypercholesterolemia_now@@stable
             patient_has_finding_of_hypercholesterolemia_now@@treated)
        (and patient_has_finding_of_urinary_incontinence_now@@stable
             patient_has_finding_of_urinary_incontinence_now@@treated)
        (and patient_has_finding_of_large_prostate_now@@stable
             patient_has_finding_of_large_prostate_now@@treated)
        (and patient_has_finding_of_gastroesophageal_reflux_disease_now@@stable
             patient_has_finding_of_gastroesophageal_reflux_disease_now@@treated)
        (and patient_has_finding_of_irritable_bowel_syndrome_now@@stable
             patient_has_finding_of_irritable_bowel_syndrome_now@@treated)
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have stable treated diseases, which may include ..."
