;; ===================== Declarations for the exclusion criterion (REQ 0) =====================
(declare-const patient_has_finding_of_disorder_due_to_infection_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a disorder due to infection.","when_to_set_to_false":"Set to false if the patient currently does not have a disorder due to infection.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a disorder due to infection.","meaning":"Boolean indicating whether the patient currently has a disorder due to infection."} ;; "infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@is_severe Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is severe.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is not severe.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection is severe.","meaning":"Boolean indicating whether the patient's current disorder due to infection is severe."} ;; "severe infection"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@requires_surgical_treatment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection requires surgical treatment.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection does not require surgical treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection requires surgical treatment.","meaning":"Boolean indicating whether the patient's current disorder due to infection requires surgical treatment."} ;; "requires surgical treatment"
(declare-const patient_has_finding_of_fever_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has fever.","when_to_set_to_false":"Set to false if the patient currently does not have fever.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has fever.","meaning":"Boolean indicating whether the patient currently has fever."} ;; "fever"
(declare-const patient_has_finding_of_fever_now@@associated_with_swelling_of_face Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current fever is associated with swelling of the face.","when_to_set_to_false":"Set to false if the patient's current fever is not associated with swelling of the face.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current fever is associated with swelling of the face.","meaning":"Boolean indicating whether the patient's current fever is associated with swelling of the face."} ;; "fever associated with swelling of the face"
(declare-const patient_has_finding_of_nasal_obstruction_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has nasal obstruction.","when_to_set_to_false":"Set to false if the patient currently does not have nasal obstruction.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has nasal obstruction.","meaning":"Boolean indicating whether the patient currently has nasal obstruction."} ;; "nasal obstruction"
(declare-const patient_has_finding_of_nasal_obstruction_now@@is_almost_full Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current nasal obstruction is almost full.","when_to_set_to_false":"Set to false if the patient's current nasal obstruction is not almost full.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current nasal obstruction is almost full.","meaning":"Boolean indicating whether the patient's current nasal obstruction is almost full."} ;; "almost full nasal obstruction"
(declare-const patient_has_finding_of_nasal_obstruction_now@@due_to_large_nasal_polyp Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current nasal obstruction is due to a large nasal polyp.","when_to_set_to_false":"Set to false if the patient's current nasal obstruction is not due to a large nasal polyp.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current nasal obstruction is due to a large nasal polyp.","meaning":"Boolean indicating whether the patient's current nasal obstruction is due to a large nasal polyp."} ;; "nasal obstruction due to a large nasal polyp"
(declare-const patient_has_finding_of_symptom_generalized_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has generalized systemic symptoms.","when_to_set_to_false":"Set to false if the patient currently does not have generalized systemic symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has generalized systemic symptoms.","meaning":"Boolean indicating whether the patient currently has generalized systemic symptoms."} ;; "systemic symptoms"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_symptom_generalized_now
          patient_has_finding_of_fever_now@@associated_with_swelling_of_face
          (and patient_has_finding_of_nasal_obstruction_now@@is_almost_full
               patient_has_finding_of_nasal_obstruction_now@@due_to_large_nasal_polyp))
     (and patient_has_finding_of_disorder_due_to_infection_now@@is_severe
          patient_has_finding_of_disorder_due_to_infection_now@@requires_surgical_treatment))
:named REQ0_AUXILIARY0)) ;; "with non-exhaustive examples (systemic symptoms such as fever associated with swelling of the face, or almost full nasal obstruction due to a large nasal polyp)."

;; Qualifier variables imply corresponding stem variables
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@is_severe
       patient_has_finding_of_disorder_due_to_infection_now)
:named REQ0_AUXILIARY1)) ;; "severe infection"

(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@requires_surgical_treatment
       patient_has_finding_of_disorder_due_to_infection_now)
:named REQ0_AUXILIARY2)) ;; "requires surgical treatment"

(assert
(! (=> patient_has_finding_of_fever_now@@associated_with_swelling_of_face
       patient_has_finding_of_fever_now)
:named REQ0_AUXILIARY3)) ;; "fever associated with swelling of the face"

(assert
(! (=> patient_has_finding_of_nasal_obstruction_now@@is_almost_full
       patient_has_finding_of_nasal_obstruction_now)
:named REQ0_AUXILIARY4)) ;; "almost full nasal obstruction"

(assert
(! (=> patient_has_finding_of_nasal_obstruction_now@@due_to_large_nasal_polyp
       patient_has_finding_of_nasal_obstruction_now)
:named REQ0_AUXILIARY5)) ;; "nasal obstruction due to a large nasal polyp"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@is_severe
             patient_has_finding_of_disorder_due_to_infection_now@@requires_surgical_treatment))
:named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a severe infection that requires surgical treatment, with non-exhaustive examples (systemic symptoms such as fever associated with swelling of the face, or almost full nasal obstruction due to a large nasal polyp)."

;; ===================== Declarations for the exclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_acute_mastoiditis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute mastoiditis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute mastoiditis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute mastoiditis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute mastoiditis."} ;; "acute mastoiditis"
(declare-const patient_has_diagnosis_of_bacterial_meningitis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of bacterial meningitis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of bacterial meningitis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of bacterial meningitis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of bacterial meningitis."} ;; "bacterial meningitis"
(declare-const patient_has_diagnosis_of_facial_palsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of facial palsy.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of facial palsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of facial palsy.","meaning":"Boolean indicating whether the patient currently has a diagnosis of facial palsy."} ;; "facial palsy"
(declare-const patient_has_diagnosis_of_intracranial_tumor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of intracranial tumor.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of intracranial tumor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of intracranial tumor.","meaning":"Boolean indicating whether the patient currently has a diagnosis of intracranial tumor."} ;; "brain tumor"
(declare-const patient_has_serious_complication_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious complication, including but not limited to acute mastoiditis, facial palsy, bacterial meningitis, or brain tumor.","when_to_set_to_false":"Set to false if the patient currently does not have any serious complication.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious complication.","meaning":"Boolean indicating whether the patient currently has a serious complication, including but not limited to acute mastoiditis, facial palsy, bacterial meningitis, or brain tumor."} ;; "serious complication"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_diagnosis_of_acute_mastoiditis_now
           patient_has_diagnosis_of_facial_palsy_now
           patient_has_diagnosis_of_bacterial_meningitis_now
           patient_has_diagnosis_of_intracranial_tumor_now)
        patient_has_serious_complication_now)
   :named REQ1_AUXILIARY0)) ;; "with non-exhaustive examples (acute mastoiditis, facial palsy, bacterial meningitis, brain tumor)."

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
(! (not patient_has_serious_complication_now)
   :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious complication with non-exhaustive examples (acute mastoiditis, facial palsy, bacterial meningitis, brain tumor)."

;; ===================== Declarations for the exclusion criterion (REQ 2) =====================
(declare-const patient_has_finding_of_congenital_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a congenital disease (any type, including but not limited to maxillofacial dysplasia).","when_to_set_to_false":"Set to false if the patient currently does not have any congenital disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a congenital disease.","meaning":"Boolean indicating whether the patient currently has a congenital disease."} ;; "congenital disorder"
(declare-const patient_has_finding_of_maxillofacial_dysplasia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has maxillofacial dysplasia.","when_to_set_to_false":"Set to false if the patient currently does not have maxillofacial dysplasia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has maxillofacial dysplasia.","meaning":"Boolean indicating whether the patient currently has maxillofacial dysplasia."} ;; "maxillofacial dysplasia"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> patient_has_finding_of_maxillofacial_dysplasia_now
      patient_has_finding_of_congenital_disease_now)
   :named REQ2_AUXILIARY0)) ;; "with non-exhaustive examples (maxillofacial dysplasia)."

