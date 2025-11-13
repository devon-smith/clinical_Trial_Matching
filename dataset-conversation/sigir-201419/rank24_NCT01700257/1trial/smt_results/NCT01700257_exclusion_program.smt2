;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_ct_of_chest_inthepast24months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a computed tomography scan of the chest at any time within the past 24 months.","when_to_set_to_false":"Set to false if the patient has not undergone a computed tomography scan of the chest at any time within the past 24 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a computed tomography scan of the chest within the past 24 months.","meaning":"Boolean indicating whether the patient has undergone a computed tomography scan of the chest within the past 24 months."} ;; "computed tomography scan of the chest within the last twenty-four months."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_undergone_ct_of_chest_inthepast24months)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a computed tomography scan of the chest within the last twenty-four months."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast10years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of any malignant neoplastic disease (cancer) within the past ten years.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of any malignant neoplastic disease (cancer) within the past ten years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of any malignant neoplastic disease (cancer) within the past ten years.","meaning":"Boolean indicating whether the patient has a diagnosis of any malignant neoplastic disease (cancer) within the past ten years."} ;; "any cancer within the last ten years"
(declare-const patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthepast10years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of malignant neoplasm of skin (skin cancer) within the past ten years.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of malignant neoplasm of skin (skin cancer) within the past ten years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of malignant neoplasm of skin (skin cancer) within the past ten years.","meaning":"Boolean indicating whether the patient has a diagnosis of malignant neoplasm of skin (skin cancer) within the past ten years."} ;; "skin cancer within the last ten years"
(declare-const patient_has_diagnosis_of_malignant_tumor_of_cervix_inthepast10years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of malignant tumor of cervix (cervical cancer) within the past ten years.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of malignant tumor of cervix (cervical cancer) within the past ten years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of malignant tumor of cervix (cervical cancer) within the past ten years.","meaning":"Boolean indicating whether the patient has a diagnosis of malignant tumor of cervix (cervical cancer) within the past ten years."} ;; "cervical cancer within the last ten years"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_other_than_skin_or_cervix_inthepast10years Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented diagnosis of any malignant neoplastic disease (cancer) other than skin cancer or cervical cancer within the past ten years.","when_to_set_to_false":"Set to false if the patient does not have a documented diagnosis of any malignant neoplastic disease (cancer) other than skin cancer or cervical cancer within the past ten years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a diagnosis of any malignant neoplastic disease (cancer) other than skin cancer or cervical cancer within the past ten years.","meaning":"Boolean indicating whether the patient has a diagnosis of any malignant neoplastic disease (cancer) other than skin cancer or cervical cancer within the past ten years."} ;; "any cancer other than skin or cervical cancer within the last ten years"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: "any cancer other than skin or cervical cancer within the last ten years"
(assert
(! (= patient_has_diagnosis_of_malignant_neoplastic_disease_other_than_skin_or_cervix_inthepast10years
(and patient_has_diagnosis_of_malignant_neoplastic_disease_inthepast10years
(not (or patient_has_diagnosis_of_malignant_neoplasm_of_skin_inthepast10years
         patient_has_diagnosis_of_malignant_tumor_of_cervix_inthepast10years))))
:named REQ1_AUXILIARY0)) ;; "any cancer other than skin or cervical cancer within the last ten years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT have any cancer other than skin or cervical cancer within the last ten years
(assert
(! (not patient_has_diagnosis_of_malignant_neoplastic_disease_other_than_skin_or_cervix_inthepast10years)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of any cancer within the last ten years, EXCEPT if the only cancer(s) within the last ten years are skin cancer or cervical cancer."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_illness_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an illness.","when_to_set_to_false":"Set to false if the patient currently does not have an illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an illness.","meaning":"Boolean indicating whether the patient currently has an illness."} ;; "illness"
(declare-const patient_has_finding_of_illness_now@@is_serious Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness is serious.","when_to_set_to_false":"Set to false if the patient's current illness is not serious.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness is serious.","meaning":"Boolean indicating whether the patient's current illness is serious."} ;; "serious illness"
(declare-const patient_has_finding_of_illness_now@@decreases_life_expectancy_to_less_than_five_years Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current illness decreases life expectancy to less than five years.","when_to_set_to_false":"Set to false if the patient's current illness does not decrease life expectancy to less than five years.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current illness decreases life expectancy to less than five years.","meaning":"Boolean indicating whether the patient's current illness decreases life expectancy to less than five years."} ;; "illness that decreases life expectancy to less than five years"
(declare-const patient_life_expectancy_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's estimated life expectancy in years, as assessed at the present time.","when_to_set_to_null":"Set to null if the patient's estimated life expectancy in years is unknown, not documented, or cannot be determined at the present time.","meaning":"Numeric value representing the patient's estimated life expectancy in years, recorded at the present time."} ;; "life expectancy to less than five years"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_illness_now@@is_serious
       patient_has_finding_of_illness_now)
   :named REQ2_AUXILIARY0)) ;; "serious illness"

(assert
(! (=> patient_has_finding_of_illness_now@@decreases_life_expectancy_to_less_than_five_years
       patient_has_finding_of_illness_now)
   :named REQ2_AUXILIARY1)) ;; "illness that decreases life expectancy to less than five years"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have a serious illness that decreases life expectancy to less than five years
(assert
(! (not (and patient_has_finding_of_illness_now@@is_serious
             patient_has_finding_of_illness_now@@decreases_life_expectancy_to_less_than_five_years))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious illness that decreases life expectancy to less than five years."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_exposed_to_oxygen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to oxygen (i.e., has any current use of oxygen).","when_to_set_to_false":"Set to false if the patient is currently not exposed to oxygen (i.e., does not have any current use of oxygen).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to oxygen.","meaning":"Boolean indicating whether the patient is currently exposed to oxygen."} ;; "any current use of oxygen"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_exposed_to_oxygen_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any current use of oxygen."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_congestive_heart_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congestive heart failure.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congestive heart failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of congestive heart failure.","meaning":"Boolean indicating whether the patient currently has congestive heart failure."} ;; "congestive heart failure"
(declare-const patient_has_finding_of_congestive_heart_failure_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current congestive heart failure is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current congestive heart failure is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current congestive heart failure is uncontrolled.","meaning":"Boolean indicating whether the patient's current congestive heart failure is uncontrolled."} ;; "uncontrolled congestive heart failure"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of cardiac arrhythmia.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of cardiac arrhythmia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of cardiac arrhythmia.","meaning":"Boolean indicating whether the patient currently has cardiac arrhythmia."} ;; "cardiac arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@uncontrolled Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac arrhythmia is uncontrolled.","when_to_set_to_false":"Set to false if the patient's current cardiac arrhythmia is controlled.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac arrhythmia is uncontrolled.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia is uncontrolled."} ;; "uncontrolled cardiac arrhythmia"
(declare-const patient_has_finding_of_cardiac_arrhythmia_now@@would_prevent_surgery_for_a_lung_lesion Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current cardiac arrhythmia would prevent surgery for a lung lesion.","when_to_set_to_false":"Set to false if the patient's current cardiac arrhythmia would not prevent surgery for a lung lesion.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current cardiac arrhythmia would prevent surgery for a lung lesion.","meaning":"Boolean indicating whether the patient's current cardiac arrhythmia would prevent surgery for a lung lesion."} ;; "cardiac arrhythmia that would prevent surgery for a lung lesion"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable for congestive heart failure
(assert
(! (=> patient_has_finding_of_congestive_heart_failure_now@@uncontrolled
      patient_has_finding_of_congestive_heart_failure_now)
:named REQ4_AUXILIARY0)) ;; "uncontrolled congestive heart failure"

;; Qualifier variable implies corresponding stem variable for cardiac arrhythmia
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@uncontrolled
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ4_AUXILIARY1)) ;; "uncontrolled cardiac arrhythmia"

;; Qualifier variable implies corresponding stem variable for cardiac arrhythmia (would prevent surgery)
(assert
(! (=> patient_has_finding_of_cardiac_arrhythmia_now@@would_prevent_surgery_for_a_lung_lesion
      patient_has_finding_of_cardiac_arrhythmia_now)
:named REQ4_AUXILIARY2)) ;; "cardiac arrhythmia that would prevent surgery for a lung lesion"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient must NOT have uncontrolled congestive heart failure
(assert
(! (not patient_has_finding_of_congestive_heart_failure_now@@uncontrolled)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled congestive heart failure."

;; Exclusion: patient must NOT have uncontrolled cardiac arrhythmia that would prevent surgery for a lung lesion
(assert
(! (not (and patient_has_finding_of_cardiac_arrhythmia_now@@uncontrolled
             patient_has_finding_of_cardiac_arrhythmia_now@@would_prevent_surgery_for_a_lung_lesion))
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has uncontrolled cardiac arrhythmia that would prevent surgery for a lung lesion."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_severe_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has severe chronic obstructive pulmonary disease."} ;; "the patient has severe chronic obstructive pulmonary disease"

(declare-const patient_has_finding_of_severe_dyspnea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has severe dyspnea.","when_to_set_to_false":"Set to false if the patient currently does not have severe dyspnea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe dyspnea.","meaning":"Boolean indicating whether the patient currently has severe dyspnea."} ;; "the patient has severe dyspnea"

(declare-const patient_has_finding_of_severe_dyspnea_now@@would_prevent_lung_surgery_or_stereotactic_body_radiotherapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current severe dyspnea would prevent lung surgery or stereotactic body radiotherapy.","when_to_set_to_false":"Set to false if the patient's current severe dyspnea would not prevent lung surgery or stereotactic body radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current severe dyspnea would prevent lung surgery or stereotactic body radiotherapy.","meaning":"Boolean indicating whether the patient's current severe dyspnea would prevent lung surgery or stereotactic body radiotherapy."} ;; "the patient has severe dyspnea that would prevent lung surgery or stereotactic body radiotherapy"

(declare-const patient_can_undergo_operation_on_lung_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo lung surgery.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo lung surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo lung surgery.","meaning":"Boolean indicating whether the patient is currently able to undergo lung surgery."} ;; "lung surgery"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies the stem variable for severe dyspnea
(assert
(! (=> patient_has_finding_of_severe_dyspnea_now@@would_prevent_lung_surgery_or_stereotactic_body_radiotherapy
      patient_has_finding_of_severe_dyspnea_now)
    :named REQ5_AUXILIARY0)) ;; "the patient has severe dyspnea that would prevent lung surgery or stereotactic body radiotherapy"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: patient must NOT have severe chronic obstructive pulmonary disease
(assert
(! (not (not patient_has_finding_of_severe_chronic_obstructive_pulmonary_disease_now))
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe chronic obstructive pulmonary disease."

;; Exclusion: patient must NOT have severe dyspnea that would prevent lung surgery or stereotactic body radiotherapy
(assert
(! (not (not patient_has_finding_of_severe_dyspnea_now@@would_prevent_lung_surgery_or_stereotactic_body_radiotherapy))
    :named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has severe dyspnea that would prevent lung surgery or stereotactic body radiotherapy."
