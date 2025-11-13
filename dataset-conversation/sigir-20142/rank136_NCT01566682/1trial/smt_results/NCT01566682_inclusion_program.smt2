;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_age_value_recorded_now_in_years Real) ;; {"when_to_set_to_value":"Set to the patient's current age in years if it is known and documented.","when_to_set_to_null":"Set to null if the patient's current age in years is unknown, not documented, or cannot be determined.","meaning":"Numeric value indicating the patient's current age in years."}  ;; "aged ≥ 18 years"

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! (>= patient_age_value_recorded_now_in_years 18.0)
     :named REQ0_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must be aged ≥ 18 years."

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_undergone_computerized_axial_tomography_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a computed tomography (CT) scan procedure at any time in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a computed tomography (CT) scan procedure at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a computed tomography (CT) scan procedure.","meaning":"Boolean indicating whether the patient has ever undergone a computed tomography (CT) scan procedure at any time in the past."} ;; "must have undergone a computed tomography scan"
(declare-const patient_has_undergone_computerized_axial_tomography_inthehistory@@anatomical_site_lung Bool) ;; {"when_to_set_to_true":"Set to true if the computed tomography (CT) scan procedure was performed specifically on the lung.","when_to_set_to_false":"Set to false if the computed tomography (CT) scan procedure was not performed on the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the CT scan was performed on the lung.","meaning":"Boolean indicating that the CT scan procedure was performed specifically on the lung."} ;; "computed tomography scan of the lung"
(declare-const patient_has_finding_of_solitary_nodule_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of a pulmonary nodule (solitary nodule of lung) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of a pulmonary nodule (solitary nodule of lung) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of a pulmonary nodule (solitary nodule of lung).","meaning":"Boolean indicating whether the patient has ever had a finding of a pulmonary nodule (solitary nodule of lung) at any time in the past."} ;; "≥ 1 pulmonary nodule"
(declare-const patient_has_finding_of_solitary_nodule_of_lung_inthehistory@@suspicious_for_lung_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the finding of a pulmonary nodule (solitary nodule of lung) is suspicious for lung cancer.","when_to_set_to_false":"Set to false if the finding of a pulmonary nodule (solitary nodule of lung) is not suspicious for lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary nodule is suspicious for lung cancer.","meaning":"Boolean indicating that the finding of a pulmonary nodule is suspicious for lung cancer."} ;; "nodule suspicious for lung cancer"
(declare-const patient_has_finding_of_solitary_nodule_of_lung_count_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of pulmonary nodules (solitary nodule of lung) found in the patient's history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many pulmonary nodules were found in the patient's history.","meaning":"Numeric variable indicating the number of pulmonary nodules found in the patient's history, with unit 'count'."} ;; "≥ 1 pulmonary nodule"
(declare-const patient_has_finding_of_lesion_of_lung_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever had a finding of a pulmonary lesion (lesion of lung) at any time in the past.","when_to_set_to_false":"Set to false if the patient has never had a finding of a pulmonary lesion (lesion of lung) at any time in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever had a finding of a pulmonary lesion (lesion of lung).","meaning":"Boolean indicating whether the patient has ever had a finding of a pulmonary lesion (lesion of lung) at any time in the past."} ;; "≥ 1 pulmonary lesion"
(declare-const patient_has_finding_of_lesion_of_lung_inthehistory@@suspicious_for_lung_cancer Bool) ;; {"when_to_set_to_true":"Set to true if the finding of a pulmonary lesion (lesion of lung) is suspicious for lung cancer.","when_to_set_to_false":"Set to false if the finding of a pulmonary lesion (lesion of lung) is not suspicious for lung cancer.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the pulmonary lesion is suspicious for lung cancer.","meaning":"Boolean indicating that the finding of a pulmonary lesion is suspicious for lung cancer."} ;; "lesion suspicious for lung cancer"
(declare-const patient_has_finding_of_lesion_of_lung_count_recorded_inthehistory_withunit_count Real) ;; {"when_to_set_to_value":"Set to the number of pulmonary lesions (lesion of lung) found in the patient's history.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined how many pulmonary lesions were found in the patient's history.","meaning":"Numeric variable indicating the number of pulmonary lesions found in the patient's history, with unit 'count'."} ;; "≥ 1 pulmonary lesion"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable for CT scan implies CT scan stem variable
(assert
  (! (=> patient_has_undergone_computerized_axial_tomography_inthehistory@@anatomical_site_lung
         patient_has_undergone_computerized_axial_tomography_inthehistory)
     :named REQ1_AUXILIARY0)) ;; "CT scan of the lung"

;; Qualifier variable for nodule suspicious for lung cancer implies nodule finding
(assert
  (! (=> patient_has_finding_of_solitary_nodule_of_lung_inthehistory@@suspicious_for_lung_cancer
         patient_has_finding_of_solitary_nodule_of_lung_inthehistory)
     :named REQ1_AUXILIARY1)) ;; "nodule suspicious for lung cancer"

;; Qualifier variable for lesion suspicious for lung cancer implies lesion finding
(assert
  (! (=> patient_has_finding_of_lesion_of_lung_inthehistory@@suspicious_for_lung_cancer
         patient_has_finding_of_lesion_of_lung_inthehistory)
     :named REQ1_AUXILIARY2)) ;; "lesion suspicious for lung cancer"

;; Numeric count implies Boolean finding for nodule
(assert
  (! (=> (> patient_has_finding_of_solitary_nodule_of_lung_count_recorded_inthehistory_withunit_count 0)
         patient_has_finding_of_solitary_nodule_of_lung_inthehistory)
     :named REQ1_AUXILIARY3)) ;; "≥ 1 pulmonary nodule"

;; Numeric count implies Boolean finding for lesion
(assert
  (! (=> (> patient_has_finding_of_lesion_of_lung_count_recorded_inthehistory_withunit_count 0)
         patient_has_finding_of_lesion_of_lung_inthehistory)
     :named REQ1_AUXILIARY4)) ;; "≥ 1 pulmonary lesion"

;; ===================== Constraint Assertions (REQ 1) =====================
;; Must have undergone CT scan of the lung AND (≥1 nodule OR ≥1 lesion), each suspicious for lung cancer
(assert
  (! (and
        patient_has_undergone_computerized_axial_tomography_inthehistory@@anatomical_site_lung
        (or
          (and
            (> patient_has_finding_of_solitary_nodule_of_lung_count_recorded_inthehistory_withunit_count 0)
            patient_has_finding_of_solitary_nodule_of_lung_inthehistory@@suspicious_for_lung_cancer)
          (and
            (> patient_has_finding_of_lesion_of_lung_count_recorded_inthehistory_withunit_count 0)
            patient_has_finding_of_lesion_of_lung_inthehistory@@suspicious_for_lung_cancer)
        )
     )
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "CT scan of the lung that indicates (≥ 1 pulmonary nodule OR ≥ 1 pulmonary lesion) suspicious for lung cancer"

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const largest_dimension_of_pulmonary_lesion_identified_from_computed_tomography_imaging_value_recorded_in_millimeters Real) ;; {"when_to_set_to_value":"Set to the value in millimeters of the largest dimension of a pulmonary lesion identified from computed tomography imaging, if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the largest dimension in millimeters of a pulmonary lesion identified from computed tomography imaging."} ;; "a pulmonary lesion with largest dimension > 4 millimeters identified from computed tomography imaging"
(declare-const largest_dimension_of_pulmonary_nodule_identified_from_computed_tomography_imaging_value_recorded_in_millimeters Real) ;; {"when_to_set_to_value":"Set to the value in millimeters of the largest dimension of a pulmonary nodule identified from computed tomography imaging, if available.","when_to_set_to_null":"Set to null if the value is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the largest dimension in millimeters of a pulmonary nodule identified from computed tomography imaging."} ;; "a pulmonary nodule with largest dimension > 4 millimeters identified from computed tomography imaging"
(declare-const patient_has_finding_of_lesion_of_lung_inthehistory@@identified_from_computed_tomography_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the lesion of lung (pulmonary lesion) was identified from computed tomography imaging.","when_to_set_to_false":"Set to false if the lesion of lung (pulmonary lesion) was not identified from computed tomography imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the lesion of lung (pulmonary lesion) was identified from computed tomography imaging.","meaning":"Boolean indicating whether the lesion of lung (pulmonary lesion) was identified from computed tomography imaging."} ;; "a pulmonary lesion ... identified from computed tomography imaging"
(declare-const patient_has_finding_of_solitary_nodule_of_lung_inthehistory@@identified_from_computed_tomography_imaging Bool) ;; {"when_to_set_to_true":"Set to true if the solitary nodule of lung (pulmonary nodule) was identified from computed tomography imaging.","when_to_set_to_false":"Set to false if the solitary nodule of lung (pulmonary nodule) was not identified from computed tomography imaging.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the solitary nodule of lung (pulmonary nodule) was identified from computed tomography imaging.","meaning":"Boolean indicating whether the solitary nodule of lung (pulmonary nodule) was identified from computed tomography imaging."} ;; "a pulmonary nodule ... identified from computed tomography imaging"

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_lesion_of_lung_inthehistory@@identified_from_computed_tomography_imaging
         patient_has_finding_of_lesion_of_lung_inthehistory)
     :named REQ2_AUXILIARY0)) ;; "lesion of lung identified from computed tomography imaging" implies "lesion of lung"

(assert
  (! (=> patient_has_finding_of_solitary_nodule_of_lung_inthehistory@@identified_from_computed_tomography_imaging
         patient_has_finding_of_solitary_nodule_of_lung_inthehistory)
     :named REQ2_AUXILIARY1)) ;; "solitary nodule of lung identified from computed tomography imaging" implies "solitary nodule of lung"

;; ===================== Constraint Assertions (REQ 2) =====================
;; The patient must have (a pulmonary nodule with largest dimension > 4 mm identified from CT imaging OR a pulmonary lesion with largest dimension > 4 mm identified from CT imaging)
(assert
  (! (or
        (and patient_has_finding_of_solitary_nodule_of_lung_inthehistory@@identified_from_computed_tomography_imaging
             (> largest_dimension_of_pulmonary_nodule_identified_from_computed_tomography_imaging_value_recorded_in_millimeters 4.0))
        (and patient_has_finding_of_lesion_of_lung_inthehistory@@identified_from_computed_tomography_imaging
             (> largest_dimension_of_pulmonary_lesion_identified_from_computed_tomography_imaging_value_recorded_in_millimeters 4.0)))
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "a pulmonary nodule with largest dimension > 4 millimeters identified from computed tomography imaging OR a pulmonary lesion with largest dimension > 4 millimeters identified from computed tomography imaging"

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_can_undergo_biopsy_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently indicated for a tissue biopsy.","when_to_set_to_false":"Set to false if the patient is currently not indicated for a tissue biopsy.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently indicated for a tissue biopsy.","meaning":"Boolean indicating whether the patient is currently indicated for a tissue biopsy."} ;; "indicated for a tissue biopsy"
(declare-const patient_can_undergo_lung_excision_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently indicated for a surgical resection of the lung.","when_to_set_to_false":"Set to false if the patient is currently not indicated for a surgical resection of the lung.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently indicated for a surgical resection of the lung.","meaning":"Boolean indicating whether the patient is currently indicated for a surgical resection of the lung."} ;; "indicated for a surgical resection of the lung"

;; ===================== Constraint Assertions (REQ 3) =====================
(assert
  (! (or patient_can_undergo_biopsy_now
         patient_can_undergo_lung_excision_now)
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "at least one of the following conditions: indicated for a tissue biopsy OR indicated for a surgical resection of the lung"

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const abnormal_computed_tomography_scan_date Real) ;; {"when_to_set_to_value":"Set to the date (in days since reference) when the patient had an abnormal computed tomography scan.","when_to_set_to_null":"Set to null if the date of the abnormal computed tomography scan is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the date (in days since reference) when the patient had an abnormal computed tomography scan."} ;; "abnormal computed tomography scan"
(declare-const biopsy_date Real) ;; {"when_to_set_to_value":"Set to the date (in days since reference) when the patient underwent a tissue biopsy.","when_to_set_to_null":"Set to null if the date of the tissue biopsy is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the date (in days since reference) when the patient underwent a tissue biopsy."} ;; "tissue biopsy"
(declare-const surgical_resection_date Real) ;; {"when_to_set_to_value":"Set to the date (in days since reference) when the patient underwent a surgical resection (excision).","when_to_set_to_null":"Set to null if the date of the surgical resection is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the date (in days since reference) when the patient underwent a surgical resection (excision)."} ;; "surgical resection"
(declare-const prolung_test_date Real) ;; {"when_to_set_to_value":"Set to the date (in days since reference) when the patient received the ProLung Test.","when_to_set_to_null":"Set to null if the date of the ProLung Test is unknown, not documented, or cannot be determined.","meaning":"Numeric value representing the date (in days since reference) when the patient received the ProLung Test."} ;; "ProLung Test"

(declare-const patient_has_undergone_computerized_axial_tomography_inthehistory_outcome_is_abnormal Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone an abnormal computed tomography scan in the past.","when_to_set_to_false":"Set to false if the patient has never undergone an abnormal computed tomography scan in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone an abnormal computed tomography scan in the past.","meaning":"Boolean indicating whether the patient has ever undergone an abnormal computed tomography scan in the past."} ;; "abnormal computed tomography scan"
(declare-const patient_has_undergone_computerized_axial_tomography_inthehistory_outcome_is_abnormal@@temporalcontext_within60days_before_prolung_test Bool) ;; {"when_to_set_to_true":"Set to true if the abnormal computed tomography scan occurred within 60 days before the ProLung Test.","when_to_set_to_false":"Set to false if the abnormal computed tomography scan did not occur within 60 days before the ProLung Test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the abnormal computed tomography scan occurred within 60 days before the ProLung Test.","meaning":"Boolean indicating whether the abnormal computed tomography scan occurred within 60 days before the ProLung Test."} ;; "abnormal computed tomography scan within 60 days before ProLung Test"

(declare-const patient_has_undergone_biopsy_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a biopsy in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a biopsy in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a biopsy in the past.","meaning":"Boolean indicating whether the patient has ever undergone a biopsy in the past."} ;; "biopsy"
(declare-const patient_has_undergone_biopsy_inthehistory@@temporalcontext_within60days_before_prolung_test Bool) ;; {"when_to_set_to_true":"Set to true if the biopsy occurred within 60 days before the ProLung Test.","when_to_set_to_false":"Set to false if the biopsy did not occur within 60 days before the ProLung Test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the biopsy occurred within 60 days before the ProLung Test.","meaning":"Boolean indicating whether the biopsy occurred within 60 days before the ProLung Test."} ;; "biopsy within 60 days before ProLung Test"

(declare-const patient_has_undergone_excision_inthehistory Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever undergone a surgical resection (excision) in the past.","when_to_set_to_false":"Set to false if the patient has never undergone a surgical resection (excision) in the past.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever undergone a surgical resection (excision) in the past.","meaning":"Boolean indicating whether the patient has ever undergone a surgical resection (excision) in the past."} ;; "surgical resection"
(declare-const patient_has_undergone_excision_inthehistory@@temporalcontext_within60days_before_prolung_test Bool) ;; {"when_to_set_to_true":"Set to true if the surgical resection occurred within 60 days before the ProLung Test.","when_to_set_to_false":"Set to false if the surgical resection did not occur within 60 days before the ProLung Test.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the surgical resection occurred within 60 days before the ProLung Test.","meaning":"Boolean indicating whether the surgical resection occurred within 60 days before the ProLung Test."} ;; "surgical resection within 60 days before ProLung Test"

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Define the temporal context qualifiers for abnormal CT, biopsy, and excision relative to ProLung Test
(assert
  (! (= patient_has_undergone_computerized_axial_tomography_inthehistory_outcome_is_abnormal@@temporalcontext_within60days_before_prolung_test
        (and patient_has_undergone_computerized_axial_tomography_inthehistory_outcome_is_abnormal
             (<= (- prolung_test_date abnormal_computed_tomography_scan_date) 60)
             (>= (- prolung_test_date abnormal_computed_tomography_scan_date) 0)))
     :named REQ4_AUXILIARY0)) ;; "abnormal computed tomography scan occurred within 60 days before ProLung Test"

(assert
  (! (= patient_has_undergone_biopsy_inthehistory@@temporalcontext_within60days_before_prolung_test
        (and patient_has_undergone_biopsy_inthehistory
             (<= (- prolung_test_date biopsy_date) 60)
             (>= (- prolung_test_date biopsy_date) 0)))
     :named REQ4_AUXILIARY1)) ;; "biopsy occurred within 60 days before ProLung Test"

(assert
  (! (= patient_has_undergone_excision_inthehistory@@temporalcontext_within60days_before_prolung_test
        (and patient_has_undergone_excision_inthehistory
             (<= (- prolung_test_date surgical_resection_date) 60)
             (>= (- prolung_test_date surgical_resection_date) 0)))
     :named REQ4_AUXILIARY2)) ;; "surgical resection occurred within 60 days before ProLung Test"

;; Define the ability to receive ProLung Test within 60 days after abnormal CT, or 60 days before biopsy, or 60 days before surgical resection
(define-fun prolung_test_within_60days_after_abnormal_ct () Bool
  (and patient_has_undergone_computerized_axial_tomography_inthehistory_outcome_is_abnormal
       (>= (- prolung_test_date abnormal_computed_tomography_scan_date) 0)
       (<= (- prolung_test_date abnormal_computed_tomography_scan_date) 60))) ;; "ProLung Test within 60 days after abnormal CT"

(define-fun prolung_test_within_60days_before_biopsy () Bool
  (and patient_has_undergone_biopsy_inthehistory
       (>= (- biopsy_date prolung_test_date) 0)
       (<= (- biopsy_date prolung_test_date) 60))) ;; "ProLung Test within 60 days before biopsy"

(define-fun prolung_test_within_60days_before_surgical_resection () Bool
  (and patient_has_undergone_excision_inthehistory
       (>= (- surgical_resection_date prolung_test_date) 0)
       (<= (- surgical_resection_date prolung_test_date) 60))) ;; "ProLung Test within 60 days before surgical resection"

;; ===================== Constraint Assertions (REQ 4) =====================
(assert
  (! (or prolung_test_within_60days_after_abnormal_ct
         prolung_test_within_60days_before_biopsy
         prolung_test_within_60days_before_surgical_resection)
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "patient must be able to receive a ProLung Test within (60 days after abnormal CT OR 60 days before biopsy OR 60 days before surgical resection)"

;; ===================== Declarations for the criterion (REQ 5) =====================
(declare-const patient_is_capable_of_understanding_and_agreeing_to_fulfill_protocol_requirements_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient is currently capable of understanding and agreeing to fulfill the requirements of this protocol.","when_to_set_to_false":"Set to false if the patient is currently not capable of understanding and agreeing to fulfill the requirements of this protocol.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient is currently capable of understanding and agreeing to fulfill the requirements of this protocol.","meaning":"Boolean indicating whether the patient is currently capable of understanding and agreeing to fulfill the requirements of this protocol."} ;; "the patient must be capable of understanding and agreeing to fulfill the requirements of this protocol."

;; ===================== Constraint Assertions (REQ 5) =====================
(assert
  (! patient_is_capable_of_understanding_and_agreeing_to_fulfill_protocol_requirements_now
     :named REQ5_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must be capable of understanding and agreeing to fulfill the requirements of this protocol."

;; ===================== Declarations for the criterion (REQ 6) =====================
(declare-const patient_has_signed_informed_consent_form_approved_by_independent_ethics_committee Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent form that is approved by the independent ethics committee.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent form that is approved by the independent ethics committee.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent form approved by the independent ethics committee.","meaning":"Boolean indicating whether the patient has signed an informed consent form that is approved by the independent ethics committee."} ;; "the patient must have signed the ... independent ethics committee approved informed consent form"
(declare-const patient_has_signed_informed_consent_form_approved_by_institutional_review_board Bool) ;; {"when_to_set_to_true":"Set to true if the patient has signed an informed consent form that is approved by the institutional review board.","when_to_set_to_false":"Set to false if the patient has not signed an informed consent form that is approved by the institutional review board.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has signed an informed consent form approved by the institutional review board.","meaning":"Boolean indicating whether the patient has signed an informed consent form that is approved by the institutional review board."} ;; "the patient must have signed the ... institutional review board approved informed consent form"

;; ===================== Constraint Assertions (REQ 6) =====================
(assert
  (! (or patient_has_signed_informed_consent_form_approved_by_institutional_review_board
         patient_has_signed_informed_consent_form_approved_by_independent_ethics_committee)
     :named REQ6_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION)) ;; "the patient must have signed the institutional review board approved informed consent form OR the independent ethics committee approved informed consent form"
