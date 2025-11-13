;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_maternal_cytomegalovirus_infection_predating_pregnancy Bool) ;; {"when_to_set_to_true":"Set to true if there is documented evidence that the patient had a maternal cytomegalovirus infection that occurred prior to pregnancy.","when_to_set_to_false":"Set to false if there is documented evidence that the patient did not have a maternal cytomegalovirus infection prior to pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient had a maternal cytomegalovirus infection prior to pregnancy.","meaning":"Boolean indicating whether the patient has a history of maternal cytomegalovirus infection that occurred prior to pregnancy."} ;; "maternal cytomegalovirus infection pre-dating pregnancy"

(declare-const patient_immunoglobulin_g_value_recorded_now_withunit_index Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's immunoglobulin G avidity index is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the patient's immunoglobulin G avidity index measured now."} ;; "high immunoglobulin G avidity index"

(declare-const patients_immunoglobulin_g_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunoglobulin G status is positive now.","when_to_set_to_false":"Set to false if the patient's immunoglobulin G status is not positive now.","when_to_set_to_null":"Set to null if the status is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient's immunoglobulin G status is positive now."} ;; "positive immunoglobulin G"

(declare-const patients_immunoglobulin_g_is_positive_now@@in_presence_of_negative_immunoglobulin_m Bool) ;; {"when_to_set_to_true":"Set to true if the patient's immunoglobulin G status is positive now and immunoglobulin M status is negative now.","when_to_set_to_false":"Set to false if the patient's immunoglobulin G status is positive now but immunoglobulin M status is not negative now.","when_to_set_to_null":"Set to null if either immunoglobulin G positivity or immunoglobulin M negativity is unknown, not documented, or indeterminate.","meaning":"Boolean indicating whether the patient's immunoglobulin G status is positive now in the presence of negative immunoglobulin M status."} ;; "positive immunoglobulin G in the presence of negative immunoglobulin M"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patients_immunoglobulin_g_is_positive_now@@in_presence_of_negative_immunoglobulin_m
      patients_immunoglobulin_g_is_positive_now)
:named REQ0_AUXILIARY0)) ;; "positive immunoglobulin G in the presence of negative immunoglobulin M"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Definition: maternal cytomegalovirus infection pre-dating pregnancy as defined by ((high immunoglobulin G avidity index) OR (positive immunoglobulin G in the presence of negative immunoglobulin M))
(assert
(! (= patient_has_maternal_cytomegalovirus_infection_predating_pregnancy
     (or
       (> patient_immunoglobulin_g_value_recorded_now_withunit_index 0.8) ;; "high immunoglobulin G avidity index" (threshold assumed as high, must be specified by protocol; here, 0.8 is a placeholder)
       patients_immunoglobulin_g_is_positive_now@@in_presence_of_negative_immunoglobulin_m))
:named REQ0_AUXILIARY1)) ;; "as defined by ((high immunoglobulin G avidity index) OR (positive immunoglobulin G in the presence of negative immunoglobulin M))"

