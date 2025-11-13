;; ===================== Declarations for the criterion (REQ 0) =====================
;; No new variables are needed for this requirement, as it is a structural statement indicating that all subsequent criteria must be satisfied.

;; ===================== Constraint Assertions (REQ 0) =====================
;; This requirement is always satisfiable and does not impose any constraint by itself.
(assert
  (! true
     :named REQ0_COMPONENT0_NOT_REQUIREMNET_OR_ALWAYS_SATISFIABLE_WITH_ACTION))

;; ===================== Declarations for the inclusion criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_hematologic_neoplasm_now Bool) ;; "hematologic neoplasm" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of hematologic neoplasm.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of hematologic neoplasm.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of hematologic neoplasm.","meaning":"Boolean indicating whether the patient currently has a diagnosis of hematologic neoplasm."}
(declare-const patient_has_diagnosis_of_acute_leukemia_now Bool) ;; "acute leukemia" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute leukemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute leukemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute leukemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute leukemia."}
(declare-const patient_has_diagnosis_of_myelodysplastic_syndrome_now Bool) ;; "myelodysplastic syndrome" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of myelodysplastic syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of myelodysplastic syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of myelodysplastic syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of myelodysplastic syndrome."}
(declare-const patient_has_diagnosis_of_malignant_lymphoma_now Bool) ;; "lymphoma" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of malignant lymphoma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of malignant lymphoma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of malignant lymphoma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of malignant lymphoma."}
(declare-const patient_has_diagnosis_of_multiple_myeloma_now Bool) ;; "multiple myeloma" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of multiple myeloma.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of multiple myeloma.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of multiple myeloma.","meaning":"Boolean indicating whether the patient currently has a diagnosis of multiple myeloma."}
(declare-const patient_has_diagnosis_of_chronic_myeloid_leukemia_now Bool) ;; "chronic myeloid leukemia" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic myeloid leukemia.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic myeloid leukemia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic myeloid leukemia.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic myeloid leukemia."}
(declare-const patient_has_diagnosis_of_chronic_myeloproliferative_disorder_now Bool) ;; "chronic myeloproliferative neoplasm" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of chronic myeloproliferative disorder.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of chronic myeloproliferative disorder.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of chronic myeloproliferative disorder.","meaning":"Boolean indicating whether the patient currently has a diagnosis of chronic myeloproliferative disorder."}
(declare-const patient_has_diagnosis_of_chronic_myeloproliferative_disorder_now@@philadelphia_chromosome_negative Bool) ;; "Philadelphia chromosome-negative chronic myeloproliferative neoplasm" {"when_to_set_to_true":"Set to true if the patient's chronic myeloproliferative disorder is Philadelphia chromosome-negative.","when_to_set_to_false":"Set to false if the patient's chronic myeloproliferative disorder is not Philadelphia chromosome-negative.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient's chronic myeloproliferative disorder is Philadelphia chromosome-negative.","meaning":"Boolean indicating whether the patient's chronic myeloproliferative disorder is Philadelphia chromosome-negative."}

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Non-exhaustive examples: each specific diagnosis implies hematologic neoplasm
(assert
  (! (=> patient_has_diagnosis_of_acute_leukemia_now
         patient_has_diagnosis_of_hematologic_neoplasm_now)
     :named REQ1_AUXILIARY0)) ;; "including a diagnosis of acute leukemia"

(assert
  (! (=> patient_has_diagnosis_of_myelodysplastic_syndrome_now
         patient_has_diagnosis_of_hematologic_neoplasm_now)
     :named REQ1_AUXILIARY1)) ;; "including a diagnosis of myelodysplastic syndrome"

(assert
  (! (=> patient_has_diagnosis_of_malignant_lymphoma_now
         patient_has_diagnosis_of_hematologic_neoplasm_now)
     :named REQ1_AUXILIARY2)) ;; "including a diagnosis of lymphoma"

(assert
  (! (=> patient_has_diagnosis_of_multiple_myeloma_now
         patient_has_diagnosis_of_hematologic_neoplasm_now)
     :named REQ1_AUXILIARY3)) ;; "including a diagnosis of multiple myeloma"

(assert
  (! (=> patient_has_diagnosis_of_chronic_myeloid_leukemia_now
         patient_has_diagnosis_of_hematologic_neoplasm_now)
     :named REQ1_AUXILIARY4)) ;; "including a diagnosis of chronic myeloid leukemia"

