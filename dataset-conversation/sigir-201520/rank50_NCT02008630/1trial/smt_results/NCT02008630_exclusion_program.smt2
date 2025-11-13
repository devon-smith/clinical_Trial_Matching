;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_fear_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding of fear.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding of fear.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding of fear.","meaning":"Boolean indicating whether the patient currently has a clinical finding of fear."} ;; "fear"
(declare-const patient_has_finding_of_fear_now@@fear_is_specifically_of_dogs Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fear is specifically a fear of dogs.","when_to_set_to_false":"Set to false if the patient's current fear is not specifically a fear of dogs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current fear is specifically of dogs.","meaning":"Boolean indicating whether the patient's current fear is specifically of dogs."} ;; "fear of dogs"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies the stem variable
(assert
(! (=> patient_has_finding_of_fear_now@@fear_is_specifically_of_dogs
       patient_has_finding_of_fear_now)
   :named REQ0_AUXILIARY0)) ;; "fear is specifically of dogs" implies "fear"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_fear_now@@fear_is_specifically_of_dogs)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a fear of dogs."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergic_disposition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergic disposition (allergy).","when_to_set_to_false":"Set to false if the patient currently does not have an allergic disposition (allergy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an allergic disposition (allergy).","meaning":"Boolean indicating whether the patient currently has an allergic disposition (allergy) now."} ;; "allergy"
(declare-const patient_has_finding_of_allergic_disposition_now@@allergen_dog Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an allergic disposition (allergy) and the allergen is dog.","when_to_set_to_false":"Set to false if the patient currently has an allergic disposition (allergy) and the allergen is not dog.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the allergen is dog for the patient's allergic disposition (allergy).","meaning":"Boolean indicating whether the patient's current allergic disposition (allergy) is to dog."} ;; "dog allergy"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_allergic_disposition_now@@allergen_dog
      patient_has_finding_of_allergic_disposition_now)
:named REQ1_AUXILIARY0)) ;; "dog allergy" implies "allergic disposition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergic_disposition_now@@allergen_dog)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a dog allergy."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_needs_wheelchair_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs a wheelchair.","when_to_set_to_false":"Set to false if the patient currently does not need a wheelchair.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs a wheelchair.","meaning":"Boolean indicating whether the patient currently needs a wheelchair."} ;; "needs a wheelchair"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_needs_wheelchair_now)
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs a wheelchair."
