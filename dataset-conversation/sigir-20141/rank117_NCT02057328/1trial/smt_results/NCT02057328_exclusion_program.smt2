;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_ambulatory_blood_pressure_recording_inthepast3months_outcome_is_normal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone ambulatory blood pressure monitoring with a normal outcome at any time in the past 3 months.","when_to_set_to_false":"Set to false if the patient has not undergone ambulatory blood pressure monitoring with a normal outcome at any time in the past 3 months.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone ambulatory blood pressure monitoring with a normal outcome in the past 3 months.","meaning":"Boolean indicating whether the patient has undergone ambulatory blood pressure monitoring with a normal outcome in the past 3 months."} ;; "ambulatory blood pressure monitoring values at the end of the 3-month period"
(declare-const patient_has_undergone_ambulatory_blood_pressure_recording_inthepast3months_outcome_is_normal@@performed_at_end_of_3_month_period Bool) ;; {"when_to_set_to_true":"Set to true if the ambulatory blood pressure monitoring with a normal outcome was performed specifically at the end of the 3-month period.","when_to_set_to_false":"Set to false if the ambulatory blood pressure monitoring with a normal outcome was not performed at the end of the 3-month period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ambulatory blood pressure monitoring with a normal outcome was performed at the end of the 3-month period.","meaning":"Boolean indicating whether the ambulatory blood pressure monitoring with a normal outcome was performed at the end of the 3-month period."} ;; "at the end of the 3-month period"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_undergone_ambulatory_blood_pressure_recording_inthepast3months_outcome_is_normal@@performed_at_end_of_3_month_period
      patient_has_undergone_ambulatory_blood_pressure_recording_inthepast3months_outcome_is_normal)
   :named REQ0_AUXILIARY0)) ;; "ambulatory blood pressure monitoring with a normal outcome was performed specifically at the end of the 3-month period"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_undergone_ambulatory_blood_pressure_recording_inthepast3months_outcome_is_normal@@performed_at_end_of_3_month_period)
   :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient presents with normal ambulatory blood pressure monitoring values at the end of the 3-month period."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_ambulatory_diastolic_blood_pressure_value_recorded_24hour_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured 24-hour ambulatory diastolic blood pressure value in mm Hg if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's 24-hour ambulatory diastolic blood pressure recorded, in mm Hg."} ;; "24-hour diastolic blood pressure < 80 mm Hg"
(declare-const patient_ambulatory_systolic_blood_pressure_value_recorded_24hour_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured 24-hour ambulatory systolic blood pressure value in mm Hg if available.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's 24-hour ambulatory systolic blood pressure recorded, in mm Hg."} ;; "24-hour systolic blood pressure < 130 mm Hg"
(declare-const patient_elevated_blood_pressure_value_recorded_now_withunit_mm_hg Real) ;; {"when_to_set_to_value":"Set to the measured office systolic and diastolic blood pressure values in mm Hg if recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's office systolic and diastolic blood pressure recorded now, in mm Hg."} ;; "increased office blood pressure values (systolic blood pressure/diastolic blood pressure ≥ 140/90 mm Hg)"
(declare-const patient_has_diagnosis_of_labile_hypertension_due_to_being_in_a_clinical_environment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently diagnosed with labile hypertension due to being in a clinical environment (white-coat hypertension).","when_to_set_to_false":"Set to false if the patient is currently not diagnosed with labile hypertension due to being in a clinical environment (white-coat hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently diagnosed with labile hypertension due to being in a clinical environment (white-coat hypertension).","meaning":"Boolean indicating whether the patient is currently diagnosed with labile hypertension due to being in a clinical environment (white-coat hypertension)."} ;; "white-coat hypertension"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Definition: white-coat hypertension = increased office BP (systolic ≥ 140 OR diastolic ≥ 90) AND normal ambulatory BP (24h systolic < 130 AND 24h diastolic < 80)
(assert
(! (= patient_has_diagnosis_of_labile_hypertension_due_to_being_in_a_clinical_environment_now
     (and (or (>= (div patient_elevated_blood_pressure_value_recorded_now_withunit_mm_hg 1000) 140)
              (>= (mod patient_elevated_blood_pressure_value_recorded_now_withunit_mm_hg 1000) 90))
          (< patient_ambulatory_systolic_blood_pressure_value_recorded_24hour_withunit_mm_hg 130)
          (< patient_ambulatory_diastolic_blood_pressure_value_recorded_24hour_withunit_mm_hg 80)))
:named REQ1_AUXILIARY0)) ;; "white-coat hypertension, defined as increased office blood pressure values (systolic blood pressure/diastolic blood pressure ≥ 140/90 mm Hg) combined with normal ambulatory blood pressure monitoring values (24-hour systolic blood pressure/diastolic blood pressure < 130/80 mm Hg)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_diagnosis_of_labile_hypertension_due_to_being_in_a_clinical_environment_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is diagnosed with white-coat hypertension, defined as increased office blood pressure values (systolic blood pressure/diastolic blood pressure ≥ 140/90 mm Hg) combined with normal ambulatory blood pressure monitoring values (24-hour systolic blood pressure/diastolic blood pressure < 130/80 mm Hg)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_contraindication_for_submission_of_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication for submission of any drug or medicament.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication for submission of any drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication for submission of any drug or medicament.","meaning":"Boolean indicating whether the patient currently has a contraindication for submission of any drug or medicament."} ;; "contraindications for submission of drugs"
(declare-const patient_has_contraindication_for_submission_of_drug_or_medicament_now@@used_in_research_protocol Bool) ;; {"when_to_set_to_true":"Set to true if the contraindication for submission of drug or medicament applies specifically to drugs or medicaments used in the research protocol.","when_to_set_to_false":"Set to false if the contraindication for submission of drug or medicament does not apply to drugs or medicaments used in the research protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraindication applies to drugs or medicaments used in the research protocol.","meaning":"Boolean indicating whether the contraindication for submission of drug or medicament applies to drugs or medicaments used in the research protocol."} ;; "contraindications for submission of drugs used in the research protocol"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_contraindication_for_submission_of_drug_or_medicament_now@@used_in_research_protocol
      patient_has_contraindication_for_submission_of_drug_or_medicament_now)
   :named REQ2_AUXILIARY0)) ;; "contraindications for submission of drugs used in the research protocol" implies "contraindications for submission of drugs"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_contraindication_for_submission_of_drug_or_medicament_now@@used_in_research_protocol)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has contraindications for submission of drugs used in the research protocol."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_renal_failure_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal failure syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal failure syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal failure syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal failure syndrome."} ;; "renal failure"
