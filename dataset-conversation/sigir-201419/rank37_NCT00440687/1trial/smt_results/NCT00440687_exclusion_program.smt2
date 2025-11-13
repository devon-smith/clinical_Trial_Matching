;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_asthma_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of asthma at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of asthma at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of asthma.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of asthma."} ;; "the patient has a clear history of asthma"
(declare-const patient_has_diagnosis_of_bronchiectasis_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of bronchiectasis at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of bronchiectasis at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of bronchiectasis.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of bronchiectasis."} ;; "the patient has a clear history of bronchiectasis"
(declare-const patient_has_diagnosis_of_carcinoma_of_bronchus_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of carcinoma of bronchus at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of carcinoma of bronchus at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of carcinoma of bronchus.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of carcinoma of bronchus."} ;; "the patient has a clear history of carcinoma of bronchus"
(declare-const patient_has_diagnosis_of_disorder_of_respiratory_system_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder of respiratory system (respiratory disease) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of disorder of respiratory system (respiratory disease) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of disorder of respiratory system (respiratory disease).","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder of respiratory system (respiratory disease)."} ;; "the patient has a clear history of other significant respiratory disease"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_diagnosis_of_asthma_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clear history of asthma."

(assert
(! (not patient_has_diagnosis_of_bronchiectasis_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clear history of bronchiectasis."

(assert
(! (not patient_has_diagnosis_of_carcinoma_of_bronchus_inthehistory)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clear history of carcinoma of bronchus."

(assert
(! (not patient_has_diagnosis_of_disorder_of_respiratory_system_inthehistory)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a clear history of other significant respiratory disease."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_inability_to_give_informed_consent_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has an inability to give informed consent.","when_to_set_to_false":"Set to false if the patient currently does not have an inability to give informed consent.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has an inability to give informed consent.","meaning":"Boolean indicating whether the patient currently has an inability to give informed consent."} ;; "the patient has an inability to give informed consent"

(declare-const patient_has_finding_of_mental_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of mental disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of mental disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of mental disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of mental disorder."} ;; "the patient has mental illness"

(declare-const patient_has_finding_of_mental_disorder_now@@severity_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of mental disorder and the disorder is severe.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis or finding of mental disorder but it is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the mental disorder is severe.","meaning":"Boolean indicating whether the patient's current mental disorder is severe."} ;; "the patient has severe mental illness"

(declare-const patient_has_finding_of_developmental_academic_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of developmental or academic disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of developmental or academic disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of developmental or academic disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of developmental or academic disorder."} ;; "the patient has mental handicap"

(declare-const patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis or finding of traumatic and/or non-traumatic brain injury.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis or finding of traumatic and/or non-traumatic brain injury.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis or finding of traumatic and/or non-traumatic brain injury.","meaning":"Boolean indicating whether the patient currently has a diagnosis or finding of traumatic and/or non-traumatic brain injury."} ;; "the patient has brain damage"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_mental_disorder_now@@severity_severe
           patient_has_finding_of_developmental_academic_disorder_now
           patient_has_finding_of_traumatic_and_or_non_traumatic_brain_injury_now)
       patient_has_inability_to_give_informed_consent_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples ((the patient has severe mental illness) OR (the patient has mental handicap) OR (the patient has brain damage))."

;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_finding_of_mental_disorder_now@@severity_severe
       patient_has_finding_of_mental_disorder_now)
   :named REQ1_AUXILIARY1)) ;; "the patient has severe mental illness" implies "the patient has mental illness"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_inability_to_give_informed_consent_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has an inability to give informed consent (with non-exhaustive examples: severe mental illness, mental handicap, or brain damage)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_recorded_exacerbation_within_last_1_month Bool) ;; {"when_to_set_to_true":"Set to true if the patient has had a recorded exacerbation that occurred within the last one month.","when_to_set_to_false":"Set to false if the patient has not had a recorded exacerbation that occurred within the last one month.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has had a recorded exacerbation within the last one month.","meaning":"Boolean indicating whether the patient has had a recorded exacerbation within the last one month."} ;; "the patient has had a recorded exacerbation within the last one month"
(declare-const recorded_exacerbation_within_last_1_month_has_required_antibiotics Bool) ;; {"when_to_set_to_true":"Set to true if a recorded exacerbation within the last one month has required antibiotics.","when_to_set_to_false":"Set to false if a recorded exacerbation within the last one month has not required antibiotics.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a recorded exacerbation within the last one month has required antibiotics.","meaning":"Boolean indicating whether a recorded exacerbation within the last one month has required antibiotics."} ;; "the recorded exacerbation has required antibiotics"
(declare-const recorded_exacerbation_within_last_1_month_has_required_steroids Bool) ;; {"when_to_set_to_true":"Set to true if a recorded exacerbation within the last one month has required steroids.","when_to_set_to_false":"Set to false if a recorded exacerbation within the last one month has not required steroids.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether a recorded exacerbation within the last one month has required steroids.","meaning":"Boolean indicating whether a recorded exacerbation within the last one month has required steroids."} ;; "the recorded exacerbation has required steroids"

;; ===================== Constraint Assertions (REQ 2) =====================
;; Exclusion: patient must NOT have had a recorded exacerbation within the last one month that required antibiotics
(assert
(! (not (and patient_has_recorded_exacerbation_within_last_1_month
             recorded_exacerbation_within_last_1_month_has_required_antibiotics))
    :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a recorded exacerbation within the last one month AND the recorded exacerbation has required antibiotics)."

;; Exclusion: patient must NOT have had a recorded exacerbation within the last one month that required steroids
(assert
(! (not (and patient_has_recorded_exacerbation_within_last_1_month
             recorded_exacerbation_within_last_1_month_has_required_steroids))
    :named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has had a recorded exacerbation within the last one month AND the recorded exacerbation has required steroids)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_never_smoked_tobacco_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently classified as a never smoker (has never smoked tobacco).","when_to_set_to_false":"Set to false if the patient is currently not classified as a never smoker (has smoked tobacco in the past or currently smokes).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is classified as a never smoker.","meaning":"Boolean indicating whether the patient is currently classified as a never smoker (has never smoked tobacco)."} ;; "never smoker"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_has_finding_of_never_smoked_tobacco_now)
    :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is classified as a never smoker."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to a specific allergen.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to a specific allergen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to a specific allergen.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to a specific allergen."} ;; "skin allergy"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to a specific allergen and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to a specific allergen but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to a specific allergen and the result is strongly positive."} ;; "strongly positive skin allergy result"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_house_dust_mite Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to house dust mite and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to house dust mite but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive for house dust mite.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to house dust mite and the result is strongly positive."} ;; "strongly positive skin allergy result to house dust mite"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@to_house_dust_mite Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to house dust mite.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to house dust mite.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to house dust mite.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to house dust mite."} ;; "skin allergy to house dust mite"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_grass Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to grass and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to grass but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive for grass.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to grass and the result is strongly positive."} ;; "strongly positive skin allergy result to grass"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@to_grass Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to grass.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to grass.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to grass.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to grass."} ;; "skin allergy to grass"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_tree Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to tree and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to tree but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive for tree.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to tree and the result is strongly positive."} ;; "strongly positive skin allergy result to tree"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@to_tree Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to tree.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to tree.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to tree.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to tree."} ;; "skin allergy to tree"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_aspergillus Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to aspergillus and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to aspergillus but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive for aspergillus.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to aspergillus and the result is strongly positive."} ;; "strongly positive skin allergy result to aspergillus"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@to_aspergillus Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to aspergillus.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to aspergillus.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to aspergillus.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to aspergillus."} ;; "skin allergy to aspergillus"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_cat Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to cat and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to cat but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive for cat.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to cat and the result is strongly positive."} ;; "strongly positive skin allergy result to cat"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@to_cat Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to cat.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to cat.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to cat.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to cat."} ;; "skin allergy to cat"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_dog Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to dog and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to dog but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive for dog.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to dog and the result is strongly positive."} ;; "strongly positive skin allergy result to dog"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@to_dog Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to dog.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to dog.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to dog.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to dog."} ;; "skin allergy to dog"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_weed Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to weed and the result is strongly positive.","when_to_set_to_false":"Set to false if the patient currently has cutaneous hypersensitivity (skin allergy) to weed but the result is not strongly positive.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the result is strongly positive for weed.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to weed and the result is strongly positive."} ;; "strongly positive skin allergy result to weed"

(declare-const patient_has_finding_of_cutaneous_hypersensitivity_now@@to_weed Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous hypersensitivity (skin allergy) to weed.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous hypersensitivity (skin allergy) to weed.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous hypersensitivity (skin allergy) to weed.","meaning":"Boolean indicating whether the patient currently has cutaneous hypersensitivity (skin allergy) to weed."} ;; "skin allergy to weed"

(declare-const patient_negative_control_weal_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for the negative control is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal for the negative control measured now, in millimeters."} ;; "skin weal diameter for negative control"

(declare-const patient_weal_value_recorded_now_withunit_millimeter Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for a specific allergen is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for a specific allergen."} ;; "skin weal diameter for allergen"

(declare-const patient_weal_value_recorded_now_withunit_millimeter@@to_house_dust_mite Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for house dust mite is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for house dust mite."} ;; "skin weal diameter for house dust mite"

(declare-const patient_weal_value_recorded_now_withunit_millimeter@@to_grass Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for grass is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for grass."} ;; "skin weal diameter for grass"

(declare-const patient_weal_value_recorded_now_withunit_millimeter@@to_tree Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for tree is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for tree."} ;; "skin weal diameter for tree"

(declare-const patient_weal_value_recorded_now_withunit_millimeter@@to_aspergillus Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for aspergillus is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for aspergillus."} ;; "skin weal diameter for aspergillus"

(declare-const patient_weal_value_recorded_now_withunit_millimeter@@to_cat Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for cat is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for cat."} ;; "skin weal diameter for cat"

(declare-const patient_weal_value_recorded_now_withunit_millimeter@@to_dog Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for dog is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for dog."} ;; "skin weal diameter for dog"

(declare-const patient_weal_value_recorded_now_withunit_millimeter@@to_weed Real) ;; {"when_to_set_to_value":"Set to the measured diameter in millimeters if a skin weal measurement for weed is available now.","when_to_set_to_null":"Set to null if no such measurement is available or the value is indeterminate.","meaning":"Numeric value representing the diameter of the skin weal measured now, in millimeters, for weed."} ;; "skin weal diameter for weed"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Definition of "strongly positive skin allergy result" for each allergen: skin weal diameter > 10mm greater than negative control
(assert
(! (= patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_house_dust_mite
     (and patient_has_finding_of_cutaneous_hypersensitivity_now@@to_house_dust_mite
          (> (- patient_weal_value_recorded_now_withunit_millimeter@@to_house_dust_mite patient_negative_control_weal_value_recorded_now_withunit_millimeter) 10)))
:named REQ4_AUXILIARY0)) ;; "strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to house dust mite"

(assert
(! (= patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_grass
     (and patient_has_finding_of_cutaneous_hypersensitivity_now@@to_grass
          (> (- patient_weal_value_recorded_now_withunit_millimeter@@to_grass patient_negative_control_weal_value_recorded_now_withunit_millimeter) 10)))
:named REQ4_AUXILIARY1)) ;; "strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to grass"

(assert
(! (= patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_tree
     (and patient_has_finding_of_cutaneous_hypersensitivity_now@@to_tree
          (> (- patient_weal_value_recorded_now_withunit_millimeter@@to_tree patient_negative_control_weal_value_recorded_now_withunit_millimeter) 10)))
:named REQ4_AUXILIARY2)) ;; "strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to tree"

(assert
(! (= patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_aspergillus
     (and patient_has_finding_of_cutaneous_hypersensitivity_now@@to_aspergillus
          (> (- patient_weal_value_recorded_now_withunit_millimeter@@to_aspergillus patient_negative_control_weal_value_recorded_now_withunit_millimeter) 10)))
:named REQ4_AUXILIARY3)) ;; "strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to aspergillus"

(assert
(! (= patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_cat
     (and patient_has_finding_of_cutaneous_hypersensitivity_now@@to_cat
          (> (- patient_weal_value_recorded_now_withunit_millimeter@@to_cat patient_negative_control_weal_value_recorded_now_withunit_millimeter) 10)))
:named REQ4_AUXILIARY4)) ;; "strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to cat"

(assert
(! (= patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_dog
     (and patient_has_finding_of_cutaneous_hypersensitivity_now@@to_dog
          (> (- patient_weal_value_recorded_now_withunit_millimeter@@to_dog patient_negative_control_weal_value_recorded_now_withunit_millimeter) 10)))
:named REQ4_AUXILIARY5)) ;; "strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to dog"

(assert
(! (= patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_weed
     (and patient_has_finding_of_cutaneous_hypersensitivity_now@@to_weed
          (> (- patient_weal_value_recorded_now_withunit_millimeter@@to_weed patient_negative_control_weal_value_recorded_now_withunit_millimeter) 10)))
:named REQ4_AUXILIARY6)) ;; "strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to weed"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_house_dust_mite
       patient_has_finding_of_cutaneous_hypersensitivity_now@@to_house_dust_mite)
:named REQ4_AUXILIARY7)) ;; "strongly positive result to house dust mite implies skin allergy to house dust mite"

(assert
(! (=> patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_grass
       patient_has_finding_of_cutaneous_hypersensitivity_now@@to_grass)
:named REQ4_AUXILIARY8)) ;; "strongly positive result to grass implies skin allergy to grass"

(assert
(! (=> patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_tree
       patient_has_finding_of_cutaneous_hypersensitivity_now@@to_tree)
:named REQ4_AUXILIARY9)) ;; "strongly positive result to tree implies skin allergy to tree"

(assert
(! (=> patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_aspergillus
       patient_has_finding_of_cutaneous_hypersensitivity_now@@to_aspergillus)
:named REQ4_AUXILIARY10)) ;; "strongly positive result to aspergillus implies skin allergy to aspergillus"

(assert
(! (=> patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_cat
       patient_has_finding_of_cutaneous_hypersensitivity_now@@to_cat)
:named REQ4_AUXILIARY11)) ;; "strongly positive result to cat implies skin allergy to cat"

(assert
(! (=> patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_dog
       patient_has_finding_of_cutaneous_hypersensitivity_now@@to_dog)
:named REQ4_AUXILIARY12)) ;; "strongly positive result to dog implies skin allergy to dog"

(assert
(! (=> patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_weed
       patient_has_finding_of_cutaneous_hypersensitivity_now@@to_weed)
:named REQ4_AUXILIARY13)) ;; "strongly positive result to weed implies skin allergy to weed"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_house_dust_mite)
:named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to house dust mite."

(assert
(! (not patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_grass)
:named REQ4_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to grass."

(assert
(! (not patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_tree)
:named REQ4_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to tree."

(assert
(! (not patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_aspergillus)
:named REQ4_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to aspergillus."

(assert
(! (not patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_cat)
:named REQ4_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to cat."

(assert
(! (not patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_dog)
:named REQ4_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to dog."

(assert
(! (not patient_has_finding_of_cutaneous_hypersensitivity_now@@strongly_positive_result@@to_weed)
:named REQ4_COMPONENT6_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a strongly positive skin allergy result (skin weal diameter greater than ten millimeters greater than negative control) to weed."