(assert
  (! (=> patient_has_diagnosis_of_chronic_myeloproliferative_disorder_now@@philadelphia_chromosome_negative
         patient_has_diagnosis_of_hematologic_neoplasm_now)
     :named REQ1_AUXILIARY5)) ;; "including a diagnosis of Philadelphia chromosome-negative chronic myeloproliferative neoplasm"

;; Qualifier variable implies stem variable
(assert
  (! (=> patient_has_diagnosis_of_chronic_myeloproliferative_disorder_now@@philadelphia_chromosome_negative
         patient_has_diagnosis_of_chronic_myeloproliferative_disorder_now)
     :named REQ1_AUXILIARY6)) ;; "Philadelphia chromosome-negative" is a qualifier of chronic myeloproliferative disorder

;; ===================== Constraint Assertions (REQ 1) =====================
;; Inclusion: patient must have a diagnosis of hematologic neoplasm (independently of stage or treatment)
(assert
  (! patient_has_diagnosis_of_hematologic_neoplasm_now
     :named REQ1_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have a diagnosis of hematologic neoplasm (including ...), independently of the stage of disease or treatment (including transplant procedures)."

;; ===================== Declarations for the criterion (REQ 2) =====================
(declare-const patient_has_finding_of_arterial_embolus_and_thrombosis_now Bool) ;; "arterial thromboembolism" {"when_to_set_to_true":"Set to true if the patient currently has arterial thromboembolism.","when_to_set_to_false":"Set to false if the patient currently does not have arterial thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has arterial thromboembolism.","meaning":"Boolean indicating whether the patient currently has arterial thromboembolism."}
(declare-const patient_has_finding_of_arterial_embolus_and_thrombosis_now@@objectively_proven Bool) ;; "objectively proven arterial thromboembolism" {"when_to_set_to_true":"Set to true if the diagnosis of arterial thromboembolism is objectively proven.","when_to_set_to_false":"Set to false if the diagnosis of arterial thromboembolism is not objectively proven.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the diagnosis of arterial thromboembolism is objectively proven.","meaning":"Boolean indicating whether the diagnosis of arterial thromboembolism is objectively proven."}
(declare-const patient_has_finding_of_thromboembolism_of_vein_now Bool) ;; "venous thromboembolism" {"when_to_set_to_true":"Set to true if the patient currently has venous thromboembolism.","when_to_set_to_false":"Set to false if the patient currently does not have venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has venous thromboembolism.","meaning":"Boolean indicating whether the patient currently has venous thromboembolism."}
(declare-const patient_has_finding_of_thromboembolism_of_vein_now@@objectively_proven Bool) ;; "objectively proven venous thromboembolism" {"when_to_set_to_true":"Set to true if the diagnosis of venous thromboembolism is objectively proven.","when_to_set_to_false":"Set to false if the diagnosis of venous thromboembolism is not objectively proven.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the diagnosis of venous thromboembolism is objectively proven.","meaning":"Boolean indicating whether the diagnosis of venous thromboembolism is objectively proven."}
(declare-const patient_has_finding_of_thrombosis_now Bool) ;; "thrombosis" {"when_to_set_to_true":"Set to true if the patient currently has thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombosis.","meaning":"Boolean indicating whether the patient currently has thrombosis."}
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now Bool) ;; "thrombocytopenia" {"when_to_set_to_true":"Set to true if the patient currently has thrombocytopenia.","when_to_set_to_false":"Set to false if the patient currently does not have thrombocytopenia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has thrombocytopenia.","meaning":"Boolean indicating whether the patient currently has thrombocytopenia."}
(declare-const patient_has_finding_of_thrombocytopenic_disorder_now@@occurs_subsequent_to_thrombosis_while_receiving_antithrombotic_treatment Bool) ;; "thrombocytopenia subsequent to thrombosis while receiving antithrombotic treatment" {"when_to_set_to_true":"Set to true if thrombocytopenia occurs subsequent to thrombosis while the patient is receiving antithrombotic treatment.","when_to_set_to_false":"Set to false if thrombocytopenia does not occur subsequent to thrombosis while receiving antithrombotic treatment.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether thrombocytopenia occurs subsequent to thrombosis while receiving antithrombotic treatment.","meaning":"Boolean indicating whether thrombocytopenia occurs subsequent to thrombosis while receiving antithrombotic treatment."}
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l Real) ;; "platelet count" {"when_to_set_to_value":"Set to the measured platelet count value (in 10^9/L) if a measurement is available at the time of starting antithrombotic prophylaxis.","when_to_set_to_null":"Set to null if no platelet count measurement is available at the time of starting antithrombotic prophylaxis or the value is indeterminate.","meaning":"Numeric value representing the patient's platelet count (in 10^9/L) measured now."}
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_starting_antithrombotic_prophylaxis Bool) ;; "platelet count measured at time of starting antithrombotic prophylaxis" {"when_to_set_to_true":"Set to true if the platelet count measurement was taken at the time of starting antithrombotic prophylaxis.","when_to_set_to_false":"Set to false if the platelet count measurement was not taken at the time of starting antithrombotic prophylaxis.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at the time of starting antithrombotic prophylaxis.","meaning":"Boolean indicating whether the platelet count measurement was taken at the time of starting antithrombotic prophylaxis."}
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_diagnosis_of_objectively_proven_arterial_or_venous_thromboembolism Bool) ;; "platelet count measured at time of diagnosis of objectively proven arterial or venous thromboembolism" {"when_to_set_to_true":"Set to true if the platelet count measurement was taken at the time of diagnosis of objectively proven arterial or venous thromboembolism.","when_to_set_to_false":"Set to false if the platelet count measurement was not taken at the time of diagnosis of objectively proven arterial or venous thromboembolism.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at the time of diagnosis of objectively proven arterial or venous thromboembolism.","meaning":"Boolean indicating whether the platelet count measurement was taken at the time of diagnosis of objectively proven arterial or venous thromboembolism."}
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_thrombosis Bool) ;; "platelet count measured at time of thrombosis" {"when_to_set_to_true":"Set to true if the platelet count measurement was taken at the time of thrombosis.","when_to_set_to_false":"Set to false if the platelet count measurement was not taken at the time of thrombosis.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at the time of thrombosis.","meaning":"Boolean indicating whether the platelet count measurement was taken at the time of thrombosis."}
(declare-const patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_subsequent_to_thrombosis_while_receiving_antithrombotic_treatment Bool) ;; "platelet count measured subsequent to thrombosis while receiving antithrombotic treatment" {"when_to_set_to_true":"Set to true if the platelet count measurement was taken at a subsequent time after thrombosis while the patient was receiving antithrombotic treatment.","when_to_set_to_false":"Set to false if the platelet count measurement was not taken at a subsequent time after thrombosis while receiving antithrombotic treatment.","when_to_set_to_null":"Set to null if it is unknown or indeterminate whether the measurement was taken at a subsequent time after thrombosis while receiving antithrombotic treatment.","meaning":"Boolean indicating whether the platelet count measurement was taken at a subsequent time after thrombosis while receiving antithrombotic treatment."}

