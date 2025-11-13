;; ===================== Declarations for the inclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now Bool) ;; "esophageal squamous cell carcinoma" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of squamous cell carcinoma of the esophagus.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of squamous cell carcinoma of the esophagus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of squamous cell carcinoma of the esophagus.","meaning":"Boolean indicating whether the patient currently has a diagnosis of squamous cell carcinoma of the esophagus."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@anatomic_site_thoracic_esophagus Bool) ;; "thoracic esophageal squamous cell carcinoma" {"when_to_set_to_true":"Set to true if the diagnosis of squamous cell carcinoma of the esophagus is located in the thoracic esophagus.","when_to_set_to_false":"Set to false if the diagnosis is not located in the thoracic esophagus.","when_to_set_to_null":"Set to null if the anatomic site is unknown or cannot be determined.","meaning":"Boolean indicating whether the diagnosis is specifically for thoracic esophagus."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_t2 Bool) ;; "stage T2" {"when_to_set_to_true":"Set to true if the diagnosis is at stage T2.","when_to_set_to_false":"Set to false if the diagnosis is not at stage T2.","when_to_set_to_null":"Set to null if the stage is unknown or cannot be determined.","meaning":"Boolean indicating whether the diagnosis is at stage T2."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_t3 Bool) ;; "stage T3" {"when_to_set_to_true":"Set to true if the diagnosis is at stage T3.","when_to_set_to_false":"Set to false if the diagnosis is not at stage T3.","when_to_set_to_null":"Set to null if the stage is unknown or cannot be determined.","meaning":"Boolean indicating whether the diagnosis is at stage T3."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_n0 Bool) ;; "stage N0" {"when_to_set_to_true":"Set to true if the diagnosis is at stage N0.","when_to_set_to_false":"Set to false if the diagnosis is not at stage N0.","when_to_set_to_null":"Set to null if the stage is unknown or cannot be determined.","meaning":"Boolean indicating whether the diagnosis is at stage N0."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_m0 Bool) ;; "stage M0" {"when_to_set_to_true":"Set to true if the diagnosis is at stage M0.","when_to_set_to_false":"Set to false if the diagnosis is not at stage M0.","when_to_set_to_null":"Set to null if the stage is unknown or cannot be determined.","meaning":"Boolean indicating whether the diagnosis is at stage M0."}
(declare-const patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@confirmed_by_pathology_studies Bool) ;; "confirmed by pathology studies" {"when_to_set_to_true":"Set to true if the diagnosis is confirmed by pathology studies.","when_to_set_to_false":"Set to false if the diagnosis is not confirmed by pathology studies.","when_to_set_to_null":"Set to null if confirmation by pathology studies is unknown or cannot be determined.","meaning":"Boolean indicating whether the diagnosis is confirmed by pathology studies."}
(declare-const patient_has_received_r0_operation_in_the_history Bool) ;; "have received R0 operation in Cancer Institute and Hospital, Chinese Academy of Medical Sciences" {"when_to_set_to_true":"Set to true if the patient has received an R0 operation in the history.","when_to_set_to_false":"Set to false if the patient has not received an R0 operation in the history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received an R0 operation in the history.","meaning":"Boolean indicating whether the patient has received an R0 operation in the history."}
(declare-const patient_has_received_r0_operation_in_the_history@@performed_in_cancer_institute_and_hospital_chinese_academy_of_medical_sciences Bool) ;; "have received R0 operation in Cancer Institute and Hospital, Chinese Academy of Medical Sciences" {"when_to_set_to_true":"Set to true if the patient's R0 operation in the history was performed in Cancer Institute and Hospital, Chinese Academy of Medical Sciences.","when_to_set_to_false":"Set to false if the patient's R0 operation in the history was not performed in Cancer Institute and Hospital, Chinese Academy of Medical Sciences.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's R0 operation in the history was performed in Cancer Institute and Hospital, Chinese Academy of Medical Sciences.","meaning":"Boolean indicating whether the patient's R0 operation in the history was performed in Cancer Institute and Hospital, Chinese Academy of Medical Sciences."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply their stem variable
(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@anatomic_site_thoracic_esophagus
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY0)) ;; "thoracic esophageal squamous cell carcinoma"

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_t2
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY1)) ;; "stage T2"

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_t3
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY2)) ;; "stage T3"

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_n0
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY3)) ;; "stage N0"

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_m0
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY4)) ;; "stage M0"

(assert
  (! (=> patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@confirmed_by_pathology_studies
         patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now)
     :named REQ0_AUXILIARY5)) ;; "confirmed by pathology studies"

(assert
  (! (=> patient_has_received_r0_operation_in_the_history@@performed_in_cancer_institute_and_hospital_chinese_academy_of_medical_sciences
         patient_has_received_r0_operation_in_the_history)
     :named REQ0_AUXILIARY6)) ;; "have received R0 operation in Cancer Institute and Hospital, Chinese Academy of Medical Sciences"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: ((T2 OR T3) stage, thoracic, confirmed by pathology)
