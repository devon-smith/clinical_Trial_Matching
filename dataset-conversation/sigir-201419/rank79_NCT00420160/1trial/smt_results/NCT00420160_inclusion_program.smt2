;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_fit_and_well_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently healthy and well.","when_to_set_to_false":"Set to false if the patient is currently not healthy and well.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently healthy and well.","meaning":"Boolean indicating whether the patient is currently healthy and well."}  ;; "To be included, the patient must be a healthy patient."
(declare-const patient_has_finding_of_sedentary_lifestyle_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a sedentary lifestyle.","when_to_set_to_false":"Set to false if the patient currently does not have a sedentary lifestyle.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a sedentary lifestyle.","meaning":"Boolean indicating whether the patient currently has a sedentary lifestyle."}  ;; "To be included, the patient must be a patient with sedentary behavior."
(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."}  ;; "To be included, the patient must be a smoker who smokes more than 4 cigarettes per day for at least one year."
(declare-const patient_has_finding_of_smoker_now@@smoking_behavior_persisted_for_at_least_one_year Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker and has smoked for at least one year.","when_to_set_to_false":"Set to false if the patient is currently a smoker but has smoked for less than one year.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has smoked for at least one year.","meaning":"Boolean indicating whether the patient is currently a smoker and the smoking behavior has persisted for at least one year."}  ;; "smokes ... for at least one year"
(declare-const patient_has_finding_of_smoker_now@@smoking_behavior_involves_more_than_4_cigarettes_per_day Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker and smokes more than 4 cigarettes per day.","when_to_set_to_false":"Set to false if the patient is currently a smoker and smokes 4 or fewer cigarettes per day.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient smokes more than 4 cigarettes per day.","meaning":"Boolean indicating whether the patient is currently a smoker and the smoking behavior involves more than 4 cigarettes per day."}  ;; "smokes more than 4 cigarettes per day"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable (smoker)
(assert
  (! (=> patient_has_finding_of_smoker_now@@smoking_behavior_persisted_for_at_least_one_year
         patient_has_finding_of_smoker_now)
     :named REQ0_AUXILIARY0)) ;; "smoking behavior persisted for at least one year" implies "smoker"

(assert
  (! (=> patient_has_finding_of_smoker_now@@smoking_behavior_involves_more_than_4_cigarettes_per_day
         patient_has_finding_of_smoker_now)
     :named REQ0_AUXILIARY1)) ;; "smoking behavior involves more than 4 cigarettes per day" implies "smoker"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must be a healthy patient
(assert
  (! patient_has_finding_of_fit_and_well_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a healthy patient."

;; Component 1: patient must have sedentary behavior
(assert
  (! patient_has_finding_of_sedentary_lifestyle_now
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a patient with sedentary behavior."

;; Component 2: patient must be a smoker who smokes >4 cigarettes/day for at least one year
(assert
  (! (and patient_has_finding_of_smoker_now@@smoking_behavior_persisted_for_at_least_one_year
          patient_has_finding_of_smoker_now@@smoking_behavior_involves_more_than_4_cigarettes_per_day)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be a smoker who smokes more than 4 cigarettes per day for at least one year."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged greater than or equal to 18 years AND less than or equal to 65 years"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: patient must be aged greater than or equal to 18 years
(assert
  (! (>= patient_age_value_recorded_now_in_years 18)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged greater than or equal to 18 years."

;; Component 1: patient must be aged less than or equal to 65 years
(assert
  (! (<= patient_age_value_recorded_now_in_years 65)
     :named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged less than or equal to 65 years."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_is_able_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to give informed consent.","when_to_set_to_false":"Set to false if the patient is currently unable to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to give informed consent.","meaning":"Boolean indicating whether the patient is currently able to give informed consent."}  ;; "To be included, the patient must be able to give informed consent."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! patient_is_able_to_give_informed_consent_now
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be able to give informed consent."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_will_live_in_area_for_next_3_months Bool) ;; {"when_to_set_to_true":"Set to true if it is confirmed that the patient will live in the area for the next 3 months.","when_to_set_to_false":"Set to false if it is confirmed that the patient will not live in the area for the next 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will live in the area for the next 3 months.","meaning":"Boolean indicating whether the patient will reside in the area for the upcoming 3 months."}  ;; "To be included, the patient must live in the area for the next 3 months."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! patient_will_live_in_area_for_next_3_months
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must live in the area for the next 3 months."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_taking_nicotine_containing_product_in_transdermal_dose_form_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing and plans to take a nicotine-containing product in transdermal dose form (nicotine patch) in the future.","when_to_set_to_false":"Set to false if the patient is not willing or does not plan to take a nicotine-containing product in transdermal dose form (nicotine patch) in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing and plans to take a nicotine-containing product in transdermal dose form (nicotine patch) in the future.","meaning":"Boolean indicating whether the patient is willing and plans to take a nicotine-containing product in transdermal dose form (nicotine patch) in the future."}  ;; "To be included, the patient must be willing to use the nicotine patch to attempt smoking cessation."
(declare-const patient_is_taking_nicotine_containing_product_in_transdermal_dose_form_inthefuture@@for_the_purpose_of_attempting_smoking_cessation Bool) ;; {"when_to_set_to_true":"Set to true if the patient's planned use of a nicotine-containing product in transdermal dose form (nicotine patch) in the future is specifically for the purpose of attempting smoking cessation.","when_to_set_to_false":"Set to false if the patient's planned use of a nicotine-containing product in transdermal dose form (nicotine patch) in the future is not for the purpose of attempting smoking cessation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the planned use is for the purpose of attempting smoking cessation.","meaning":"Boolean indicating whether the patient's planned use of a nicotine-containing product in transdermal dose form (nicotine patch) in the future is for the purpose of attempting smoking cessation."}  ;; "To be included, the patient must be willing to use the nicotine patch to attempt smoking cessation."

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_is_taking_nicotine_containing_product_in_transdermal_dose_form_inthefuture@@for_the_purpose_of_attempting_smoking_cessation
         patient_is_taking_nicotine_containing_product_in_transdermal_dose_form_inthefuture)
     :named REQ4_AUXILIARY0)) ;; "To be included, the patient must be willing to use the nicotine patch to attempt smoking cessation."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_taking_nicotine_containing_product_in_transdermal_dose_form_inthefuture@@for_the_purpose_of_attempting_smoking_cessation
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must be willing to use the nicotine patch to attempt smoking cessation."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_received_consent_from_primary_care_physician_to_participate Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received consent to participate from the patient's primary care physician.","when_to_set_to_false":"Set to false if the patient has not received consent to participate from the patient's primary care physician.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received consent to participate from the patient's primary care physician.","meaning":"Boolean indicating whether the patient has received consent to participate from the patient's primary care physician."}  ;; "To be included, the patient must receive consent to participate from the patient's primary care physician."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_received_consent_from_primary_care_physician_to_participate
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must receive consent to participate from the patient's primary care physician."