;; ===================== Auxiliary Assertions (REQ 2) =====================
;; Qualifier variables imply corresponding stem variables
(assert
  (! (=> patient_has_finding_of_arterial_embolus_and_thrombosis_now@@objectively_proven
         patient_has_finding_of_arterial_embolus_and_thrombosis_now)
     :named REQ2_AUXILIARY0)) ;; "diagnosis of objectively proven arterial thromboembolism"

(assert
  (! (=> patient_has_finding_of_thromboembolism_of_vein_now@@objectively_proven
         patient_has_finding_of_thromboembolism_of_vein_now)
     :named REQ2_AUXILIARY1)) ;; "diagnosis of objectively proven venous thromboembolism"

(assert
  (! (=> patient_has_finding_of_thrombocytopenic_disorder_now@@occurs_subsequent_to_thrombosis_while_receiving_antithrombotic_treatment
         patient_has_finding_of_thrombocytopenic_disorder_now)
     :named REQ2_AUXILIARY2)) ;; "thrombocytopenia subsequent to thrombosis while receiving antithrombotic treatment"

;; Platelet count qualifier variables imply measurement context
(assert
  (! (=> patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_starting_antithrombotic_prophylaxis
         true)
     :named REQ2_AUXILIARY3)) ;; "platelet count measured at time of starting antithrombotic prophylaxis"

(assert
  (! (=> patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_diagnosis_of_objectively_proven_arterial_or_venous_thromboembolism
         true)
     :named REQ2_AUXILIARY4)) ;; "platelet count measured at time of diagnosis of objectively proven arterial or venous thromboembolism"

(assert
  (! (=> patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_thrombosis
         true)
     :named REQ2_AUXILIARY5)) ;; "platelet count measured at time of thrombosis"

