;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_psychoactive_substance_abuse_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of psychoactive substance abuse.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of psychoactive substance abuse.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of psychoactive substance abuse.","meaning":"Boolean indicating whether the patient currently has psychoactive substance abuse."} ;; "substance abuse"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_psychoactive_substance_abuse_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has substance abuse."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_bulimia_nervosa_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of bulimia nervosa.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of bulimia nervosa.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has bulimia nervosa.","meaning":"Boolean indicating whether the patient currently has bulimia nervosa."} ;; "bulimia nervosa"
(declare-const patient_has_related_behaviors_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has related behaviors as defined by the study or protocol.","when_to_set_to_false":"Set to false if the patient currently does not have related behaviors as defined by the study or protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has related behaviors as defined by the study or protocol.","meaning":"Boolean indicating whether the patient currently has related behaviors at the present time."} ;; "related behaviors"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_bulimia_nervosa_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bulimia nervosa."

(assert
  (! (not patient_has_related_behaviors_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has related behaviors."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently known not to be breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breast feeding"
(declare-const patients_breastfeeding_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently breastfeeding.","meaning":"Boolean indicating whether the patient is currently breastfeeding."} ;; "breast feeding"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Link observable entity to main breastfeeding variable
(assert
(! (= patient_is_breastfeeding_now patients_breastfeeding_is_positive_now)
:named REQ2_AUXILIARY0)) ;; "breast feeding" observable entity is equivalent to main breastfeeding variable

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

(assert
(! (not patient_is_breastfeeding_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breast feeding."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_medical_contraindication_to_counseling_about_diet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical contraindication to counseling about diet.","when_to_set_to_false":"Set to false if the patient currently does not have a medical contraindication to counseling about diet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical contraindication to counseling about diet.","meaning":"Boolean indicating whether the patient currently has a medical contraindication to counseling about diet."} ;; "the patient has medical contraindications to counseling about diet"
(declare-const patient_has_medical_contraindication_to_counseling_about_physical_activity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical contraindication to counseling about physical activity.","when_to_set_to_false":"Set to false if the patient currently does not have a medical contraindication to counseling about physical activity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical contraindication to counseling about physical activity.","meaning":"Boolean indicating whether the patient currently has a medical contraindication to counseling about physical activity."} ;; "the patient has medical contraindications to counseling about physical activity"
(declare-const patient_has_medical_contraindication_to_counseling_about_weight_reduction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a medical contraindication to counseling about weight reduction.","when_to_set_to_false":"Set to false if the patient currently does not have a medical contraindication to counseling about weight reduction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a medical contraindication to counseling about weight reduction.","meaning":"Boolean indicating whether the patient currently has a medical contraindication to counseling about weight reduction."} ;; "the patient has medical contraindications to counseling about weight reduction"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_medical_contraindication_to_counseling_about_diet_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medical contraindications to counseling about diet."

(assert
(! (not patient_has_medical_contraindication_to_counseling_about_physical_activity_now)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medical contraindications to counseling about physical activity."

(assert
(! (not patient_has_medical_contraindication_to_counseling_about_weight_reduction_now)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has medical contraindications to counseling about weight reduction."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mental disorder.","meaning":"Boolean indicating whether the patient currently has a mental disorder."} ;; "mental illness"
(declare-const patient_has_finding_of_mental_disorder_now@@unstable Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mental disorder and the disorder is unstable.","when_to_set_to_false":"Set to false if the patient currently has a mental disorder and the disorder is stable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is unstable.","meaning":"Boolean indicating whether the patient's current mental disorder is unstable."} ;; "unstable mental illness"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@unstable
      patient_has_finding_of_mental_disorder_now)
:named REQ4_AUXILIARY0)) ;; "unstable mental illness" implies "mental illness"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_mental_disorder_now@@unstable)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unstable mental illness."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_dsm_iv_pathological_gambling_criteria_count_now Real) ;; {"when_to_set_to_value":"Set to the number of DSM-IV pathological gambling criteria (out of ten) that the patient currently meets, as assessed now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many DSM-IV pathological gambling criteria the patient currently meets.","meaning":"Numeric value representing the number of DSM-IV pathological gambling criteria currently met by the patient (range: 0-10)."} ;; "the patient meets greater than or equal to five criteria"
(declare-const patient_has_finding_of_compulsive_gambling_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of compulsive (pathological) gambling.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of compulsive (pathological) gambling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has compulsive (pathological) gambling.","meaning":"Boolean indicating whether the patient currently has compulsive (pathological) gambling."} ;; "pathological gambling"
(declare-const patient_has_finding_of_compulsive_gambling_now@@identified_by_dsm_iv_ten_item_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's compulsive (pathological) gambling is identified on the basis of the ten item DSM-IV criteria.","when_to_set_to_false":"Set to false if the patient's compulsive (pathological) gambling is not identified on the basis of the ten item DSM-IV criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's compulsive (pathological) gambling is identified by the ten item DSM-IV criteria.","meaning":"Boolean indicating whether the patient's compulsive (pathological) gambling is identified by the ten item DSM-IV criteria."} ;; "on the basis of the ten item Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Definition: patient meets DSM-IV pathological gambling criteria if count >= 5
(assert
(! (= patient_has_finding_of_compulsive_gambling_now@@identified_by_dsm_iv_ten_item_criteria
     (>= patient_dsm_iv_pathological_gambling_criteria_count_now 5))
:named REQ5_AUXILIARY0)) ;; "the patient meets greater than or equal to five criteria"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_compulsive_gambling_now@@identified_by_dsm_iv_ten_item_criteria
       patient_has_finding_of_compulsive_gambling_now)
:named REQ5_AUXILIARY1)) ;; "pathological gambling on the basis of the ten item DSM-IV criteria"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_compulsive_gambling_now@@identified_by_dsm_iv_ten_item_criteria)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient screens positive for pathological gambling on the basis of the ten item Diagnostic and Statistical Manual of Mental Disorders, Fourth Edition criteria (the patient meets greater than or equal to five criteria)."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_unable_to_read_consent_forms_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to read consent forms in English.","when_to_set_to_false":"Set to false if the patient is currently able to read consent forms in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to read consent forms in English.","meaning":"Boolean indicating whether the patient is currently unable to read consent forms in English."} ;; "the patient is unable to read consent forms in English"
(declare-const patient_is_unable_to_fill_out_surveys_in_english_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to fill out surveys in English.","when_to_set_to_false":"Set to false if the patient is currently able to fill out surveys in English.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to fill out surveys in English.","meaning":"Boolean indicating whether the patient is currently unable to fill out surveys in English."} ;; "the patient is unable to fill out surveys in English"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_unable_to_read_consent_forms_in_english_now)
:named REQ6_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to read consent forms in English."

(assert
(! (not patient_is_unable_to_fill_out_surveys_in_english_now)
:named REQ6_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is unable to fill out surveys in English."
