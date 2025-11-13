;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_undergone_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone a surgical procedure during the current surgery.","when_to_set_to_false":"Set to false if the patient has not undergone any surgical procedure during the current surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone a surgical procedure during the current surgery.","meaning":"Boolean indicating whether the patient has undergone a surgical procedure now."} ;; "surgical procedure"
(declare-const patient_has_undergone_surgical_procedure_now@@during_same_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure occurred during the same surgery as the index procedure.","when_to_set_to_false":"Set to false if the surgical procedure did not occur during the same surgery as the index procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure occurred during the same surgery as the index procedure.","meaning":"Boolean indicating whether the surgical procedure occurred during the same surgery as the index procedure."}
(declare-const patient_has_undergone_surgical_procedure_now@@is_additional_procedure Bool) ;; {"when_to_set_to_true":"Set to true if the surgical procedure is additional to the index procedure.","when_to_set_to_false":"Set to false if the surgical procedure is not additional to the index procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical procedure is additional to the index procedure.","meaning":"Boolean indicating whether the surgical procedure is additional to the index procedure."}
(declare-const patient_has_undergone_uvulopalatopharyngoplasty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone uvulopalatopharyngoplasty during the current surgery.","when_to_set_to_false":"Set to false if the patient has not undergone uvulopalatopharyngoplasty during the current surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone uvulopalatopharyngoplasty during the current surgery.","meaning":"Boolean indicating whether the patient has undergone uvulopalatopharyngoplasty now."} ;; "uvulopalatopharyngoplasty"
(declare-const patient_has_undergone_uvulopalatopharyngoplasty_now@@during_same_surgery Bool) ;; {"when_to_set_to_true":"Set to true if uvulopalatopharyngoplasty occurred during the same surgery as the index procedure.","when_to_set_to_false":"Set to false if uvulopalatopharyngoplasty did not occur during the same surgery as the index procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether uvulopalatopharyngoplasty occurred during the same surgery as the index procedure.","meaning":"Boolean indicating whether uvulopalatopharyngoplasty occurred during the same surgery as the index procedure."}
(declare-const patient_has_undergone_septoplasty_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone septoplasty during the current surgery.","when_to_set_to_false":"Set to false if the patient has not undergone septoplasty during the current surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone septoplasty during the current surgery.","meaning":"Boolean indicating whether the patient has undergone septoplasty during the current surgery."}
(declare-const patient_has_undergone_septoplasty_now@@during_same_surgery Bool) ;; {"when_to_set_to_true":"Set to true if septoplasty occurred during the same surgery as the index procedure.","when_to_set_to_false":"Set to false if septoplasty did not occur during the same surgery as the index procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether septoplasty occurred during the same surgery as the index procedure.","meaning":"Boolean indicating whether septoplasty occurred during the same surgery as the index procedure."}
(declare-const patient_has_undergone_inferior_turbinate_reduction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient has undergone inferior turbinate reduction during the current surgery.","when_to_set_to_false":"Set to false if the patient has not undergone inferior turbinate reduction during the current surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has undergone inferior turbinate reduction during the current surgery.","meaning":"Boolean indicating whether the patient has undergone inferior turbinate reduction during the current surgery."}
(declare-const patient_has_undergone_inferior_turbinate_reduction_now@@during_same_surgery Bool) ;; {"when_to_set_to_true":"Set to true if inferior turbinate reduction occurred during the same surgery as the index procedure.","when_to_set_to_false":"Set to false if inferior turbinate reduction did not occur during the same surgery as the index procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether inferior turbinate reduction occurred during the same surgery as the index procedure.","meaning":"Boolean indicating whether inferior turbinate reduction occurred during the same surgery as the index procedure."}

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_undergone_uvulopalatopharyngoplasty_now@@during_same_surgery
           patient_has_undergone_septoplasty_now@@during_same_surgery
           patient_has_undergone_inferior_turbinate_reduction_now@@during_same_surgery)
    (and patient_has_undergone_surgical_procedure_now@@during_same_surgery
         patient_has_undergone_surgical_procedure_now@@is_additional_procedure))
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (uvulopalatopharyngoplasty OR septoplasty OR inferior turbinate reduction) during the same surgery."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_undergone_uvulopalatopharyngoplasty_now@@during_same_surgery
       patient_has_undergone_uvulopalatopharyngoplasty_now)
:named REQ0_AUXILIARY1)) ;; "uvulopalatopharyngoplasty during the same surgery"