(assert
  (! (=> patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_subsequent_to_thrombosis_while_receiving_antithrombotic_treatment
         true)
     :named REQ2_AUXILIARY6)) ;; "platelet count measured subsequent to thrombosis while receiving antithrombotic treatment"

;; ===================== Constraint Assertions (REQ 2) =====================
;; At least one of the following platelet count criteria must be met:
;; (1) platelet count <50 x10^9/L at the time of starting antithrombotic prophylaxis;
;; (2) platelet count <50 x10^9/L at the time of diagnosis of objectively proven arterial thromboembolism or diagnosis of objectively proven venous thromboembolism;
;; (3) platelet count >50 x10^9/L at time of thrombosis but subsequent thrombocytopenia <50 x10^9/L while receiving antithrombotic treatment.

(assert
  (! (or
        ;; Criterion 1
        (and patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_starting_antithrombotic_prophylaxis
             (< patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l 50.0))
        ;; Criterion 2
        (and patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_diagnosis_of_objectively_proven_arterial_or_venous_thromboembolism
             (< patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l 50.0)
             (or patient_has_finding_of_arterial_embolus_and_thrombosis_now@@objectively_proven
                 patient_has_finding_of_thromboembolism_of_vein_now@@objectively_proven))
        ;; Criterion 3
        (and patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_at_time_of_thrombosis
             (> patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l 50.0)
             patient_has_finding_of_thrombosis_now
             patient_has_finding_of_thrombocytopenic_disorder_now@@occurs_subsequent_to_thrombosis_while_receiving_antithrombotic_treatment
             patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l@@measured_subsequent_to_thrombosis_while_receiving_antithrombotic_treatment
             (< patient_platelet_count_finding_value_recorded_now_withunit_10e9_per_l 50.0)
        )
     )
     :named REQ2_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must meet at least one of the following platelet count criteria: (1) platelet count <50 x10^9/L at the time of starting antithrombotic prophylaxis; (2) platelet count <50 x10^9/L at the time of diagnosis of objectively proven arterial thromboembolism or diagnosis of objectively proven venous thromboembolism; or (3) platelet count >50 x10^9/L at time of thrombosis but subsequent thrombocytopenia <50 x10^9/L while receiving antithrombotic treatment."

;; ===================== Declarations for the criterion (REQ 3) =====================
(declare-const patient_has_diagnosis_of_acute_coronary_syndrome_now Bool) ;; "acute coronary syndrome" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of acute coronary syndrome.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of acute coronary syndrome.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of acute coronary syndrome.","meaning":"Boolean indicating whether the patient currently has a diagnosis of acute coronary syndrome."}
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now Bool) ;; "stroke (cerebrovascular accident)" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stroke (cerebrovascular accident).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of stroke (cerebrovascular accident).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of stroke (cerebrovascular accident).","meaning":"Boolean indicating whether the patient currently has a diagnosis of stroke (cerebrovascular accident)."}
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now@@major Bool) ;; "major stroke" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stroke (cerebrovascular accident) and the stroke is classified as major.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of stroke (cerebrovascular accident) and the stroke is not classified as major.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stroke is classified as major.","meaning":"Boolean indicating whether the patient's current stroke diagnosis is classified as major."}
(declare-const patient_has_diagnosis_of_cerebrovascular_accident_now@@minor Bool) ;; "minor stroke" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of stroke (cerebrovascular accident) and the stroke is classified as minor.","when_to_set_to_false":"Set to false if the patient currently has a diagnosis of stroke (cerebrovascular accident) and the stroke is not classified as minor.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the stroke is classified as minor.","meaning":"Boolean indicating whether the patient's current stroke diagnosis is classified as minor."}
(declare-const patient_has_diagnosis_of_ischemic_stroke_now Bool) ;; "ischemic stroke" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of ischemic stroke.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of ischemic stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of ischemic stroke.","meaning":"Boolean indicating whether the patient currently has a diagnosis of ischemic stroke."}
(declare-const patient_has_diagnosis_of_thrombosis_of_arteries_of_the_extremities_now Bool) ;; "peripheral arterial thrombosis" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of peripheral arterial thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of peripheral arterial thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of peripheral arterial thrombosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of peripheral arterial thrombosis."}
(declare-const patient_has_diagnosis_of_thrombosis_of_retinal_artery_now Bool) ;; "retinal arterial thrombosis" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of retinal arterial thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of retinal arterial thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of retinal arterial thrombosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of retinal arterial thrombosis."}

