;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently ill (has any illness).","when_to_set_to_false":"Set to false if the patient is currently not ill (has no illness).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently ill.","meaning":"Boolean indicating whether the patient is currently ill."} ;; "ill"
(declare-const patient_has_finding_of_illness_now@@illness_is_too_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently ill and the illness is considered too severe (the patient is 'too ill').","when_to_set_to_false":"Set to false if the patient is currently ill but the illness is not considered too severe (the patient is not 'too ill').","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is too severe.","meaning":"Boolean indicating whether the patient's current illness is too severe ('too ill')."} ;; "too ill"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_illness_now@@illness_is_too_severe
      patient_has_finding_of_illness_now)
:named REQ0_AUXILIARY0)) ;; "patient_has_finding_of_illness_now@@illness_is_too_severe implies patient_has_finding_of_illness_now"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_illness_now@@illness_is_too_severe)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is too ill."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_under_care_of_chest_physician_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently under the care or control of a chest physician.","when_to_set_to_false":"Set to false if the patient is currently not under the care or control of a chest physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently under the care or control of a chest physician.","meaning":"Boolean indicating whether the patient is currently under the care or control of a chest physician."} ;; "The patient is excluded if the patient is under control of a chest physician."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not patient_is_under_care_of_chest_physician_now)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is under control of a chest physician."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_co_morbid_conditions_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any comorbid condition.","when_to_set_to_false":"Set to false if the patient currently does not have any comorbid condition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any comorbid condition.","meaning":"Boolean indicating whether the patient currently has any comorbid condition."} ;; "comorbidity"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the comorbid condition present is serious.","when_to_set_to_false":"Set to false if the comorbid condition present is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition present is serious.","meaning":"Boolean indicating whether the comorbid condition present is serious."} ;; "serious"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@physical Bool) ;; {"when_to_set_to_true":"Set to true if the comorbid condition present is physical.","when_to_set_to_false":"Set to false if the comorbid condition present is not physical.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition present is physical.","meaning":"Boolean indicating whether the comorbid condition present is physical."} ;; "physical"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@psychological Bool) ;; {"when_to_set_to_true":"Set to true if the comorbid condition present is psychological.","when_to_set_to_false":"Set to false if the comorbid condition present is not psychological.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the comorbid condition present is psychological.","meaning":"Boolean indicating whether the comorbid condition present is psychological."} ;; "psychological"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@physical@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid condition that is both physical and serious.","when_to_set_to_false":"Set to false if the patient currently does not have a comorbid condition that is both physical and serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a comorbid condition that is both physical and serious.","meaning":"Boolean indicating whether the patient currently has a comorbid condition that is both physical and serious."} ;; "serious physical comorbidity"
(declare-const patient_has_finding_of_co_morbid_conditions_now@@psychological@@serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a comorbid condition that is both psychological and serious.","when_to_set_to_false":"Set to false if the patient currently does not have a comorbid condition that is both psychological and serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a comorbid condition that is both psychological and serious.","meaning":"Boolean indicating whether the patient currently has a comorbid condition that is both psychological and serious."} ;; "serious psychological comorbidity"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@serious
      patient_has_finding_of_co_morbid_conditions_now)
    :named REQ2_AUXILIARY0)) ;; "serious" implies comorbidity

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@physical
      patient_has_finding_of_co_morbid_conditions_now)
    :named REQ2_AUXILIARY1)) ;; "physical" implies comorbidity

(assert
(! (=> patient_has_finding_of_co_morbid_conditions_now@@psychological
      patient_has_finding_of_co_morbid_conditions_now)
    :named REQ2_AUXILIARY2)) ;; "psychological" implies comorbidity

;; "serious physical comorbidity" means both physical and serious
(assert
(! (= patient_has_finding_of_co_morbid_conditions_now@@physical@@serious
       (and patient_has_finding_of_co_morbid_conditions_now@@physical
            patient_has_finding_of_co_morbid_conditions_now@@serious))
    :named REQ2_AUXILIARY3)) ;; "serious physical comorbidity"

;; "serious psychological comorbidity" means both psychological and serious
(assert
(! (= patient_has_finding_of_co_morbid_conditions_now@@psychological@@serious
       (and patient_has_finding_of_co_morbid_conditions_now@@psychological
            patient_has_finding_of_co_morbid_conditions_now@@serious))
    :named REQ2_AUXILIARY4)) ;; "serious psychological comorbidity"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@physical@@serious)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious physical comorbidity."

(assert
(! (not patient_has_finding_of_co_morbid_conditions_now@@psychological@@serious)
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious psychological comorbidity."
