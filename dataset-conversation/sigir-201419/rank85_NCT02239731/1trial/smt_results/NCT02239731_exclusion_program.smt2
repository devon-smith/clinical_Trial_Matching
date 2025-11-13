;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_allergy_to_doxycycline_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction to doxycycline at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction to doxycycline in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction to doxycycline.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction to doxycycline in their history."} ;; "the patient has a prior allergic reaction to doxycycline"

(declare-const patient_has_finding_of_allergy_to_tetracycline_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction to any tetracycline at any time in their medical history.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction to any tetracycline in their medical history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction to any tetracycline.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction to any tetracycline in their history."} ;; "the patient has a prior allergic reaction to other tetracyclines"

(declare-const patient_has_finding_of_severe_intolerance_to_doxycycline_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a severe intolerance to doxycycline at any time in their medical history prior to trial enrollment.","when_to_set_to_false":"Set to false if the patient has never had a severe intolerance to doxycycline in their medical history prior to trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a severe intolerance to doxycycline prior to trial enrollment.","meaning":"Boolean indicating whether the patient has ever had a severe intolerance to doxycycline at any time in their medical history prior to trial enrollment."} ;; "the patient has a prior severe intolerance to doxycycline"

(declare-const patient_has_finding_of_severe_intolerance_to_tetracycline_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a severe intolerance to any tetracycline at any time in their medical history prior to trial enrollment.","when_to_set_to_false":"Set to false if the patient has never had a severe intolerance to any tetracycline in their medical history prior to trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a severe intolerance to any tetracycline prior to trial enrollment.","meaning":"Boolean indicating whether the patient has ever had a severe intolerance to any tetracycline at any time in their medical history prior to trial enrollment."} ;; "the patient has a prior severe intolerance to other tetracyclines"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not patient_has_finding_of_allergy_to_doxycycline_inthehistory)
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior allergic reaction to doxycycline."

(assert
(! (not patient_has_finding_of_allergy_to_tetracycline_inthehistory)
:named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior allergic reaction to other tetracyclines."

(assert
(! (not patient_has_finding_of_severe_intolerance_to_doxycycline_inthehistory)
:named REQ0_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior severe intolerance to doxycycline."

(assert
(! (not patient_has_finding_of_severe_intolerance_to_tetracycline_inthehistory)
:named REQ0_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior severe intolerance to other tetracyclines."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_finding_of_allergy_to_soy_protein_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction to soy protein at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction to soy protein prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction to soy protein prior to now.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction to soy protein at any time in the past."} ;; "the patient has a prior allergic reaction to soy"
(declare-const patient_has_finding_of_allergy_to_coconut_oil_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had an allergic reaction to coconut oil at any time prior to now.","when_to_set_to_false":"Set to false if the patient has never had an allergic reaction to coconut oil prior to now.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had an allergic reaction to coconut oil prior to now.","meaning":"Boolean indicating whether the patient has ever had an allergic reaction to coconut oil at any time in the past."} ;; "the patient has a prior allergic reaction to coconut oil"
(declare-const patient_has_finding_of_severe_intolerance_to_soy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a severe intolerance to soy at any time prior to trial enrollment.","when_to_set_to_false":"Set to false if the patient has never had a severe intolerance to soy prior to trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a severe intolerance to soy prior to trial enrollment.","meaning":"Boolean indicating whether the patient has ever had a severe intolerance to soy at any time prior to trial enrollment."} ;; "the patient has a prior severe intolerance to soy"
(declare-const patient_has_finding_of_severe_intolerance_to_coconut_oil_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a severe intolerance to coconut oil at any time prior to trial enrollment.","when_to_set_to_false":"Set to false if the patient has never had a severe intolerance to coconut oil prior to trial enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a severe intolerance to coconut oil prior to trial enrollment.","meaning":"Boolean indicating whether the patient has ever had a severe intolerance to coconut oil at any time prior to trial enrollment."} ;; "the patient has a prior severe intolerance to coconut oil"

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_finding_of_allergy_to_soy_protein_inthehistory)
:named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior allergic reaction to soy."

(assert
(! (not patient_has_finding_of_allergy_to_coconut_oil_inthehistory)
:named REQ1_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior allergic reaction to coconut oil."

(assert
(! (not patient_has_finding_of_severe_intolerance_to_soy_inthehistory)
:named REQ1_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior severe intolerance to soy."

(assert
(! (not patient_has_finding_of_severe_intolerance_to_coconut_oil_inthehistory)
:named REQ1_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a prior severe intolerance to coconut oil."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous metastases (secondary malignant neoplasm of skin) at any location.","when_to_set_to_false":"Set to false if the patient currently does not have cutaneous metastases (secondary malignant neoplasm of skin) at any location.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has cutaneous metastases (secondary malignant neoplasm of skin).","meaning":"Boolean indicating whether the patient currently has cutaneous metastases (secondary malignant neoplasm of skin) at any location."} ;; "cutaneous metastases"

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now@@located_on_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous metastases (secondary malignant neoplasm of skin) and those metastases are located on the face.","when_to_set_to_false":"Set to false if the patient currently has cutaneous metastases but they are not located on the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cutaneous metastases are located on the face.","meaning":"Boolean indicating whether the patient's cutaneous metastases are located on the face."} ;; "cutaneous metastases on the face"

(declare-const patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now@@might_spread_to_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has cutaneous metastases (secondary malignant neoplasm of skin) and those metastases might spread to the face.","when_to_set_to_false":"Set to false if the patient currently has cutaneous metastases but they do not have a possibility of spreading to the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the cutaneous metastases might spread to the face.","meaning":"Boolean indicating whether the patient's cutaneous metastases might spread to the face."} ;; "cutaneous metastases that might spread to the face"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now@@located_on_face
      patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now)
:named REQ2_AUXILIARY0)) ;; "cutaneous metastases on the face"

(assert
(! (=> patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now@@might_spread_to_face
      patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now)
:named REQ2_AUXILIARY1)) ;; "cutaneous metastases that might spread to the face"

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now@@located_on_face)
:named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cutaneous metastases on the face."

(assert
(! (not patient_has_finding_of_secondary_malignant_neoplasm_of_skin_now@@might_spread_to_face)
:named REQ2_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has cutaneous metastases that might spread to the face."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_has_finding_of_active_skin_disease_now@@at_application_site_on_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has any active skin disease present at the application site located on the face.","when_to_set_to_false":"Set to false if the patient currently does not have any active skin disease present at the application site located on the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has any active skin disease present at the application site located on the face.","meaning":"Boolean indicating whether the patient currently has any active skin disease present at the application site located on the face."} ;; "any active skin disease ... at the application site located on the face"
(declare-const patient_has_finding_of_eczema_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has eczema.","when_to_set_to_false":"Set to false if the patient currently does not have eczema.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has eczema.","meaning":"Boolean indicating whether the patient currently has eczema."} ;; "eczema"
(declare-const patient_has_finding_of_eczema_now@@active Bool) ;; {"when_to_set_to_true":"Set to true if the patient's eczema is active.","when_to_set_to_false":"Set to false if the patient's eczema is not active.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's eczema is active.","meaning":"Boolean indicating whether the patient's eczema is active."} ;; "eczema is active"
(declare-const patient_has_finding_of_eczema_now@@at_application_site_on_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient's eczema is present at the application site located on the face.","when_to_set_to_false":"Set to false if the patient's eczema is not present at the application site located on the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's eczema is present at the application site located on the face.","meaning":"Boolean indicating whether the patient's eczema is present at the application site located on the face."} ;; "eczema ... at the application site located on the face"
(declare-const patient_has_finding_of_tattoo_of_skin_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has tattoos of skin.","when_to_set_to_false":"Set to false if the patient currently does not have tattoos of skin.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has tattoos of skin.","meaning":"Boolean indicating whether the patient currently has tattoos of skin."} ;; "tattoos"
(declare-const patient_has_finding_of_tattoo_of_skin_now@@at_application_site_on_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient's tattoos of skin are present at the application site located on the face.","when_to_set_to_false":"Set to false if the patient's tattoos of skin are not present at the application site located on the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's tattoos of skin are present at the application site located on the face.","meaning":"Boolean indicating whether the patient's tattoos of skin are present at the application site located on the face."} ;; "tattoos ... at the application site located on the face"
(declare-const patient_has_other_problem_at_application_site_on_face_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has other problems at the application site located on the face.","when_to_set_to_false":"Set to false if the patient currently does not have other problems at the application site located on the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has other problems at the application site located on the face.","meaning":"Boolean indicating whether the patient currently has other problems at the application site located on the face."} ;; "other problems at the application site located on the face"
(declare-const patient_has_other_problem_at_application_site_on_face_now@@could_confound_evaluation_of_rash_or_make_topical_application_unacceptable_in_investigator_opinion Bool) ;; {"when_to_set_to_true":"Set to true if, in the investigator's opinion, the patient's other problems at the application site located on the face could confound the evaluation of the rash or make topical application unacceptable.","when_to_set_to_false":"Set to false if, in the investigator's opinion, the patient's other problems at the application site located on the face could not confound the evaluation of the rash and would not make topical application unacceptable.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether, in the investigator's opinion, the patient's other problems at the application site located on the face could confound the evaluation of the rash or make topical application unacceptable.","meaning":"Boolean indicating whether, in the investigator's opinion, the patient's other problems at the application site located on the face could confound the evaluation of the rash or make topical application unacceptable."} ;; "other problems ... that, in the investigator's opinion, could confound the evaluation of the rash OR make topical application unacceptable"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Non-exhaustive example: eczema at the application site on the face implies active skin disease at the application site on the face
(assert
(! (=> patient_has_finding_of_eczema_now@@at_application_site_on_face
       patient_has_finding_of_active_skin_disease_now@@at_application_site_on_face)
:named REQ3_AUXILIARY0)) ;; "with non-exhaustive examples (eczema) at the application site located on the face"

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_eczema_now@@active
       patient_has_finding_of_eczema_now)
:named REQ3_AUXILIARY1)) ;; "eczema is active"

(assert
(! (=> patient_has_finding_of_eczema_now@@at_application_site_on_face
       patient_has_finding_of_eczema_now)
:named REQ3_AUXILIARY2)) ;; "eczema ... at the application site located on the face"

(assert
(! (=> patient_has_finding_of_tattoo_of_skin_now@@at_application_site_on_face
       patient_has_finding_of_tattoo_of_skin_now)
:named REQ3_AUXILIARY3)) ;; "tattoos ... at the application site located on the face"

(assert
(! (=> patient_has_other_problem_at_application_site_on_face_now@@could_confound_evaluation_of_rash_or_make_topical_application_unacceptable_in_investigator_opinion
       patient_has_other_problem_at_application_site_on_face_now)
:named REQ3_AUXILIARY4)) ;; "other problems ... that, in the investigator's opinion, could confound the evaluation of the rash OR make topical application unacceptable"

;; ===================== Constraint Assertions (REQ 3) =====================
;; Exclusion 1: any active skin disease at the application site on the face
(assert
(! (not patient_has_finding_of_active_skin_disease_now@@at_application_site_on_face)
:named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has any active skin disease with non-exhaustive examples (eczema) at the application site located on the face."

;; Exclusion 2: tattoos at the application site on the face
(assert
(! (not patient_has_finding_of_tattoo_of_skin_now@@at_application_site_on_face)
:named REQ3_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has tattoos at the application site located on the face."

;; Exclusion 3: other problems at the application site on the face that, in the investigator's opinion, could confound the evaluation of the rash OR make topical application unacceptable
(assert
(! (not patient_has_other_problem_at_application_site_on_face_now@@could_confound_evaluation_of_rash_or_make_topical_application_unacceptable_in_investigator_opinion)
:named REQ3_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has other problems at the application site located on the face that, in the investigator's opinion, could confound the evaluation of the rash OR make topical application unacceptable."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_hair_on_face_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hair on the face, including but not limited to beard.","when_to_set_to_false":"Set to false if the patient currently does not have hair on the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hair on the face.","meaning":"Boolean indicating whether the patient currently has hair on the face (including but not limited to beard)."} ;; "the patient has hair on the face (including but not limited to beard)"
(declare-const patient_has_hair_on_face_now@@would_interfere_with_application_or_evaluation_of_study_drug Bool) ;; {"when_to_set_to_true":"Set to true if the patient's hair on the face would interfere with the application of the study drug or the evaluation of the study drug.","when_to_set_to_false":"Set to false if the patient's hair on the face would not interfere with the application of the study drug or the evaluation of the study drug.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's hair on the face would interfere with the application or evaluation of the study drug.","meaning":"Boolean indicating whether the patient's hair on the face would interfere with the application of the study drug or the evaluation of the study drug."} ;; "hair on the face ... which would interfere with the application of the study drug or the evaluation of the study drug"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive example: beard is only an example of hair on the face
;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_hair_on_face_now@@would_interfere_with_application_or_evaluation_of_study_drug
       patient_has_hair_on_face_now)
   :named REQ4_AUXILIARY0)) ;; "hair on the face ... which would interfere with the application of the study drug or the evaluation of the study drug"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_hair_on_face_now@@would_interfere_with_application_or_evaluation_of_study_drug)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has hair on the face ... which would interfere with the application of the study drug OR the evaluation of the study drug)."
