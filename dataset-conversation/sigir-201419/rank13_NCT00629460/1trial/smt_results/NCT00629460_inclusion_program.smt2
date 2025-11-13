;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; "malignancy" {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@known_diagnosis Bool) ;; "known solid malignancy" {"when_to_set_to_true":"Set to true if the malignant neoplastic disease diagnosis is known (confirmed, not suspected).","when_to_set_to_false":"Set to false if the malignant neoplastic disease diagnosis is not known (e.g., only suspected or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is known.","meaning":"Boolean indicating whether the malignant neoplastic disease diagnosis is known (confirmed)."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@solid_tumor Bool) ;; "solid malignancy" {"when_to_set_to_true":"Set to true if the malignant neoplastic disease is a solid tumor.","when_to_set_to_false":"Set to false if the malignant neoplastic disease is not a solid tumor (e.g., hematologic malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease is a solid tumor.","meaning":"Boolean indicating whether the malignant neoplastic disease is a solid tumor."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@excludes_brain_tumor Bool) ;; "excluding brain tumor" {"when_to_set_to_true":"Set to true if the malignant neoplastic disease is not a brain tumor.","when_to_set_to_false":"Set to false if the malignant neoplastic disease is a brain tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease is a brain tumor.","meaning":"Boolean indicating whether the malignant neoplastic disease is not a brain tumor."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@clinically_suspected Bool) ;; "clinically suspected solid malignancy" {"when_to_set_to_true":"Set to true if the malignant neoplastic disease diagnosis is clinically suspected (not confirmed).","when_to_set_to_false":"Set to false if the malignant neoplastic disease diagnosis is not clinically suspected (e.g., confirmed or indeterminate).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is clinically suspected.","meaning":"Boolean indicating whether the malignant neoplastic disease diagnosis is clinically suspected (not confirmed)."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply the stem variable
(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@known_diagnosis
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "known solid malignancy"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@solid_tumor
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY1)) ;; "solid malignancy"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@excludes_brain_tumor
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY2)) ;; "excluding brain tumor"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@clinically_suspected
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY3)) ;; "clinically suspected solid malignancy"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must ((have a known solid malignancy (excluding brain tumor)) OR (have a clinically suspected solid malignancy (excluding brain tumor))).
(assert
  (! (or
        (and patient_has_finding_of_malignant_neoplastic_disease_now@@known_diagnosis
             patient_has_finding_of_malignant_neoplastic_disease_now@@solid_tumor
             patient_has_finding_of_malignant_neoplastic_disease_now@@excludes_brain_tumor)
        (and patient_has_finding_of_malignant_neoplastic_disease_now@@clinically_suspected
             patient_has_finding_of_malignant_neoplastic_disease_now@@solid_tumor
             patient_has_finding_of_malignant_neoplastic_disease_now@@excludes_brain_tumor))
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must ((have a known solid malignancy (excluding brain tumor)) OR (have a clinically suspected solid malignancy (excluding brain tumor)))."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_nodule_discovered_at_time_of_diagnosis_of_primary_malignancy Bool) ;; "have a nodule that is discovered at the time of diagnosis of the primary malignancy" {"when_to_set_to_true":"Set to true if the patient has a nodule that is discovered at the time of diagnosis of the primary malignancy.","when_to_set_to_false":"Set to false if the patient does not have a nodule that is discovered at the time of diagnosis of the primary malignancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a nodule that is discovered at the time of diagnosis of the primary malignancy.","meaning":"Boolean indicating whether the patient has a nodule that is discovered at the time of diagnosis of the primary malignancy."}
(declare-const patient_has_nodule_discovered_after_completion_of_therapy Bool) ;; "have a nodule that is discovered after the completion of therapy" {"when_to_set_to_true":"Set to true if the patient has a nodule that is discovered after the completion of therapy.","when_to_set_to_false":"Set to false if the patient does not have a nodule that is discovered after the completion of therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a nodule that is discovered after the completion of therapy.","meaning":"Boolean indicating whether the patient has a nodule that is discovered after the completion of therapy."}

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must ((have a nodule that is discovered at the time of diagnosis of the primary malignancy) OR (have a nodule that is discovered after the completion of therapy)).
(assert
  (! (or patient_has_nodule_discovered_at_time_of_diagnosis_of_primary_malignancy
         patient_has_nodule_discovered_after_completion_of_therapy)
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must ((have a nodule that is discovered at the time of diagnosis of the primary malignancy) OR (have a nodule that is discovered after the completion of therapy))."