;; Exclusion: patient must NOT have maternal cytomegalovirus infection pre-dating pregnancy as defined above
(assert
(! (not patient_has_maternal_cytomegalovirus_infection_predating_pregnancy)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has maternal cytomegalovirus infection pre-dating pregnancy as defined by ((high immunoglobulin G avidity index) OR (positive immunoglobulin G in the presence of negative immunoglobulin M))."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_adverse_reaction_to_blood_plasma_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity (adverse reaction) to blood plasma.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity (adverse reaction) to blood plasma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity (adverse reaction) to blood plasma.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity (adverse reaction) to blood plasma."} ;; "hypersensitivity to plasma"
(declare-const patient_has_hypersensitivity_to_plasma_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to plasma-derived products.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to plasma-derived products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to plasma-derived products.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to plasma-derived products."} ;; "plasma derived products"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_adverse_reaction_to_blood_plasma_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to plasma."

(assert
(! (not patient_has_hypersensitivity_to_plasma_product_now)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known hypersensitivity to plasma derived products."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_planned_termination_of_pregnancy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a planned termination of pregnancy.","when_to_set_to_false":"Set to false if the patient currently does not have a planned termination of pregnancy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a planned termination of pregnancy.","meaning":"Boolean indicating whether the patient currently has a planned termination of pregnancy."} ;; "planned termination of pregnancy"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "planned termination of pregnancy"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_planned_termination_of_pregnancy_now)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has planned termination of pregnancy."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_congenital_malformation_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a fetal anomaly (congenital malformation).","when_to_set_to_false":"Set to false if the patient currently does not have a fetal anomaly (congenital malformation).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a fetal anomaly (congenital malformation).","meaning":"Boolean indicating whether the patient currently has a fetal anomaly (congenital malformation) at the present time."} ;; "fetal anomalies"
(declare-const patient_has_finding_of_congenital_malformation_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the fetal anomaly (congenital malformation) is known (documented or established) in the patient.","when_to_set_to_false":"Set to false if the fetal anomaly (congenital malformation) is not known (not documented or not established) in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fetal anomaly (congenital malformation) is known.","meaning":"Boolean indicating whether the fetal anomaly (congenital malformation) is known in the patient."} ;; "known major fetal anomalies"
(declare-const patient_has_finding_of_dead_fetus_in_utero_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fetal demise (dead fetus in utero).","when_to_set_to_false":"Set to false if the patient currently does not have fetal demise (dead fetus in utero).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fetal demise (dead fetus in utero).","meaning":"Boolean indicating whether the patient currently has fetal demise (dead fetus in utero) at the present time."} ;; "fetal demise"
(declare-const patient_has_finding_of_dead_fetus_in_utero_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the fetal demise (dead fetus in utero) is known (documented or established) in the patient.","when_to_set_to_false":"Set to false if the fetal demise (dead fetus in utero) is not known (not documented or not established) in the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fetal demise (dead fetus in utero) is known.","meaning":"Boolean indicating whether the fetal demise (dead fetus in utero) is known in the patient."} ;; "known fetal demise"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_congenital_malformation_now@@known
      patient_has_finding_of_congenital_malformation_now)
    :named REQ3_AUXILIARY0)) ;; "known major fetal anomalies"

(assert
(! (=> patient_has_finding_of_dead_fetus_in_utero_now@@known
      patient_has_finding_of_dead_fetus_in_utero_now)
    :named REQ3_AUXILIARY1)) ;; "known fetal demise"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_congenital_malformation_now@@known)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known major fetal anomalies."

