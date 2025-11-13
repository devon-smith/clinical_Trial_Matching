;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_diagnosis_of_abdominal_pain_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of abdominal pain.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of abdominal pain.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of abdominal pain.","meaning":"Boolean indicating whether the patient currently has a diagnosis of abdominal pain."} // "an abdominal pain related disorder"
(declare-const patient_has_diagnosis_of_functional_abdominal_pain_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of functional abdominal pain syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of functional abdominal pain syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of functional abdominal pain syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of functional abdominal pain syndrome."} // "functional abdominal pain syndrome"
(declare-const patient_has_diagnosis_of_functional_abdominal_pain_syndrome_now@@diagnosed_according_to_rome_iii_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of functional abdominal pain syndrome was made according to Rome III criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of functional abdominal pain syndrome was not made according to Rome III criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of functional abdominal pain syndrome was made according to Rome III criteria.","meaning":"Boolean indicating whether the patient's diagnosis of functional abdominal pain syndrome was made according to Rome III criteria."} // "diagnosed according to Rome III criteria"
(declare-const patient_has_diagnosis_of_irritable_bowel_syndrome_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of irritable bowel syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of irritable bowel syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of irritable bowel syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of irritable bowel syndrome."} // "irritable bowel syndrome"
(declare-const patient_has_diagnosis_of_irritable_bowel_syndrome_now@@diagnosed_according_to_rome_iii_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of irritable bowel syndrome was made according to Rome III criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of irritable bowel syndrome was not made according to Rome III criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of irritable bowel syndrome was made according to Rome III criteria.","meaning":"Boolean indicating whether the patient's diagnosis of irritable bowel syndrome was made according to Rome III criteria."} // "diagnosed according to Rome III criteria"
(declare-const patient_has_diagnosis_of_nonulcer_dyspepsia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of functional dyspepsia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of functional dyspepsia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of functional dyspepsia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of functional dyspepsia."} // "functional dyspepsia"
(declare-const patient_has_diagnosis_of_nonulcer_dyspepsia_now@@diagnosed_according_to_rome_iii_criteria Bool) ;; {"when_to_set_to_true":"Set to true if the patient's diagnosis of functional dyspepsia was made according to Rome III criteria.","when_to_set_to_false":"Set to false if the patient's diagnosis of functional dyspepsia was not made according to Rome III criteria.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis of functional dyspepsia was made according to Rome III criteria.","meaning":"Boolean indicating whether the patient's diagnosis of functional dyspepsia was made according to Rome III criteria."} // "diagnosed according to Rome III criteria"

;; ===================== Auxiliary Assertions (REQ 0) =====================
;; Exhaustive subcategories define the umbrella exactly:
(assert
  (! (= patient_has_diagnosis_of_abdominal_pain_now
        (or patient_has_diagnosis_of_functional_abdominal_pain_syndrome_now
            patient_has_diagnosis_of_irritable_bowel_syndrome_now
            patient_has_diagnosis_of_nonulcer_dyspepsia_now))
     :named REQ0_AUXILIARY0)) ;; "an abdominal pain related disorder with exhaustive subcategories (functional dyspepsia OR irritable bowel syndrome OR functional abdominal pain syndrome)"

;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_diagnosis_of_functional_abdominal_pain_syndrome_now@@diagnosed_according_to_rome_iii_criteria
         patient_has_diagnosis_of_functional_abdominal_pain_syndrome_now)
     :named REQ0_AUXILIARY1)) ;; "diagnosis of functional abdominal pain syndrome according to Rome III criteria"

(assert
  (! (=> patient_has_diagnosis_of_irritable_bowel_syndrome_now@@diagnosed_according_to_rome_iii_criteria
         patient_has_diagnosis_of_irritable_bowel_syndrome_now)
     :named REQ0_AUXILIARY2)) ;; "diagnosis of irritable bowel syndrome according to Rome III criteria"

(assert
  (! (=> patient_has_diagnosis_of_nonulcer_dyspepsia_now@@diagnosed_according_to_rome_iii_criteria
         patient_has_diagnosis_of_nonulcer_dyspepsia_now)
     :named REQ0_AUXILIARY3)) ;; "diagnosis of functional dyspepsia according to Rome III criteria"

;; ===================== Constraint Assertions (REQ 0) =====================
;; Component 0: Must have an abdominal pain related disorder (exhaustive subcategories)
(assert
  (! patient_has_diagnosis_of_abdominal_pain_now
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "an abdominal pain related disorder with exhaustive subcategories (functional dyspepsia OR irritable bowel syndrome OR functional abdominal pain syndrome)"

;; Component 1: Must have diagnosis according to Rome III criteria (at least one of the three subtypes diagnosed per Rome III)
(assert
  (! (or patient_has_diagnosis_of_functional_abdominal_pain_syndrome_now@@diagnosed_according_to_rome_iii_criteria
         patient_has_diagnosis_of_irritable_bowel_syndrome_now@@diagnosed_according_to_rome_iii_criteria
         patient_has_diagnosis_of_nonulcer_dyspepsia_now@@diagnosed_according_to_rome_iii_criteria)
     :named REQ0_COMPONENT1_OTHER_REQUIREMENTS)) ;; "diagnosis according to Rome III criteria"
