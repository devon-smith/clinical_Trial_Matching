;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_impaired_cognition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of impaired cognition (cognitive impairment).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of impaired cognition (cognitive impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has impaired cognition.","meaning":"Boolean indicating whether the patient currently has impaired cognition (cognitive impairment)."} ;; "cognitive impairment"

(declare-const patient_has_finding_of_impaired_cognition_now@@interferes_with_patient_signing_own_informed_consent Bool) ;; {"when_to_set_to_true":"Set to true if the patient's impaired cognition interferes with their ability to sign their own informed consent.","when_to_set_to_false":"Set to false if the patient's impaired cognition does not interfere with their ability to sign their own informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's impaired cognition interferes with their ability to sign their own informed consent.","meaning":"Boolean indicating whether the patient's impaired cognition interferes with their ability to sign their own informed consent."} ;; "cognitive impairment that would interfere with the patient signing the patient's own informed consent"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_impaired_cognition_now@@interferes_with_patient_signing_own_informed_consent
      patient_has_finding_of_impaired_cognition_now)
:named REQ0_AUXILIARY0)) ;; "cognitive impairment that would interfere with the patient signing the patient's own informed consent"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_impaired_cognition_now@@interferes_with_patient_signing_own_informed_consent)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cognitive impairment that would interfere with the patient signing the patient's own informed consent."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_undergoing_anticoagulant_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing anticoagulant therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing anticoagulant therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing anticoagulant therapy.","meaning":"Boolean indicating whether the patient is currently undergoing anticoagulant therapy."} ;; "anticoagulant therapy"
(declare-const patient_prothrombin_time_value_recorded_inthepast1weeks_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the most recent measured value of the patient's prothrombin time (PT) within the past 1 week, in seconds.","when_to_set_to_null":"Set to null if no PT measurement is available within the past 1 week or if the value is indeterminate.","meaning":"Numeric value representing the patient's most recent prothrombin time (PT) measured within the past 1 week, in seconds."} ;; "prothrombin time/international normalized ratio within the last week"
(declare-const patient_international_normalized_ratio_value_recorded_inthepast1weeks_withunit_none Real) ;; {"when_to_set_to_value":"Set to the most recent measured value of the patient's international normalized ratio (INR) within the past 1 week.","when_to_set_to_null":"Set to null if no INR measurement is available within the past 1 week or if the value is indeterminate.","meaning":"Numeric value representing the patient's international normalized ratio (INR) measured within the past 1 week."} ;; "international normalized ratio within the last week"
(declare-const patient_has_other_significant_bleeding_risk_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other significant bleeding risk.","when_to_set_to_false":"Set to false if the patient currently does not have other significant bleeding risk.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other significant bleeding risk.","meaning":"Boolean indicating whether the patient currently has other significant bleeding risk."} ;; "other significant bleeding risk"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is on active anticoagulant therapy AND most recent INR within last week > 3.0
(assert
(! (not (and patient_is_undergoing_anticoagulant_therapy_now
             (> patient_international_normalized_ratio_value_recorded_inthepast1weeks_withunit_none 3.0)))
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "(the patient is on active anticoagulant therapy AND the most recent prothrombin time/international normalized ratio within the last week > 3.0)"

;; Exclusion: patient has other significant bleeding risk
(assert
(! (not patient_has_other_significant_bleeding_risk_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient has other significant bleeding risk"

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_immunosuppression_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immunosuppression.","when_to_set_to_false":"Set to false if the patient currently does not have immunosuppression.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression."} ;; "immune suppression just prior to or during the study"
(declare-const patient_has_finding_of_immunosuppression_now@@not_only_on_nasal_steroid_spray_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has immunosuppression and is not only on nasal steroid spray therapy.","when_to_set_to_false":"Set to false if the patient currently has immunosuppression but is only on nasal steroid spray therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is only on nasal steroid spray therapy in the context of immunosuppression.","meaning":"Boolean indicating whether the patient currently has immunosuppression and is not only on nasal steroid spray therapy."} ;; "AND NOT (the patient is only on nasal steroid spray therapy)"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast7days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken corticosteroid and corticosteroid derivative containing product within the past 7 days.","when_to_set_to_false":"Set to false if the patient has not taken corticosteroid and corticosteroid derivative containing product within the past 7 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken corticosteroid and corticosteroid derivative containing product within the past 7 days.","meaning":"Boolean indicating whether the patient has taken corticosteroid and corticosteroid derivative containing product within the past 7 days."} ;; "systemic corticosteroid therapy within 7 days prior to the study"
(declare-const patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast7days@@systemic_therapy Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken corticosteroid and corticosteroid derivative containing product within the past 7 days as systemic therapy.","when_to_set_to_false":"Set to false if the patient has taken corticosteroid and corticosteroid derivative containing product within the past 7 days but not as systemic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the therapy was systemic.","meaning":"Boolean indicating whether the patient has taken corticosteroid and corticosteroid derivative containing product within the past 7 days as systemic therapy."} ;; "systemic corticosteroid therapy within 7 days prior to the study"
(declare-const patient_has_undergone_chemotherapy_inthepast4weeks Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy within the past 4 weeks.","when_to_set_to_false":"Set to false if the patient has not undergone chemotherapy within the past 4 weeks.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone chemotherapy within the past 4 weeks.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past 4 weeks."} ;; "chemotherapy for cancer treatment within 4 weeks prior to the study" OR "chemotherapy for rheumatoid arthritis treatment within 4 weeks prior to the study"
(declare-const patient_has_undergone_chemotherapy_inthepast4weeks@@for_cancer_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy within the past 4 weeks for cancer treatment.","when_to_set_to_false":"Set to false if the patient has undergone chemotherapy within the past 4 weeks but not for cancer treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was for cancer treatment.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past 4 weeks for cancer treatment."} ;; "chemotherapy for cancer treatment within 4 weeks prior to the study"
(declare-const patient_has_undergone_chemotherapy_inthepast4weeks@@for_rheumatoid_arthritis_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone chemotherapy within the past 4 weeks for rheumatoid arthritis treatment.","when_to_set_to_false":"Set to false if the patient has undergone chemotherapy within the past 4 weeks but not for rheumatoid arthritis treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the chemotherapy was for rheumatoid arthritis treatment.","meaning":"Boolean indicating whether the patient has undergone chemotherapy within the past 4 weeks for rheumatoid arthritis treatment."} ;; "chemotherapy for rheumatoid arthritis treatment within 4 weeks prior to the study"
(declare-const patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has a diagnosis of human immunodeficiency virus infection."} ;; "diagnosis of human immunodeficiency virus infection"
(declare-const patient_has_diagnosis_of_aids_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acquired immunodeficiency syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acquired immunodeficiency syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acquired immunodeficiency syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acquired immunodeficiency syndrome."} ;; "diagnosis of acquired immunodeficiency syndrome"
(declare-const patient_has_diagnosis_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant neoplastic disease."} ;; "cancer"
(declare-const patient_has_diagnosis_of_rheumatoid_arthritis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of rheumatoid arthritis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of rheumatoid arthritis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of rheumatoid arthritis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of rheumatoid arthritis."} ;; "rheumatoid arthritis"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_immunosuppression_now@@not_only_on_nasal_steroid_spray_therapy
      patient_has_finding_of_immunosuppression_now)
    :named REQ2_AUXILIARY0)) ;; "AND NOT (the patient is only on nasal steroid spray therapy)"

(assert
(! (=> patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast7days@@systemic_therapy
      patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast7days)
    :named REQ2_AUXILIARY1)) ;; "systemic corticosteroid therapy within 7 days prior to the study"

(assert
(! (=> patient_has_undergone_chemotherapy_inthepast4weeks@@for_cancer_treatment
      patient_has_undergone_chemotherapy_inthepast4weeks)
    :named REQ2_AUXILIARY2)) ;; "chemotherapy for cancer treatment within 4 weeks prior to the study"

(assert
(! (=> patient_has_undergone_chemotherapy_inthepast4weeks@@for_rheumatoid_arthritis_treatment
      patient_has_undergone_chemotherapy_inthepast4weeks)
    :named REQ2_AUXILIARY3)) ;; "chemotherapy for rheumatoid arthritis treatment within 4 weeks prior to the study"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: systemic corticosteroid therapy within 7 days prior to the study AND NOT only on nasal steroid spray therapy
(assert
(! (not (and patient_has_taken_corticosteroid_and_corticosteroid_derivative_containing_product_inthepast7days@@systemic_therapy
             patient_has_finding_of_immunosuppression_now@@not_only_on_nasal_steroid_spray_therapy))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on systemic corticosteroid therapy within 7 days prior to the study AND NOT (the patient is only on nasal steroid spray therapy)."

;; Exclusion: chemotherapy for cancer treatment within 4 weeks prior to the study AND NOT only on nasal steroid spray therapy
(assert
(! (not (and patient_has_undergone_chemotherapy_inthepast4weeks@@for_cancer_treatment
             patient_has_finding_of_immunosuppression_now@@not_only_on_nasal_steroid_spray_therapy))
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on chemotherapy for cancer treatment within 4 weeks prior to the study AND NOT (the patient is only on nasal steroid spray therapy)."

;; Exclusion: chemotherapy for rheumatoid arthritis treatment within 4 weeks prior to the study AND NOT only on nasal steroid spray therapy
(assert
(! (not (and patient_has_undergone_chemotherapy_inthepast4weeks@@for_rheumatoid_arthritis_treatment
             patient_has_finding_of_immunosuppression_now@@not_only_on_nasal_steroid_spray_therapy))
    :named REQ2_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is on chemotherapy for rheumatoid arthritis treatment within 4 weeks prior to the study AND NOT (the patient is only on nasal steroid spray therapy)."

;; Exclusion: diagnosis of HIV infection or AIDS AND NOT only on nasal steroid spray therapy
(assert
(! (not (and (or patient_has_diagnosis_of_human_immunodeficiency_virus_infection_now
                 patient_has_diagnosis_of_aids_now)
             patient_has_finding_of_immunosuppression_now@@not_only_on_nasal_steroid_spray_therapy))
    :named REQ2_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has diagnosis of human immunodeficiency virus infection/acquired immunodeficiency syndrome AND NOT (the patient is only on nasal steroid spray therapy)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_is_on_active_systemic_antibiotic_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently receiving active systemic antibiotic therapy.","when_to_set_to_false":"Set to false if the patient is not currently receiving active systemic antibiotic therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently receiving active systemic antibiotic therapy.","meaning":"Boolean indicating whether the patient is currently on active systemic antibiotic therapy."} ;; "The patient is excluded if the patient is on active systemic antibiotic therapy."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_is_on_active_systemic_antibiotic_therapy_now)
:named REQ3_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient is on active systemic antibiotic therapy."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_dorsalis_pulse_absent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has absent dorsalis pedis artery pulses.","when_to_set_to_false":"Set to false if the patient currently does not have absent dorsalis pedis artery pulses.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has absent dorsalis pedis artery pulses.","meaning":"Boolean indicating whether the patient currently has absent dorsalis pedis artery pulses."} ;; "absent dorsalis pedis artery pulses"
(declare-const patient_ankle_brachial_pressure_index_value_recorded_now_withunit_ratio Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's ankle brachial pressure index is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current ankle brachial pressure index (ratio)."} ;; "ankle brachial index < 0.5"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (not (and patient_has_finding_of_dorsalis_pulse_absent_now
               (< patient_ankle_brachial_pressure_index_value_recorded_now_withunit_ratio 0.5)))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has absent dorsalis pedis artery pulses AND the patient has ankle brachial index < 0.5)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_transferred_to_other_non_department_of_veterans_affairs_facilities_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently transferred to other non-Department of Veterans Affairs facilities.","when_to_set_to_false":"Set to false if the patient is not currently transferred to other non-Department of Veterans Affairs facilities.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently transferred to other non-Department of Veterans Affairs facilities.","meaning":"Boolean indicating whether the patient is currently transferred to other non-Department of Veterans Affairs facilities."} ;; "the patient is transferred to other non-Department of Veterans Affairs facilities"

(declare-const patient_can_undergo_sampling_of_tissue_specimen_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to undergo tissue sampling.","when_to_set_to_false":"Set to false if the patient is currently unable to undergo tissue sampling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to undergo tissue sampling.","meaning":"Boolean indicating whether the patient is currently able to undergo tissue sampling."} ;; "tissue sampling"

(declare-const patient_can_undergo_sampling_of_tissue_specimen_now@@even_with_local_anesthesia Bool) ;; {"when_to_set_to_true":"Set to true if the patient's ability to undergo tissue sampling applies even when the procedure is performed with local anesthesia.","when_to_set_to_false":"Set to false if the patient's ability to undergo tissue sampling does not apply when the procedure is performed with local anesthesia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's ability to undergo tissue sampling applies when performed with local anesthesia.","meaning":"Boolean indicating whether the patient's ability to undergo tissue sampling applies even with local anesthesia."} ;; "unable to tolerate tissue sampling even with local anesthesia"

(declare-const patient_is_unable_to_comply_with_scheduled_research_visits_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently unable to comply with scheduled research visits.","when_to_set_to_false":"Set to false if the patient is currently able to comply with scheduled research visits.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently unable to comply with scheduled research visits.","meaning":"Boolean indicating whether the patient is currently unable to comply with scheduled research visits."} ;; "unable to comply with scheduled research visits"

(declare-const patient_has_finding_of_finding_of_wound_healing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has wound healing.","when_to_set_to_false":"Set to false if the patient currently does not have wound healing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has wound healing.","meaning":"Boolean indicating whether the patient currently has wound healing."} ;; "wound healing"

(declare-const patient_has_finding_of_finding_of_wound_healing_now@@significant_so_that_sampling_is_not_possible Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current wound healing is significant enough that tissue sampling is not possible.","when_to_set_to_false":"Set to false if the patient's current wound healing is not significant enough to preclude tissue sampling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's wound healing is significant enough to preclude tissue sampling.","meaning":"Boolean indicating whether the patient's wound healing is significant enough to preclude tissue sampling."} ;; "significant wound healing so that sampling is not possible"

(declare-const patient_has_finding_of_finding_of_wound_healing_now@@occurs_after_initial_sampling Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current wound healing occurs after the initial tissue sampling.","when_to_set_to_false":"Set to false if the patient's current wound healing does not occur after the initial tissue sampling.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's wound healing occurs after the initial tissue sampling.","meaning":"Boolean indicating whether the patient's wound healing occurs after the initial tissue sampling."} ;; "sampling is not possible after the initial sampling"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable for tissue sampling implies stem variable
(assert
(! (=> patient_can_undergo_sampling_of_tissue_specimen_now@@even_with_local_anesthesia
      patient_can_undergo_sampling_of_tissue_specimen_now)
:named REQ5_AUXILIARY0)) ;; "even with local anesthesia"

;; Qualifier variable for significant wound healing implies stem variable
(assert
(! (=> patient_has_finding_of_finding_of_wound_healing_now@@significant_so_that_sampling_is_not_possible
      patient_has_finding_of_finding_of_wound_healing_now)
:named REQ5_AUXILIARY1)) ;; "significant wound healing so that sampling is not possible"

;; Qualifier variable for wound healing after initial sampling implies stem variable
(assert
(! (=> patient_has_finding_of_finding_of_wound_healing_now@@occurs_after_initial_sampling
      patient_has_finding_of_finding_of_wound_healing_now)
:named REQ5_AUXILIARY2)) ;; "occurs after initial sampling"

;; Both wound healing qualifiers must be true for exclusion (significant AND after initial sampling)
(assert
(! (= patient_has_finding_of_finding_of_wound_healing_now@@significant_so_that_sampling_is_not_possible
      (and patient_has_finding_of_finding_of_wound_healing_now@@significant_so_that_sampling_is_not_possible
           patient_has_finding_of_finding_of_wound_healing_now@@occurs_after_initial_sampling))
:named REQ5_AUXILIARY3)) ;; "significant wound healing so that sampling is not possible after the initial sampling"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not (not patient_is_transferred_to_other_non_department_of_veterans_affairs_facilities_now))
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "the patient is transferred to other non-Department of Veterans Affairs facilities"

(assert
(! (not (not patient_can_undergo_sampling_of_tissue_specimen_now@@even_with_local_anesthesia))
:named REQ5_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient is unable to tolerate tissue sampling even with local anesthesia"

(assert
(! (not (not patient_is_unable_to_comply_with_scheduled_research_visits_now))
:named REQ5_COMPONENT2_OTHER_REQUIREMENTS)) ;; "the patient is unable to comply with scheduled research visits"

(assert
(! (not (not patient_has_finding_of_finding_of_wound_healing_now@@significant_so_that_sampling_is_not_possible))
:named REQ5_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient has significant wound healing so that sampling is not possible after the initial sampling"
