;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_mixed_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a mixed malaria infection.","when_to_set_to_false":"Set to false if the patient currently does not have a mixed malaria infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a mixed malaria infection.","meaning":"Boolean indicating whether the patient currently has a mixed malaria infection."} ;; "mixed malaria infection"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (not patient_has_finding_of_mixed_malaria_now)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a mixed malaria infection."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently pregnant.","when_to_set_to_false":"Set to false if the patient is currently not pregnant.","when_to_set_to_null":"Set to null if the patient's current pregnancy status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently pregnant."} ;; "the patient is pregnant"
(declare-const patient_is_breastfeeding_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently breastfeeding.","when_to_set_to_false":"Set to false if the patient is currently not breastfeeding.","when_to_set_to_null":"Set to null if the patient's current breastfeeding status is unknown or cannot be determined.","meaning":"Boolean value indicating whether the patient is currently breastfeeding."} ;; "the patient is breastfeeding"
(declare-const age_of_child_being_breastfed_value_recorded_now_in_months Real) ;; {"when_to_set_to_value":"Set to the numeric value in months of the age of the child currently being breastfed by the patient, as recorded now.","when_to_set_to_null":"Set to null if the age of the child currently being breastfed by the patient is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the age in months of the child currently being breastfed by the patient, as recorded now."} ;; "age in months of the child currently being breastfed by the patient"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Exclusion: patient is pregnant
(assert
(! (not patient_is_pregnant_now)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is pregnant."

;; Exclusion: patient is breastfeeding a child whose age is less than or equal to 6 months
(assert
(! (not (and patient_is_breastfeeding_now
             (<= age_of_child_being_breastfed_value_recorded_now_in_months 6)))
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is breastfeeding a child whose age is less than or equal to 6 months."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_danger_sign_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has at least one danger sign.","when_to_set_to_false":"Set to false if the patient currently has no danger signs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any danger signs.","meaning":"Boolean indicating whether the patient currently has at least one danger sign."} ;; "the patient has at least one danger sign"

(declare-const patient_has_finding_of_malaria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has the clinical finding of malaria.","when_to_set_to_false":"Set to false if the patient currently does not have the clinical finding of malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has the clinical finding of malaria.","meaning":"Boolean indicating whether the patient currently has malaria."} ;; "malaria"

(declare-const patient_has_finding_of_malaria_now@@severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malaria and the malaria is severe.","when_to_set_to_false":"Set to false if the patient currently has malaria but it is not severe, or does not have malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malaria is severe.","meaning":"Boolean indicating whether the patient currently has severe malaria."} ;; "severe malaria"

(declare-const patient_has_finding_of_malaria_now@@complicated Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has malaria and the malaria is complicated.","when_to_set_to_false":"Set to false if the patient currently has malaria but it is not complicated, or does not have malaria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's malaria is complicated.","meaning":"Boolean indicating whether the patient currently has complicated malaria."} ;; "complicated malaria"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable (severe malaria)
(assert
(! (=> patient_has_finding_of_malaria_now@@severe
       patient_has_finding_of_malaria_now)
   :named REQ2_AUXILIARY0)) ;; "severe malaria"

;; Qualifier variables imply corresponding stem variable (complicated malaria)
(assert
(! (=> patient_has_finding_of_malaria_now@@complicated
       patient_has_finding_of_malaria_now)
   :named REQ2_AUXILIARY1)) ;; "complicated malaria"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have any of the following: danger sign, severe malaria, or complicated malaria
(assert
(! (not (or patient_has_danger_sign_now
            patient_has_finding_of_malaria_now@@severe
            patient_has_finding_of_malaria_now@@complicated))
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has at least one danger sign) OR (the patient has any sign of severe malaria) OR (the patient has any sign of complicated malaria)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease.","when_to_set_to_false":"Set to false if the patient currently does not have a disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disease.","meaning":"Boolean indicating whether the patient currently has a disease."} ;; "disease"
(declare-const patient_has_finding_of_disease_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is severe.","when_to_set_to_false":"Set to false if the patient currently has a disease and the disease is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is severe.","meaning":"Boolean indicating whether the patient's current disease is severe."} ;; "severe disease"
(declare-const patient_has_finding_of_disease_now@@is_concomitant Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease and the disease is concomitant.","when_to_set_to_false":"Set to false if the patient currently has a disease and the disease is not concomitant.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is concomitant.","meaning":"Boolean indicating whether the patient's current disease is concomitant."} ;; "concomitant disease"
(declare-const patient_has_finding_of_disease_now@@is_concomitant@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disease that is both concomitant and severe.","when_to_set_to_false":"Set to false if the patient currently has a disease that is not both concomitant and severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disease is both concomitant and severe.","meaning":"Boolean indicating whether the patient's current disease is both concomitant and severe."} ;; "concomitant severe disease"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Definitional equality for "concomitant severe disease"
(assert
(! (= patient_has_finding_of_disease_now@@is_concomitant@@is_severe
(and patient_has_finding_of_disease_now@@is_concomitant
     patient_has_finding_of_disease_now@@is_severe))
:named REQ3_AUXILIARY0)) ;; "concomitant severe disease"

;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_disease_now@@is_concomitant@@is_severe
       patient_has_finding_of_disease_now)
:named REQ3_AUXILIARY1)) ;; "concomitant severe disease implies disease"

(assert
(! (=> patient_has_finding_of_disease_now@@is_concomitant
       patient_has_finding_of_disease_now)
:named REQ3_AUXILIARY2)) ;; "concomitant disease implies disease"

(assert
(! (=> patient_has_finding_of_disease_now@@is_severe
       patient_has_finding_of_disease_now)
:named REQ3_AUXILIARY3)) ;; "severe disease implies disease"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_disease_now@@is_concomitant@@is_severe)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concomitant severe disease."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_history_of_treatment_with_mefloquine_within_last_60_days Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with mefloquine at any time within the last 60 days.","when_to_set_to_false":"Set to false if the patient has not received treatment with mefloquine within the last 60 days.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with mefloquine within the last 60 days.","meaning":"Boolean indicating whether the patient has a history of treatment with mefloquine within the last 60 days."} ;; "the patient has a history of treatment with mefloquine within the last 60 days"
(declare-const patient_has_history_of_treatment_with_chloroquine_within_14_days_before_present_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with chloroquine at any time within the 14 days before the present episode.","when_to_set_to_false":"Set to false if the patient has not received treatment with chloroquine within the 14 days before the present episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with chloroquine within the 14 days before the present episode.","meaning":"Boolean indicating whether the patient has a history of treatment with chloroquine within the 14 days before the present episode."} ;; "the patient has a history of treatment with chloroquine within the 14 days before the present episode"
(declare-const patient_has_history_of_treatment_with_primaquine_within_14_days_before_present_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with primaquine at any time within the 14 days before the present episode.","when_to_set_to_false":"Set to false if the patient has not received treatment with primaquine within the 14 days before the present episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with primaquine within the 14 days before the present episode.","meaning":"Boolean indicating whether the patient has a history of treatment with primaquine within the 14 days before the present episode."} ;; "the patient has a history of treatment with primaquine within the 14 days before the present episode"
(declare-const patient_has_history_of_treatment_with_quinine_within_14_days_before_present_episode Bool) ;; {"when_to_set_to_true":"Set to true if the patient has received treatment with quinine at any time within the 14 days before the present episode.","when_to_set_to_false":"Set to false if the patient has not received treatment with quinine within the 14 days before the present episode.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has received treatment with quinine within the 14 days before the present episode.","meaning":"Boolean indicating whether the patient has a history of treatment with quinine within the 14 days before the present episode."} ;; "the patient has a history of treatment with quinine within the 14 days before the present episode"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_history_of_treatment_with_mefloquine_within_last_60_days)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with mefloquine within the last 60 days."

(assert
(! (not patient_has_history_of_treatment_with_chloroquine_within_14_days_before_present_episode)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with chloroquine within the 14 days before the present episode."

(assert
(! (not patient_has_history_of_treatment_with_primaquine_within_14_days_before_present_episode)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with primaquine within the 14 days before the present episode."

(assert
(! (not patient_has_history_of_treatment_with_quinine_within_14_days_before_present_episode)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of treatment with quinine within the 14 days before the present episode."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_diagnosis_of_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of any disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of any disease in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of any disease in their medical history.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any disease in their medical history."} ;; "disease"
(declare-const patient_has_diagnosis_of_neuropsychiatric_disease_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of any neuropsychiatric disease at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of any neuropsychiatric disease in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of any neuropsychiatric disease in their medical history.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of any neuropsychiatric disease in their medical history."} ;; "history of neuropsychiatric disease"

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
(! (not patient_has_diagnosis_of_neuropsychiatric_disease_inthehistory)
    :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of neuropsychiatric disease."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_hypersensitivity_to_artemisinin_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity (allergic) reaction to artemisinin at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity (allergic) reaction to artemisinin at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity (allergic) reaction to artemisinin.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity (allergic) reaction to artemisinin at any time in their medical history."} ;; "the patient has a history of hypersensitivity reaction to artemisinin"
(declare-const patient_has_finding_of_allergy_to_mefloquine_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a hypersensitivity (allergic) reaction to mefloquine at any point in their medical history.","when_to_set_to_false":"Set to false if the patient has never had a hypersensitivity (allergic) reaction to mefloquine at any point in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a hypersensitivity (allergic) reaction to mefloquine.","meaning":"Boolean indicating whether the patient has ever had a hypersensitivity (allergic) reaction to mefloquine at any time in their medical history."} ;; "the patient has a history of hypersensitivity reaction to mefloquine"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (not patient_has_hypersensitivity_to_artemisinin_inthehistory)
     :named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity reaction to artemisinin."

(assert
  (! (not patient_has_finding_of_allergy_to_mefloquine_inthehistory)
     :named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of hypersensitivity reaction to mefloquine."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_undergone_splenectomy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a splenectomy at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never undergone a splenectomy at any time in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a splenectomy.","meaning":"Boolean indicating whether the patient has ever undergone a splenectomy in their medical history."} ;; "splenectomy"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
  (! (not patient_has_undergone_splenectomy_inthehistory)
     :named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a history of splenectomy."
