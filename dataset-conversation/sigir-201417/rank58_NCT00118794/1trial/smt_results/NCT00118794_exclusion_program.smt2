;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malaria.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malaria."} ;; "malaria"
(declare-const patient_has_diagnosis_of_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malaria and the malaria is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malaria but the malaria is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaria is severe.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malaria and the malaria is severe."} ;; "severe malaria"
(declare-const patient_has_diagnosis_of_malaria_now@@complicated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malaria and the malaria is complicated.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of malaria but the malaria is not complicated.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the malaria is complicated.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malaria and the malaria is complicated."} ;; "complicated malaria"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_finding_of_vomiting_now@@persistent Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting and the vomiting is persistent.","when_to_set_to_false":"Set to false if the patient currently has vomiting but the vomiting is not persistent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the vomiting is persistent.","meaning":"Boolean indicating whether the patient currently has vomiting and the vomiting is persistent."} ;; "persistent vomiting"
(declare-const patient_has_finding_of_dehydration_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has dehydration.","when_to_set_to_false":"Set to false if the patient currently does not have dehydration.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has dehydration.","meaning":"Boolean indicating whether the patient currently has dehydration."} ;; "dehydration"
(declare-const patient_has_finding_of_seizure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of seizure (convulsion).","when_to_set_to_false":"Set to false if the patient currently does not have a finding of seizure (convulsion).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a finding of seizure (convulsion).","meaning":"Boolean indicating whether the patient currently has a finding of seizure (convulsion)."} ;; "convulsion"
(declare-const patient_has_finding_of_seizure_now@@during_present_illness Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a finding of seizure (convulsion) and the seizure occurred during the present illness.","when_to_set_to_false":"Set to false if the patient currently has a finding of seizure (convulsion) but the seizure did not occur during the present illness.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the seizure occurred during the present illness.","meaning":"Boolean indicating whether the patient currently has a finding of seizure (convulsion) and the seizure occurred during the present illness."} ;; "history of convulsion during the present illness"
(declare-const patient_has_finding_of_inability_to_sit_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to sit.","when_to_set_to_false":"Set to false if the patient currently does not have inability to sit.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to sit.","meaning":"Boolean indicating whether the patient currently has inability to sit."} ;; "inability to sit"
(declare-const patient_has_finding_of_inability_to_stand_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has inability to stand.","when_to_set_to_false":"Set to false if the patient currently does not have inability to stand.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has inability to stand.","meaning":"Boolean indicating whether the patient currently has inability to stand."} ;; "inability to stand"
(declare-const parasitaemia_value_recorded_now_withunit_per_microliter Real) ;; {"when_to_set_to_value":"Set to the numeric value of the patient's parasitaemia (number of parasites per microliter) recorded now.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's parasitaemia (number of parasites per microliter) recorded now."} ;; "parasitaemia > 200,000 per microliter"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_diagnosis_of_malaria_now@@severe
      patient_has_diagnosis_of_malaria_now)
    :named REQ0_AUXILIARY0)) ;; "severe malaria"

(assert
(! (=> patient_has_diagnosis_of_malaria_now@@complicated
      patient_has_diagnosis_of_malaria_now)
    :named REQ0_AUXILIARY1)) ;; "complicated malaria"

(assert
(! (=> patient_has_finding_of_vomiting_now@@persistent
      patient_has_finding_of_vomiting_now)
    :named REQ0_AUXILIARY2)) ;; "persistent vomiting"

(assert
(! (=> patient_has_finding_of_seizure_now@@during_present_illness
      patient_has_finding_of_seizure_now)
    :named REQ0_AUXILIARY3)) ;; "history of convulsion during the present illness"

;; Definition: complicated malaria includes any of the listed findings (non-exhaustive examples, so implication only)
(assert
(! (=> (or
         (and patient_has_finding_of_vomiting_now@@persistent patient_has_finding_of_dehydration_now) ;; persistent vomiting with dehydration
         (and patient_has_finding_of_vomiting_now@@persistent (not patient_has_finding_of_dehydration_now)) ;; persistent vomiting without dehydration
         patient_has_finding_of_seizure_now@@during_present_illness
         patient_has_finding_of_inability_to_sit_now
         patient_has_finding_of_inability_to_stand_now
         (> parasitaemia_value_recorded_now_withunit_per_microliter 200000)
       )
       patient_has_diagnosis_of_malaria_now@@complicated)
    :named REQ0_AUXILIARY4)) ;; "including any of: persistent vomiting with dehydration, persistent vomiting without dehydration, history of convulsion during the present illness, inability to sit, inability to stand, or parasitaemia > 200,000 per microliter"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_malaria_now@@severe)
    :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of severe malaria."

(assert
(! (not patient_has_diagnosis_of_malaria_now@@complicated)
    :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has signs of complicated malaria (including any of: persistent vomiting with dehydration, persistent vomiting without dehydration, history of convulsion during the present illness, inability to sit, inability to stand, or parasitaemia > 200,000 per microliter)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_nutritional_marasmus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of nutritional marasmus (severe malnutrition).","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of nutritional marasmus (severe malnutrition).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nutritional marasmus (severe malnutrition).","meaning":"Boolean indicating whether the patient currently has nutritional marasmus (severe malnutrition)."} ;; "severe malnutrition"
(declare-const patient_has_finding_of_severe_malnutrition_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of severe malnutrition.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of severe malnutrition.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has severe malnutrition.","meaning":"Boolean indicating whether the patient currently has severe malnutrition."} ;; "severe malnutrition"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_severe_malnutrition_now)
    :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has malnutrition that is severe malnutrition."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@clinically_evident Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is clinically evident.","when_to_set_to_false":"Set to false if the patient currently has a disease but it is not clinically evident.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is clinically evident.","meaning":"Boolean indicating whether the patient's current disease is clinically evident."} ;; "clinically evident"
(declare-const patient_has_finding_of_disease_now@@concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is concomitant.","when_to_set_to_false":"Set to false if the patient currently has a disease but it is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the disease is concomitant.","meaning":"Boolean indicating whether the patient's current disease is concomitant."} ;; "concomitant"
(declare-const patient_has_finding_of_disease_now@@concomitant@@clinically_evident Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease that is concomitant and clinically evident.","when_to_set_to_false":"Set to false if the patient currently has a disease but it is not concomitant and/or not clinically evident.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is concomitant and clinically evident.","meaning":"Boolean indicating whether the patient currently has a disease that is both concomitant and clinically evident."} ;; "concomitant disease that is clinically evident"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disease_now@@concomitant
      patient_has_finding_of_disease_now)
:named REQ2_AUXILIARY0)) ;; "concomitant disease"

(assert
(! (=> patient_has_finding_of_disease_now@@clinically_evident
      patient_has_finding_of_disease_now)
:named REQ2_AUXILIARY1)) ;; "clinically evident disease"

;; Double qualifier variable implies both single qualifiers
(assert
(! (=> patient_has_finding_of_disease_now@@concomitant@@clinically_evident
      (and patient_has_finding_of_disease_now@@concomitant
           patient_has_finding_of_disease_now@@clinically_evident))
:named REQ2_AUXILIARY2)) ;; "concomitant disease that is clinically evident"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_disease_now@@concomitant@@clinically_evident)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant disease that is clinically evident."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent Real) ;; {"when_to_set_to_value":"Set to the measured percentage value if a numeric measurement of packed cell volume (hematocrit/PCV) is recorded now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric percentage representing the patient's packed cell volume (hematocrit/PCV) measured now."} ;; "packed cell volume < 20 percent"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (not (< patient_hematocrit_pcv_level_finding_value_recorded_now_withunit_percent 20))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has packed cell volume < 20 percent."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_allergy_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergy to any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had an allergy to any drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergy to any drug or medicament.","meaning":"Boolean indicating whether the patient has ever had an allergy to any drug or medicament."} ;; "history of allergy to the study medications"
(declare-const patient_has_allergy_to_drug_or_medicament_inthehistory@@is_study_medication Bool) ;; {"when_to_set_to_true":"Set to true if the drug or medicament to which the patient has a history of allergy is a study medication.","when_to_set_to_false":"Set to false if the drug or medicament to which the patient has a history of allergy is not a study medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the drug or medicament to which the patient has a history of allergy is a study medication.","meaning":"Boolean indicating whether the drug or medicament to which the patient has a history of allergy is a study medication."} ;; "history of allergy to the study medications"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_allergy_to_drug_or_medicament_inthehistory@@is_study_medication
      patient_has_allergy_to_drug_or_medicament_inthehistory)
   :named REQ4_AUXILIARY0)) ;; "the drug or medicament to which the patient has a history of allergy is a study medication"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_allergy_to_drug_or_medicament_inthehistory@@is_study_medication)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has history of allergy to the study medications."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_resides_outside_study_area_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently resides outside the study area.","when_to_set_to_false":"Set to false if the patient currently resides within the study area.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently resides outside the study area.","meaning":"Boolean indicating whether the patient currently resides outside the study area."} ;; "The patient resides outside the study area (and is hence difficult to follow up)."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_resides_outside_study_area_now)
:named REQ5_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient resides outside the study area (and is hence difficult to follow up)."
