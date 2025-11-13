;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_signed_written_informed_consent_prior_to_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed written informed consent prior to study participation.","when_to_set_to_false":"Set to false if the patient has not signed written informed consent prior to study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed written informed consent prior to study participation.","meaning":"Boolean indicating whether the patient has signed written informed consent prior to study participation."} ;; "the patient must have signed written informed consent prior to study participation."
(declare-const patient_has_dated_written_informed_consent_prior_to_study_participation Bool) ;; {"when_to_set_to_true":"Set to true if the patient has dated written informed consent prior to study participation.","when_to_set_to_false":"Set to false if the patient has not dated written informed consent prior to study participation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has dated written informed consent prior to study participation.","meaning":"Boolean indicating whether the patient has dated written informed consent prior to study participation."} ;; "the patient must have dated written informed consent prior to study participation."

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: patient must have signed written informed consent prior to study participation
(assert
  (! patient_has_signed_written_informed_consent_prior_to_study_participation
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed written informed consent prior to study participation."

;; Component 1: patient must have dated written informed consent prior to study participation
(assert
  (! patient_has_dated_written_informed_consent_prior_to_study_participation
     :named REQ0_COMPONENT1_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have dated written informed consent prior to study participation."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_is_outpatient_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as an outpatient.","when_to_set_to_false":"Set to false if the patient is currently not classified as an outpatient (e.g., inpatient, emergency, etc.).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently classified as an outpatient.","meaning":"Boolean indicating whether the patient is currently classified as an outpatient."} ;; "the patient must be an outpatient."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_is_outpatient_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "the patient must be an outpatient."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's age in years as recorded at Visit 1 if it is known and documented.","when_to_set_to_null":"Set to null if the patient's age in years at Visit 1 is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's age in years at Visit 1."} ;; "aged ≥ 40 years at Visit 1"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 40)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must be (aged ≥ 40 years) at Visit 1."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently female."} ;; "female"
(declare-const patient_sex_is_male_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as male.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not male (e.g., female, other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently male."} ;; "male"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_sex_is_male_now patient_sex_is_female_now)
     :named REQ3_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be (male OR female)."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of becoming pregnant (i.e., has childbearing potential).","when_to_set_to_false":"Set to false if the patient is currently physiologically incapable of becoming pregnant (e.g., post-menopausal, surgically sterile, or otherwise non-childbearing).","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient currently has the potential to bear children."} ;; "of non-child bearing potential (defined as physiologically incapable of becoming pregnant, including post-menopausal or surgically sterile)"
(declare-const patient_has_finding_of_non_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently physiologically incapable of becoming pregnant, including being post-menopausal or surgically sterile.","when_to_set_to_false":"Set to false if the patient is currently physiologically capable of becoming pregnant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is physiologically incapable of becoming pregnant.","meaning":"Boolean value indicating whether the patient is currently physiologically incapable of becoming pregnant (i.e., of non-childbearing potential, including post-menopausal or surgically sterile)."} ;; "of non-child bearing potential (defined as physiologically incapable of becoming pregnant, including post-menopausal or surgically sterile)"
(declare-const patient_has_finding_of_post_menopausal_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently post-menopausal.","when_to_set_to_false":"Set to false if the patient is currently not post-menopausal.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently post-menopausal.","meaning":"Boolean value indicating whether the patient is currently post-menopausal."} ;; "post-menopausal"
(declare-const patient_has_finding_of_surgically_sterile_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently surgically sterile.","when_to_set_to_false":"Set to false if the patient is currently not surgically sterile.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently surgically sterile.","meaning":"Boolean value indicating whether the patient is currently surgically sterile."} ;; "surgically sterile"
(declare-const patient_has_finding_of_negative_pregnancy_test_at_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a negative pregnancy test at the time of screening.","when_to_set_to_false":"Set to false if the patient does not have a negative pregnancy test at the time of screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a negative pregnancy test at the time of screening.","meaning":"Boolean value indicating whether the patient has a negative pregnancy test at the time of screening."} ;; "have a negative pregnancy test at screening"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as determined by a pregnancy test or clinical assessment.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as determined by a pregnancy test or clinical assessment.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "have a negative pregnancy test at screening"
(declare-const patient_has_finding_of_oral_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using oral contraception (combined or progestogen alone).","when_to_set_to_false":"Set to false if the patient is currently not using oral contraception (combined or progestogen alone).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using oral contraception (combined or progestogen alone).","meaning":"Boolean indicating whether the patient is currently using oral contraception (combined or progestogen alone)."} ;; "oral contraceptive (combined or progestogen alone)"
(declare-const patient_has_finding_of_oral_contraception_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using oral contraception (combined or progestogen alone) and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using oral contraception (combined or progestogen alone) but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using oral contraception (combined or progestogen alone) consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using oral contraception (combined or progestogen alone) consistently and correctly for the duration of the study."} ;; "oral contraceptive (combined or progestogen alone); ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_progesterone_containing_product_in_parenteral_dose_form_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using injectable progestogen.","when_to_set_to_false":"Set to false if the patient is currently not using injectable progestogen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using injectable progestogen.","meaning":"Boolean indicating whether the patient is currently using injectable progestogen."} ;; "injectable progestogen"
(declare-const patient_has_finding_of_progesterone_containing_product_in_parenteral_dose_form_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using injectable progestogen and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using injectable progestogen but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using injectable progestogen consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using injectable progestogen consistently and correctly for the duration of the study."} ;; "injectable progestogen; ... consistently AND correctly for the duration of the study"
(declare-const patient_is_exposed_to_levonorgestrel_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using) implants of levonorgestrel.","when_to_set_to_false":"Set to false if the patient is currently not exposed to (using) implants of levonorgestrel.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to (using) implants of levonorgestrel.","meaning":"Boolean indicating whether the patient is currently exposed to (using) implants of levonorgestrel."} ;; "implants of levonorgestrel"
(declare-const patient_is_exposed_to_levonorgestrel_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to (using) implants of levonorgestrel and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently exposed to (using) implants of levonorgestrel but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using implants of levonorgestrel consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently exposed to (using) implants of levonorgestrel consistently and correctly for the duration of the study."} ;; "implants of levonorgestrel; ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_estrogenic_vaginal_ring_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an estrogenic vaginal ring.","when_to_set_to_false":"Set to false if the patient is currently not using an estrogenic vaginal ring.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an estrogenic vaginal ring.","meaning":"Boolean value indicating whether the patient is currently using an estrogenic vaginal ring."} ;; "estrogenic vaginal ring"
(declare-const patient_has_finding_of_estrogenic_vaginal_ring_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an estrogenic vaginal ring and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using an estrogenic vaginal ring but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using an estrogenic vaginal ring consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using an estrogenic vaginal ring consistently and correctly for the duration of the study."} ;; "estrogenic vaginal ring; ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_transdermal_contraceptive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using percutaneous contraceptive patches.","when_to_set_to_false":"Set to false if the patient is currently not using percutaneous contraceptive patches.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using percutaneous contraceptive patches.","meaning":"Boolean indicating whether the patient is currently using percutaneous contraceptive patches."} ;; "percutaneous contraceptive patches"
(declare-const patient_has_finding_of_transdermal_contraceptive_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using percutaneous contraceptive patches and is using them consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using percutaneous contraceptive patches but is not using them consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using percutaneous contraceptive patches consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using percutaneous contraceptive patches consistently and correctly for the duration of the study."} ;; "percutaneous contraceptive patches; ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_iud_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an intrauterine device (IUD).","when_to_set_to_false":"Set to false if the patient is currently not using an intrauterine device (IUD).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an intrauterine device (IUD).","meaning":"Boolean indicating whether the patient is currently using an intrauterine device (IUD)."} ;; "intrauterine device"
(declare-const patient_has_finding_of_iud_contraception_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an intrauterine device (IUD) and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using an intrauterine device (IUD) but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using an intrauterine device (IUD) consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using an intrauterine device (IUD) consistently and correctly for the duration of the study."} ;; "intrauterine device; ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_intrauterine_system_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an intrauterine system.","when_to_set_to_false":"Set to false if the patient is currently not using an intrauterine system.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using an intrauterine system.","meaning":"Boolean value indicating whether the patient is currently using an intrauterine system."} ;; "intrauterine system"
(declare-const patient_has_finding_of_intrauterine_system_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using an intrauterine system and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using an intrauterine system but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using an intrauterine system consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using an intrauterine system consistently and correctly for the duration of the study."} ;; "intrauterine system; ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_male_partner_sterilization_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's male partner is currently sterilized (vasectomy).","when_to_set_to_false":"Set to false if the patient's male partner is currently not sterilized (vasectomy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's male partner is currently sterilized (vasectomy).","meaning":"Boolean value indicating whether the patient's male partner is currently sterilized (vasectomy)."} ;; "male partner sterilization (vasectomy with documentation of azoospermia) prior to the patient's entry into the study AND this male is the sole partner for the patient"
(declare-const patient_has_finding_of_male_partner_sterilization_now@@vasectomy_with_documentation_of_azoospermia Bool) ;; {"when_to_set_to_true":"Set to true if the vasectomy resulted in documentation of azoospermia.","when_to_set_to_false":"Set to false if the vasectomy did not result in documentation of azoospermia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vasectomy resulted in documentation of azoospermia.","meaning":"Boolean indicating whether the vasectomy resulted in documentation of azoospermia."} ;; "vasectomy with documentation of azoospermia"
(declare-const patient_has_finding_of_male_partner_sterilization_now@@performed_prior_to_patient_study_entry Bool) ;; {"when_to_set_to_true":"Set to true if the vasectomy was performed prior to the patient's entry into the study.","when_to_set_to_false":"Set to false if the vasectomy was not performed prior to the patient's entry into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vasectomy was performed prior to the patient's entry into the study.","meaning":"Boolean indicating whether the vasectomy was performed prior to the patient's entry into the study."} ;; "vasectomy ... prior to the patient's entry into the study"
(declare-const patient_has_finding_of_male_partner_sterilization_now@@male_is_sole_partner_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if the male partner who underwent vasectomy is the sole partner for the patient.","when_to_set_to_false":"Set to false if the male partner who underwent vasectomy is not the sole partner for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the male partner who underwent vasectomy is the sole partner for the patient.","meaning":"Boolean indicating whether the male partner who underwent vasectomy is the sole partner for the patient."} ;; "this male is the sole partner for the patient"
(declare-const patient_has_finding_of_double_barrier_method_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using the double barrier method (condom AND an occlusive cap with a vaginal spermicidal agent).","when_to_set_to_false":"Set to false if the patient is currently not using the double barrier method.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using the double barrier method.","meaning":"Boolean value indicating whether the patient is currently using the double barrier method (condom AND an occlusive cap with a vaginal spermicidal agent)."} ;; "double barrier method (condom AND an occlusive cap with a vaginal spermicidal agent)"
(declare-const patient_has_finding_of_double_barrier_method_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using the double barrier method and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using the double barrier method but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using the double barrier method consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using the double barrier method consistently and correctly for the duration of the study."} ;; "double barrier method ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_uses_contraceptive_sheath_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using condoms.","when_to_set_to_false":"Set to false if the patient is currently not using condoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using condoms.","meaning":"Boolean indicating whether the patient is currently using condoms."} ;; "condom"
(declare-const patient_has_finding_of_uses_contraceptive_sheath_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using condoms and is using them consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using condoms but is not using them consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using condoms consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using condoms consistently and correctly for the duration of the study."} ;; "condom ... consistently AND correctly for the duration of the study"
(declare-const patient_has_finding_of_spermicidal_contraception_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a vaginal spermicidal agent.","when_to_set_to_false":"Set to false if the patient is currently not using a vaginal spermicidal agent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently using a vaginal spermicidal agent.","meaning":"Boolean indicating whether the patient is currently using a vaginal spermicidal agent."} ;; "vaginal spermicidal agent"
(declare-const patient_has_finding_of_spermicidal_contraception_now@@used_consistently_and_correctly_for_study_duration Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently using a vaginal spermicidal agent and is using it consistently and correctly for the duration of the study.","when_to_set_to_false":"Set to false if the patient is currently using a vaginal spermicidal agent but is not using it consistently and correctly for the duration of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is using a vaginal spermicidal agent consistently and correctly for the duration of the study.","meaning":"Boolean indicating whether the patient is currently using a vaginal spermicidal agent consistently and correctly for the duration of the study."} ;; "vaginal spermicidal agent ... consistently AND correctly for the duration of the study"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-childbearing potential is defined as physiologically incapable of becoming pregnant, including post-menopausal or surgically sterile
(assert
  (! (= patient_has_finding_of_non_childbearing_potential_now
        (or (not patient_has_childbearing_potential_now)
            patient_has_finding_of_post_menopausal_now
            patient_has_finding_of_surgically_sterile_now))
     :named REQ4_AUXILIARY0)) ;; "of non-child bearing potential (defined as physiologically incapable of becoming pregnant, including post-menopausal or surgically sterile)"

;; If the patient is using a double barrier method consistently and correctly, then she is using both condom and occlusive cap with vaginal spermicidal agent consistently and correctly
(assert
  (! (=> patient_has_finding_of_double_barrier_method_now@@used_consistently_and_correctly_for_study_duration
         (and patient_has_finding_of_uses_contraceptive_sheath_now@@used_consistently_and_correctly_for_study_duration
              patient_has_finding_of_spermicidal_contraception_now@@used_consistently_and_correctly_for_study_duration))
     :named REQ4_AUXILIARY1)) ;; "double barrier method (condom AND an occlusive cap with a vaginal spermicidal agent) ... consistently AND correctly for the duration of the study"

;; If the patient is using male partner sterilization as contraception, it must be vasectomy with documentation of azoospermia, performed prior to study entry, and this male is the sole partner
(assert
  (! (=> (and patient_has_finding_of_male_partner_sterilization_now
              patient_has_finding_of_male_partner_sterilization_now@@vasectomy_with_documentation_of_azoospermia
              patient_has_finding_of_male_partner_sterilization_now@@performed_prior_to_patient_study_entry
              patient_has_finding_of_male_partner_sterilization_now@@male_is_sole_partner_for_patient)
         patient_has_finding_of_male_partner_sterilization_now)
     :named REQ4_AUXILIARY2)) ;; "male partner sterilization (vasectomy with documentation of azoospermia) prior to the patient's entry into the study AND this male is the sole partner for the patient"

;; Acceptable contraceptive methods (umbrella: exhaustive list)
;; List: abstinence; oral contraceptive (combined or progestogen alone); injectable progestogen; implants of levonorgestrel; estrogenic vaginal ring; percutaneous contraceptive patches; intrauterine device or intrauterine system; male partner sterilization (vasectomy with documentation of azoospermia) prior to the patient's entry into the study AND this male is the sole partner for the patient; double barrier method (condom AND an occlusive cap with a vaginal spermicidal agent)
(define-fun patient_is_using_acceptable_contraceptive_method_consistently_and_correctly_for_study_duration () Bool
  (or
    ;; abstinence (not encoded as a variable, so not included)
    patient_has_finding_of_oral_contraception_now@@used_consistently_and_correctly_for_study_duration
    patient_has_finding_of_progesterone_containing_product_in_parenteral_dose_form_now@@used_consistently_and_correctly_for_study_duration
    patient_is_exposed_to_levonorgestrel_now@@used_consistently_and_correctly_for_study_duration
    patient_has_finding_of_estrogenic_vaginal_ring_now@@used_consistently_and_correctly_for_study_duration
    patient_has_finding_of_transdermal_contraceptive_now@@used_consistently_and_correctly_for_study_duration
    patient_has_finding_of_iud_contraception_now@@used_consistently_and_correctly_for_study_duration
    patient_has_finding_of_intrauterine_system_now@@used_consistently_and_correctly_for_study_duration
    (and patient_has_finding_of_male_partner_sterilization_now
         patient_has_finding_of_male_partner_sterilization_now@@vasectomy_with_documentation_of_azoospermia
         patient_has_finding_of_male_partner_sterilization_now@@performed_prior_to_patient_study_entry
         patient_has_finding_of_male_partner_sterilization_now@@male_is_sole_partner_for_patient)
    patient_has_finding_of_double_barrier_method_now@@used_consistently_and_correctly_for_study_duration
  )
) ;; "agree to use at least one of the following acceptable contraceptive methods consistently AND correctly for the duration of the study: ..."

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient is female, she must be either of non-childbearing potential (as defined), or (of childbearing potential AND negative pregnancy test at screening AND agrees to use at least one acceptable contraceptive method consistently and correctly for the duration of the study)
(assert
  (! (or
        (not patient_sex_is_female_now)
        (or
          patient_has_finding_of_non_childbearing_potential_now
          (and patient_has_childbearing_potential_now
               patient_has_finding_of_negative_pregnancy_test_at_screening
               (not patient_is_pregnant_now)
               patient_is_using_acceptable_contraceptive_method_consistently_and_correctly_for_study_duration)))
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is female, the patient must be ((of non-child bearing potential (defined as physiologically incapable of becoming pregnant, including post-menopausal or surgically sterile)) OR (of child bearing potential AND (have a negative pregnancy test at screening) AND (agree to use at least one of the following acceptable contraceptive methods consistently AND correctly for the duration of the study: ...)))"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a documented clinical history of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_false":"Set to false if the patient does not have a documented clinical history of chronic obstructive pulmonary disease (COPD) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a clinical history of chronic obstructive pulmonary disease (COPD).","meaning":"Boolean indicating whether the patient has a clinical history of chronic obstructive pulmonary disease (COPD)."} ;; "the patient must have an established clinical history of chronic obstructive pulmonary disease (COPD)"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_diagnosis_of_chronic_obstructive_lung_disease_inthehistory
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have an established clinical history of chronic obstructive pulmonary disease (COPD) in accordance with the definition by the American Thoracic Society/European Respiratory Society."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_cigarette_smoking_cessation_duration_value_recorded_prior_to_screening_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value of the duration in months that the patient has stopped cigarette smoking prior to screening (Visit 1).","when_to_set_to_null":"Set to null if the duration in months that the patient has stopped cigarette smoking prior to screening (Visit 1) is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the duration in months that the patient has stopped cigarette smoking prior to screening (Visit 1)."} ;; "has stopped cigarette smoking for ≥ 6 months prior to Visit 1"
(declare-const patient_cigarette_smoking_pack_years_value_recorded_at_screening_in_pack_years Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's cigarette smoking history in pack-years, as recorded at screening (Visit 1).","when_to_set_to_null":"Set to null if the patient's cigarette smoking history in pack-years at screening (Visit 1) is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's history of cigarette smoking in pack-years at screening (Visit 1)."} ;; "history of cigarette smoking of ≥ 10 pack-years at screening (Visit 1)"
(declare-const patient_has_finding_of_cigarette_smoker_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of being a cigarette smoker (i.e., was a smoker in the past, but not currently).","when_to_set_to_false":"Set to false if the patient does not have a history of being a cigarette smoker.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a history of being a cigarette smoker.","meaning":"Boolean indicating whether the patient has a history of being a cigarette smoker."} ;; "former cigarette smoker"
(declare-const patient_has_finding_of_cigarette_smoker_inthehistory@@cessation_for_at_least_6_months_prior_to_screening Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a history of being a cigarette smoker and has stopped smoking for at least 6 months prior to screening (Visit 1).","when_to_set_to_false":"Set to false if the patient has a history of being a cigarette smoker but has not stopped for at least 6 months prior to screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has stopped smoking for at least 6 months prior to screening.","meaning":"Boolean indicating whether the patient has a history of being a cigarette smoker and has stopped for at least 6 months prior to screening (Visit 1)."} ;; "has stopped cigarette smoking for ≥ 6 months prior to Visit 1"
(declare-const patient_has_finding_of_cigarette_smoker_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a cigarette smoker at the time of screening (Visit 1).","when_to_set_to_false":"Set to false if the patient is not currently a cigarette smoker at the time of screening (Visit 1).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a cigarette smoker at screening.","meaning":"Boolean indicating whether the patient is currently a cigarette smoker."} ;; "current cigarette smoker"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: cessation for at least 6 months prior to screening
(assert
  (! (= patient_has_finding_of_cigarette_smoker_inthehistory@@cessation_for_at_least_6_months_prior_to_screening
        (and patient_has_finding_of_cigarette_smoker_inthehistory
             (>= patient_cigarette_smoking_cessation_duration_value_recorded_prior_to_screening_in_months 6)))
     :named REQ6_AUXILIARY0)) ;; "has stopped cigarette smoking for ≥ 6 months prior to Visit 1"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_finding_of_cigarette_smoker_inthehistory@@cessation_for_at_least_6_months_prior_to_screening
         patient_has_finding_of_cigarette_smoker_inthehistory)
     :named REQ6_AUXILIARY1)) ;; "former cigarette smoker with cessation for ≥ 6 months"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Inclusion: (current cigarette smoker with ≥10 pack-years) OR (former cigarette smoker with ≥10 pack-years AND cessation ≥6 months)
(assert
  (! (or
        (and patient_has_finding_of_cigarette_smoker_now
             (>= patient_cigarette_smoking_pack_years_value_recorded_at_screening_in_pack_years 10))
        (and patient_has_finding_of_cigarette_smoker_inthehistory@@cessation_for_at_least_6_months_prior_to_screening
             (>= patient_cigarette_smoking_pack_years_value_recorded_at_screening_in_pack_years 10)))
     :named REQ6_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must be ((a current cigarette smoker with a history of cigarette smoking of ≥ 10 pack-years at screening (Visit 1)) OR (a former cigarette smoker with a history of cigarette smoking of ≥ 10 pack-years at screening (Visit 1) AND has stopped cigarette smoking for ≥ 6 months prior to Visit 1))."

;; ===================== Declarations for the criterion (REQ 7) =====================
(declare-const chronic_obstructive_pulmonary_disease_assessment_test_score_value_recorded_at_screening_withunit_points Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's chronic obstructive pulmonary disease assessment test score recorded at screening, in points.","when_to_set_to_null":"Set to null if the score is unknown, not documented, or cannot be determined at screening.","meaning":"Numeric value representing the patient's chronic obstructive pulmonary disease assessment test score at screening, in points."} ;; "the patient must have a score of ≥ 10 on the chronic obstructive pulmonary disease assessment test at screening."

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (>= chronic_obstructive_pulmonary_disease_assessment_test_score_value_recorded_at_screening_withunit_points 10)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient must have a score of ≥ 10 on the chronic obstructive pulmonary disease assessment test at screening."

;; ===================== Declarations for the criterion (REQ 8) =====================
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-albuterol FEV1/FVC ratio is recorded at screening.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-albuterol FEV1/FVC ratio measured at screening."} ;; "post-albuterol forced expiratory volume in one second/forced vital capacity ratio < 0.70 at screening"
(declare-const patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_salbutamol Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's post-salbutamol FEV1/FVC ratio is recorded at screening.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-salbutamol FEV1/FVC ratio measured at screening."} ;; "post-salbutamol forced expiratory volume in one second/forced vital capacity ratio < 0.70 at screening"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
  (! (or (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio 0.70)
         (< patient_forced_expired_volume_in_one_second_forced_vital_capacity_ratio_value_recorded_now_withunit_ratio@@measured_post_salbutamol 0.70))
     :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((post-albuterol forced expiratory volume in one second/forced vital capacity ratio < 0.70 at screening) OR (post-salbutamol forced expiratory volume in one second/forced vital capacity ratio < 0.70 at screening))."

;; ===================== Declarations for the criterion (REQ 9) =====================
(declare-const patient_has_duration_of_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_prior_to_screening_in_months Real) ;; {"when_to_set_to_value":"Set to the number of months the patient has been receiving daily maintenance treatment for chronic obstructive pulmonary disease prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many months the patient has been receiving daily maintenance treatment for chronic obstructive pulmonary disease prior to screening.","meaning":"Numeric value indicating the number of months the patient has been receiving daily maintenance treatment for chronic obstructive pulmonary disease prior to screening."} ;; "receiving daily maintenance treatment for chronic obstructive pulmonary disease for ≥ 3 months prior to screening"
(declare-const patient_has_finding_of_chronic_obstructive_lung_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient currently has chronic obstructive pulmonary disease."} ;; "chronic obstructive pulmonary disease"
(declare-const patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving daily maintenance treatment for chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient is currently not receiving daily maintenance treatment for chronic obstructive pulmonary disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving daily maintenance treatment for chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient is currently receiving daily maintenance treatment for chronic obstructive pulmonary disease."} ;; "receiving daily maintenance treatment for chronic obstructive pulmonary disease"
(declare-const patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now@@duration_prior_to_screening_in_months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has been receiving daily maintenance treatment for chronic obstructive pulmonary disease for the specified number of months prior to screening.","when_to_set_to_false":"Set to false if the patient has not been receiving daily maintenance treatment for chronic obstructive pulmonary disease for the specified number of months prior to screening.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has been receiving daily maintenance treatment for chronic obstructive pulmonary disease for the specified number of months prior to screening.","meaning":"Boolean indicating whether the patient has been receiving daily maintenance treatment for chronic obstructive pulmonary disease for the specified number of months prior to screening."} ;; "receiving daily maintenance treatment for chronic obstructive pulmonary disease for ≥ 3 months prior to screening"
(declare-const patient_is_receiving_only_pro_re_nata_copd_medications_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving only pro re nata (as needed) medications for chronic obstructive pulmonary disease.","when_to_set_to_false":"Set to false if the patient is currently receiving other types of medications for chronic obstructive pulmonary disease, or both pro re nata and maintenance medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving only pro re nata medications for chronic obstructive pulmonary disease.","meaning":"Boolean indicating whether the patient is currently receiving only pro re nata (as needed) medications for chronic obstructive pulmonary disease."} ;; "receiving only pro re nata chronic obstructive pulmonary disease medications"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Qualifier variable implies stem variable
(assert
  (! (=> patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now@@duration_prior_to_screening_in_months
         patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now)
     :named REQ9_AUXILIARY0)) ;; "receiving daily maintenance treatment for chronic obstructive pulmonary disease for ≥ 3 months prior to screening"

;; Definition: patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now@@duration_prior_to_screening_in_months is true iff patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now AND duration ≥ 3 months
(assert
  (! (= patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now@@duration_prior_to_screening_in_months
        (and patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now
             (>= patient_has_duration_of_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_prior_to_screening_in_months 3)))
     :named REQ9_AUXILIARY1)) ;; "receiving daily maintenance treatment for chronic obstructive pulmonary disease for ≥ 3 months prior to screening"

;; ===================== Constraint Assertions (REQ 9) =====================
;; Component 0: Must be receiving daily maintenance treatment for COPD for ≥ 3 months prior to screening
(assert
  (! patient_is_receiving_daily_maintenance_treatment_for_chronic_obstructive_pulmonary_disease_now@@duration_prior_to_screening_in_months
     :named REQ9_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "receiving daily maintenance treatment for chronic obstructive pulmonary disease for ≥ 3 months prior to screening"

;; Component 1: Must NOT be receiving only pro re nata COPD medications
(assert
  (! (not patient_is_receiving_only_pro_re_nata_copd_medications_now)
     :named REQ9_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "must not be receiving only pro re nata chronic obstructive pulmonary disease medications"

;; ===================== Declarations for the criterion (REQ 10) =====================
(declare-const patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_predicted Real) ;; {"when_to_set_to_value":"Set to the measured percent predicted value if a post-bronchodilator FEV1 measurement (as percent of predicted normal) is available for the patient now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's post-bronchodilator FEV1 as percent of predicted normal, measured now."} ;; "post-bronchodilator forced expiratory volume in one second < 50% predicted normal (percent predicted calculated using the European Respiratory Society Global Lung Function Initiative reference equations)"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had an acute exacerbation of chronic obstructive pulmonary disease in the past 12 months.","when_to_set_to_false":"Set to false if the patient has not had an acute exacerbation of chronic obstructive pulmonary disease in the past 12 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had an acute exacerbation of chronic obstructive pulmonary disease in the past 12 months.","meaning":"Boolean indicating whether the patient has had an acute exacerbation of chronic obstructive pulmonary disease in the past 12 months."} ;; "have a documented history of (≥ 1 moderate chronic obstructive pulmonary disease exacerbation ... OR ≥ 1 severe chronic obstructive pulmonary disease exacerbation ...) in the previous 12 months"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@documented_in_medical_record Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of COPD in the past 12 months is documented in the medical record.","when_to_set_to_false":"Set to false if the acute exacerbation of COPD in the past 12 months is not documented in the medical record.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation of COPD in the past 12 months is documented in the medical record.","meaning":"Boolean indicating whether the acute exacerbation of COPD in the past 12 months is documented in the medical record."} ;; "documented history ... Subject verbal reports are NOT acceptable as documentation of exacerbation history."
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@severity_moderate Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of COPD in the past 12 months is of moderate severity.","when_to_set_to_false":"Set to false if the acute exacerbation of COPD in the past 12 months is not of moderate severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation of COPD in the past 12 months is of moderate severity.","meaning":"Boolean indicating whether the acute exacerbation of COPD in the past 12 months is of moderate severity."} ;; "moderate chronic obstructive pulmonary disease exacerbation"
(declare-const patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the acute exacerbation of COPD in the past 12 months is of severe severity.","when_to_set_to_false":"Set to false if the acute exacerbation of COPD in the past 12 months is not of severe severity.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the acute exacerbation of COPD in the past 12 months is of severe severity.","meaning":"Boolean indicating whether the acute exacerbation of COPD in the past 12 months is of severe severity."} ;; "severe chronic obstructive pulmonary disease exacerbation"
(declare-const patient_number_of_moderate_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count Real) ;; {"when_to_set_to_value":"Set to the documented count of moderate acute exacerbations of COPD in the past 12 months as recorded in the medical record.","when_to_set_to_null":"Set to null if the count is unknown, not documented, or cannot be determined from the medical record.","meaning":"Numeric value representing the number of moderate acute exacerbations of COPD in the past 12 months, as documented in the medical record."} ;; "≥ 1 moderate ... OR ≥ 2 moderate ... in the previous 12 months"
(declare-const patient_number_of_severe_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count Real) ;; {"when_to_set_to_value":"Set to the documented count of severe acute exacerbations of COPD in the past 12 months as recorded in the medical record.","when_to_set_to_null":"Set to null if the count is unknown, not documented, or cannot be determined from the medical record.","meaning":"Numeric value representing the number of severe acute exacerbations of COPD in the past 12 months, as documented in the medical record."} ;; "≥ 1 severe ... in the previous 12 months"

;; ===================== Auxiliary Assertions (REQ 10) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@documented_in_medical_record
         patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months)
     :named REQ10_AUXILIARY0)) ;; "documented history ... Subject verbal reports are NOT acceptable as documentation of exacerbation history."

;; Moderate severity qualifier implies stem variable
(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@severity_moderate
         patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months)
     :named REQ10_AUXILIARY1)) ;; "moderate chronic obstructive pulmonary disease exacerbation"

;; Severe severity qualifier implies stem variable
(assert
  (! (=> patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@severity_severe
         patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months)
     :named REQ10_AUXILIARY2)) ;; "severe chronic obstructive pulmonary disease exacerbation"

;; Definitions for moderate and severe exacerbation counts
(assert
  (! (= patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@severity_moderate
        (> patient_number_of_moderate_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count 0))
     :named REQ10_AUXILIARY3)) ;; "≥ 1 moderate ... in the previous 12 months"

(assert
  (! (= patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@severity_severe
        (> patient_number_of_severe_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count 0))
     :named REQ10_AUXILIARY4)) ;; "≥ 1 severe ... in the previous 12 months"

;; ===================== Constraint Assertions (REQ 10) =====================
;; Component 0: FEV1 < 50% predicted AND (≥1 moderate OR ≥1 severe exacerbation in past 12 months, documented)
(assert
  (! (or
        (and
          (< patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_predicted 50.0) ;; "post-bronchodilator forced expiratory volume in one second < 50% predicted normal"
          (or
            (>= patient_number_of_moderate_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count 1)
            (>= patient_number_of_severe_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count 1)
          )
          patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@documented_in_medical_record
        )
        (and
          (>= patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_predicted 50.0)
          (< patient_fev1_after_bronchodilation_value_recorded_now_withunit_percent_predicted 80.0)
          (or
            (>= patient_number_of_moderate_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count 2)
            (>= patient_number_of_severe_acute_exacerbations_of_chronic_obstructive_airways_disease_inthepast12months_value_recorded_past12months_withunit_count 1)
          )
          patient_has_finding_of_acute_exacerbation_of_chronic_obstructive_airways_disease_inthepast12months@@documented_in_medical_record
        )
     )
     :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a post-bronchodilator forced expiratory volume in one second < 50% predicted normal ... AND (have a documented history of (≥ 1 moderate ... OR ≥ 1 severe ...) in the previous 12 months)) OR (have a post-bronchodilator forced expiratory volume in one second ≥ 50% AND < 80% predicted normal ... AND (have a documented history of (≥ 2 moderate ... OR ≥ 1 severe ...) in the previous 12 months))). Subject verbal reports are NOT acceptable as documentation of exacerbation history."

;; ===================== Declarations for the criterion (REQ 11) =====================
(declare-const patient_alanine_aminotransferase_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if alanine aminotransferase is recorded now for the patient.","when_to_set_to_null":"Set to null if no alanine aminotransferase measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's alanine aminotransferase measurement recorded now."} ;; "alanine aminotransferase < 2 times the upper limit of normal"
(declare-const patient_alkaline_phosphatase_value_recorded_now_withunit_unit Real) ;; {"when_to_set_to_value":"Set to the measured value if alkaline phosphatase is recorded now for the patient.","when_to_set_to_null":"Set to null if no alkaline phosphatase measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's alkaline phosphatase measurement recorded now."} ;; "alkaline phosphatase ≤ 1.5 times the upper limit of normal"
(declare-const patient_bilirubin_value_recorded_now_withunit_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if total bilirubin is recorded now for the patient, in micromoles per liter (μmol/L).","when_to_set_to_null":"Set to null if no total bilirubin measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's total bilirubin measurement recorded now, in micromoles per liter (μmol/L)."} ;; "bilirubin ≤ 1.5 times the upper limit of normal"
(declare-const patient_bilirubin_is_isolated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bilirubin elevation is isolated (not accompanied by elevations in other liver enzymes).","when_to_set_to_false":"Set to false if the patient's current bilirubin elevation is not isolated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bilirubin elevation is isolated.","meaning":"Boolean indicating whether the patient's current bilirubin elevation is isolated (not accompanied by elevations in other liver enzymes)."} ;; "isolated bilirubin > 1.5 times the upper limit of normal"
(declare-const patient_bilirubin_is_fractionated_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current bilirubin measurement has been fractionated into direct and indirect components.","when_to_set_to_false":"Set to false if the patient's current bilirubin measurement has not been fractionated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current bilirubin measurement has been fractionated.","meaning":"Boolean indicating whether the patient's current bilirubin measurement has been fractionated into direct and indirect components."} ;; "have bilirubin fractionated"
(declare-const patient_direct_bilirubin_value_recorded_now_withunit_micromol_per_l Real) ;; {"when_to_set_to_value":"Set to the measured value if direct (conjugated) bilirubin is recorded now for the patient, in micromoles per liter (μmol/L).","when_to_set_to_null":"Set to null if no direct bilirubin measurement is recorded now or the value is indeterminate.","meaning":"Numeric value representing the patient's direct (conjugated) bilirubin measurement recorded now, in micromoles per liter (μmol/L)."} ;; "direct bilirubin < 35%"

;; ===================== Additional Declarations for upper limit of normal (ULN) values =====================
(declare-const alanine_aminotransferase_upper_limit_of_normal_value Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for alanine aminotransferase, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for alanine aminotransferase is unknown or not available.","meaning":"Numeric value representing the upper limit of normal for alanine aminotransferase."} ;; "upper limit of normal for alanine aminotransferase"
(declare-const alkaline_phosphatase_upper_limit_of_normal_value Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for alkaline phosphatase, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for alkaline phosphatase is unknown or not available.","meaning":"Numeric value representing the upper limit of normal for alkaline phosphatase."} ;; "upper limit of normal for alkaline phosphatase"
(declare-const bilirubin_upper_limit_of_normal_value Real) ;; {"when_to_set_to_value":"Set to the reference value for the upper limit of normal for total bilirubin, as defined by the laboratory.","when_to_set_to_null":"Set to null if the reference value for the upper limit of normal for total bilirubin is unknown or not available.","meaning":"Numeric value representing the upper limit of normal for total bilirubin."} ;; "upper limit of normal for bilirubin"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Direct bilirubin percent calculation
(define-fun patient_direct_bilirubin_percent_of_total_now () Real
  (ite (> patient_bilirubin_value_recorded_now_withunit_micromol_per_l 0.0)
       (/ patient_direct_bilirubin_value_recorded_now_withunit_micromol_per_l patient_bilirubin_value_recorded_now_withunit_micromol_per_l)
       0.0)
) ;; "direct bilirubin < 35% of total bilirubin"

;; ===================== Constraint Assertions (REQ 11) =====================
;; Component 0: alanine aminotransferase < 2 × ULN
(assert
  (! (< patient_alanine_aminotransferase_value_recorded_now_withunit_unit
        (* 2.0 alanine_aminotransferase_upper_limit_of_normal_value))
     :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "alanine aminotransferase < 2 times the upper limit of normal"

;; Component 1: alkaline phosphatase ≤ 1.5 × ULN
(assert
  (! (<= patient_alkaline_phosphatase_value_recorded_now_withunit_unit
         (* 1.5 alkaline_phosphatase_upper_limit_of_normal_value))
     :named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "alkaline phosphatase ≤ 1.5 times the upper limit of normal"

;; Component 2: bilirubin ≤ 1.5 × ULN OR (isolated bilirubin > 1.5 × ULN AND fractionated AND direct bilirubin < 35%)
(assert
  (! (or
        (<= patient_bilirubin_value_recorded_now_withunit_micromol_per_l
            (* 1.5 bilirubin_upper_limit_of_normal_value))
        (and
          patient_bilirubin_is_isolated_now
          (> patient_bilirubin_value_recorded_now_withunit_micromol_per_l
             (* 1.5 bilirubin_upper_limit_of_normal_value))
          patient_bilirubin_is_fractionated_now
          (< patient_direct_bilirubin_percent_of_total_now 0.35)
        )
     )
     :named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "bilirubin ≤ 1.5 times the upper limit of normal OR (have isolated bilirubin > 1.5 times the upper limit of normal AND have bilirubin fractionated AND have direct bilirubin < 35%)"

;; ===================== Declarations for the criterion (REQ 12) =====================
(declare-const patient_is_affiliated_to_social_security_category_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently affiliated to a social security category.","when_to_set_to_false":"Set to false if the patient is currently not affiliated to a social security category.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently affiliated to a social security category.","meaning":"Boolean indicating whether the patient is currently affiliated to a social security category."} ;; "affiliated to a social security category"
(declare-const patient_is_beneficiary_of_social_security_category_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a beneficiary of a social security category.","when_to_set_to_false":"Set to false if the patient is currently not a beneficiary of a social security category.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a beneficiary of a social security category.","meaning":"Boolean indicating whether the patient is currently a beneficiary of a social security category."} ;; "a beneficiary of a social security category"
(declare-const patient_is_in_france_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently located in France.","when_to_set_to_false":"Set to false if the patient is currently not located in France.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently located in France.","meaning":"Boolean indicating whether the patient is currently located in France."} ;; "if the patient is in France"

;; ===================== Constraint Assertions (REQ 12) =====================
;; If the patient is in France, they must be affiliated to OR a beneficiary of a social security category
(assert
  (! (or (not patient_is_in_france_now)
         (or patient_is_affiliated_to_social_security_category_now
             patient_is_beneficiary_of_social_security_category_now))
     :named REQ12_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "if the patient is in France, the patient must be (affiliated to a social security category OR a beneficiary of a social security category)"