;; ===================== Auxiliary Assertions (REQ 3) =====================
;; "ischemic stroke (including a diagnosis of major stroke and a diagnosis of minor stroke)"
;; Non-exhaustive examples: major/minor stroke are examples of ischemic stroke
(assert
  (! (=> (or patient_has_diagnosis_of_cerebrovascular_accident_now@@major
             patient_has_diagnosis_of_cerebrovascular_accident_now@@minor)
         patient_has_diagnosis_of_ischemic_stroke_now)
     :named REQ3_AUXILIARY0)) ;; "including a diagnosis of major stroke and a diagnosis of minor stroke"

;; ===================== Constraint Assertions (REQ 3) =====================
;; "if the patient has a diagnosis of arterial thrombosis, it must include one or more of the following: ..."
(assert
  (! (=> patient_has_finding_of_arterial_embolus_and_thrombosis_now
         (or patient_has_diagnosis_of_acute_coronary_syndrome_now
             patient_has_diagnosis_of_ischemic_stroke_now
             patient_has_diagnosis_of_thrombosis_of_arteries_of_the_extremities_now
             patient_has_diagnosis_of_thrombosis_of_retinal_artery_now))
     :named REQ3_COMPONENT0_OTHER_REQUIREMENTS)) ;; "it must include one or more of the following: a diagnosis of acute coronary syndrome, a diagnosis of ischemic stroke (including a diagnosis of major stroke and a diagnosis of minor stroke), a diagnosis of peripheral arterial thrombosis, or a diagnosis of retinal arterial thrombosis."

;; ===================== Declarations for the criterion (REQ 4) =====================
(declare-const patient_has_finding_of_venous_thrombosis_now Bool) ;; "venous thrombosis" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of venous thrombosis.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of venous thrombosis.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of venous thrombosis.","meaning":"Boolean indicating whether the patient currently has a diagnosis of venous thrombosis."}
(declare-const patient_has_diagnosis_of_deep_venous_thrombosis_now Bool) ;; "thrombosis of deep veins of the limbs" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of deep venous thrombosis of the limbs.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of deep venous thrombosis of the limbs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of deep venous thrombosis of the limbs.","meaning":"Boolean indicating whether the patient currently has a diagnosis of deep venous thrombosis of the limbs."}
(declare-const patient_has_diagnosis_of_thrombosis_now@@located_in_deep_veins_of_abdomen Bool) ;; "thrombosis of deep veins of the abdomen" {"when_to_set_to_true":"Set to true if the patient's current diagnosis of thrombosis is located in the deep veins of the abdomen.","when_to_set_to_false":"Set to false if the patient's current diagnosis of thrombosis is not located in the deep veins of the abdomen.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thrombosis is located in the deep veins of the abdomen.","meaning":"Boolean indicating whether the patient's current diagnosis of thrombosis is located in the deep veins of the abdomen."}
(declare-const patient_has_diagnosis_of_superficial_vein_thrombosis_now Bool) ;; "thrombosis of superficial veins of the limbs" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of superficial vein thrombosis of the limbs.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of superficial vein thrombosis of the limbs.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of superficial vein thrombosis of the limbs.","meaning":"Boolean indicating whether the patient currently has a diagnosis of superficial vein thrombosis of the limbs."}
(declare-const patient_has_diagnosis_of_thrombosis_of_cerebral_veins_now Bool) ;; "thrombosis of cerebral veins" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of thrombosis of cerebral veins.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of thrombosis of cerebral veins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of thrombosis of cerebral veins.","meaning":"Boolean indicating whether the patient currently has a diagnosis of thrombosis of cerebral veins."}
(declare-const patient_has_diagnosis_of_thrombosis_now@@located_in_splanchnic_veins Bool) ;; "thrombosis of splanchnic veins" {"when_to_set_to_true":"Set to true if the patient's current diagnosis of thrombosis is located in the splanchnic veins.","when_to_set_to_false":"Set to false if the patient's current diagnosis of thrombosis is not located in the splanchnic veins.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the thrombosis is located in the splanchnic veins.","meaning":"Boolean indicating whether the patient's current diagnosis of thrombosis is located in the splanchnic veins."}
(declare-const patient_has_diagnosis_of_budd_chiari_syndrome_now Bool) ;; "occlusion of hepatic veins" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of Budd-Chiari syndrome (occlusion of hepatic veins).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of Budd-Chiari syndrome (occlusion of hepatic veins).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of Budd-Chiari syndrome (occlusion of hepatic veins).","meaning":"Boolean indicating whether the patient currently has a diagnosis of Budd-Chiari syndrome (occlusion of hepatic veins)."}
(declare-const patient_has_diagnosis_of_portal_vein_obstruction_now Bool) ;; "occlusion of portal veins" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of portal vein obstruction (occlusion of portal veins).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of portal vein obstruction (occlusion of portal veins).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of portal vein obstruction (occlusion of portal veins).","meaning":"Boolean indicating whether the patient currently has a diagnosis of portal vein obstruction (occlusion of portal veins)."}
(declare-const patient_has_diagnosis_of_thrombosis_of_mesenteric_vein_now Bool) ;; "occlusion of mesenteric veins" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of thrombosis of mesenteric vein (occlusion of mesenteric veins).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of thrombosis of mesenteric vein (occlusion of mesenteric veins).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of thrombosis of mesenteric vein (occlusion of mesenteric veins).","meaning":"Boolean indicating whether the patient currently has a diagnosis of thrombosis of mesenteric vein (occlusion of mesenteric veins)."}
(declare-const patient_has_diagnosis_of_splenic_vein_thrombosis_now Bool) ;; "occlusion of splenic veins" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of splenic vein thrombosis (occlusion of splenic veins).","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of splenic vein thrombosis (occlusion of splenic veins).","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of splenic vein thrombosis (occlusion of splenic veins).","meaning":"Boolean indicating whether the patient currently has a diagnosis of splenic vein thrombosis (occlusion of splenic veins)."}
(declare-const patient_has_diagnosis_of_thrombosis_of_retinal_vein_now Bool) ;; "thrombosis of the retinal vein" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of thrombosis of the retinal vein.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of thrombosis of the retinal vein.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of thrombosis of the retinal vein.","meaning":"Boolean indicating whether the patient currently has a diagnosis of thrombosis of the retinal vein."}
(declare-const patient_has_diagnosis_of_pulmonary_embolism_now Bool) ;; "pulmonary embolism" {"when_to_set_to_true":"Set to true if the patient currently has a diagnosis of pulmonary embolism.","when_to_set_to_false":"Set to false if the patient currently does not have a diagnosis of pulmonary embolism.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a diagnosis of pulmonary embolism.","meaning":"Boolean indicating whether the patient currently has a diagnosis of pulmonary embolism."}

