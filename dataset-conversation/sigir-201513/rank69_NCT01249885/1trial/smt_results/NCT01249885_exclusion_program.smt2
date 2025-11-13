;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chronic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a chronic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a chronic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a chronic disease.","meaning":"Boolean indicating whether the patient currently has a chronic disease."} ;; "chronic disease"
(declare-const patient_has_finding_of_chronic_disease_now@@can_affect_orofacial_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chronic disease can affect the orofacial region.","when_to_set_to_false":"Set to false if the patient's chronic disease cannot affect the orofacial region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic disease can affect the orofacial region.","meaning":"Boolean indicating whether the patient's chronic disease can affect the orofacial region."} ;; "chronic disease that can affect the orofacial region"
(declare-const patient_has_finding_of_developmental_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a developmental disease.","when_to_set_to_false":"Set to false if the patient currently does not have a developmental disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a developmental disease.","meaning":"Boolean indicating whether the patient currently has a developmental disease."} ;; "developmental disease"
(declare-const patient_has_finding_of_developmental_disease_now@@can_affect_orofacial_region Bool) ;; {"when_to_set_to_true":"Set to true if the patient's developmental disease can affect the orofacial region.","when_to_set_to_false":"Set to false if the patient's developmental disease cannot affect the orofacial region.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's developmental disease can affect the orofacial region.","meaning":"Boolean indicating whether the patient's developmental disease can affect the orofacial region."} ;; "developmental disease that can affect the orofacial region"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable for chronic disease
(assert
(! (=> patient_has_finding_of_chronic_disease_now@@can_affect_orofacial_region
      patient_has_finding_of_chronic_disease_now)
:named REQ0_AUXILIARY0)) ;; "chronic disease that can affect the orofacial region"

;; Qualifier variable implies corresponding stem variable for developmental disease
(assert
(! (=> patient_has_finding_of_developmental_disease_now@@can_affect_orofacial_region
      patient_has_finding_of_developmental_disease_now)
:named REQ0_AUXILIARY1)) ;; "developmental disease that can affect the orofacial region"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_chronic_disease_now@@can_affect_orofacial_region)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from a chronic disease that can affect the orofacial region."

(assert
(! (not patient_has_finding_of_developmental_disease_now@@can_affect_orofacial_region)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from a developmental disease that can affect the orofacial region."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} ;; "child"
(declare-const patient_has_finding_of_digit_sucking_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finger (digit) sucking habit.","when_to_set_to_false":"Set to false if the patient currently does not have a finger (digit) sucking habit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finger (digit) sucking habit.","meaning":"Boolean indicating whether the patient currently has a finger (digit) sucking habit now."} ;; "finger sucking habit"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient must NOT be a child with finger sucking habit
(assert
(! (not (and (< patient_age_value_recorded_now_in_years 18)
             patient_has_finding_of_digit_sucking_now))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child with finger sucking habit."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_poor_muscle_tone_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of poor muscle tone (low muscle tonus).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of poor muscle tone (low muscle tonus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has poor muscle tone (low muscle tonus).","meaning":"Boolean indicating whether the patient currently has poor muscle tone."} ;; "low muscle tonus"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (not patient_has_finding_of_poor_muscle_tone_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is suffering from low muscle tonus."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_dribbling_from_mouth_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of dribbling from mouth (drooling).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of dribbling from mouth (drooling).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dribbling from mouth (drooling).","meaning":"Boolean indicating whether the patient currently has dribbling from mouth (drooling) now."} ;; "drooling"
(declare-const patient_has_finding_of_dribbling_from_mouth_now@@abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current dribbling from mouth (drooling) is abnormal.","when_to_set_to_false":"Set to false if the patient's current dribbling from mouth (drooling) is not abnormal (i.e., normal or physiologic).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current dribbling from mouth (drooling) is abnormal.","meaning":"Boolean indicating whether the patient's current dribbling from mouth (drooling) is abnormal."} ;; "abnormal drooling"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_dribbling_from_mouth_now@@abnormal
      patient_has_finding_of_dribbling_from_mouth_now)
:named REQ3_AUXILIARY0)) ;; "abnormal drooling" means drooling that is abnormal

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_dribbling_from_mouth_now@@abnormal)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has abnormal drooling."
