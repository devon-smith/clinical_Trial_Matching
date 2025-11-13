;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_history_of_radiotherapy_to_foot Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever previously received radiotherapy to the foot (any time prior to the present).","when_to_set_to_false":"Set to false if the patient has never previously received radiotherapy to the foot.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever previously received radiotherapy to the foot.","meaning":"Boolean indicating whether the patient has ever previously received radiotherapy to the foot."} ;; "has had previous radiotherapy to the foot."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_history_of_radiotherapy_to_foot)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous radiotherapy to the foot."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_injury_of_foot_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an injury (trauma) to the foot at any time in the past, regardless of when it occurred.","when_to_set_to_false":"Set to false if the patient has never had an injury (trauma) to the foot at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an injury (trauma) to the foot.","meaning":"Boolean indicating whether the patient has ever had an injury (trauma) to the foot in their history."} ;; "trauma to the foot"
(declare-const patient_has_finding_of_fracture_of_foot_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a fracture of the foot at any time in the past, regardless of when it occurred.","when_to_set_to_false":"Set to false if the patient has never had a fracture of the foot at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a fracture of the foot.","meaning":"Boolean indicating whether the patient has ever had a fracture of the foot in their history."} ;; "fracture of the foot"
(declare-const patient_has_finding_of_rupture_of_tendon_of_foot_region_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a rupture of a tendon in the foot region at any time in the past, regardless of when it occurred.","when_to_set_to_false":"Set to false if the patient has never had a rupture of a tendon in the foot region at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a rupture of a tendon in the foot region.","meaning":"Boolean indicating whether the patient has ever had a rupture of a tendon in the foot region in their history."} ;; "rupture of tendon of the foot"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_fracture_of_foot_inthehistory
          patient_has_finding_of_rupture_of_tendon_of_foot_region_inthehistory)
     patient_has_finding_of_injury_of_foot_inthehistory)
:named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((fracture of the foot) OR (rupture of tendon of the foot))."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_injury_of_foot_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had previous trauma to the foot with non-exhaustive examples ((fracture of the foot) OR (rupture of tendon of the foot))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_rheumatic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of rheumatic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of rheumatic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of rheumatic disease.","meaning":"Boolean indicating whether the patient currently has a rheumatic disease."} ;; "the patient has rheumatic diseases"
(declare-const patient_has_finding_of_vascular_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of vascular disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of vascular disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of vascular disorder.","meaning":"Boolean indicating whether the patient currently has a vascular disorder."} ;; "the patient has vascular diseases"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_rheumatic_disease_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has rheumatic diseases."

(assert
(! (not patient_has_finding_of_vascular_disorder_now)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has vascular diseases."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."} ;; "malignant diseases"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_malignant_neoplastic_disease_now)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malignant diseases."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_lymphedema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of lymphedema.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of lymphedema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of lymphedema.","meaning":"Boolean indicating whether the patient currently has lymphedema."} ;; "lymphatic edema"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_lymphedema_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has lymphatic edema."