(declare-const patient_has_diagnosis_of_hepatic_failure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hepatic failure.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hepatic failure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hepatic failure.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hepatic failure."} ;; "hepatic failure"
(declare-const patient_has_diagnosis_of_renal_artery_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of renal artery stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of renal artery stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of renal artery stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of renal artery stenosis."} ;; "renal artery stenosis"
(declare-const patient_has_diagnosis_of_asthma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of asthma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of asthma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of asthma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of asthma."} ;; "bronchial asthma"
(declare-const patient_has_diagnosis_of_prinzmetal_angina_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Prinzmetal's angina.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Prinzmetal's angina.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Prinzmetal's angina.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Prinzmetal's angina."} ;; "vasoconstrictive angina (Prinzmetal's angina)"
(declare-const patient_has_diagnosis_of_hypertrophic_cardiomyopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hypertrophic cardiomyopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hypertrophic cardiomyopathy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hypertrophic cardiomyopathy."} ;; "hypertrophic cardiomyopathy"
(declare-const patient_has_diagnosis_of_aortic_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of aortic valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of aortic valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of aortic valve stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of aortic valve stenosis."} ;; "aortic valve stenosis"
(declare-const patient_has_diagnosis_of_mitral_valve_stenosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of mitral valve stenosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of mitral valve stenosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of mitral valve stenosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of mitral valve stenosis."} ;; "mitral valve stenosis"
(declare-const patient_has_diagnosis_of_sinus_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sinus tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sinus tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sinus tachycardia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sinus tachycardia."} ;; "sinus tachycardia"
(declare-const patient_has_diagnosis_of_sinus_bradycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sinus bradycardia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sinus bradycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sinus bradycardia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sinus bradycardia."} ;; "sinus bradycardia"
(declare-const patient_has_diagnosis_of_sick_sinus_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of sick sinus syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of sick sinus syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of sick sinus syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of sick sinus syndrome."} ;; "sick sinus syndrome"
(declare-const patient_has_diagnosis_of_wolff_parkinson_white_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Wolff-Parkinson-White syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Wolff-Parkinson-White syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Wolff-Parkinson-White syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of Wolff-Parkinson-White syndrome."} ;; "Wolff-Parkinson-White syndrome"
(declare-const patient_has_diagnosis_of_chronic_atrial_fibrillation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic atrial fibrillation.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic atrial fibrillation.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic atrial fibrillation.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic atrial fibrillation."} ;; "chronic atrial fibrillation"
(declare-const patient_has_diagnosis_of_second_degree_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of second degree atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of second degree atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of second degree atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a diagnosis of second degree atrioventricular block."} ;; "second degree atrioventricular block"
(declare-const patient_has_diagnosis_of_complete_atrioventricular_block_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of complete (third degree) atrioventricular block.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of complete (third degree) atrioventricular block.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of complete (third degree) atrioventricular block.","meaning":"Boolean indicating whether the patient currently has a diagnosis of complete (third degree) atrioventricular block."} ;; "third degree atrioventricular block"
(declare-const patient_has_diagnosis_of_cor_pulmonale_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of cor pulmonale (right heart failure due to pulmonary hypertension).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of cor pulmonale (right heart failure due to pulmonary hypertension).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of cor pulmonale (right heart failure due to pulmonary hypertension).","meaning":"Boolean indicating whether the patient currently has a diagnosis of cor pulmonale (right heart failure due to pulmonary hypertension)."} ;; "right heart failure due to pulmonary hypertension"
(declare-const patient_has_diagnosis_of_pheochromocytoma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pheochromocytoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pheochromocytoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pheochromocytoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pheochromocytoma."} ;; "pheochromocytoma"
(declare-const patient_has_diagnosis_of_peripheral_arterial_occlusive_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peripheral arterial occlusive disease.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of peripheral arterial occlusive disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of peripheral arterial occlusive disease.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peripheral arterial occlusive disease."} ;; "peripheral artery disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_diagnosis_of_renal_failure_syndrome_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal failure."
(assert
(! (not patient_has_diagnosis_of_hepatic_failure_now)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hepatic failure."
(assert
(! (not patient_has_diagnosis_of_renal_artery_stenosis_now)
    :named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has renal artery stenosis."
(assert
(! (not patient_has_diagnosis_of_asthma_now)
    :named REQ3_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has bronchial asthma."
(assert
(! (not patient_has_diagnosis_of_prinzmetal_angina_now)
    :named REQ3_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has vasoconstrictive angina (Prinzmetal's angina)."
(assert
(! (not patient_has_diagnosis_of_hypertrophic_cardiomyopathy_now)
    :named REQ3_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has hypertrophic cardiomyopathy."
(assert
(! (not patient_has_diagnosis_of_aortic_valve_stenosis_now)
    :named REQ3_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has aortic valve stenosis."
(assert
(! (not patient_has_diagnosis_of_mitral_valve_stenosis_now)
    :named REQ3_COMPONENT7_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has mitral valve stenosis."
(assert
(! (not patient_has_diagnosis_of_sinus_tachycardia_now)
    :named REQ3_COMPONENT8_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sinus tachycardia."
(assert
(! (not patient_has_diagnosis_of_sinus_bradycardia_now)
    :named REQ3_COMPONENT9_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sinus bradycardia."
(assert
(! (not patient_has_diagnosis_of_sick_sinus_syndrome_now)
    :named REQ3_COMPONENT10_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has sick sinus syndrome."
(assert
(! (not patient_has_diagnosis_of_wolff_parkinson_white_syndrome_now)
    :named REQ3_COMPONENT11_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has Wolff-Parkinson-White syndrome."
(assert
(! (not patient_has_diagnosis_of_chronic_atrial_fibrillation_now)
    :named REQ3_COMPONENT12_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has chronic atrial fibrillation."
(assert
(! (not patient_has_diagnosis_of_second_degree_atrioventricular_block_now)
    :named REQ3_COMPONENT13_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has second degree atrioventricular block."
(assert
(! (not patient_has_diagnosis_of_complete_atrioventricular_block_now)
    :named REQ3_COMPONENT14_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has third degree atrioventricular block."
(assert
(! (not patient_has_diagnosis_of_cor_pulmonale_now)
    :named REQ3_COMPONENT15_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has right heart failure due to pulmonary hypertension."
(assert
(! (not patient_has_diagnosis_of_pheochromocytoma_now)
    :named REQ3_COMPONENT16_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has pheochromocytoma."
(assert
(! (not patient_has_diagnosis_of_peripheral_arterial_occlusive_disease_now)
    :named REQ3_COMPONENT17_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has peripheral artery disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence (history or pregnancy test) that the patient is currently pregnant.","when_to_set_to_false":"Set to false if there is evidence that the patient is currently not pregnant.","when_to_set_to_null":"Set to null if pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "patient is pregnant (as determined by history and pregnancy test)"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if there is evidence (history or clinical documentation) that the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if there is evidence that the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if breastfeeding status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "patient is nursing (as determined by history and pregnancy test)"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_is_pregnant_now)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant (as determined by history and pregnancy test)."

(assert
(! (not patient_is_breastfeeding_now)
    :named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is nursing (as determined by history and pregnancy test)."