(assert
  (! (or
        (and patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@anatomic_site_thoracic_esophagus
             patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_t2
             patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@confirmed_by_pathology_studies)
        (and patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@anatomic_site_thoracic_esophagus
             patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_t3
             patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@confirmed_by_pathology_studies))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "((have thoracic esophageal squamous cell carcinoma stage T2 confirmed by pathology studies) OR (have thoracic esophageal squamous cell carcinoma stage T3 confirmed by pathology studies))"

;; Component 1: N0 stage, thoracic, confirmed by pathology
(assert
  (! (and patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@anatomic_site_thoracic_esophagus
          patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_n0
          patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@confirmed_by_pathology_studies)
     :named REQ0_COMPONENT1_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have thoracic esophageal squamous cell carcinoma stage N0 confirmed by pathology studies"

;; Component 2: M0 stage, thoracic, confirmed by pathology
(assert
  (! (and patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@anatomic_site_thoracic_esophagus
          patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@stage_m0
          patient_has_diagnosis_of_squamous_cell_carcinoma_of_esophagus_now@@confirmed_by_pathology_studies)
     :named REQ0_COMPONENT2_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have thoracic esophageal squamous cell carcinoma stage M0 confirmed by pathology studies"

;; Component 3: R0 operation performed in Cancer Institute and Hospital, Chinese Academy of Medical Sciences
(assert
  (! patient_has_received_r0_operation_in_the_history@@performed_in_cancer_institute_and_hospital_chinese_academy_of_medical_sciences
     :named REQ0_COMPONENT3_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "have received R0 operation in Cancer Institute and Hospital, Chinese Academy of Medical Sciences"

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_kps_karnofsky_performance_status_score_value_recorded_inthehistory_withunit_score Real) ;; "Karnofsky Performance Status score" {"when_to_set_to_value":"Set to the measured Karnofsky Performance Status score if a numeric measurement recorded in the patient's history prior to radiotherapy is available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's Karnofsky Performance Status score recorded in the patient's history."}
(declare-const patient_kps_karnofsky_performance_status_score_value_recorded_inthehistory_withunit_score@@temporalcontext_before_radiotherapy Bool) ;; "before radiotherapy" {"when_to_set_to_true":"Set to true if the Karnofsky Performance Status score measurement was taken before radiotherapy.","when_to_set_to_false":"Set to false if the measurement was not taken before radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the measurement was taken before radiotherapy.","meaning":"Boolean indicating whether the Karnofsky Performance Status score measurement was taken before radiotherapy."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: Karnofsky Performance Status score ≥ 70 before radiotherapy
(assert
  (! (and patient_kps_karnofsky_performance_status_score_value_recorded_inthehistory_withunit_score@@temporalcontext_before_radiotherapy
          (>= patient_kps_karnofsky_performance_status_score_value_recorded_inthehistory_withunit_score 70))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have Karnofsky Performance Status score ≥ 70 before radiotherapy."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_received_neoadjuvant_treatment_ever Bool) ;; "To be included, the patient must NOT have received neoadjuvant treatment" {"when_to_set_to_true":"Set to true if the patient has ever received neoadjuvant treatment at any time in their history.","when_to_set_to_false":"Set to false if the patient has never received neoadjuvant treatment at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received neoadjuvant treatment.","meaning":"Boolean indicating whether the patient has ever received neoadjuvant treatment."}
(declare-const patient_has_received_adjuvant_treatment_ever Bool) ;; "To be included, the patient must NOT have received adjuvant treatment" {"when_to_set_to_true":"Set to true if the patient has ever received adjuvant treatment at any time in their history.","when_to_set_to_false":"Set to false if the patient has never received adjuvant treatment at any time in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever received adjuvant treatment.","meaning":"Boolean indicating whether the patient has ever received adjuvant treatment."}

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must NOT have received neoadjuvant treatment AND NOT have received adjuvant treatment.
(assert
  (! (and (not patient_has_received_neoadjuvant_treatment_ever)
          (not patient_has_received_adjuvant_treatment_ever))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have received neoadjuvant treatment AND NOT have received adjuvant treatment."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_finding_of_finding_of_lesion_inthehistory Bool) ;; "lesion" {"when_to_set_to_true":"Set to true if the patient has ever had a lesion documented in their history (prior to now).","when_to_set_to_false":"Set to false if the patient has never had a lesion documented in their history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a lesion in their history.","meaning":"Boolean indicating whether the patient has ever had a lesion in their history."}
(declare-const patient_has_finding_of_finding_of_lesion_inthehistory@@is_clear Bool) ;; "clear lesion" {"when_to_set_to_true":"Set to true if the lesion in history is clear.","when_to_set_to_false":"Set to false if the lesion in history is not clear.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion in history is clear.","meaning":"Boolean indicating whether the lesion in history is clear."}
(declare-const patient_has_finding_of_finding_of_lesion_inthehistory@@is_recurrent Bool) ;; "recurrent lesion" {"when_to_set_to_true":"Set to true if the lesion in history is recurrent.","when_to_set_to_false":"Set to false if the lesion in history is not recurrent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion in history is recurrent.","meaning":"Boolean indicating whether the lesion in history is recurrent."}
(declare-const patient_has_finding_of_finding_of_lesion_inthehistory@@present_before_radiotherapy Bool) ;; "before radiotherapy" {"when_to_set_to_true":"Set to true if the lesion in history was present before radiotherapy.","when_to_set_to_false":"Set to false if the lesion in history was not present before radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion in history was present before radiotherapy.","meaning":"Boolean indicating whether the lesion in history was present before radiotherapy."}
(declare-const patient_has_finding_of_finding_of_lesion_inthehistory@@is_metastatic Bool) ;; "metastatic lesion" {"when_to_set_to_true":"Set to true if the lesion in history is metastatic.","when_to_set_to_false":"Set to false if the lesion in history is not metastatic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion in history is metastatic.","meaning":"Boolean indicating whether the lesion in history is metastatic."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_finding_of_lesion_inthehistory@@is_clear
         patient_has_finding_of_finding_of_lesion_inthehistory)
     :named REQ3_AUXILIARY0)) ;; "clear lesion"

(assert
  (! (=> patient_has_finding_of_finding_of_lesion_inthehistory@@is_recurrent
         patient_has_finding_of_finding_of_lesion_inthehistory)
     :named REQ3_AUXILIARY1)) ;; "recurrent lesion"

(assert
  (! (=> patient_has_finding_of_finding_of_lesion_inthehistory@@present_before_radiotherapy
         patient_has_finding_of_finding_of_lesion_inthehistory)
     :named REQ3_AUXILIARY2)) ;; "before radiotherapy"

(assert
  (! (=> patient_has_finding_of_finding_of_lesion_inthehistory@@is_metastatic
         patient_has_finding_of_finding_of_lesion_inthehistory)
     :named REQ3_AUXILIARY3)) ;; "metastatic lesion"

;; ===================== Constraint Assertions (REQ 3) =====================
;; To be included, the patient must NOT have clear recurrent lesion before radiotherapy AND NOT have clear metastatic lesion before radiotherapy.
(assert
  (! (and
        (not (and patient_has_finding_of_finding_of_lesion_inthehistory@@is_clear
                  patient_has_finding_of_finding_of_lesion_inthehistory@@is_recurrent
                  patient_has_finding_of_finding_of_lesion_inthehistory@@present_before_radiotherapy))
        (not (and patient_has_finding_of_finding_of_lesion_inthehistory@@is_clear
                  patient_has_finding_of_finding_of_lesion_inthehistory@@is_metastatic
                  patient_has_finding_of_finding_of_lesion_inthehistory@@present_before_radiotherapy))
     )
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have clear recurrent lesion before radiotherapy AND NOT have clear metastatic lesion before radiotherapy."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_can_undergo_intensity_modulated_radiation_therapy_now Bool) ;; "To be included, the patient must accept intensity modulated radiation therapy." {"when_to_set_to_true":"Set to true if the patient is currently able and willing to undergo intensity modulated radiation therapy (i.e., accepts the procedure).","when_to_set_to_false":"Set to false if the patient is currently not able or not willing to undergo intensity modulated radiation therapy (i.e., does not accept the procedure).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is able and willing to undergo intensity modulated radiation therapy.","meaning":"Boolean indicating whether the patient is currently able and willing to undergo intensity modulated radiation therapy."}

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! patient_can_undergo_intensity_modulated_radiation_therapy_now
     :named REQ4_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must accept intensity modulated radiation therapy."

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_has_finding_of_follow_up_status_now Bool) ;; "follow-up" {"when_to_set_to_true":"Set to true if the patient currently has follow-up status.","when_to_set_to_false":"Set to false if the patient currently does not have follow-up status.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has follow-up status.","meaning":"Boolean indicating whether the patient currently has follow-up status now."}
(declare-const patient_has_finding_of_follow_up_status_now@@regular Bool) ;; "regular follow-up" {"when_to_set_to_true":"Set to true if the patient's current follow-up status is regular.","when_to_set_to_false":"Set to false if the patient's current follow-up status is not regular.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current follow-up status is regular.","meaning":"Boolean indicating whether the patient's current follow-up status is regular."}

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
  (! (=> patient_has_finding_of_follow_up_status_now@@regular
         patient_has_finding_of_follow_up_status_now)
     :named REQ5_AUXILIARY0)) ;; "To be included, the patient must have regular follow-up."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_has_finding_of_follow_up_status_now@@regular
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "To be included, the patient must have regular follow-up."
