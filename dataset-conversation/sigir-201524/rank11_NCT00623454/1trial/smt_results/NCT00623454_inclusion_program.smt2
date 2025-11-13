;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_finding_of_chest_pain_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient had the clinical finding of chest pain in the past 6 months.","when_to_set_to_false":"Set to false if the patient did not have the clinical finding of chest pain in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had chest pain in the past 6 months.","meaning":"Boolean indicating whether the patient had chest pain in the past 6 months."}  ;; "chest pain"
(declare-const patient_has_finding_of_chest_pain_inthepast6months@@investigated_at_cardiological_out_patient_clinic_molde_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient's chest pain in the past 6 months was investigated at the Cardiological Out-patient Clinic, Molde Hospital.","when_to_set_to_false":"Set to false if the patient's chest pain in the past 6 months was not investigated at the Cardiological Out-patient Clinic, Molde Hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigation occurred at the Cardiological Out-patient Clinic, Molde Hospital.","meaning":"Boolean indicating whether the patient's chest pain in the past 6 months was investigated at the Cardiological Out-patient Clinic, Molde Hospital."}  ;; "chest pain investigated at Cardiological Out-patient Clinic, Molde Hospital"
(declare-const patient_has_finding_of_palpitations_inthepast6months Bool) ;; {"when_to_set_to_true":"Set to true if the patient had the clinical finding of palpitations in the past 6 months.","when_to_set_to_false":"Set to false if the patient did not have the clinical finding of palpitations in the past 6 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had palpitations in the past 6 months.","meaning":"Boolean indicating whether the patient had palpitations in the past 6 months."}  ;; "palpitation"
(declare-const patient_has_finding_of_palpitations_inthepast6months@@investigated_at_cardiological_out_patient_clinic_molde_hospital Bool) ;; {"when_to_set_to_true":"Set to true if the patient's palpitations in the past 6 months were investigated at the Cardiological Out-patient Clinic, Molde Hospital.","when_to_set_to_false":"Set to false if the patient's palpitations in the past 6 months were not investigated at the Cardiological Out-patient Clinic, Molde Hospital.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigation occurred at the Cardiological Out-patient Clinic, Molde Hospital.","meaning":"Boolean indicating whether the patient's palpitations in the past 6 months were investigated at the Cardiological Out-patient Clinic, Molde Hospital."}  ;; "palpitation investigated at Cardiological Out-patient Clinic, Molde Hospital"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable for chest pain investigation implies the patient had chest pain in the past 6 months
(assert
  (! (=> patient_has_finding_of_chest_pain_inthepast6months@@investigated_at_cardiological_out_patient_clinic_molde_hospital
         patient_has_finding_of_chest_pain_inthepast6months)
     :named REQ0_AUXILIARY0)) ;; "chest pain investigated at Cardiological Out-patient Clinic, Molde Hospital" implies "chest pain in past 6 months"

;; Qualifier variable for palpitations investigation implies the patient had palpitations in the past 6 months
(assert
  (! (=> patient_has_finding_of_palpitations_inthepast6months@@investigated_at_cardiological_out_patient_clinic_molde_hospital
         patient_has_finding_of_palpitations_inthepast6months)
     :named REQ0_AUXILIARY1)) ;; "palpitations investigated at Cardiological Out-patient Clinic, Molde Hospital" implies "palpitations in past 6 months"

;; ===================== Constraint Assertions (REQ 0) =====================
;; To be included, the patient must have been investigated for chest pain at the Cardiological Out-patient Clinic, Molde Hospital 6 months ago OR have been investigated for palpitation at the Cardiological Out-patient Clinic, Molde Hospital 6 months ago.
(assert
  (! (or patient_has_finding_of_chest_pain_inthepast6months@@investigated_at_cardiological_out_patient_clinic_molde_hospital
        patient_has_finding_of_palpitations_inthepast6months@@investigated_at_cardiological_out_patient_clinic_molde_hospital)
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "investigated for chest pain OR palpitations at Cardiological Out-patient Clinic, Molde Hospital 6 months ago"

;; ===================== Constraint Assertions (REQ 1) =====================
;; To be included, the patient must suffer from chest pain OR suffer from palpitations.
(assert
  (! (or patient_has_finding_of_chest_pain_inthepast6months
         patient_has_finding_of_palpitations_inthepast6months)
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must suffer from chest pain OR suffer from palpitations."