;; ===================== Auxiliary Assertions (REQ 4) =====================
;; Splanchnic veins (umbrella) includes occlusion of hepatic, portal, mesenteric, and splenic veins (exhaustive subcategories)
(assert
  (! (= patient_has_diagnosis_of_thrombosis_now@@located_in_splanchnic_veins
        (or patient_has_diagnosis_of_budd_chiari_syndrome_now
            patient_has_diagnosis_of_portal_vein_obstruction_now
            patient_has_diagnosis_of_thrombosis_of_mesenteric_vein_now
            patient_has_diagnosis_of_splenic_vein_thrombosis_now))
     :named REQ4_AUXILIARY0)) ;; "a diagnosis of thrombosis of splanchnic veins (including a diagnosis of occlusion of hepatic veins, a diagnosis of occlusion of portal veins, a diagnosis of occlusion of mesenteric veins, and a diagnosis of occlusion of splenic veins)"

;; ===================== Constraint Assertions (REQ 4) =====================
;; If the patient has a diagnosis of venous thrombosis, it must include at least one of the listed subtypes
(assert
  (! (or (not patient_has_finding_of_venous_thrombosis_now)
         (or patient_has_diagnosis_of_deep_venous_thrombosis_now
             patient_has_diagnosis_of_thrombosis_now@@located_in_deep_veins_of_abdomen
             patient_has_diagnosis_of_superficial_vein_thrombosis_now
             patient_has_diagnosis_of_thrombosis_of_cerebral_veins_now
             patient_has_diagnosis_of_thrombosis_now@@located_in_splanchnic_veins
             patient_has_diagnosis_of_thrombosis_of_retinal_vein_now
             patient_has_diagnosis_of_pulmonary_embolism_now))
     :named REQ4_COMPONENT0_OTHER_REQUIREMENTS)) ;; "if the patient has a diagnosis of venous thrombosis, it must include one or more of the following: ..."
