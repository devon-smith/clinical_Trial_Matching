;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_malignant_tumor_of_breast_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant tumor of the breast (breast cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant tumor of the breast (breast cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant tumor of the breast (breast cancer).","meaning":"Boolean indicating whether the patient currently has a malignant tumor of the breast (breast cancer)."} ;; "breast cancer"
(declare-const patient_has_finding_of_carcinoma_of_corpus_uteri_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has carcinoma of the corpus uteri (uterine corpus cancer).","when_to_set_to_false":"Set to false if the patient currently does not have carcinoma of the corpus uteri (uterine corpus cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has carcinoma of the corpus uteri (uterine corpus cancer).","meaning":"Boolean indicating whether the patient currently has carcinoma of the corpus uteri (uterine corpus cancer)."} ;; "uterine corpus cancer"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_has_finding_of_malignant_tumor_of_breast_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has breast cancer."

(assert
  (! (not patient_has_finding_of_carcinoma_of_corpus_uteri_now)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uterine corpus cancer."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disorder_of_menstruation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder of menstruation.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder of menstruation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder of menstruation.","meaning":"Boolean indicating whether the patient currently has a disorder of menstruation."} ;; "menstrual disorders"
(declare-const patient_has_finding_of_disorder_of_menstruation_now@@unexplained Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder of menstruation is unexplained.","when_to_set_to_false":"Set to false if the patient's current disorder of menstruation is explained (i.e., a cause is known).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder of menstruation is unexplained.","meaning":"Boolean indicating whether the patient's current disorder of menstruation is unexplained."} ;; "unexplained menstrual disorders"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disorder_of_menstruation_now@@unexplained
       patient_has_finding_of_disorder_of_menstruation_now)
   :named REQ2_AUXILIARY0)) ;; "unexplained menstrual disorders" implies "menstrual disorders"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disorder_of_menstruation_now@@unexplained)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has unexplained menstrual disorders."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_serious_health_problem_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has one or more serious health problems.","when_to_set_to_false":"Set to false if the patient currently does not have any serious health problems.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any serious health problems.","meaning":"Boolean indicating whether the patient currently has one or more serious health problems."} ;; "The patient is excluded if the patient has serious health problems."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_serious_health_problem_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has serious health problems."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_uses_hormonal_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses hormonal contraception.","when_to_set_to_false":"Set to false if the patient currently does not use hormonal contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses hormonal contraception.","meaning":"Boolean indicating whether the patient currently uses hormonal contraception."} ;; "the patient uses hormonal contraception"

(declare-const patient_uses_hormonal_intrauterine_device_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently uses a hormonal intrauterine device.","when_to_set_to_false":"Set to false if the patient currently does not use a hormonal intrauterine device.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently uses a hormonal intrauterine device.","meaning":"Boolean indicating whether the patient currently uses a hormonal intrauterine device."} ;; "the patient uses hormonal intrauterine device"

(declare-const patient_uses_hormonal_intrauterine_device_now@@trade_name_mirena Bool) ;; {"when_to_set_to_true":"Set to true if the hormonal intrauterine device currently used by the patient is Mirena.","when_to_set_to_false":"Set to false if the hormonal intrauterine device currently used by the patient is not Mirena.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hormonal intrauterine device currently used by the patient is Mirena.","meaning":"Boolean indicating whether the hormonal intrauterine device currently used by the patient is Mirena."} ;; "the patient uses hormonal intrauterine device (trade name Mirena)"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_uses_hormonal_intrauterine_device_now@@trade_name_mirena
      patient_uses_hormonal_intrauterine_device_now)
:named REQ4_AUXILIARY0)) ;; "the patient uses hormonal intrauterine device (trade name Mirena)" implies "the patient uses hormonal intrauterine device"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_uses_hormonal_contraception_now)
:named REQ4_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses hormonal contraception."

(assert
(! (not patient_uses_hormonal_intrauterine_device_now@@trade_name_mirena)
:named REQ4_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient uses hormonal intrauterine device (trade name Mirena)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_undergoing_estrogen_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving estrogen hormone therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving estrogen hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving estrogen hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing estrogen hormone therapy."} ;; "oestrogen treatment"
(declare-const patient_is_undergoing_progestogen_hormone_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving progestogen hormone therapy.","when_to_set_to_false":"Set to false if the patient is currently not receiving progestogen hormone therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving progestogen hormone therapy.","meaning":"Boolean indicating whether the patient is currently undergoing progestogen hormone therapy."} ;; "progestin treatment"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not patient_is_undergoing_estrogen_hormone_therapy_now)
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving oestrogen treatment."

(assert
  (! (not patient_is_undergoing_progestogen_hormone_therapy_now)
     :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is receiving progestin treatment."

;; --- verifier-bypassed (attempt 8/8) 2025-10-24T10:08:16.299473 policy=eventual
;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_undergone_hysterectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone hysterectomy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone hysterectomy.","meaning":"Boolean indicating whether the patient has ever undergone hysterectomy in their history."} ;; "the patient has had hysterectomy"
(declare-const patient_has_undergone_oophorectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone oophorectomy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never undergone oophorectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone oophorectomy.","meaning":"Boolean indicating whether the patient has ever undergone oophorectomy in their history."} ;; "the patient has had oophorectomy"
(declare-const patient_has_received_radiation_therapy_in_the_history Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received radiation therapy at any time in their history.","when_to_set_to_false":"Set to false if the patient has never received radiation therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received radiation therapy.","meaning":"Boolean indicating whether the patient has ever received radiation therapy in their history."} ;; "the patient has received radiation therapy"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_undergone_hysterectomy_inthehistory)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had hysterectomy."

(assert
(! (not patient_has_undergone_oophorectomy_inthehistory)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had oophorectomy."

(assert
(! (not patient_has_received_radiation_therapy_in_the_history)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received radiation therapy."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_artificial_cardiac_pacemaker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an artificial cardiac pacemaker.","when_to_set_to_false":"Set to false if the patient currently does not have an artificial cardiac pacemaker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an artificial cardiac pacemaker.","meaning":"Boolean indicating whether the patient currently has an artificial cardiac pacemaker."} ;; "the patient has an artificial cardiac pacemaker"
(declare-const patient_has_metallic_prostheses_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has metallic prostheses.","when_to_set_to_false":"Set to false if the patient currently does not have metallic prostheses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has metallic prostheses.","meaning":"Boolean indicating whether the patient currently has metallic prostheses."} ;; "the patient has metallic prostheses"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_artificial_cardiac_pacemaker_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an artificial cardiac pacemaker."

(assert
(! (not patient_has_metallic_prostheses_now)
:named REQ7_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has metallic prostheses."
