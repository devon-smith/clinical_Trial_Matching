;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; "malignant neoplasm" {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@extracranial Bool) ;; "extracranial" {"when_to_set_to_true":"Set to true if the malignant neoplastic disease is extracranial.","when_to_set_to_false":"Set to false if the malignant neoplastic disease is not extracranial.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease is extracranial.","meaning":"Boolean indicating whether the malignant neoplastic disease is extracranial."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@primary Bool) ;; "primary" {"when_to_set_to_true":"Set to true if the malignant neoplastic disease is primary.","when_to_set_to_false":"Set to false if the malignant neoplastic disease is not primary.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease is primary.","meaning":"Boolean indicating whether the malignant neoplastic disease is primary."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@histopathologically_confirmed Bool) ;; "histopathologically confirmed" {"when_to_set_to_true":"Set to true if the malignant neoplastic disease is histopathologically confirmed.","when_to_set_to_false":"Set to false if the malignant neoplastic disease is not histopathologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malignant neoplastic disease is histopathologically confirmed.","meaning":"Boolean indicating whether the malignant neoplastic disease is histopathologically confirmed."}
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now@@extracranial@@primary@@histopathologically_confirmed Bool) ;; "Boolean clinical finding indicating whether the patient currently has a malignant neoplastic disease, and the neoplasm is extracranial, primary, and histopathologically confirmed." {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease that is extracranial, primary, and histopathologically confirmed.","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease that is extracranial, primary, and histopathologically confirmed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease that is extracranial, primary, and histopathologically confirmed.","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease that is extracranial, primary, and histopathologically confirmed."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variable
(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@extracranial
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY0)) ;; "extracranial primary malignant neoplasm"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@primary
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY1)) ;; "extracranial primary malignant neoplasm"

(assert
  (! (=> patient_has_finding_of_malignant_neoplastic_disease_now@@histopathologically_confirmed
         patient_has_finding_of_malignant_neoplastic_disease_now)
     :named REQ0_AUXILIARY2)) ;; "histopathologically confirmed extracranial primary malignant neoplasm"

;; The fully qualified variable is true iff all three qualifiers are true
(assert
  (! (= patient_has_finding_of_malignant_neoplastic_disease_now@@extracranial@@primary@@histopathologically_confirmed
        (and patient_has_finding_of_malignant_neoplastic_disease_now@@extracranial
             patient_has_finding_of_malignant_neoplastic_disease_now@@primary
             patient_has_finding_of_malignant_neoplastic_disease_now@@histopathologically_confirmed))
     :named REQ0_AUXILIARY3)) ;; "histopathologically confirmed extracranial primary malignant neoplasm"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_finding_of_malignant_neoplastic_disease_now@@extracranial@@primary@@histopathologically_confirmed
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a histopathologically confirmed extracranial primary malignant neoplasm."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now Bool) ;; "brain metastases" {"when_to_set_to_true":"Set to true if the patient currently has brain metastases (secondary malignant neoplasm of brain).","when_to_set_to_false":"Set to false if the patient currently does not have brain metastases (secondary malignant neoplasm of brain).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has brain metastases (secondary malignant neoplasm of brain).","meaning":"Boolean indicating whether the patient currently has brain metastases (secondary malignant neoplasm of brain) now."}
(declare-const patient_secondary_malignant_neoplasm_of_brain_value_recorded_now_withunit_count Int) ;; "brain metastases" {"when_to_set_to_value":"Set to the number of brain metastases (secondary malignant neoplasm of brain) currently present in the patient, if known.","when_to_set_to_null":"Set to null if the number of brain metastases is unknown, not documented, or cannot be determined.","meaning":"Numeric count of brain metastases (secondary malignant neoplasm of brain) currently present in the patient."}
(declare-const patient_secondary_malignant_neoplasm_of_brain_value_recorded_now_withunit_cm Real) ;; "brain metastasis" {"when_to_set_to_value":"Set to the diameter in centimeters of a brain metastasis (secondary malignant neoplasm of brain) currently present in the patient, if known. If multiple metastases are present, set to the maximum diameter observed.","when_to_set_to_null":"Set to null if the diameter of any brain metastasis is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the diameter (in centimeters) of a brain metastasis (secondary malignant neoplasm of brain) currently present in the patient."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; If the patient has any brain metastases, the count must be at least 1
(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now
         (>= patient_secondary_malignant_neoplasm_of_brain_value_recorded_now_withunit_count 1))
     :named REQ1_AUXILIARY0)) ;; "To be included, the patient must have ... brain metastases ..."

