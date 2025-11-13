;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const parent_refuses_to_give_consent_for_patient_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if at least one parent of the patient refuses to give consent for the patient's participation in the study.","when_to_set_to_false":"Set to false if all parents of the patient do not refuse to give consent for the patient's participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any parent of the patient refuses to give consent for the patient's participation in the study.","meaning":"Boolean indicating whether any parent of the patient refuses to give consent for the patient's participation in the study."} ;; "the patient has a parent who refuses to give consent to the patient's participation in the study"

(declare-const guardian_refuses_to_give_consent_for_patient_participation_in_study Bool) ;; {"when_to_set_to_true":"Set to true if at least one guardian of the patient refuses to give consent for the patient's participation in the study.","when_to_set_to_false":"Set to false if all guardians of the patient do not refuse to give consent for the patient's participation in the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether any guardian of the patient refuses to give consent for the patient's participation in the study.","meaning":"Boolean indicating whether any guardian of the patient refuses to give consent for the patient's participation in the study."} ;; "the patient has a guardian who refuses to give consent to the patient's participation in the study"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not parent_refuses_to_give_consent_for_patient_participation_in_study)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a parent who refuses to give consent to the patient's participation in the study."

(assert
(! (not guardian_refuses_to_give_consent_for_patient_participation_in_study)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a guardian who refuses to give consent to the patient's participation in the study."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_can_undergo_drug_or_medicament_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently able to take drug or medicament.","when_to_set_to_false":"Set to false if the patient is currently unable to take drug or medicament.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently able to take drug or medicament.","meaning":"Boolean indicating whether the patient is currently able to take drug or medicament."} ;; "able to take oral medication"
(declare-const patient_can_undergo_drug_or_medicament_now@@administered_orally Bool) ;; {"when_to_set_to_true":"Set to true if the ability to take drug or medicament refers specifically to oral administration.","when_to_set_to_false":"Set to false if the ability to take drug or medicament does not refer to oral administration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the ability to take drug or medicament refers to oral administration.","meaning":"Boolean indicating whether the ability to take drug or medicament is specifically for oral administration."} ;; "oral medication"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for oral administration implies general ability to take drug/medicament
(assert
(! (=> patient_can_undergo_drug_or_medicament_now@@administered_orally
      patient_can_undergo_drug_or_medicament_now)
:named REQ1_AUXILIARY0)) ;; "oral medication" implies "medication"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_can_undergo_drug_or_medicament_now@@administered_orally)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is unable to take oral medication."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const parasite_density_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's parasite density measured now, in parasites per microliter.","when_to_set_to_null":"Set to null if the parasite density value measured now is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's parasite density measured now, expressed in parasites per microliter."} ;; "parasite density"
(declare-const patient_has_features_of_severe_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any features of severe malaria as defined by World Health Organization 50.","when_to_set_to_false":"Set to false if the patient currently does not have any features of severe malaria as defined by World Health Organization 50.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any features of severe malaria as defined by World Health Organization 50.","meaning":"Boolean indicating whether the patient currently has any features of severe malaria as defined by World Health Organization 50."} ;; "features of severe malaria as defined by World Health Organization 50"
(declare-const patient_has_finding_of_anemia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has anaemia.","when_to_set_to_false":"Set to false if the patient currently does not have anaemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has anaemia.","meaning":"Boolean indicating whether the patient currently has anaemia now."} ;; "anaemia"
(declare-const patient_has_finding_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malaria.","when_to_set_to_false":"Set to false if the patient currently does not have malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has malaria.","meaning":"Boolean indicating whether the patient currently has malaria now."} ;; "malaria"
(declare-const patient_has_only_features_of_anemia_and_or_parasite_density_now Bool) ;; {"when_to_set_to_true":"Set to true if the only features of severe malaria present in the patient now are anaemia and/or parasite density.","when_to_set_to_false":"Set to false if features of severe malaria other than anaemia and/or parasite density are present in the patient now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the only features of severe malaria present in the patient now are anaemia and/or parasite density.","meaning":"Boolean indicating whether the only features of severe malaria present in the patient now are anaemia and/or parasite density."} ;; "EXCEPT if the ONLY features present are anaemia and/or parasite density"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have features of severe malaria as defined by WHO 50, unless the ONLY features present are anaemia and/or parasite density
(assert
(! (not (and patient_has_features_of_severe_malaria_now
             (not patient_has_only_features_of_anemia_and_or_parasite_density_now)))
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has features of severe malaria as defined by World Health Organization 50, EXCEPT if the ONLY features present are anaemia and/or parasite density."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_tachypnoea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachypnoea.","when_to_set_to_false":"Set to false if the patient currently does not have tachypnoea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachypnoea.","meaning":"Boolean indicating whether the patient currently has tachypnoea."} ;; "tachypnoea"
(declare-const patient_has_finding_of_tachycardia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tachycardia.","when_to_set_to_false":"Set to false if the patient currently does not have tachycardia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tachycardia.","meaning":"Boolean indicating whether the patient currently has tachycardia."} ;; "tachycardia"
(declare-const patient_has_finding_of_gallop_rhythm_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a gallop rhythm.","when_to_set_to_false":"Set to false if the patient currently does not have a gallop rhythm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a gallop rhythm.","meaning":"Boolean indicating whether the patient currently has a gallop rhythm."} ;; "gallop rhythm"
(declare-const patient_has_finding_of_tender_hepatomegaly_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tender hepatomegaly.","when_to_set_to_false":"Set to false if the patient currently does not have tender hepatomegaly.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tender hepatomegaly.","meaning":"Boolean indicating whether the patient currently has tender hepatomegaly."} ;; "tender hepatomegaly"
(declare-const patient_has_undergone_transfusion_of_blood_product_now@@urgent_need Bool) ;; {"when_to_set_to_true":"Set to true if the patient has an urgent need for transfusion of a blood product now.","when_to_set_to_false":"Set to false if the patient does not have an urgent need for transfusion of a blood product now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has an urgent need for transfusion of a blood product now.","meaning":"Boolean indicating whether the patient has an urgent need for transfusion of a blood product now."} ;; "urgent need for blood transfusion"
(declare-const patient_has_undergone_transfusion_of_blood_product_now@@need_indicated_by_at_least_one_of_tachypnoea_tachycardia_gallop_rhythm_tender_hepatomegaly Bool) ;; {"when_to_set_to_true":"Set to true if the need for transfusion of a blood product is indicated by at least one of: tachypnoea, tachycardia, gallop rhythm, or tender hepatomegaly.","when_to_set_to_false":"Set to false if the need for transfusion of a blood product is not indicated by any of these signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the need for transfusion of a blood product is indicated by any of these signs.","meaning":"Boolean indicating whether the need for transfusion of a blood product is indicated by at least one of: tachypnoea, tachycardia, gallop rhythm, or tender hepatomegaly."} ;; "need for blood transfusion as indicated by (at least one of the following: tachypnoea OR tachycardia OR gallop rhythm OR tender hepatomegaly)"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definition: "need for blood transfusion as indicated by (at least one of the following: tachypnoea OR tachycardia OR gallop rhythm OR tender hepatomegaly)"
(assert
(! (= patient_has_undergone_transfusion_of_blood_product_now@@need_indicated_by_at_least_one_of_tachypnoea_tachycardia_gallop_rhythm_tender_hepatomegaly
(or patient_has_finding_of_tachypnoea_now
    patient_has_finding_of_tachycardia_now
    patient_has_finding_of_gallop_rhythm_now
    patient_has_finding_of_tender_hepatomegaly_now))
:named REQ3_AUXILIARY0)) ;; "as indicated by (at least one of the following: tachypnoea OR tachycardia OR gallop rhythm OR tender hepatomegaly)"

;; Qualifier variable implies urgent need for transfusion
(assert
(! (=> patient_has_undergone_transfusion_of_blood_product_now@@need_indicated_by_at_least_one_of_tachypnoea_tachycardia_gallop_rhythm_tender_hepatomegaly
     patient_has_undergone_transfusion_of_blood_product_now@@urgent_need)
:named REQ3_AUXILIARY1)) ;; "urgent need for blood transfusion as indicated by (at least one of the following...)"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_undergone_transfusion_of_blood_product_now@@urgent_need)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an urgent need for blood transfusion as indicated by (at least one of the following: tachypnoea OR tachycardia OR gallop rhythm OR tender hepatomegaly)."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_hemoglobinopathy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hemoglobinopathy.","when_to_set_to_false":"Set to false if the patient currently does not have a hemoglobinopathy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hemoglobinopathy.","meaning":"Boolean indicating whether the patient currently has a hemoglobinopathy."} ;; "haemoglobinopathy"
(declare-const patient_has_finding_of_hemoglobinopathy_now@@known Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hemoglobinopathy is known (previously diagnosed or documented).","when_to_set_to_false":"Set to false if the patient's hemoglobinopathy is not known (not previously diagnosed or documented).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hemoglobinopathy is known.","meaning":"Boolean indicating whether the patient's hemoglobinopathy is known (previously diagnosed or documented)."} ;; "known haemoglobinopathy"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_hemoglobinopathy_now@@known
      patient_has_finding_of_hemoglobinopathy_now)
:named REQ4_AUXILIARY0)) ;; "known haemoglobinopathy" (qualifier implies stem)

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_hemoglobinopathy_now@@known)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known haemoglobinopathy."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const weight_for_height_z_score_value_recorded_now_withunit_standard_deviation Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's current weight for height Z score, measured in standard deviations, as per the World Health Organization/National Center for Health Statistics standard.","when_to_set_to_null":"Set to null if the patient's current weight for height Z score is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the patient's current weight for height Z score, measured in standard deviations."} ;; "weight for height Z score (standardized score)"
(declare-const weight_for_height_z_score_value_recorded_now_withunit_standard_deviation@@based_on_who_nchs_standard Bool) ;; {"when_to_set_to_true":"Set to true if the patient's weight for height Z score is calculated using the World Health Organization/National Center for Health Statistics standard.","when_to_set_to_false":"Set to false if the patient's weight for height Z score is not calculated using the World Health Organization/National Center for Health Statistics standard.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the score is calculated using the World Health Organization/National Center for Health Statistics standard.","meaning":"Boolean indicating whether the patient's weight for height Z score is calculated using the World Health Organization/National Center for Health Statistics standard."} ;; "World Health Organization/National Center for Health Statistics standard"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! (not (and
            weight_for_height_z_score_value_recorded_now_withunit_standard_deviation@@based_on_who_nchs_standard
            (< weight_for_height_z_score_value_recorded_now_withunit_standard_deviation -3)
          ))
     :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a weight for height Z score (standardized score) < -3 standard deviations of World Health Organization/National Center for Health Statistics standard."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_is_enrolled_in_another_research_project_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently enrolled in another research project.","when_to_set_to_false":"Set to false if the patient is currently not enrolled in another research project.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently enrolled in another research project.","meaning":"Boolean indicating whether the patient is currently enrolled in another research project."} ;; "the patient is enrolled in another research project"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_is_enrolled_in_another_research_project_now)
    :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is enrolled in another research project."
