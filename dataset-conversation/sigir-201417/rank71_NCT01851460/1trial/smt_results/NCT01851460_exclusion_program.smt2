;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_positive_result_for_toxin_producing_bacteria_obtained_from_liver_biopsy_in_pertinent_abscess Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive result for toxin-producing bacteria, and the sample was obtained from liver biopsy in the pertinent abscess.","when_to_set_to_false":"Set to false if the patient does not have a positive result for toxin-producing bacteria from a sample obtained from liver biopsy in the pertinent abscess.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a positive result for toxin-producing bacteria from a sample obtained from liver biopsy in the pertinent abscess.","meaning":"Boolean indicating whether the patient has a positive result for toxin-producing bacteria, where the sample was obtained from liver biopsy in the pertinent abscess."} ;; "positive results for toxin-producing bacteria obtained from liver biopsy in the pertinent abscess"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_positive_result_for_toxin_producing_bacteria_obtained_from_liver_biopsy_in_pertinent_abscess)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has positive results for toxin-producing bacteria obtained from liver biopsy in the pertinent abscess."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_can_undergo_excision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a good candidate for and can undergo excision (resection) now.","when_to_set_to_false":"Set to false if the patient is currently not a good candidate for or cannot undergo excision (resection) now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a good candidate for or can undergo excision (resection) now.","meaning":"Boolean indicating whether the patient is currently a good candidate for and can undergo excision (resection) now."} ;; "resection"
(declare-const patient_is_good_candidate_for_liver_curative_open_surgical_resection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a good candidate for liver-curative open surgical resection.","when_to_set_to_false":"Set to false if the patient is not currently a good candidate for liver-curative open surgical resection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a good candidate for liver-curative open surgical resection.","meaning":"Boolean indicating whether the patient is currently a good candidate for liver-curative open surgical resection."} ;; "the patient is a good candidate for liver-curative open surgical resection"
(declare-const patient_refuses_open_surgical_resection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently refuses open surgical resection.","when_to_set_to_false":"Set to false if the patient does not currently refuse open surgical resection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently refuses open surgical resection.","meaning":"Boolean indicating whether the patient currently refuses open surgical resection."} ;; "the patient does NOT refuse open surgical resection"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: The patient is excluded if (the patient is a good candidate for liver-curative open surgical resection) AND (the patient does NOT refuse open surgical resection).
(assert
(! (not (and patient_is_good_candidate_for_liver_curative_open_surgical_resection_now
             (not patient_refuses_open_surgical_resection_now)))
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is a good candidate for liver-curative open surgical resection) AND (the patient does NOT refuse open surgical resection)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_is_candidate_for_radiofrequency_ablation_therapy_due_to_lesion_size_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for radiofrequency ablation therapy due to lesion size.","when_to_set_to_false":"Set to false if the patient is currently NOT a candidate for radiofrequency ablation therapy due to lesion size.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a candidate for radiofrequency ablation therapy due to lesion size.","meaning":"Boolean indicating whether the patient is currently a candidate for radiofrequency ablation therapy due to lesion size."} ;; "the patient is NOT a candidate for radiofrequency ablation therapy due to lesion size"
(declare-const patient_is_candidate_for_radiofrequency_ablation_therapy_due_to_lesion_location_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a candidate for radiofrequency ablation therapy due to lesion location.","when_to_set_to_false":"Set to false if the patient is currently NOT a candidate for radiofrequency ablation therapy due to lesion location.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a candidate for radiofrequency ablation therapy due to lesion location.","meaning":"Boolean indicating whether the patient is currently a candidate for radiofrequency ablation therapy due to lesion location."} ;; "the patient is NOT a candidate for radiofrequency ablation therapy due to lesion location"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not (or (not patient_is_candidate_for_radiofrequency_ablation_therapy_due_to_lesion_size_now)
            (not patient_is_candidate_for_radiofrequency_ablation_therapy_due_to_lesion_location_now)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient is NOT a candidate for radiofrequency ablation therapy due to lesion size) OR (the patient is NOT a candidate for radiofrequency ablation therapy due to lesion location)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const hematologist_deems_no_excessive_bleeding_risk_despite_abnormal_coagulation_parameters_now Bool) ;; {"when_to_set_to_true":"Set to true if a hematologist currently deems that the patient will not have excessive bleeding risk despite abnormal coagulation parameters.","when_to_set_to_false":"Set to false if a hematologist currently does not deem that the patient will not have excessive bleeding risk despite abnormal coagulation parameters.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a hematologist currently deems that the patient will not have excessive bleeding risk despite abnormal coagulation parameters.","meaning":"Boolean indicating whether a hematologist currently deems that the patient will not have excessive bleeding risk despite abnormal coagulation parameters."} ;; "another condition which a hematologist deems will not cause excessive bleeding despite the abnormal coagulation parameters"

(declare-const patient_is_exposed_to_lupus_anticoagulant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently known to have or is exposed to a lupus anticoagulant.","when_to_set_to_false":"Set to false if the patient is currently not known to have or is not exposed to a lupus anticoagulant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has or is exposed to a lupus anticoagulant.","meaning":"Boolean indicating whether the patient is currently exposed to or has a known lupus anticoagulant."} ;; "known lupus anticoagulant"

(declare-const patient_partial_thromboplastin_time_activated_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value in seconds if the patient's current activated partial thromboplastin time (aPTT/PTT) is available.","when_to_set_to_null":"Set to null if no current activated partial thromboplastin time (aPTT/PTT) measurement in seconds is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current activated partial thromboplastin time (aPTT/PTT) in seconds."} ;; "partial thromboplastin time (PTT)"

(declare-const patient_partial_thromboplastin_time_normal_value_reference_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the reference normal aPTT/PTT value in seconds if available for the patient at the current time.","when_to_set_to_null":"Set to null if the reference normal aPTT/PTT value in seconds is not available or indeterminate for the patient at the current time.","meaning":"Numeric value representing the reference normal activated partial thromboplastin time (aPTT/PTT) in seconds for the patient at the current time."} ;; "normal partial thromboplastin time (PTT)"

(declare-const patient_prothrombin_time_normal_value_reference_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the reference normal PT value in seconds if available for the patient at the current time.","when_to_set_to_null":"Set to null if the reference normal PT value in seconds is not available or indeterminate for the patient at the current time.","meaning":"Numeric value representing the reference normal prothrombin time (PT) in seconds for the patient at the current time."} ;; "normal prothrombin time (PT)"

(declare-const patient_prothrombin_time_value_recorded_now_withunit_seconds Real) ;; {"when_to_set_to_value":"Set to the measured value in seconds if the patient's current prothrombin time (PT) is available.","when_to_set_to_null":"Set to null if no current prothrombin time (PT) measurement in seconds is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current prothrombin time (PT) in seconds."} ;; "prothrombin time (PT)"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion: patient must NOT have PT > 1.5x normal OR PTT > 1.5x normal, unless exception applies
(assert
(! (not
     (and
       (or
         (> patient_prothrombin_time_value_recorded_now_withunit_seconds
            (* 1.5 patient_prothrombin_time_normal_value_reference_now_withunit_seconds))
         (> patient_partial_thromboplastin_time_activated_value_recorded_now_withunit_seconds
            (* 1.5 patient_partial_thromboplastin_time_normal_value_reference_now_withunit_seconds))
       )
       (not patient_is_exposed_to_lupus_anticoagulant_now)
       (not hematologist_deems_no_excessive_bleeding_risk_despite_abnormal_coagulation_parameters_now)
     )
   )
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a prothrombin time (PT) greater than 1.5 times normal or has a partial thromboplastin time (PTT) greater than 1.5 times normal, except in patients who have a known lupus anticoagulant or have another condition which a hematologist deems will not cause excessive bleeding despite the abnormal coagulation parameters."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_platelet_count_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical finding related to platelet count.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical finding related to platelet count.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical finding related to platelet count.","meaning":"Boolean indicating whether the patient currently has a clinical finding related to platelet count."} ;; "platelet count"
(declare-const patient_has_finding_of_platelet_count_finding_now@@cannot_be_maintained_despite_platelet_transfusions Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a platelet count finding and the platelet count cannot be maintained despite platelet transfusions.","when_to_set_to_false":"Set to false if the patient currently has a platelet count finding and the platelet count can be maintained with platelet transfusions.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the platelet count can be maintained despite platelet transfusions.","meaning":"Boolean indicating whether the patient's platelet count cannot be maintained despite platelet transfusions."} ;; "the platelet count cannot be maintained despite platelet transfusions"
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current platelet count in number per cubic millimeter is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's current platelet count in number per cubic millimeter."} ;; "platelet count less than 50,000 per cubic millimeter"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_platelet_count_finding_now@@cannot_be_maintained_despite_platelet_transfusions
      patient_has_finding_of_platelet_count_finding_now)
   :named REQ4_AUXILIARY0)) ;; "the platelet count cannot be maintained despite platelet transfusions"

;; ===================== Constraint Assertions (REQ 4) =====================
;; Exclusion: patient has platelet count < 50,000 per cubic millimeter AND the platelet count cannot be maintained despite platelet transfusions
(assert
(! (not (and
         (< patient_platelet_count_finding_value_recorded_now_withunit_per_cubic_millimeter 50000)
         patient_has_finding_of_platelet_count_finding_now@@cannot_be_maintained_despite_platelet_transfusions))
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has platelet count less than 50,000 per cubic millimeter) AND (the platelet count cannot be maintained despite platelet transfusions)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant as documented or reported.","when_to_set_to_false":"Set to false if the patient is currently not pregnant as documented or reported.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_pregnant_now)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_disease_condition_finding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding.","when_to_set_to_false":"Set to false if the patient currently does not have any disease, condition, or clinical finding.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any disease, condition, or clinical finding.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding."} ;; "any condition"

(declare-const patient_has_finding_of_disease_condition_finding_now@@places_patient_at_undue_risk_by_participating_in_study_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any disease, condition, or clinical finding, and in the investigator's opinion, this condition places the patient at undue risk by participating in the study.","when_to_set_to_false":"Set to false if the patient currently has any disease, condition, or clinical finding, but in the investigator's opinion, this condition does not place the patient at undue risk by participating in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator considers the condition to place the patient at undue risk by participating in the study.","meaning":"Boolean indicating whether the patient currently has any disease, condition, or clinical finding that, in the investigator's opinion, places the patient at undue risk by participating in the study."} ;; "in the investigator's opinion, places the patient at undue risk by participating in the study"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_condition_finding_now@@places_patient_at_undue_risk_by_participating_in_study_investigator_opinion
      patient_has_finding_of_disease_condition_finding_now)
:named REQ6_AUXILIARY0)) ;; "any condition that, in the investigator's opinion, places the patient at undue risk by participating in the study"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_disease_condition_finding_now@@places_patient_at_undue_risk_by_participating_in_study_investigator_opinion)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any condition that, in the investigator's opinion, places the patient at undue risk by participating in the study."