;; ===================== Constraint Assertions (REQ 2) =====================
(assert
(! (not patient_has_finding_of_congenital_disease_now)
   :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a congenital disorder with non-exhaustive examples (maxillofacial dysplasia)."

;; ===================== Declarations for the exclusion criterion (REQ 3) =====================
(declare-const patient_needs_concomitant_use_of_other_antibiotics_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently needs to use other antibiotics concomitantly with another medication or treatment.","when_to_set_to_false":"Set to false if the patient does not currently need to use other antibiotics concomitantly with another medication or treatment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently needs to use other antibiotics concomitantly with another medication or treatment.","meaning":"Boolean indicating whether the patient currently needs to use other antibiotics concomitantly (i.e., at the same time as another medication or treatment)."} ;; "needs concomitant use of other antibiotics."
(declare-const patient_needs_concomitant_use_of_other_antibiotics_now@@concomitant_with_other_medications Bool) ;; {"when_to_set_to_true":"Set to true if the patient's need for other antibiotics is specifically for concomitant use with other medications.","when_to_set_to_false":"Set to false if the patient's need for other antibiotics is not for concomitant use with other medications.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's need for other antibiotics is for concomitant use with other medications.","meaning":"Boolean indicating whether the patient's need for other antibiotics is specifically for concomitant use with other medications."} ;; "concomitant with other medications"

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_needs_concomitant_use_of_other_antibiotics_now@@concomitant_with_other_medications
      patient_needs_concomitant_use_of_other_antibiotics_now)
   :named REQ3_AUXILIARY0)) ;; "concomitant with other medications" implies "needs concomitant use of other antibiotics."

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
(! (not patient_needs_concomitant_use_of_other_antibiotics_now)
   :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs concomitant use of other antibiotics."

;; ===================== Declarations for the exclusion criterion (REQ 4) =====================
(declare-const patient_has_finding_of_heart_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has heart disease (cardiac disease).","when_to_set_to_false":"Set to false if the patient currently does not have heart disease (cardiac disease).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has heart disease (cardiac disease).","meaning":"Boolean indicating whether the patient currently has heart disease (cardiac disease)."} ;; "cardiac disease"
(declare-const patient_has_finding_of_malignant_neoplastic_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a malignant neoplastic disease (malignancy).","when_to_set_to_false":"Set to false if the patient currently does not have a malignant neoplastic disease (malignancy).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a malignant neoplastic disease (malignancy).","meaning":"Boolean indicating whether the patient currently has a malignant neoplastic disease (malignancy)."} ;; "malignancy"
(declare-const patient_has_finding_of_serious_underlying_disease_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a serious underlying disease of any type, regardless of specific diagnosis.","when_to_set_to_false":"Set to false if the patient currently does not have any serious underlying disease.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a serious underlying disease.","meaning":"Boolean indicating whether the patient currently has a serious underlying disease of any type."} ;; "serious underlying disease"
(declare-const patient_has_finding_of_type_1_diabetes_mellitus_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has type 1 diabetes mellitus (juvenile diabetes mellitus).","when_to_set_to_false":"Set to false if the patient currently does not have type 1 diabetes mellitus (juvenile diabetes mellitus).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has type 1 diabetes mellitus (juvenile diabetes mellitus).","meaning":"Boolean indicating whether the patient currently has type 1 diabetes mellitus (juvenile diabetes mellitus)."} ;; "juvenile diabetes mellitus"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or patient_has_finding_of_heart_disease_now
          patient_has_finding_of_malignant_neoplastic_disease_now
          patient_has_finding_of_type_1_diabetes_mellitus_now)
       patient_has_finding_of_serious_underlying_disease_now)
   :named REQ4_AUXILIARY0)) ;; "with non-exhaustive examples (cardiac disease, malignancy, juvenile diabetes mellitus)."

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
(! (not patient_has_finding_of_serious_underlying_disease_now)
   :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a serious underlying disease with non-exhaustive examples (cardiac disease, malignancy, juvenile diabetes mellitus)."

;; ===================== Declarations for the exclusion criterion (REQ 5) =====================
(declare-const patient_has_finding_of_diarrhea_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has diarrhoea.","when_to_set_to_false":"Set to false if the patient currently does not have diarrhoea.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has diarrhoea.","meaning":"Boolean indicating whether the patient currently has diarrhoea."} ;; "diarrhoea"
(declare-const patient_has_finding_of_vomiting_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has vomiting.","when_to_set_to_false":"Set to false if the patient currently does not have vomiting.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has vomiting.","meaning":"Boolean indicating whether the patient currently has vomiting."} ;; "vomiting"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@associated_with_gastrointestinal_symptoms Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection is associated with gastrointestinal symptoms (such as diarrhoea or vomiting).","when_to_set_to_false":"Set to false if the patient's current disorder due to infection is not associated with gastrointestinal symptoms.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection is associated with gastrointestinal symptoms.","meaning":"Boolean indicating whether the patient's current disorder due to infection is associated with gastrointestinal symptoms."} ;; "associated with gastrointestinal symptoms"
(declare-const patient_has_finding_of_disorder_due_to_infection_now@@may_affect_safety_assessment Bool) ;; {"when_to_set_to_true":"Set to true if the patient's current disorder due to infection may affect safety assessment.","when_to_set_to_false":"Set to false if the patient's current disorder due to infection does not affect or is not expected to affect safety assessment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's current disorder due to infection may affect safety assessment.","meaning":"Boolean indicating whether the patient's current disorder due to infection may affect safety assessment."} ;; "may affect safety assessment"

;; ===================== Auxiliary Assertions (REQ 5) =====================
;; Non-exhaustive examples (diarrhoea, vomiting) imply association with GI symptoms
(assert
(! (=> (or patient_has_finding_of_diarrhea_now
           patient_has_finding_of_vomiting_now)
       patient_has_finding_of_disorder_due_to_infection_now@@associated_with_gastrointestinal_symptoms)
   :named REQ5_AUXILIARY0)) ;; "with non-exhaustive examples (diarrhoea, vomiting)"

;; Qualifier variable implies stem variable
(assert
(! (=> patient_has_finding_of_disorder_due_to_infection_now@@associated_with_gastrointestinal_symptoms
       patient_has_finding_of_disorder_due_to_infection_now)
   :named REQ5_AUXILIARY1)) ;; "associated with gastrointestinal symptoms"

;; ===================== Constraint Assertions (REQ 5) =====================
;; Exclusion: concurrent infection associated with GI symptoms that may affect safety assessment
(assert
(! (not (and patient_has_finding_of_disorder_due_to_infection_now@@associated_with_gastrointestinal_symptoms
             patient_has_finding_of_disorder_due_to_infection_now@@may_affect_safety_assessment))
   :named REQ5_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a concurrent infection associated with gastrointestinal symptoms with non-exhaustive examples (diarrhoea, vomiting) that may affect safety assessment."

;; ===================== Declarations for the exclusion criterion (REQ 6) =====================
(declare-const patient_has_hypersensitivity_to_amoxicillin_and_clavulanic_acid_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a hypersensitivity to any component of amoxicillin and clavulanic acid containing product.","when_to_set_to_false":"Set to false if the patient currently does not have a hypersensitivity to any component of amoxicillin and clavulanic acid containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a hypersensitivity to any component of amoxicillin and clavulanic acid containing product.","meaning":"Boolean indicating whether the patient currently has a hypersensitivity to any component of amoxicillin and clavulanic acid containing product."} ;; "known hypersensitivity to any component of amoxicillin-potassium clavulanate combination"
(declare-const patient_has_hypersensitivity_to_penicillin_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to penicillin antibiotic.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to penicillin antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to penicillin antibiotic.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to penicillin antibiotic."} ;; "known hypersensitivity to penicillin antibiotic"
(declare-const patient_has_hypersensitivity_to_cephem_antibiotic_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a known hypersensitivity to cephem antibiotic.","when_to_set_to_false":"Set to false if the patient currently does not have a known hypersensitivity to cephem antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a known hypersensitivity to cephem antibiotic.","meaning":"Boolean indicating whether the patient currently has a known hypersensitivity to cephem antibiotic."} ;; "known hypersensitivity to cephem antibiotic"
(declare-const patient_has_finding_of_adverse_reaction_inthehistory@@serious@@possibly_related_to_amoxicillin_and_clavulanic_acid_containing_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a past history of a serious adverse reaction possibly related to any component of amoxicillin and clavulanic acid containing product.","when_to_set_to_false":"Set to false if the patient does not have a past history of a serious adverse reaction possibly related to any component of amoxicillin and clavulanic acid containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a past history of a serious adverse reaction possibly related to any component of amoxicillin and clavulanic acid containing product.","meaning":"Boolean indicating whether the patient has a past history of a serious adverse reaction possibly related to any component of amoxicillin and clavulanic acid containing product."} ;; "past history of a serious adverse reaction possibly related to any component of amoxicillin-potassium clavulanate combination"
(declare-const patient_has_finding_of_adverse_reaction_inthehistory@@serious@@possibly_related_to_penicillin Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a past history of a serious adverse reaction possibly related to penicillin antibiotic.","when_to_set_to_false":"Set to false if the patient does not have a past history of a serious adverse reaction possibly related to penicillin antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a past history of a serious adverse reaction possibly related to penicillin antibiotic.","meaning":"Boolean indicating whether the patient has a past history of a serious adverse reaction possibly related to penicillin antibiotic."} ;; "past history of a serious adverse reaction possibly related to penicillin antibiotic"
(declare-const patient_has_finding_of_adverse_reaction_inthehistory@@serious@@possibly_related_to_cephem_antibiotic Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a past history of a serious adverse reaction possibly related to cephem antibiotic.","when_to_set_to_false":"Set to false if the patient does not have a past history of a serious adverse reaction possibly related to cephem antibiotic.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a past history of a serious adverse reaction possibly related to cephem antibiotic.","meaning":"Boolean indicating whether the patient has a past history of a serious adverse reaction possibly related to cephem antibiotic."} ;; "past history of a serious adverse reaction possibly related to cephem antibiotic"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
(! (not patient_has_hypersensitivity_to_amoxicillin_and_clavulanic_acid_containing_product_now)
:named REQ6_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to any component of amoxicillin-potassium clavulanate combination."

(assert
(! (not patient_has_hypersensitivity_to_penicillin_antibiotic_now)
:named REQ6_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to penicillin antibiotic."

(assert
(! (not patient_has_hypersensitivity_to_cephem_antibiotic_now)
:named REQ6_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a known hypersensitivity to cephem antibiotic."

(assert
(! (not patient_has_finding_of_adverse_reaction_inthehistory@@serious@@possibly_related_to_amoxicillin_and_clavulanic_acid_containing_product)
:named REQ6_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of a serious adverse reaction possibly related to any component of amoxicillin-potassium clavulanate combination."

(assert
(! (not patient_has_finding_of_adverse_reaction_inthehistory@@serious@@possibly_related_to_penicillin)
:named REQ6_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of a serious adverse reaction possibly related to penicillin antibiotic."

(assert
(! (not patient_has_finding_of_adverse_reaction_inthehistory@@serious@@possibly_related_to_cephem_antibiotic)
:named REQ6_COMPONENT5_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of a serious adverse reaction possibly related to cephem antibiotic."

;; ===================== Declarations for the exclusion criterion (REQ 7) =====================
(declare-const patient_has_diagnosis_of_infectious_mononucleosis_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of infectious mononucleosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of infectious mononucleosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of infectious mononucleosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of infectious mononucleosis."} ;; "infectious mononucleosis"

;; ===================== Constraint Assertions (REQ 7) =====================
(assert
(! (not patient_has_diagnosis_of_infectious_mononucleosis_now)
:named REQ7_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has infectious mononucleosis."

;; ===================== Declarations for the exclusion criterion (REQ 8) =====================
(declare-const patient_has_finding_of_hepatic_impairment_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has hepatic impairment.","when_to_set_to_false":"Set to false if the patient currently does not have hepatic impairment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has hepatic impairment.","meaning":"Boolean indicating whether the patient currently has hepatic impairment."} ;; "the patient has current hepatic impairment"

(declare-const patient_has_finding_of_jaundice_inthehistory@@due_to_any_component_of_amoxicillin_and_clavulanic_acid_containing_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient's past history of jaundice was due to any component of amoxicillin-potassium clavulanate combination.","when_to_set_to_false":"Set to false if the patient's past history of jaundice was not due to any component of amoxicillin-potassium clavulanate combination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's past history of jaundice was due to any component of amoxicillin-potassium clavulanate combination.","meaning":"Boolean indicating whether the patient's past history of jaundice was due to any component of amoxicillin-potassium clavulanate combination."} ;; "the patient has a past history of jaundice due to any component of amoxicillin-potassium clavulanate combination"

(declare-const patient_has_finding_of_hepatic_impairment_inthehistory@@due_to_any_component_of_amoxicillin_and_clavulanic_acid_containing_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has a past history of hepatic impairment due to any component of amoxicillin-potassium clavulanate combination.","when_to_set_to_false":"Set to false if the patient does not have a past history of hepatic impairment due to any component of amoxicillin-potassium clavulanate combination.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has a past history of hepatic impairment due to any component of amoxicillin-potassium clavulanate combination.","meaning":"Boolean indicating whether the patient has a past history of hepatic impairment due to any component of amoxicillin-potassium clavulanate combination."} ;; "the patient has a past history of hepatic impairment due to any component of amoxicillin-potassium clavulanate combination"

;; ===================== Constraint Assertions (REQ 8) =====================
(assert
(! (not patient_has_finding_of_hepatic_impairment_now)
    :named REQ8_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current hepatic impairment."

(assert
(! (not patient_has_finding_of_jaundice_inthehistory@@due_to_any_component_of_amoxicillin_and_clavulanic_acid_containing_product)
    :named REQ8_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of jaundice due to any component of amoxicillin-potassium clavulanate combination."

(assert
(! (not patient_has_finding_of_hepatic_impairment_inthehistory@@due_to_any_component_of_amoxicillin_and_clavulanic_acid_containing_product)
    :named REQ8_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has a past history of hepatic impairment due to any component of amoxicillin-potassium clavulanate combination."

;; ===================== Declarations for the exclusion criterion (REQ 9) =====================
(declare-const patient_has_finding_of_renal_impairment_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding or diagnosis of renal impairment at any time in the past or currently.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding or diagnosis of renal impairment at any time in the past or currently.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding or diagnosis of renal impairment.","meaning":"Boolean indicating whether the patient has ever had a clinical finding or diagnosis of renal impairment (past or present)."} ;; "past or current renal impairment"

(declare-const patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current serum creatinine concentration in mg/dL is available.","when_to_set_to_null":"Set to null if no current serum creatinine concentration in mg/dL is available or the value is indeterminate.","meaning":"Numeric value of the patient's current serum creatinine concentration in mg/dL."} ;; "serum creatinine concentration"

(declare-const patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min Real) ;; {"when_to_set_to_value":"Set to the measured value if the patient's current creatinine clearance in mL/min is available.","when_to_set_to_null":"Set to null if no current creatinine clearance in mL/min is available or the value is indeterminate.","meaning":"Numeric value of the patient's current creatinine clearance in mL/min."} ;; "creatinine clearance"

(declare-const patient_serum_creatinine_upper_limit_of_normal_value_now_withunit_mg_per_dl Real) ;; {"when_to_set_to_value":"Set to the reference upper limit of normal for serum creatinine concentration in mg/dL, as defined by the laboratory at the time of measurement.","when_to_set_to_null":"Set to null if the upper limit of normal for serum creatinine is not available or indeterminate.","meaning":"Numeric value representing the upper limit of normal for serum creatinine concentration in mg/dL at the time of measurement."} ;; "upper limit of normal for serum creatinine concentration"

;; ===================== Auxiliary Assertions (REQ 9) =====================
;; Non-exhaustive examples imply umbrella term
(assert
(! (=> (or (>= patient_serum_creatinine_level_finding_value_recorded_now_withunit_mg_per_dl
               (* 1.5 patient_serum_creatinine_upper_limit_of_normal_value_now_withunit_mg_per_dl))
           (< patient_creatinine_renal_clearance_value_recorded_now_withunit_ml_per_min 30))
        patient_has_finding_of_renal_impairment_inthehistory)
    :named REQ9_AUXILIARY0)) ;; "with non-exhaustive examples (serum creatinine concentration greater than or equal to 1.5 times the upper limit of normal, or creatinine clearance less than 30 mL/L)."

;; ===================== Constraint Assertions (REQ 9) =====================
(assert
(! (not patient_has_finding_of_renal_impairment_inthehistory)
    :named REQ9_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has past or current renal impairment, with non-exhaustive examples (serum creatinine concentration greater than or equal to 1.5 times the upper limit of normal, or creatinine clearance less than 30 mL/L)."

;; ===================== Declarations for the exclusion criterion (REQ 10) =====================
(declare-const patient_has_diagnosis_of_disorder_of_immune_function_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of disorder of immune function (immune dysfunction) in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of disorder of immune function (immune dysfunction) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of disorder of immune function (immune dysfunction) in the past.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of disorder of immune function (immune dysfunction) in the past."} ;; "past immune dysfunction"
(declare-const patient_has_diagnosis_of_disorder_of_immune_function_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of disorder of immune function (immune dysfunction).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of disorder of immune function (immune dysfunction).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of disorder of immune function (immune dysfunction).","meaning":"Boolean indicating whether the patient currently has a diagnosis of disorder of immune function (immune dysfunction)."} ;; "current immune dysfunction"
(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a diagnosis of immunodeficiency disorder (immune insufficiency) in the past.","when_to_set_to_false":"Set to false if the patient has never had a diagnosis of immunodeficiency disorder (immune insufficiency) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a diagnosis of immunodeficiency disorder (immune insufficiency) in the past.","meaning":"Boolean indicating whether the patient has ever had a diagnosis of immunodeficiency disorder (immune insufficiency) in the past."} ;; "past immune insufficiency"
(declare-const patient_has_diagnosis_of_immunodeficiency_disorder_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of immunodeficiency disorder (immune insufficiency).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of immunodeficiency disorder (immune insufficiency).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of immunodeficiency disorder (immune insufficiency).","meaning":"Boolean indicating whether the patient currently has a diagnosis of immunodeficiency disorder (immune insufficiency)."} ;; "current immune insufficiency"
(declare-const patient_is_undergoing_immunosuppressive_therapy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently undergoing immunosuppressive therapy.","when_to_set_to_false":"Set to false if the patient is not currently undergoing immunosuppressive therapy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently undergoing immunosuppressive therapy.","meaning":"Boolean indicating whether the patient is currently undergoing immunosuppressive therapy."} ;; "uses immunosuppressive therapy"

;; ===================== Constraint Assertions (REQ 10) =====================
(assert
(! (not patient_has_diagnosis_of_disorder_of_immune_function_inthehistory)
:named REQ10_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has past immune dysfunction."

(assert
(! (not patient_has_diagnosis_of_disorder_of_immune_function_now)
:named REQ10_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current immune dysfunction."

(assert
(! (not patient_has_diagnosis_of_immunodeficiency_disorder_inthehistory)
:named REQ10_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has past immune insufficiency."

(assert
(! (not patient_has_diagnosis_of_immunodeficiency_disorder_now)
:named REQ10_COMPONENT3_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has current immune insufficiency."

(assert
(! (not patient_is_undergoing_immunosuppressive_therapy_now)
:named REQ10_COMPONENT4_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient uses immunosuppressive therapy."

;; ===================== Declarations for the exclusion criterion (REQ 11) =====================
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_false":"Set to false if the patient is currently not taking a corticosteroid or corticosteroid derivative containing product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product.","meaning":"Boolean indicating whether the patient is currently taking a corticosteroid or corticosteroid derivative containing product."} ;; "corticosteroid"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@for_systemic_use Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product for systemic use.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product but not for systemic use.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is administered for systemic use.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative containing product is administered for systemic use."} ;; "the patient needs corticosteroid for systemic use"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_as_eye_drops Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product administered as eye drops.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product but not as eye drops.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is administered as eye drops.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative containing product is administered as eye drops."} ;; "the patient needs corticosteroid eye drops"
(declare-const patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_as_nasal_drops Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently taking a corticosteroid or corticosteroid derivative containing product administered as nasal drops.","when_to_set_to_false":"Set to false if the patient is currently taking a corticosteroid or corticosteroid derivative containing product but not as nasal drops.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the product is administered as nasal drops.","meaning":"Boolean indicating whether the corticosteroid or corticosteroid derivative containing product is administered as nasal drops."} ;; "the patient needs corticosteroid nasal drops"

;; ===================== Auxiliary Assertions (REQ 11) =====================
;; Qualifier variables imply corresponding stem variable
(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@for_systemic_use
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ11_AUXILIARY0)) ;; "the patient needs corticosteroid for systemic use"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_as_eye_drops
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ11_AUXILIARY1)) ;; "the patient needs corticosteroid eye drops"

(assert
(! (=> patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_as_nasal_drops
      patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now)
:named REQ11_AUXILIARY2)) ;; "the patient needs corticosteroid nasal drops"

;; ===================== Constraint Assertions (REQ 11) =====================
(assert
(! (not patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@for_systemic_use)
:named REQ11_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs corticosteroid for systemic use."

(assert
(! (not patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_as_eye_drops)
:named REQ11_COMPONENT1_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs corticosteroid eye drops."

(assert
(! (not patient_is_taking_corticosteroid_and_corticosteroid_derivative_containing_product_now@@administered_as_nasal_drops)
:named REQ11_COMPONENT2_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient needs corticosteroid nasal drops."

;; ===================== Declarations for the exclusion criterion (REQ 12) =====================
(declare-const patient_has_finding_of_phenylketonuria_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has phenylketonuria.","when_to_set_to_false":"Set to false if the patient currently does not have phenylketonuria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has phenylketonuria.","meaning":"Boolean indicating whether the patient currently has phenylketonuria."} ;; "The patient is excluded if the patient has phenylketonuria."

;; ===================== Constraint Assertions (REQ 12) =====================
(assert
(! (not patient_has_finding_of_phenylketonuria_now)
:named REQ12_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has phenylketonuria."

;; ===================== Declarations for the exclusion criterion (REQ 13) =====================
(declare-const patient_has_taken_azithromycin_containing_product_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever taken an azithromycin-containing product at any time in the past.","when_to_set_to_false":"Set to false if the patient has never taken an azithromycin-containing product at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever taken an azithromycin-containing product.","meaning":"Boolean indicating whether the patient has ever taken an azithromycin-containing product in the past."} ;; "azithromycin"
(declare-const patient_has_taken_azithromycin_containing_product_inthehistory@@temporalcontext_within14days_before_first_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has taken an azithromycin-containing product within fourteen days prior to the first dose of the investigational product.","when_to_set_to_false":"Set to false if the patient has not taken an azithromycin-containing product within fourteen days prior to the first dose of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has taken an azithromycin-containing product within fourteen days prior to the first dose of the investigational product.","meaning":"Boolean indicating whether the patient has taken an azithromycin-containing product within fourteen days prior to the first dose of the investigational product."} ;; "azithromycin within fourteen days prior to the first dose of the investigational product"

;; ===================== Auxiliary Assertions (REQ 13) =====================
;; Qualifier variable implies corresponding stem variable
(assert
(! (=> patient_has_taken_azithromycin_containing_product_inthehistory@@temporalcontext_within14days_before_first_dose_of_investigational_product
       patient_has_taken_azithromycin_containing_product_inthehistory)
   :named REQ13_AUXILIARY0)) ;; "azithromycin within fourteen days prior to the first dose of the investigational product" implies "azithromycin ever"

;; ===================== Constraint Assertions (REQ 13) =====================
(assert
(! (not patient_has_taken_azithromycin_containing_product_inthehistory@@temporalcontext_within14days_before_first_dose_of_investigational_product)
   :named REQ13_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient has used azithromycin within fourteen days prior to the first dose of the investigational product."

;; ===================== Declarations for the exclusion criterion (REQ 14) =====================
(declare-const patient_has_used_antibiotic_within_7_days_before_first_dose_of_investigational_product Bool) ;; {"when_to_set_to_true":"Set to true if the patient has used any antibiotic within the seven days prior to the first dose of the investigational product.","when_to_set_to_false":"Set to false if the patient has not used any antibiotic within the seven days prior to the first dose of the investigational product.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has used any antibiotic within the seven days prior to the first dose of the investigational product.","meaning":"Boolean indicating whether the patient has used any antibiotic within seven days prior to the first dose of the investigational product."} ;; "has used any antibiotic within seven days prior to the first dose of the investigational product"

;; ===================== Constraint Assertions (REQ 14) =====================
(assert
(! (not patient_has_used_antibiotic_within_7_days_before_first_dose_of_investigational_product)
    :named REQ14_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient has used any antibiotic within seven days prior to the first dose of the investigational product."

;; ===================== Declarations for the exclusion criterion (REQ 15) =====================
(declare-const patient_is_exposed_to_probenecid_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to probenecid (e.g., actively taking or using probenecid now).","when_to_set_to_false":"Set to false if the patient is currently not exposed to probenecid (not taking or using probenecid now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to probenecid.","meaning":"Boolean indicating whether the patient is currently exposed to probenecid."} ;; "the patient is currently using probenecid"
(declare-const patient_is_exposed_to_probenecid_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient must be exposed to probenecid at any time during the study period (i.e., future exposure is required or planned).","when_to_set_to_false":"Set to false if the patient will not be exposed to probenecid during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will be exposed to probenecid during the study period.","meaning":"Boolean indicating whether the patient will be exposed to probenecid during the study period."} ;; "the patient must use probenecid during the study period"
(declare-const patient_is_exposed_to_tubular_secretion_inhibitor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently exposed to a tubular secretion inhibitor (e.g., actively taking or using a tubular secretion inhibitor now).","when_to_set_to_false":"Set to false if the patient is currently not exposed to a tubular secretion inhibitor (not taking or using a tubular secretion inhibitor now).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently exposed to a tubular secretion inhibitor.","meaning":"Boolean indicating whether the patient is currently exposed to a tubular secretion inhibitor."} ;; "the patient is currently using a tubular secretion inhibitor"
(declare-const patient_is_exposed_to_tubular_secretion_inhibitor_inthefuture Bool) ;; {"when_to_set_to_true":"Set to true if the patient must be exposed to a tubular secretion inhibitor at any time during the study period (i.e., future exposure is required or planned).","when_to_set_to_false":"Set to false if the patient will not be exposed to a tubular secretion inhibitor during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient will be exposed to a tubular secretion inhibitor during the study period.","meaning":"Boolean indicating whether the patient will be exposed to a tubular secretion inhibitor during the study period."} ;; "the patient must use a tubular secretion inhibitor during the study period"

;; ===================== Constraint Assertions (REQ 15) =====================
(assert
(! (not patient_is_exposed_to_probenecid_now)
:named REQ15_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is currently using probenecid"

(assert
(! (not patient_is_exposed_to_probenecid_inthefuture)
:named REQ15_COMPONENT1_OTHER_REQUIREMENTS)) ;; "the patient must use probenecid during the study period"

(assert
(! (not patient_is_exposed_to_tubular_secretion_inhibitor_now)
:named REQ15_COMPONENT2_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "the patient is currently using a tubular secretion inhibitor"

(assert
(! (not patient_is_exposed_to_tubular_secretion_inhibitor_inthefuture)
:named REQ15_COMPONENT3_OTHER_REQUIREMENTS)) ;; "the patient must use a tubular secretion inhibitor during the study period"

;; ===================== Declarations for the exclusion criterion (REQ 16) =====================
(declare-const patient_has_participated_in_another_clinical_study_within_3_months_prior_to_enrollment Bool) ;; {"when_to_set_to_true":"Set to true if the patient has participated in another clinical study within three months prior to enrollment.","when_to_set_to_false":"Set to false if the patient has not participated in another clinical study within three months prior to enrollment.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has participated in another clinical study within three months prior to enrollment.","meaning":"Boolean indicating whether the patient has participated in another clinical study within three months prior to enrollment."} ;; "the patient has participated in another clinical study within three months prior to enrollment"
(declare-const patient_is_expected_to_participate_in_another_clinical_study_during_this_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is expected to participate in another clinical study during the period of this study.","when_to_set_to_false":"Set to false if the patient is not expected to participate in another clinical study during the period of this study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is expected to participate in another clinical study during the period of this study.","meaning":"Boolean indicating whether the patient is expected to participate in another clinical study during the period of this study."} ;; "the patient is expected to participate in another clinical study during the period of this study"

;; ===================== Constraint Assertions (REQ 16) =====================
(assert
(! (not (or patient_has_participated_in_another_clinical_study_within_3_months_prior_to_enrollment
            patient_is_expected_to_participate_in_another_clinical_study_during_this_study_period))
   :named REQ16_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if ((the patient has participated in another clinical study within three months prior to enrollment) OR (the patient is expected to participate in another clinical study during the period of this study))."

;; ===================== Declarations for the exclusion criterion (REQ 17) =====================
(declare-const patient_sex_is_female_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as female.","when_to_set_to_false":"Set to false if the patient is currently documented as not female (male or other).","when_to_set_to_null":"Set to null if the patient's current sex is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently female."} ;; "the patient is a girl with menstruation and childbearing potential"
(declare-const patients_menstruation_is_positive_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently menstruating.","when_to_set_to_false":"Set to false if the patient is currently not menstruating.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently menstruating.","meaning":"Boolean indicating whether the patient is currently menstruating."} ;; "menstruation"
(declare-const patient_has_childbearing_potential_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as having childbearing potential.","when_to_set_to_false":"Set to false if the patient is currently documented as not having childbearing potential.","when_to_set_to_null":"Set to null if the patient's childbearing potential status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient currently has childbearing potential."} ;; "the patient is a girl with menstruation and childbearing potential"
(declare-const patient_is_pregnant_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as pregnant.","when_to_set_to_false":"Set to false if the patient is currently documented as not pregnant.","when_to_set_to_null":"Set to null if the patient's pregnancy status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently pregnant."} ;; "the patient is a pregnant girl"
(declare-const patient_is_lactating_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently documented as lactating.","when_to_set_to_false":"Set to false if the patient is currently documented as not lactating.","when_to_set_to_null":"Set to null if the patient's lactation status is unknown, not documented, or cannot be determined.","meaning":"Indicates whether the patient is currently lactating."} ;; "the patient is a lactating girl"
(declare-const patient_is_planning_pregnancy_during_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is planning a pregnancy during the study period.","when_to_set_to_false":"Set to false if the patient is not planning a pregnancy during the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is planning a pregnancy during the study period.","meaning":"Boolean indicating whether the patient is planning a pregnancy during the study period."} ;; "the patient is a girl who is planning a pregnancy during the study period"
(declare-const male_partner_has_been_sterilized_prior_to_patient_entry_into_study Bool) ;; {"when_to_set_to_true":"Set to true if the patient's male partner has been sterilized prior to the patient's entry into the study.","when_to_set_to_false":"Set to false if the patient's male partner has not been sterilized prior to the patient's entry into the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's male partner has been sterilized prior to the patient's entry into the study.","meaning":"Boolean indicating whether the patient's male partner has been sterilized prior to the patient's entry into the study."} ;; "male partner sterilization prior to the girl's entry into the study"
(declare-const male_partner_has_been_sterilized_prior_to_patient_entry_into_study@@male_is_sole_partner_for_patient Bool) ;; {"when_to_set_to_true":"Set to true if the patient's male partner is the sole partner for the patient.","when_to_set_to_false":"Set to false if the patient's male partner is not the sole partner for the patient.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's male partner is the sole partner for the patient.","meaning":"Boolean indicating whether the patient's male partner is the sole partner for the patient."} ;; "this male is the sole partner for that girl"
(declare-const intrauterine_device_annual_failure_rate_estimate_value_recorded_withunit_percent_per_year Real) ;; {"when_to_set_to_value":"Set to the documented annual failure rate estimate of the intrauterine device, in percent per year.","when_to_set_to_null":"Set to null if the annual failure rate estimate of the intrauterine device is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the documented annual failure rate estimate of the intrauterine device, in percent per year."} ;; "intrauterine device with documented annual failure rate estimate of less than one percent"
(declare-const patient_is_willing_to_practice_abstinence_throughout_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to practice abstinence throughout the study period.","when_to_set_to_false":"Set to false if the patient is not willing to practice abstinence throughout the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to practice abstinence throughout the study period.","meaning":"Boolean indicating whether the patient is willing to practice abstinence throughout the study period."} ;; "abstinence"
(declare-const patient_is_willing_to_use_male_condom_combined_with_female_diaphragm_throughout_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to use a male condom combined with a female diaphragm throughout the study period.","when_to_set_to_false":"Set to false if the patient is not willing to use a male condom combined with a female diaphragm throughout the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to use a male condom combined with a female diaphragm throughout the study period.","meaning":"Boolean indicating whether the patient is willing to use a male condom combined with a female diaphragm throughout the study period."} ;; "male condom combined with a female diaphragm, either with or without a vaginal spermicide"
(declare-const patient_is_willing_to_use_male_condom_combined_with_female_diaphragm_throughout_study_period@@with_or_without_vaginal_spermicide Bool) ;; {"when_to_set_to_true":"Set to true if the use of male condom combined with female diaphragm is with or without vaginal spermicide.","when_to_set_to_false":"Set to false if the use of male condom combined with female diaphragm is not with or without vaginal spermicide.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the use of male condom combined with female diaphragm is with or without vaginal spermicide.","meaning":"Boolean indicating whether the use of male condom combined with female diaphragm is with or without vaginal spermicide."} ;; "with or without a vaginal spermicide"
(declare-const patient_is_willing_to_use_at_least_one_acceptable_contraception_measure_throughout_study_period Bool) ;; {"when_to_set_to_true":"Set to true if the patient is willing to use at least one of the acceptable contraception measures throughout the study period.","when_to_set_to_false":"Set to false if the patient is not willing to use any of the acceptable contraception measures throughout the study period.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is willing to use at least one acceptable contraception measure throughout the study period.","meaning":"Boolean indicating whether the patient is willing to use at least one of the acceptable measures for contraception throughout the study period."} ;; "willing to use at least one of the following acceptable measures for contraception throughout the study period"

;; ===================== Auxiliary Assertions (REQ 17) =====================
;; Definition: Acceptable contraception measures
(assert
(! (= patient_is_willing_to_use_at_least_one_acceptable_contraception_measure_throughout_study_period
(or
  (and male_partner_has_been_sterilized_prior_to_patient_entry_into_study
       male_partner_has_been_sterilized_prior_to_patient_entry_into_study@@male_is_sole_partner_for_patient)
  (< intrauterine_device_annual_failure_rate_estimate_value_recorded_withunit_percent_per_year 1)
  patient_is_willing_to_practice_abstinence_throughout_study_period
  (and patient_is_willing_to_use_male_condom_combined_with_female_diaphragm_throughout_study_period
       patient_is_willing_to_use_male_condom_combined_with_female_diaphragm_throughout_study_period@@with_or_without_vaginal_spermicide)
))
:named REQ17_AUXILIARY0)) ;; "at least one of the following acceptable measures for contraception throughout the study period: ..."

;; ===================== Constraint Assertions (REQ 17) =====================
(assert
(! (not
    (and
      (or
        (and patient_sex_is_female_now patients_menstruation_is_positive_now patient_has_childbearing_potential_now)
        patient_is_pregnant_now
        patient_is_lactating_now
        patient_is_planning_pregnancy_during_study_period
      )
      (not patient_is_willing_to_use_at_least_one_acceptable_contraception_measure_throughout_study_period)
    )
  )
:named REQ17_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if ((the patient is a girl with menstruation and childbearing potential) OR (the patient is a pregnant girl) OR (the patient is a lactating girl) OR (the patient is a girl who is planning a pregnancy during the study period)) AND (the patient is NOT willing to use at least one of the following acceptable measures for contraception throughout the study period: ...)"

;; ===================== Declarations for the exclusion criterion (REQ 18) =====================
(declare-const legally_acceptable_representative_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the age in years of the patient's legally acceptable representative as recorded now.","when_to_set_to_null":"Set to null if the age in years of the patient's legally acceptable representative is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the age in years of the patient's legally acceptable representative as recorded now."} ;; "the patient's legally acceptable representative is a minor"
(declare-const legally_acceptable_representative_is_minor_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient's legally acceptable representative is currently a minor.","when_to_set_to_false":"Set to false if the patient's legally acceptable representative is currently not a minor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's legally acceptable representative is currently a minor.","meaning":"Boolean indicating whether the patient's legally acceptable representative is currently a minor."} ;; "the patient's legally acceptable representative is a minor"

;; ===================== Auxiliary Assertions (REQ 18) =====================
;; Definitional link: being a minor is age < 18
(assert
(! (= legally_acceptable_representative_is_minor_now
    (< legally_acceptable_representative_age_value_recorded_now_in_years 18))
:named REQ18_AUXILIARY0)) ;; "legally acceptable representative is a minor = age < 18"

;; ===================== Constraint Assertions (REQ 18) =====================
(assert
(! (not legally_acceptable_representative_is_minor_now)
:named REQ18_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if the patient's legally acceptable representative is a minor."

;; ===================== Declarations for the exclusion criterion (REQ 19) =====================
(declare-const patient_is_child_in_care_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently a child in care (e.g., under the care of social services, foster care, or similar arrangements).","when_to_set_to_false":"Set to false if the patient is currently not a child in care.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently a child in care.","meaning":"Boolean indicating whether the patient is currently a child in care."} ;; "The patient is excluded if the patient is a child in care."

;; ===================== Constraint Assertions (REQ 19) =====================
(assert
(! (not patient_is_child_in_care_now)
   :named REQ19_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if the patient is a child in care."

;; ===================== Declarations for the exclusion criterion (REQ 20) =====================
(declare-const patient_has_finding_of_alcohol_abuse_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding of alcohol abuse documented at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding of alcohol abuse documented at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding of alcohol abuse.","meaning":"Boolean indicating whether the patient has ever had a clinical finding of alcohol abuse in their history."} ;; "the patient has a history of alcohol abuse"
(declare-const patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a clinical finding relating to drug misuse behavior documented at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a clinical finding relating to drug misuse behavior documented at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a clinical finding relating to drug misuse behavior.","meaning":"Boolean indicating whether the patient has ever had a clinical finding relating to drug misuse behavior in their history."} ;; "the patient has a history of drug abuse"

;; ===================== Constraint Assertions (REQ 20) =====================
(assert
(! (not (or patient_has_finding_of_alcohol_abuse_inthehistory
            patient_has_finding_of_finding_relating_to_drug_misuse_behavior_inthehistory))
   :named REQ20_COMPONENT0_OTHER_REQUIREMENTS)) ;; "The patient is excluded if (the patient has a history of alcohol abuse) OR (the patient has a history of drug abuse)."

;; ===================== Declarations for the exclusion criterion (REQ 21) =====================
(declare-const patient_is_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is the investigator of the study.","when_to_set_to_false":"Set to false if the patient is not the investigator of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is the investigator of the study.","meaning":"Boolean indicating whether the patient is the investigator of the study."} ;; "the patient is the investigator"
(declare-const patient_is_sub_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a sub-investigator of the study.","when_to_set_to_false":"Set to false if the patient is not a sub-investigator of the study.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a sub-investigator of the study.","meaning":"Boolean indicating whether the patient is a sub-investigator of the study."} ;; "the patient is the sub-investigator"
(declare-const patient_is_study_collaborator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a study collaborator.","when_to_set_to_false":"Set to false if the patient is not a study collaborator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a study collaborator.","meaning":"Boolean indicating whether the patient is a study collaborator."} ;; "the patient is a study collaborator"
(declare-const patient_is_employed_by_investigator Bool) ;; {"when_to_set_to_true":"Set to true if the patient is employed by the investigator.","when_to_set_to_false":"Set to false if the patient is not employed by the investigator.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is employed by the investigator.","meaning":"Boolean indicating whether the patient is employed by the investigator."} ;; "person employed by the investigator"
(declare-const patient_is_employed_by_study_medical_institution Bool) ;; {"when_to_set_to_true":"Set to true if the patient is employed by the study medical institution.","when_to_set_to_false":"Set to false if the patient is not employed by the study medical institution.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is employed by the study medical institution.","meaning":"Boolean indicating whether the patient is employed by the study medical institution."} ;; "person employed by the study medical institution"
(declare-const patient_is_close_relative_of_investigator_or_study_staff Bool) ;; {"when_to_set_to_true":"Set to true if the patient is a close relative of the investigator, sub-investigator, study collaborator, or a person employed by the investigator or the study medical institution.","when_to_set_to_false":"Set to false if the patient is not a close relative of any of these individuals.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is a close relative of any of these individuals.","meaning":"Boolean indicating whether the patient is a close relative of the investigator, sub-investigator, study collaborator, or a person employed by the investigator or the study medical institution."} ;; "their close relative"

;; ===================== Constraint Assertions (REQ 21) =====================
(assert
(! (not (or patient_is_investigator
            patient_is_sub_investigator
            patient_is_study_collaborator
            patient_is_employed_by_investigator
            patient_is_employed_by_study_medical_institution
            patient_is_close_relative_of_investigator_or_study_staff))
   :named REQ21_COMPONENT0_OTHER_REQUIREMENTS)) ;; "A patient is excluded if the patient is the investigator, sub-investigator, study collaborator, person employed by the investigator or the study medical institution, or their close relative."

;; ===================== Declarations for the exclusion criterion (REQ 22) =====================
(declare-const patient_participation_in_study_considered_inappropriate_by_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if the investigator currently considers the patient's participation in the study inappropriate.","when_to_set_to_false":"Set to false if the investigator currently does not consider the patient's participation in the study inappropriate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the investigator currently considers the patient's participation in the study inappropriate.","meaning":"Boolean indicating whether the investigator currently considers the patient's participation in the study inappropriate."} ;; "the patient's participation in the study is considered inappropriate by the investigator"
(declare-const patient_participation_in_study_considered_inappropriate_by_sub_investigator_now Bool) ;; {"when_to_set_to_true":"Set to true if the sub-investigator currently considers the patient's participation in the study inappropriate.","when_to_set_to_false":"Set to false if the sub-investigator currently does not consider the patient's participation in the study inappropriate.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the sub-investigator currently considers the patient's participation in the study inappropriate.","meaning":"Boolean indicating whether the sub-investigator currently considers the patient's participation in the study inappropriate."} ;; "the patient's participation in the study is considered inappropriate by the sub-investigator"

;; ===================== Constraint Assertions (REQ 22) =====================
(assert
(! (not (or patient_participation_in_study_considered_inappropriate_by_investigator_now
            patient_participation_in_study_considered_inappropriate_by_sub_investigator_now))
   :named REQ22_COMPONENT0_CAN_ALWAYS_GO_FROM_SATISFIED_TO_NOTSATISFIED)) ;; "The patient is excluded if (the patient's participation in the study is considered inappropriate by the investigator) OR (the patient's participation in the study is considered inappropriate by the sub-investigator)."