(assert
(! (=> patient_has_undergone_septoplasty_now@@during_same_surgery
       patient_has_undergone_septoplasty_now)
:named REQ0_AUXILIARY2)) ;; "septoplasty during the same surgery"

(assert
(! (=> patient_has_undergone_inferior_turbinate_reduction_now@@during_same_surgery
       patient_has_undergone_inferior_turbinate_reduction_now)
:named REQ0_AUXILIARY3)) ;; "inferior turbinate reduction during the same surgery"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_undergone_surgical_procedure_now@@during_same_surgery
             patient_has_undergone_surgical_procedure_now@@is_additional_procedure))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient undergoes at least one additional surgical procedure during the same surgery."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "pregnant female"
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current sex is documented as female.","when_to_set_to_false":"Set to false if the patient's current sex is documented as not female (e.g., male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient's current sex is female."} ;; "pregnant female"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! (not (and patient_is_pregnant_now patient_sex_is_female_now))
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a pregnant female."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_suspicion_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has suspected malignant neoplastic disease.","when_to_set_to_false":"Set to false if the patient currently does not have suspected malignant neoplastic disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has suspected malignant neoplastic disease.","meaning":"Boolean indicating whether the patient currently has suspected malignant neoplastic disease."} ;; "malignancy"

(declare-const patient_has_suspicion_of_malignant_neoplastic_disease_now@@indication_for_surgery Bool) ;; {"when_to_set_to_true":"Set to true if the patient's suspected malignant neoplastic disease is present specifically as an indication for surgery.","when_to_set_to_false":"Set to false if the patient's suspected malignant neoplastic disease is not present as an indication for surgery.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the suspicion of malignant neoplastic disease is present as an indication for surgery.","meaning":"Boolean indicating whether the patient's suspected malignant neoplastic disease is present as an indication for surgery."} ;; "suspected malignancy as an indication for surgery"

(declare-const patient_is_undergoing_surgical_procedure_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing a surgical procedure.","when_to_set_to_false":"Set to false if the patient is not currently undergoing a surgical procedure.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing a surgical procedure.","meaning":"Boolean indicating whether the patient is currently undergoing a surgical procedure."} ;; "surgery"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_suspicion_of_malignant_neoplastic_disease_now@@indication_for_surgery
     patient_has_suspicion_of_malignant_neoplastic_disease_now)
:named REQ2_AUXILIARY0)) ;; "suspected malignancy as an indication for surgery""

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_suspicion_of_malignant_neoplastic_disease_now@@indication_for_surgery)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has suspected malignancy as an indication for surgery."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_chronic_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of chronic pain documented at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of chronic pain documented at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had chronic pain.","meaning":"Boolean indicating whether the patient has ever had chronic pain in their history."} ;; "chronic pain"

(declare-const patient_has_finding_of_pain_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of pain documented at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of pain documented at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had pain.","meaning":"Boolean indicating whether the patient has ever had pain in their history."} ;; "pain"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been exposed to any drug or medicament at any time in the past.","when_to_set_to_false":"Set to false if the patient has never been exposed to any drug or medicament at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been exposed to any drug or medicament.","meaning":"Boolean indicating whether the patient has ever been exposed to any drug or medicament in their history."} ;; "medication"

(declare-const patient_is_exposed_to_drug_or_medicament_inthehistory@@use_for_another_medical_problem Bool) ;; {"when_to_set_to_true":"Set to true if the patient's exposure to drug or medicament in their history was for another medical problem (not pain).","when_to_set_to_false":"Set to false if the patient's exposure to drug or medicament in their history was not for another medical problem (i.e., was for pain or unknown indication).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the exposure was for another medical problem.","meaning":"Boolean indicating whether the patient's exposure to drug or medicament in their history was for another medical problem."} ;; "daily pain medication use for another medical problem"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_chronic_pain_inthehistory)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of chronic pain."