;; ===================== Constraint Assertions (REQ 1) =====================
;; Component 0: To be included, the patient must have ((multiple brain metastases (defined as number of brain metastases > 3)) OR ((number of brain metastases < 3) AND (at least one brain metastasis with diameter > 4.0 cm))).
(assert
  (! (and patient_has_finding_of_secondary_malignant_neoplasm_of_brain_now
          (or
            (> patient_secondary_malignant_neoplasm_of_brain_value_recorded_now_withunit_count 3) ;; "multiple brain metastases (defined as number of brain metastases > 3)"
            (and
              (< patient_secondary_malignant_neoplasm_of_brain_value_recorded_now_withunit_count 3) ;; "number of brain metastases < 3"
              (> patient_secondary_malignant_neoplasm_of_brain_value_recorded_now_withunit_cm 4.0) ;; "at least one brain metastasis with diameter > 4.0 cm"
            )
          )
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have ((multiple brain metastases (defined as number of brain metastases > 3)) OR ((number of brain metastases < 3) AND (at least one brain metastasis with diameter > 4.0 cm)))."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_can_undergo_stereotactic_radiosurgery_now Bool) ;; "radiosurgery" {"when_to_set_to_true":"Set to true if the patient is currently eligible to undergo stereotactic radiosurgery.","when_to_set_to_false":"Set to false if the patient is currently not eligible to undergo stereotactic radiosurgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently eligible to undergo stereotactic radiosurgery.","meaning":"Boolean indicating whether the patient is currently eligible to undergo stereotactic radiosurgery."}

;; ===================== Constraint Assertions (REQ 2) =====================
;; Component 0: To be included, the patient must NOT be eligible for radiosurgery.
(assert
  (! (not patient_can_undergo_stereotactic_radiosurgery_now)
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT be eligible for radiosurgery."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_requirement_for_immediate_whole_brain_radiotherapy_now Bool) ;; "requirement for immediate whole-brain radiotherapy" {"when_to_set_to_true":"Set to true if the patient currently has a requirement for immediate whole-brain radiotherapy.","when_to_set_to_false":"Set to false if the patient currently does not have a requirement for immediate whole-brain radiotherapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a requirement for immediate whole-brain radiotherapy.","meaning":"Boolean indicating whether the patient currently has a requirement for immediate whole-brain radiotherapy."}

;; ===================== Constraint Assertions (REQ 3) =====================
;; The patient must NOT have a requirement for immediate whole-brain radiotherapy.
(assert
  (! (not patient_has_requirement_for_immediate_whole_brain_radiotherapy_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS))

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now Bool) ;; "metastases" {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplastic disease (metastases).","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplastic disease (metastases).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplastic disease (metastases).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplastic disease (metastases)."}

(declare-const patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@anatomical_site_midbrain Bool) ;; "metastases to the midbrain" {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplastic disease (metastases) and the metastases are located in the midbrain.","when_to_set_to_false":"Set to false if the patient currently has secondary malignant neoplastic disease (metastases) but the metastases are not located in the midbrain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the metastases are located in the midbrain.","meaning":"Boolean indicating whether the patient's metastases are located in the midbrain."}

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_brain_stem_now Bool) ;; "metastases to the brainstem" {"when_to_set_to_true":"Set to true if the patient currently has secondary malignant neoplasm of the brain stem (metastases to the brainstem).","when_to_set_to_false":"Set to false if the patient currently does not have secondary malignant neoplasm of the brain stem (metastases to the brainstem).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has secondary malignant neoplasm of the brain stem (metastases to the brainstem).","meaning":"Boolean indicating whether the patient currently has secondary malignant neoplasm of the brain stem (metastases to the brainstem)."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable for midbrain metastases implies stem variable for metastases
(assert
  (! (=> patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@anatomical_site_midbrain
         patient_has_finding_of_secondary_malignant_neoplastic_disease_now)
     :named REQ4_AUXILIARY0)) ;; "metastases to the midbrain" qualifier implies general metastases

;; ===================== Constraint Assertions (REQ 4) =====================
;; The patient must NOT have (metastases to the midbrain OR metastases to the brainstem)
(assert
  (! (not (or patient_has_finding_of_secondary_malignant_neoplastic_disease_now@@anatomical_site_midbrain
              patient_has_finding_of_secondary_malignant_neoplasm_of_brain_stem_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must NOT have (metastases to the midbrain OR metastases to the brainstem)."
