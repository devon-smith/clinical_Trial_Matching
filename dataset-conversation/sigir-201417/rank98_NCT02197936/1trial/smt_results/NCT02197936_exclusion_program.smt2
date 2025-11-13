;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the potential for childbearing (i.e., is premenopausal and not otherwise infertile).","when_to_set_to_false":"Set to false if the patient is currently postmenopausal or otherwise lacks childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential for childbearing."} ;; "the patient is postmenopausal"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_childbearing_potential_now)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is postmenopausal."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently known not to be pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_diagnosis_of_malignant_tumor_of_female_genital_organ_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant tumor of a female genital organ (gynecological cancer).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant tumor of a female genital organ (gynecological cancer).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant tumor of a female genital organ (gynecological cancer).","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant tumor of a female genital organ (gynecological cancer)."} ;; "gynecological cancer"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_diagnosis_of_malignant_tumor_of_female_genital_organ_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has gynecological cancer."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_gonadotropin_releasing_factor_inthepast3months@@temporalcontext_within3months_before_hysterectomy Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to gonadotropin-releasing hormone analog therapy occurred within the 3 months before hysterectomy.","when_to_set_to_false":"Set to false if the exposure did not occur within the 3 months before hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred within the 3 months before hysterectomy.","meaning":"Boolean indicating whether the exposure to gonadotropin-releasing hormone analog therapy occurred within the 3 months before hysterectomy."} ;; "the patient has received gonadotropin-releasing hormone analog therapy in the last three months prior to hysterectomy"

(declare-const patient_has_undergone_hormone_therapy_inthepast3months@@temporalcontext_within3months_before_hysterectomy Bool) ;; {"when_to_set_to_true":"Set to true if the systemic hormone therapy occurred within the 3 months before hysterectomy.","when_to_set_to_false":"Set to false if the systemic hormone therapy did not occur within the 3 months before hysterectomy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the systemic hormone therapy occurred within the 3 months before hysterectomy.","meaning":"Boolean indicating whether the systemic hormone therapy occurred within the 3 months before hysterectomy."} ;; "the patient has received systemic hormone therapy in the last three months prior to hysterectomy"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not patient_is_exposed_to_gonadotropin_releasing_factor_inthepast3months@@temporalcontext_within3months_before_hysterectomy)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received gonadotropin-releasing hormone analog therapy in the last three months prior to hysterectomy."

(assert
  (! (not patient_has_undergone_hormone_therapy_inthepast3months@@temporalcontext_within3months_before_hysterectomy)
     :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has received systemic hormone therapy in the last three months prior to hysterectomy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_endometriosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of endometriosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of endometriosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of endometriosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of endometriosis."} ;; "endometriosis"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_diagnosis_of_endometriosis_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has endometriosis."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_uterine_leiomyoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of uterine leiomyoma (uterine fibroids).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of uterine leiomyoma (uterine fibroids).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has uterine leiomyoma (uterine fibroids).","meaning":"Boolean indicating whether the patient currently has uterine leiomyoma (uterine fibroids)."} ;; "uterine fibroids"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_finding_of_uterine_leiomyoma_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uterine fibroids."
