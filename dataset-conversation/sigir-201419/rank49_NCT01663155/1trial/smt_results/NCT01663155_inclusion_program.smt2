;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 40 years AND aged ≤ 75 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 40 years."

(assert
  (! (<= patient_age_value_recorded_now_in_years 75)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≤ 75 years."

;; ===================== Declarations for the criterion (REQ 1) =====================
;; Age variable already declared in previous SMT program:
;; (declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."} // "aged ≥ 40 years AND aged ≤ 75 years"

(declare-const patient_has_finding_of_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a smoker.","when_to_set_to_false":"Set to false if the patient is currently not a smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a smoker.","meaning":"Boolean indicating whether the patient is currently a smoker."} // "the patient is a current smoker"
(declare-const patient_has_finding_of_ex_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently an ex-smoker.","when_to_set_to_false":"Set to false if the patient is currently not an ex-smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently an ex-smoker.","meaning":"Boolean indicating whether the patient is currently an ex-smoker."} // "the patient is an ex-smoker"
(declare-const patient_pack_years_of_smoking_value_recorded_now_withunit_pack_years Real) ;; {"when_to_set_to_value":"Set to the numeric value representing the patient's total pack years of smoking as recorded now, in pack years.","when_to_set_to_null":"Set to null if the patient's total pack years of smoking is unknown, not documented, or cannot be determined at the current time.","meaning":"Numeric value indicating the total number of pack years of smoking recorded for the patient at the current time, in units of pack years."} // "history of > 25 pack years", "history of > 35 pack years"
(declare-const patient_has_family_history_of_lung_cancer_in_a_parent Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a family history of lung cancer in a parent.","when_to_set_to_false":"Set to false if the patient does not have a family history of lung cancer in a parent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family history of lung cancer in a parent.","meaning":"Boolean indicating whether the patient has a family history of lung cancer in a parent."} // "family history in a parent"
(declare-const patient_has_family_history_of_lung_cancer_in_a_sibling Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a family history of lung cancer in a sibling.","when_to_set_to_false":"Set to false if the patient does not have a family history of lung cancer in a sibling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family history of lung cancer in a sibling.","meaning":"Boolean indicating whether the patient has a family history of lung cancer in a sibling."} // "family history in a sibling"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} // "chronic obstructive pulmonary disease"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Exhaustive subcategories for family history of lung cancer: only parent or sibling qualify
(declare-const patient_has_family_history_of_lung_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a family history of lung cancer in a parent or sibling.","when_to_set_to_false":"Set to false if the patient does not have a family history of lung cancer in a parent or sibling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a family history of lung cancer in a parent or sibling.","meaning":"Boolean indicating whether the patient has a family history of lung cancer in a parent or sibling."} // "family history of lung cancer with exhaustive subcategories (family history in a parent OR family history in a sibling)"

(assert
  (! (= patient_has_family_history_of_lung_cancer
        (or patient_has_family_history_of_lung_cancer_in_a_parent
            patient_has_family_history_of_lung_cancer_in_a_sibling))
     :named REQ1_AUXILIARY0)) ;; "family history of lung cancer with exhaustive subcategories (family history in a parent OR family history in a sibling)"

;; ===================== Constraint Assertions (REQ 1) =====================
;; If patient is aged ≥ 40 AND ≤ 59, then must meet at least one of the following three criteria:
;; 1. (current smoker OR ex-smoker with >25 pack years) AND family history of lung cancer (parent or sibling)
;; 2. (current smoker OR ex-smoker with >25 pack years) AND chronic obstructive pulmonary disease
;; 3. (current smoker OR ex-smoker with >35 pack years)

(assert
  (! (=> (and (>= patient_age_value_recorded_now_in_years 40.0)
              (<= patient_age_value_recorded_now_in_years 59.0))
         (or
           (and
             (or patient_has_finding_of_smoker_now
                 (and patient_has_finding_of_ex_smoker_now
                      (> patient_pack_years_of_smoking_value_recorded_now_withunit_pack_years 25.0)))
             patient_has_family_history_of_lung_cancer)
           (and
             (or patient_has_finding_of_smoker_now
                 (and patient_has_finding_of_ex_smoker_now
                      (> patient_pack_years_of_smoking_value_recorded_now_withunit_pack_years 25.0)))
             patient_has_finding_of_chronic_obstructive_lung_disease_now)
           (or patient_has_finding_of_smoker_now
               (and patient_has_finding_of_ex_smoker_now
                    (> patient_pack_years_of_smoking_value_recorded_now_withunit_pack_years 35.0)))
         ))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient is (aged ≥ 40 years AND aged ≤ 59 years), then the patient must meet at least one of the following criteria: ..."

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Exhaustive subcategories: family history of lung cancer ≡ (family history in a parent OR family history in a sibling)
(assert
  (! (= patient_has_family_history_of_lung_cancer
        (or patient_has_family_history_of_lung_cancer_in_a_parent
            patient_has_family_history_of_lung_cancer_in_a_sibling))
     :named REQ2_AUXILIARY0)) ;; "family history of lung cancer with exhaustive subcategories (family history in a parent OR family history in a sibling)"

;; ===================== Constraint Assertions (REQ 2) =====================
;; If patient is aged ≥ 60 years AND ≤ 75 years, then must meet at least one of the following:
;; 1. ((current smoker OR (ex-smoker AND >25 pack years)) AND family history of lung cancer)
;; 2. ((current smoker OR (ex-smoker AND >25 pack years)) AND chronic obstructive pulmonary disease)
;; 3. (current smoker OR (ex-smoker AND >30 pack years))
(assert
  (! (or
        (not (and (>= patient_age_value_recorded_now_in_years 60.0)
                  (<= patient_age_value_recorded_now_in_years 75.0)))
        (or
          (and
            (or patient_has_finding_of_smoker_now
                (and patient_has_finding_of_ex_smoker_now
                     (> patient_pack_years_of_smoking_value_recorded_now_withunit_pack_years 25.0)))
            patient_has_family_history_of_lung_cancer)
          (and
            (or patient_has_finding_of_smoker_now
                (and patient_has_finding_of_ex_smoker_now
                     (> patient_pack_years_of_smoking_value_recorded_now_withunit_pack_years 25.0)))
            patient_has_finding_of_chronic_obstructive_lung_disease_now)
          (or patient_has_finding_of_smoker_now
              (and patient_has_finding_of_ex_smoker_now
                   (> patient_pack_years_of_smoking_value_recorded_now_withunit_pack_years 30.0)))
        )
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, if the patient is (aged ≥ 60 years AND aged ≤ 75 years), then the patient must meet at least one of the following criteria: ..."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_can_undergo_screening_procedure_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is able to undergo a screening procedure in the future.","when_to_set_to_false":"Set to false if the patient is not able to undergo a screening procedure in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able to undergo a screening procedure in the future.","meaning":"Boolean indicating whether the patient is able to undergo a screening procedure in the future."} // "must be able to return to Cleveland Clinic for annual follow-up screening"
(declare-const patient_can_undergo_screening_procedure_inthefuture@@performed_at_cleveland_clinic Bool) ;; {"when_to_set_to_true":"Set to true if the patient can undergo a screening procedure in the future and the procedure is performed at Cleveland Clinic.","when_to_set_to_false":"Set to false if the patient can undergo a screening procedure in the future but the procedure is not performed at Cleveland Clinic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure is performed at Cleveland Clinic.","meaning":"Boolean indicating whether the patient can undergo a screening procedure in the future and the procedure is performed at Cleveland Clinic."} // "must be able to return to Cleveland Clinic for annual follow-up screening"
(declare-const patient_can_undergo_screening_procedure_inthefuture@@occurs_annually Bool) ;; {"when_to_set_to_true":"Set to true if the patient can undergo a screening procedure in the future and the procedure occurs annually.","when_to_set_to_false":"Set to false if the patient can undergo a screening procedure in the future but the procedure does not occur annually.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the procedure occurs annually.","meaning":"Boolean indicating whether the patient can undergo a screening procedure in the future and the procedure occurs annually."} // "must be able to return to Cleveland Clinic for annual follow-up screening"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_can_undergo_screening_procedure_inthefuture@@performed_at_cleveland_clinic
         patient_can_undergo_screening_procedure_inthefuture)
     :named REQ3_AUXILIARY0)) ;; "must be able to return to Cleveland Clinic for annual follow-up screening"

;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_can_undergo_screening_procedure_inthefuture@@occurs_annually
         patient_can_undergo_screening_procedure_inthefuture)
     :named REQ3_AUXILIARY1)) ;; "must be able to return to Cleveland Clinic for annual follow-up screening"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (and patient_can_undergo_screening_procedure_inthefuture@@performed_at_cleveland_clinic
          patient_can_undergo_screening_procedure_inthefuture@@occurs_annually)
     :named REQ3_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "must be able to return to Cleveland Clinic for annual follow-up screening"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_is_willing_to_sign_medical_release_form Bool) ;; {"when_to_set_to_true":"Set to true if the patient expresses willingness to sign a medical release form.","when_to_set_to_false":"Set to false if the patient expresses unwillingness to sign a medical release form.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to sign a medical release form.","meaning":"Boolean indicating whether the patient is willing to sign a medical release form."} // "the patient must be willing to sign a medical release form"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_is_willing_to_sign_medical_release_form
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be willing to sign a medical release form"