(assert
(! (not patient_is_exposed_to_drug_or_medicament_inthehistory@@use_for_another_medical_problem)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of daily pain medication use for another medical problem."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_diagnosis_of_disease_of_liver_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of liver disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of liver disease documented in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of liver disease.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of liver disease in their medical history."} ;; "liver disease"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_diagnosis_of_disease_of_liver_inthehistory)
    :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of liver disease."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_contraindication_to_dexamethasone_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to dexamethasone-containing products.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to dexamethasone-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to dexamethasone-containing products.","meaning":"Boolean indicating whether the patient currently has a contraindication to dexamethasone-containing products."} ;; "contraindication to Decadron"
(declare-const patient_has_contraindication_to_dexamethasone_containing_product_now@@preoperative_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient's contraindication to dexamethasone-containing products is specifically relevant in the preoperative period.","when_to_set_to_false":"Set to false if the patient's contraindication to dexamethasone-containing products is not relevant in the preoperative period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the contraindication is relevant in the preoperative period.","meaning":"Boolean indicating whether the patient's contraindication to dexamethasone-containing products is relevant in the preoperative period."} ;; "contraindication to preoperative Decadron"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_contraindication_to_dexamethasone_containing_product_now@@preoperative_period
      patient_has_contraindication_to_dexamethasone_containing_product_now)
:named REQ5_AUXILIARY0)) ;; "contraindication to preoperative Decadron""

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_contraindication_to_dexamethasone_containing_product_now@@preoperative_period)
:named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a contraindication to preoperative Decadron."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_contraindication_to_tylenol_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to Tylenol.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to Tylenol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to Tylenol.","meaning":"Boolean indicating whether the patient currently has a contraindication to Tylenol."} ;; "contraindication to Tylenol"
(declare-const patient_has_contraindication_to_norco_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to Norco.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to Norco.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to Norco.","meaning":"Boolean indicating whether the patient currently has a contraindication to Norco."} ;; "contraindication to Norco"
(declare-const patient_has_contraindication_to_percocet_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a contraindication to Percocet.","when_to_set_to_false":"Set to false if the patient currently does not have a contraindication to Percocet.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a contraindication to Percocet.","meaning":"Boolean indicating whether the patient currently has a contraindication to Percocet."} ;; "contraindication to Percocet"
(declare-const patient_has_hypersensitivity_to_hydromorphone_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity to hydromorphone-containing products (e.g., Dilaudid).","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity to hydromorphone-containing products.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity to hydromorphone-containing products.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity to hydromorphone-containing products."} ;; "Dilaudid"
(declare-const patient_has_hypersensitivity_to_hydromorphone_containing_product_now@@contraindication Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hypersensitivity to hydromorphone-containing products is considered a contraindication to pain regimen medication.","when_to_set_to_false":"Set to false if the patient's hypersensitivity to hydromorphone-containing products is not considered a contraindication to pain regimen medication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the hypersensitivity constitutes a contraindication.","meaning":"Boolean indicating whether the patient's hypersensitivity to hydromorphone-containing products is a contraindication to pain regimen medication."} ;; "Dilaudid as contraindication to pain regimen medication"

;; ===================== Auxiliary Assertions (REQ 6) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_hypersensitivity_to_hydromorphone_containing_product_now@@contraindication
     patient_has_hypersensitivity_to_hydromorphone_containing_product_now)
:named REQ6_AUXILIARY0)) ;; "hypersensitivity to hydromorphone-containing products is a contraindication to pain regimen medication"

;; ===================== Constraint Assertions (REQ 6) =====================
;; Exclusion: patient must NOT have a contraindication to any pain regimen medication (Tylenol, Norco, Percocet, Dilaudid)
(assert
(! (not (or patient_has_contraindication_to_tylenol_now
            patient_has_contraindication_to_norco_now
            patient_has_contraindication_to_percocet_now
            patient_has_hypersensitivity_to_hydromorphone_containing_product_now@@contraindication))
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient has a contraindication to pain regimen medication (Tylenol or Norco or Percocet or Dilaudid)."