(assert
(! (not patient_has_finding_of_dead_fetus_in_utero_now@@known)
    :named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has known fetal demise."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_immunoglobulin_a_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of immunoglobulin A deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of immunoglobulin A deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of immunoglobulin A deficiency.","meaning":"Boolean indicating whether the patient currently has immunoglobulin A deficiency."} ;; "immunoglobulin A deficiency"
(declare-const patient_has_finding_of_maternal_immunoglobulin_a_deficiency_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of maternal immunoglobulin A deficiency.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of maternal immunoglobulin A deficiency.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of maternal immunoglobulin A deficiency.","meaning":"Boolean indicating whether the patient currently has maternal immunoglobulin A deficiency."} ;; "maternal immunoglobulin A deficiency"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_maternal_immunoglobulin_a_deficiency_now)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has maternal immunoglobulin A deficiency."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_is_taking_immunoglobulin_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to take or use any immunoglobulin-containing product in the future.","when_to_set_to_false":"Set to false if the patient is not planned to take or use any immunoglobulin-containing product in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to take or use any immunoglobulin-containing product in the future.","meaning":"Boolean indicating whether the patient is planned to take or use any immunoglobulin-containing product in the future."} ;; "planned use of immune globulin"
(declare-const patient_is_taking_ganciclovir_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to take or use any ganciclovir-containing product in the future.","when_to_set_to_false":"Set to false if the patient is not planned to take or use any ganciclovir-containing product in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to take or use any ganciclovir-containing product in the future.","meaning":"Boolean indicating whether the patient is planned to take or use any ganciclovir-containing product in the future."} ;; "planned use of ganciclovir"
(declare-const patient_is_taking_valganciclovir_containing_product_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planned to take or use any valganciclovir-containing product in the future.","when_to_set_to_false":"Set to false if the patient is not planned to take or use any valganciclovir-containing product in the future.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planned to take or use any valganciclovir-containing product in the future.","meaning":"Boolean indicating whether the patient is planned to take or use any valganciclovir-containing product in the future."} ;; "planned use of valganciclovir"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_is_taking_immunoglobulin_containing_product_inthefuture)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned use of immune globulin."

(assert
(! (not patient_is_taking_ganciclovir_containing_product_inthefuture)
:named REQ5_COMPONENT1_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned use of ganciclovir."

(assert
(! (not patient_is_taking_valganciclovir_containing_product_inthefuture)
:named REQ5_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has planned use of valganciclovir."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_finding_of_maternal_renal_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has maternal renal disease.","when_to_set_to_false":"Set to false if the patient currently does not have maternal renal disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has maternal renal disease.","meaning":"Boolean indicating whether the patient currently has maternal renal disease."} ;; "maternal renal disease"

(declare-const patient_serum_creatinine_level_finding_value_recorded_inthehistory_withunit_milligrams_per_deciliter Real) ;; {"when_to_set_to_value":"Set to the measured value if a serum creatinine concentration in milligrams per deciliter is recorded in the patient's history (prior to randomization).","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value for the patient's serum creatinine concentration (mg/dL) recorded in the history."} ;; "serum creatinine concentration"

(declare-const patient_serum_creatinine_level_finding_value_recorded_inthehistory_withunit_milligrams_per_deciliter@@most_recent_pre_randomization_measurement Bool) ;; {"when_to_set_to_true":"Set to true if the value represents the most recent serum creatinine measurement prior to randomization.","when_to_set_to_false":"Set to false if the value does not represent the most recent pre-randomization measurement.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the value is the most recent pre-randomization measurement.","meaning":"Boolean indicating whether the numeric value is the most recent serum creatinine measurement prior to randomization."} ;; "most recent pre-randomization serum creatinine concentration"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Definition: maternal renal disease is defined as most recent pre-randomization serum creatinine concentration ≥ 1.4 mg/dL
(assert
(! (= patient_has_finding_of_maternal_renal_disease_now
(and patient_serum_creatinine_level_finding_value_recorded_inthehistory_withunit_milligrams_per_deciliter@@most_recent_pre_randomization_measurement
     (>= patient_serum_creatinine_level_finding_value_recorded_inthehistory_withunit_milligrams_per_deciliter 1.4)))
:named REQ6_AUXILIARY0)) ;; "maternal renal disease defined as (most recent pre-randomization serum creatinine concentration ≥ 1.4 milligrams per deciliter)"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_finding_of_maternal_renal_disease_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has maternal renal disease defined as (most recent pre-randomization serum creatinine concentration ≥ 1.4 milligrams per deciliter)."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_finding_of_immune_defect_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an immune defect (immune impairment).","when_to_set_to_false":"Set to false if the patient currently does not have an immune defect (immune impairment).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an immune defect (immune impairment).","meaning":"Boolean indicating whether the patient currently has an immune defect (immune impairment)."} ;; "immune impairment"
(declare-const patient_has_finding_of_immune_defect_now@@maternal_context Bool) ;; {"when_to_set_to_true":"Set to true if the immune defect present in the patient is maternal in origin.","when_to_set_to_false":"Set to false if the immune defect present in the patient is not maternal in origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the immune defect is maternal in origin.","meaning":"Boolean indicating whether the immune defect is maternal in origin."} ;; "maternal immune impairment"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has human immunodeficiency virus infection.","when_to_set_to_false":"Set to false if the patient currently does not have human immunodeficiency virus infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has human immunodeficiency virus infection.","meaning":"Boolean indicating whether the patient currently has human immunodeficiency virus infection."} ;; "human immunodeficiency virus infection"
(declare-const patient_has_finding_of_human_immunodeficiency_virus_infection_now@@maternal_context Bool) ;; {"when_to_set_to_true":"Set to true if the human immunodeficiency virus infection present in the patient is maternal in origin.","when_to_set_to_false":"Set to false if the human immunodeficiency virus infection present in the patient is not maternal in origin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the human immunodeficiency virus infection is maternal in origin.","meaning":"Boolean indicating whether the human immunodeficiency virus infection is maternal in origin."} ;; "human immunodeficiency virus infection (maternal context)"
(declare-const patient_has_finding_of_organ_transplant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a history of organ transplant.","when_to_set_to_false":"Set to false if the patient currently does not have a history of organ transplant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a history of organ transplant.","meaning":"Boolean indicating whether the patient currently has a history of organ transplant."} ;; "organ transplant"
(declare-const patient_has_finding_of_organ_transplant_now@@on_anti_rejection_medication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient with a history of organ transplant is currently on anti-rejection medication.","when_to_set_to_false":"Set to false if the patient with a history of organ transplant is not currently on anti-rejection medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient with a history of organ transplant is currently on anti-rejection medication.","meaning":"Boolean indicating whether the patient with a history of organ transplant is currently on anti-rejection medication."} ;; "organ transplant on anti-rejection medication"

;; ===================== Auxiliary Assertions (REQ 7) =====================
;; Non-exhaustive examples imply umbrella term (maternal immune impairment)
(assert
(! (=> (or patient_has_finding_of_human_immunodeficiency_virus_infection_now@@maternal_context
           patient_has_finding_of_organ_transplant_now@@on_anti_rejection_medication_now)
    patient_has_finding_of_immune_defect_now@@maternal_context)
:named REQ7_AUXILIARY0)) ;; "with non-exhaustive examples (human immunodeficiency virus infection, organ transplant on anti-rejection medication)"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_immune_defect_now@@maternal_context
       patient_has_finding_of_immune_defect_now)
:named REQ7_AUXILIARY1)) ;; "maternal immune impairment"

(assert
(! (=> patient_has_finding_of_human_immunodeficiency_virus_infection_now@@maternal_context
       patient_has_finding_of_human_immunodeficiency_virus_infection_now)
:named REQ7_AUXILIARY2)) ;; "human immunodeficiency virus infection (maternal context)"

(assert
(! (=> patient_has_finding_of_organ_transplant_now@@on_anti_rejection_medication_now
       patient_has_finding_of_organ_transplant_now)
:named REQ7_AUXILIARY3)) ;; "organ transplant on anti-rejection medication"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_finding_of_immune_defect_now@@maternal_context)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has maternal immune impairment with non-exhaustive examples (human immunodeficiency virus infection, organ transplant on anti-rejection medication)."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_fetal_cytomegalovirus_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of fetal cytomegalovirus syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of fetal cytomegalovirus syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of fetal cytomegalovirus syndrome.","meaning":"Boolean indicating whether the patient currently has fetal cytomegalovirus syndrome."} ;; "fetal cytomegalovirus infection"

(declare-const patient_has_finding_of_fetal_cytomegalovirus_syndrome_now@@established Bool) ;; {"when_to_set_to_true":"Set to true if the patient's fetal cytomegalovirus syndrome is established.","when_to_set_to_false":"Set to false if the patient's fetal cytomegalovirus syndrome is not established.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fetal cytomegalovirus syndrome is established.","meaning":"Boolean indicating whether the patient's fetal cytomegalovirus syndrome is established."} ;; "established fetal cytomegalovirus infection"

(declare-const patient_has_finding_of_fetal_cytomegalovirus_syndrome_now@@suggested_by_findings_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient's fetal cytomegalovirus syndrome is suggested by findings on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient's fetal cytomegalovirus syndrome is not suggested by findings on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the fetal cytomegalovirus syndrome is suggested by findings on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient's fetal cytomegalovirus syndrome is suggested by findings on pre-randomization ultrasound."} ;; "findings on pre-randomization ultrasound suggestive of established fetal cytomegalovirus infection"

(declare-const patient_has_finding_of_cerebral_ventriculomegaly_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient has cerebral ventriculomegaly on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient does not have cerebral ventriculomegaly on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has cerebral ventriculomegaly on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient has cerebral ventriculomegaly on pre-randomization ultrasound."} ;; "cerebral ventriculomegaly"

(declare-const patient_has_finding_of_microcephaly_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient has microcephaly on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient does not have microcephaly on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has microcephaly on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient has microcephaly on pre-randomization ultrasound."} ;; "microcephaly"

(declare-const patient_has_finding_of_cerebral_calcifications_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient has cerebral calcifications on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient does not have cerebral calcifications on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has cerebral calcifications on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient has cerebral calcifications on pre-randomization ultrasound."} ;; "cerebral calcifications"

(declare-const patient_has_finding_of_intra_abdominal_calcifications_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient has intra-abdominal calcifications on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient does not have intra-abdominal calcifications on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has intra-abdominal calcifications on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient has intra-abdominal calcifications on pre-randomization ultrasound."} ;; "intra-abdominal calcifications"

(declare-const patient_has_finding_of_abnormal_amniotic_fluid_volume_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient has abnormal amniotic fluid volume on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient does not have abnormal amniotic fluid volume on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has abnormal amniotic fluid volume on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient has abnormal amniotic fluid volume on pre-randomization ultrasound."} ;; "abnormalities of amniotic fluid volume"

(declare-const patient_has_finding_of_echogenic_bowel_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient has echogenic bowel on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient does not have echogenic bowel on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has echogenic bowel on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient has echogenic bowel on pre-randomization ultrasound."} ;; "echogenic bowel"

(declare-const patient_has_finding_of_ascites_on_pre_randomization_ultrasound Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ascites on pre-randomization ultrasound.","when_to_set_to_false":"Set to false if the patient does not have ascites on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ascites on pre-randomization ultrasound.","meaning":"Boolean indicating whether the patient has ascites on pre-randomization ultrasound."} ;; "ascites"

(declare-const amniotic_fluid_volume_value_recorded_on_pre_randomization_ultrasound_withunit_centimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the amniotic fluid volume in centimeters as measured on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the amniotic fluid volume measured in centimeters on pre-randomization ultrasound."} ;; "amniotic fluid volume in centimeters"

(declare-const gestational_age_at_ultrasound_value_recorded_in_weeks Real) ;; {"when_to_set_to_value":"Set to the numeric value of the gestational age in weeks at the time of the pre-randomization ultrasound.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the gestational age in weeks at the time of the pre-randomization ultrasound."} ;; "gestational age at ultrasound in weeks"

(declare-const maximum_vertical_pocket_value_recorded_on_pre_randomization_ultrasound_withunit_centimeters Real) ;; {"when_to_set_to_value":"Set to the numeric value of the maximum vertical pocket in centimeters as measured on pre-randomization ultrasound.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value of the maximum vertical pocket measured in centimeters on pre-randomization ultrasound."} ;; "maximum vertical pocket in centimeters"

;; ===================== Auxiliary Assertions (REQ 8) =====================
;; Non-exhaustive examples: listed findings imply the umbrella term "findings on pre-randomization ultrasound suggestive of established fetal cytomegalovirus infection"
(assert
(! (=> (or patient_has_finding_of_cerebral_ventriculomegaly_on_pre_randomization_ultrasound
           patient_has_finding_of_microcephaly_on_pre_randomization_ultrasound
           patient_has_finding_of_cerebral_calcifications_on_pre_randomization_ultrasound
           patient_has_finding_of_intra_abdominal_calcifications_on_pre_randomization_ultrasound
           patient_has_finding_of_abnormal_amniotic_fluid_volume_on_pre_randomization_ultrasound
           patient_has_finding_of_echogenic_bowel_on_pre_randomization_ultrasound
           patient_has_finding_of_ascites_on_pre_randomization_ultrasound)
    patient_has_finding_of_fetal_cytomegalovirus_syndrome_now@@suggested_by_findings_on_pre_randomization_ultrasound)
:named REQ8_AUXILIARY0)) ;; "with non-exhaustive examples ((cerebral ventriculomegaly) OR (microcephaly) OR (cerebral calcifications) OR (intra-abdominal calcifications) OR (abnormalities of amniotic fluid volume ...) OR (echogenic bowel) OR (ascites))"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_fetal_cytomegalovirus_syndrome_now@@suggested_by_findings_on_pre_randomization_ultrasound
       patient_has_finding_of_fetal_cytomegalovirus_syndrome_now)
:named REQ8_AUXILIARY1)) ;; "suggestive of established fetal cytomegalovirus infection"

;; Abnormal amniotic fluid volume: exhaustive subcategories
(assert
(! (= patient_has_finding_of_abnormal_amniotic_fluid_volume_on_pre_randomization_ultrasound
      (or
        ;; abnormally low amniotic fluid volume
        (or
          ;; no amniotic fluid prior to 14 weeks
          (and (< gestational_age_at_ultrasound_value_recorded_in_weeks 14)
               (= amniotic_fluid_volume_value_recorded_on_pre_randomization_ultrasound_withunit_centimeters 0))
          ;; maximum vertical pocket < 2 cm on or after 14 weeks
          (and (>= gestational_age_at_ultrasound_value_recorded_in_weeks 14)
               (< maximum_vertical_pocket_value_recorded_on_pre_randomization_ultrasound_withunit_centimeters 2)))
        ;; abnormally high amniotic fluid volume: > 10 cm
        (> amniotic_fluid_volume_value_recorded_on_pre_randomization_ultrasound_withunit_centimeters 10)))
:named REQ8_AUXILIARY2)) ;; "abnormalities of amniotic fluid volume with exhaustive subcategories ..."

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_fetal_cytomegalovirus_syndrome_now@@suggested_by_findings_on_pre_randomization_ultrasound)
:named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has findings on pre-randomization ultrasound suggestive of established fetal cytomegalovirus infection ..."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_positive_fetal_cytomegalovirus_finding_from_culture_of_amniotic_fluid Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive fetal cytomegalovirus finding from culture of amniotic fluid.","when_to_set_to_false":"Set to false if the patient does not have a positive fetal cytomegalovirus finding from culture of amniotic fluid.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a positive fetal cytomegalovirus finding from culture of amniotic fluid.","meaning":"Boolean indicating whether the patient has a positive fetal cytomegalovirus finding from culture of amniotic fluid."} ;; "positive fetal cytomegalovirus findings from culture of amniotic fluid"
(declare-const patient_has_positive_fetal_cytomegalovirus_finding_from_polymerase_chain_reaction Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a positive fetal cytomegalovirus finding from polymerase chain reaction.","when_to_set_to_false":"Set to false if the patient does not have a positive fetal cytomegalovirus finding from polymerase chain reaction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a positive fetal cytomegalovirus finding from polymerase chain reaction.","meaning":"Boolean indicating whether the patient has a positive fetal cytomegalovirus finding from polymerase chain reaction."} ;; "positive fetal cytomegalovirus findings from polymerase chain reaction"

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not (or patient_has_positive_fetal_cytomegalovirus_finding_from_culture_of_amniotic_fluid
            patient_has_positive_fetal_cytomegalovirus_finding_from_polymerase_chain_reaction))
   :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has positive fetal cytomegalovirus findings from culture of amniotic fluid) OR (the patient has positive fetal cytomegalovirus findings from polymerase chain reaction)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_finding_of_congenital_rubella_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital rubella syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital rubella syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital rubella syndrome.","meaning":"Boolean indicating whether the patient currently has congenital rubella syndrome."} ;; "congenital infection with rubella"
(declare-const patient_has_finding_of_congenital_syphilis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital syphilis.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital syphilis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital syphilis.","meaning":"Boolean indicating whether the patient currently has congenital syphilis."} ;; "congenital infection with syphilis"
(declare-const patient_has_finding_of_congenital_varicella_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital varicella syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital varicella syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital varicella syndrome.","meaning":"Boolean indicating whether the patient currently has congenital varicella syndrome."} ;; "congenital infection with varicella"
(declare-const patient_has_finding_of_congenital_parvoviral_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of congenital parvoviral infection.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of congenital parvoviral infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital parvoviral infection.","meaning":"Boolean indicating whether the patient currently has congenital parvoviral infection."} ;; "congenital infection with parvovirus"
(declare-const patient_has_finding_of_congenital_toxoplasmosis_diagnosed_by_serology_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital toxoplasmosis diagnosed by serology.","when_to_set_to_false":"Set to false if the patient currently does not have congenital toxoplasmosis diagnosed by serology.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital toxoplasmosis diagnosed by serology.","meaning":"Boolean indicating whether the patient currently has congenital toxoplasmosis diagnosed by serology."} ;; "congenital infection with toxoplasmosis diagnosed by serology"
(declare-const patient_has_finding_of_congenital_toxoplasmosis_diagnosed_by_ultrasound_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital toxoplasmosis diagnosed by ultrasound.","when_to_set_to_false":"Set to false if the patient currently does not have congenital toxoplasmosis diagnosed by ultrasound.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital toxoplasmosis diagnosed by ultrasound.","meaning":"Boolean indicating whether the patient currently has congenital toxoplasmosis diagnosed by ultrasound."} ;; "congenital infection with toxoplasmosis diagnosed by ultrasound"
(declare-const patient_has_finding_of_congenital_toxoplasmosis_diagnosed_by_amniotic_fluid_testing_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has congenital toxoplasmosis diagnosed by amniotic fluid testing.","when_to_set_to_false":"Set to false if the patient currently does not have congenital toxoplasmosis diagnosed by amniotic fluid testing.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has congenital toxoplasmosis diagnosed by amniotic fluid testing.","meaning":"Boolean indicating whether the patient currently has congenital toxoplasmosis diagnosed by amniotic fluid testing."} ;; "congenital infection with toxoplasmosis diagnosed by amniotic fluid testing"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_finding_of_congenital_rubella_syndrome_now)
    :named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital infection with rubella."

(assert
(! (not patient_has_finding_of_congenital_syphilis_now)
    :named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital infection with syphilis."

(assert
(! (not patient_has_finding_of_congenital_varicella_syndrome_now)
    :named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital infection with varicella."

(assert
(! (not patient_has_finding_of_congenital_parvoviral_infection_now)
    :named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital infection with parvovirus."

(assert
(! (not patient_has_finding_of_congenital_toxoplasmosis_diagnosed_by_serology_now)
    :named REQ10_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital infection with toxoplasmosis diagnosed by serology."

(assert
(! (not patient_has_finding_of_congenital_toxoplasmosis_diagnosed_by_ultrasound_now)
    :named REQ10_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital infection with toxoplasmosis diagnosed by ultrasound."

(assert
(! (not patient_has_finding_of_congenital_toxoplasmosis_diagnosed_by_amniotic_fluid_testing_now)
    :named REQ10_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has congenital infection with toxoplasmosis diagnosed by amniotic fluid testing."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_intends_delivery_outside_maternal_fetal_medicine_units_network_center Bool) ;; {"when_to_set_to_true":"Set to true if the patient intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center.","when_to_set_to_false":"Set to false if the patient intends for the delivery to be inside a Maternal-Fetal Medicine Units Network center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center.","meaning":"Boolean indicating whether the patient intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center."} ;; "the patient intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center"

(declare-const managing_obstetrician_intends_delivery_outside_maternal_fetal_medicine_units_network_center Bool) ;; {"when_to_set_to_true":"Set to true if the managing obstetrician intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center.","when_to_set_to_false":"Set to false if the managing obstetrician intends for the delivery to be inside a Maternal-Fetal Medicine Units Network center.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the managing obstetrician intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center.","meaning":"Boolean indicating whether the managing obstetrician intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center."} ;; "the managing obstetrician intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not (or patient_intends_delivery_outside_maternal_fetal_medicine_units_network_center
            managing_obstetrician_intends_delivery_outside_maternal_fetal_medicine_units_network_center))
   :named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center) OR (the managing obstetrician intends for the delivery to be outside a Maternal-Fetal Medicine Units Network center))."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_is_participating_in_interventional_study_influencing_fetal_death_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another interventional study that influences fetal death.","when_to_set_to_false":"Set to false if the patient is currently not participating in another interventional study that influences fetal death.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another interventional study that influences fetal death.","meaning":"Boolean indicating whether the patient is currently participating in another interventional study that influences fetal death."} ;; "the patient is participating in another interventional study that influences fetal death"
(declare-const patient_is_participating_in_interventional_study_influencing_neonatal_death_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently participating in another interventional study that influences neonatal death.","when_to_set_to_false":"Set to false if the patient is currently not participating in another interventional study that influences neonatal death.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently participating in another interventional study that influences neonatal death.","meaning":"Boolean indicating whether the patient is currently participating in another interventional study that influences neonatal death."} ;; "the patient is participating in another interventional study that influences neonatal death"

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_is_participating_in_interventional_study_influencing_fetal_death_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another interventional study that influences fetal death."

(assert
(! (not patient_is_participating_in_interventional_study_influencing_neonatal_death_now)
:named REQ12_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is participating in another interventional study that influences neonatal death."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_is_unwilling_to_commit_to_two_year_follow_up_of_infant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unwilling to commit to a two-year follow-up of the infant.","when_to_set_to_false":"Set to false if the patient is willing to commit to a two-year follow-up of the infant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unwilling to commit to a two-year follow-up of the infant.","meaning":"Boolean indicating whether the patient is unwilling to commit to a two-year follow-up of the infant."} ;; "the patient is unwilling to commit to two year follow-up of the infant"
(declare-const patient_is_unable_to_commit_to_two_year_follow_up_of_infant Bool) ;; {"when_to_set_to_true":"Set to true if the patient is unable to commit to a two-year follow-up of the infant.","when_to_set_to_false":"Set to false if the patient is able to commit to a two-year follow-up of the infant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is unable to commit to a two-year follow-up of the infant.","meaning":"Boolean indicating whether the patient is unable to commit to a two-year follow-up of the infant."} ;; "the patient is unable to commit to two year follow-up of the infant"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not (or patient_is_unwilling_to_commit_to_two_year_follow_up_of_infant
            patient_is_unable_to_commit_to_two_year_follow_up_of_infant))
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient is unwilling to commit to two year follow-up of the infant) OR (the patient is unable to commit to two year follow-up of the infant))."
