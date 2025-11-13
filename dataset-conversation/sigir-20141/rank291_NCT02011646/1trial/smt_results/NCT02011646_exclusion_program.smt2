;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_anorexia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of anorexia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of anorexia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of anorexia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of anorexia nervosa."} ;; "anorexia nervosa"
(declare-const patient_has_diagnosis_of_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bulimia nervosa."} ;; "bulimia nervosa"
(declare-const patient_has_diagnosis_of_binge_eating_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of binge eating disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of binge eating disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of binge eating disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of binge eating disorder."} ;; "binge eating disorder"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_diagnosis_of_anorexia_nervosa_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current anorexia nervosa."

(assert
  (! (not patient_has_diagnosis_of_bulimia_nervosa_now)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current bulimia nervosa."

(assert
  (! (not patient_has_diagnosis_of_binge_eating_disorder_now)
     :named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a current binge eating disorder."

;; --- verifier-bypassed (attempt 8/8) 2025-10-25T05:48:37.983224 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_dissatisfaction_with_body_image_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dissatisfaction with their body image (body image concerns).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dissatisfaction with their body image (body image concerns).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dissatisfaction with their body image.","meaning":"Boolean indicating whether the patient currently has dissatisfaction with their body image (body image concerns)."} ;; "body image concerns"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not (not patient_has_finding_of_dissatisfaction_with_body_image_now))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an absence of body image concerns."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_body_mass_index_centile_value_recorded_now_withunit_percentile Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current body mass index percentile is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current body mass index percentile."} ;; "body mass index percentile"
(declare-const patient_has_finding_of_body_weight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an obese body weight.","when_to_set_to_false":"Set to false if the patient currently does not have an obese body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an obese body weight.","meaning":"Boolean indicating whether the patient currently has an obese body weight."} ;; "obese body weight"
(declare-const patient_has_finding_of_normal_weight_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a normal body weight.","when_to_set_to_false":"Set to false if the patient currently does not have a normal body weight.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a normal body weight.","meaning":"Boolean indicating whether the patient currently has a normal body weight."} ;; "normal body weight"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Define normal body weight in terms of BMI percentile
(assert
(! (= patient_has_finding_of_normal_weight_now
     (< patient_body_mass_index_centile_value_recorded_now_withunit_percentile 85))
:named REQ2_AUXILIARY0)) ;; "normal body weight (body mass index percentile < 85th percentile)"

;; Define obese body weight in terms of BMI percentile
(assert
(! (= patient_has_finding_of_body_weight_now
     (>= patient_body_mass_index_centile_value_recorded_now_withunit_percentile 95))
:named REQ2_AUXILIARY1)) ;; "obese body weight (body mass index percentile ≥ 95th percentile)"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_normal_weight_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a normal body weight (body mass index percentile < 85th percentile)."

(assert
(! (not patient_has_finding_of_body_weight_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an obese body weight (body mass index percentile ≥ 95th percentile)."
