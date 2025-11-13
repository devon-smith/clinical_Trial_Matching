;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a cerebrovascular accident (stroke) at any time in the past, regardless of timing relative to study enrollment.","when_to_set_to_false":"Set to false if the patient has never had a cerebrovascular accident (stroke) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a cerebrovascular accident (stroke).","meaning":"Boolean indicating whether the patient has ever had a cerebrovascular accident (stroke) in the past."} ;; "stroke"
(declare-const patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within6months_before_study_enrollment_visit Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a cerebrovascular accident (stroke) within six months before the study enrollment visit.","when_to_set_to_false":"Set to false if the patient has not had a cerebrovascular accident (stroke) within six months before the study enrollment visit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a cerebrovascular accident (stroke) within six months before the study enrollment visit.","meaning":"Boolean indicating whether the patient has had a cerebrovascular accident (stroke) within six months before the study enrollment visit."} ;; "stroke within six months prior to the study enrollment visit"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within6months_before_study_enrollment_visit
      patient_has_finding_of_cerebrovascular_accident_inthehistory)
:named REQ0_AUXILIARY0)) ;; "stroke within six months prior to the study enrollment visit" implies "stroke ever"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_cerebrovascular_accident_inthehistory@@temporalcontext_within6months_before_study_enrollment_visit)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has had a stroke within six months prior to the study enrollment visit."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's sex is documented as female at the current time.","when_to_set_to_false":"Set to false if the patient's sex is documented as not female at the current time.","when_to_set_to_null":"Set to null if the patient's sex at the current time is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient's sex is female at the current time."} ;; "the patient is female"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently pregnant.","when_to_set_to_false":"Set to false if the patient is documented as not currently pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is documented as not currently breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is nursing"
(declare-const patient_is_pregnant_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as planning to become pregnant in the future.","when_to_set_to_false":"Set to false if the patient is documented as not planning to become pregnant in the future.","when_to_set_to_null":"Set to null if the patient's future pregnancy plans are unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is planning to become pregnant in the future."} ;; "the patient is planning a pregnancy during the study period"
(declare-const patient_is_using_reliable_means_of_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is documented as currently using a reliable means of contraception.","when_to_set_to_false":"Set to false if the patient is documented as not currently using a reliable means of contraception.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a reliable means of contraception.","meaning":"Boolean value indicating whether the patient is currently using a reliable means of contraception."} ;; "the patient is not using a reliable means of contraception"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_sex_is_female_now
               (or patient_is_pregnant_now
                   patient_is_breastfeeding_now
                   patient_is_pregnant_inthefuture
                   (not patient_is_using_reliable_means_of_contraception_now))))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is female) AND ((the patient is pregnant) OR (the patient is nursing) OR (the patient is planning a pregnancy during the study period) OR (the patient is not using a reliable means of contraception))."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_exposed_to_clostridium_botulinum_toxin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever received clostridium botulinum toxin (Botox) therapy in the past (including any type and in the study limb).","when_to_set_to_false":"Set to false if the patient has never received clostridium botulinum toxin (Botox) therapy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received clostridium botulinum toxin (Botox) therapy in the past.","meaning":"Boolean indicating whether the patient has ever been exposed to clostridium botulinum toxin (Botox) at any time in the past."} ;; "previous Botox therapy of any type in the study limb"
(declare-const patient_is_exposed_to_clostridium_botulinum_toxin_inthehistory@@in_study_limb Bool) ;; {"when_to_set_to_true":"Set to true if the exposure to clostridium botulinum toxin (Botox) occurred in the study limb.","when_to_set_to_false":"Set to false if the exposure did not occur in the study limb.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure occurred in the study limb.","meaning":"Boolean indicating whether the exposure to clostridium botulinum toxin (Botox) was in the study limb."} ;; "previous Botox therapy of any type in the study limb"
(declare-const patient_is_exposed_to_clostridium_botulinum_toxin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving clostridium botulinum toxin (Botox) therapy (including any type and in the study limb).","when_to_set_to_false":"Set to false if the patient is not currently receiving clostridium botulinum toxin (Botox) therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving clostridium botulinum toxin (Botox) therapy.","meaning":"Boolean indicating whether the patient is currently exposed to clostridium botulinum toxin (Botox)."} ;; "current Botox therapy of any type in the study limb"
(declare-const patient_is_exposed_to_clostridium_botulinum_toxin_now@@in_study_limb Bool) ;; {"when_to_set_to_true":"Set to true if the current exposure to clostridium botulinum toxin (Botox) is in the study limb.","when_to_set_to_false":"Set to false if the current exposure is not in the study limb.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the current exposure occurred in the study limb.","meaning":"Boolean indicating whether the current exposure to clostridium botulinum toxin (Botox) is in the study limb."} ;; "current Botox therapy of any type in the study limb"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_is_exposed_to_clostridium_botulinum_toxin_inthehistory@@in_study_limb
      patient_is_exposed_to_clostridium_botulinum_toxin_inthehistory)
:named REQ2_AUXILIARY0)) ;; "previous Botox therapy of any type in the study limb"

(assert
(! (=> patient_is_exposed_to_clostridium_botulinum_toxin_now@@in_study_limb
      patient_is_exposed_to_clostridium_botulinum_toxin_now)
:named REQ2_AUXILIARY1)) ;; "current Botox therapy of any type in the study limb"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_is_exposed_to_clostridium_botulinum_toxin_inthehistory@@in_study_limb)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has previous Botox therapy of any type in the study limb."

(assert
(! (not patient_is_exposed_to_clostridium_botulinum_toxin_now@@in_study_limb)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current Botox therapy of any type in the study limb."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "medical condition"
(declare-const patient_has_finding_of_disease_condition_finding_now@@may_put_patient_at_increased_risk_with_botox_exposure Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disease, condition, or clinical finding may put the patient at increased risk with Botox exposure.","when_to_set_to_false":"Set to false if the patient's current disease, condition, or clinical finding does not put the patient at increased risk with Botox exposure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease, condition, or clinical finding may put the patient at increased risk with Botox exposure.","meaning":"Boolean indicating whether the patient's current disease, condition, or clinical finding may put the patient at increased risk with Botox exposure."} ;; "medical condition that may put the patient at increased risk with Botox exposure"
(declare-const patient_has_finding_of_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disorder.","when_to_set_to_false":"Set to false if the patient currently does not have any disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disorder.","meaning":"Boolean indicating whether the patient currently has any disorder."} ;; "any other disorder"
(declare-const patient_has_finding_of_disorder_now@@might_have_interfered_with_neuromuscular_function Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder might have interfered with neuromuscular function.","when_to_set_to_false":"Set to false if the patient's current disorder does not interfere or is not likely to interfere with neuromuscular function.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder might have interfered with neuromuscular function.","meaning":"Boolean indicating whether the patient's current disorder might have interfered with neuromuscular function."} ;; "any other disorder that might have interfered with neuromuscular function"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable for disease/condition
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@may_put_patient_at_increased_risk_with_botox_exposure
      patient_has_finding_of_disease_condition_finding_now)
:named REQ3_AUXILIARY0)) ;; "medical condition that may put the patient at increased risk with Botox exposure"

;; Qualifier variable implies corresponding stem variable for disorder
(assert
(! (=> patient_has_finding_of_disorder_now@@might_have_interfered_with_neuromuscular_function
      patient_has_finding_of_disorder_now)
:named REQ3_AUXILIARY1)) ;; "any other disorder that might have interfered with neuromuscular function"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have any medical condition that may put the patient at increased risk with Botox exposure
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@may_put_patient_at_increased_risk_with_botox_exposure)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any medical condition that may put the patient at increased risk with Botox exposure."

;; Exclusion: patient must NOT have any other disorder that might have interfered with neuromuscular function
(assert
(! (not patient_has_finding_of_disorder_now@@might_have_interfered_with_neuromuscular_function)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any other disorder that might have interfered with neuromuscular function."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_fixed_contracture_of_study_limb_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fixed contracture of the study limb.","when_to_set_to_false":"Set to false if the patient currently does not have a fixed contracture of the study limb.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fixed contracture of the study limb.","meaning":"Boolean indicating whether the patient currently has a fixed contracture of the study limb."} ;; "presence of fixed contracture of the study limb"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not patient_has_finding_of_fixed_contracture_of_study_limb_now)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has presence of fixed contracture of the study limb."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_decreased_range_of_wrist_movement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased range of wrist movement (limited use of the wrist).","when_to_set_to_false":"Set to false if the patient currently does not have decreased range of wrist movement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased range of wrist movement.","meaning":"Boolean indicating whether the patient currently has decreased range of wrist movement."} ;; "limited use of the wrist"
(declare-const patient_has_finding_of_decreased_range_of_finger_movement_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has decreased range of finger movement (limited use of the fingers).","when_to_set_to_false":"Set to false if the patient currently does not have decreased range of finger movement.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has decreased range of finger movement.","meaning":"Boolean indicating whether the patient currently has decreased range of finger movement."} ;; "limited use of the fingers"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (and patient_has_finding_of_decreased_range_of_wrist_movement_now
             patient_has_finding_of_decreased_range_of_finger_movement_now))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has limited use of the wrist and limited use of the fingers."
