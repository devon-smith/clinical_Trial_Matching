;; ===================== Declarations for the criterion (REQ 0) =====================
(declare-const patient_has_been_referred_to_cognitive_neuroscience_section_of_national_institute_of_neurological_disorders_and_stroke_ever Bool) ;; {"when_to_set_to_true":"Set to true if the patient has ever been referred to the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke.","when_to_set_to_false":"Set to false if the patient has never been referred to the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient has ever been referred to the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke.","meaning":"Boolean indicating whether the patient has ever been referred to the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke."} ;; "To be included, the patient must have been referred to the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke."

;; ===================== Constraint Assertions (REQ 0) =====================
(assert
  (! patient_has_been_referred_to_cognitive_neuroscience_section_of_national_institute_of_neurological_disorders_and_stroke_ever
     :named REQ0_COMPONENT0_PRESCREEN_NOTES_MUST_COMPLETELY_SUFFICE)) ;; "To be included, the patient must have been referred to the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke."

;; ===================== Declarations for the criterion (REQ 1) =====================
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now Bool) ;; {"when_to_set_to_true":"Set to true if the patient currently has a clinical diagnosis of frontotemporal dementia.","when_to_set_to_false":"Set to false if the patient currently does not have a clinical diagnosis of frontotemporal dementia.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the patient currently has a clinical diagnosis of frontotemporal dementia.","meaning":"Boolean indicating whether the patient currently has a clinical diagnosis of frontotemporal dementia."} ;; "To be included, the patient must have a clinical diagnosis of frontotemporal dementia"
(declare-const patient_has_diagnosis_of_frontotemporal_dementia_now@@confirmed_at_cognitive_neuroscience_section_of_national_institute_of_neurological_disorders_and_stroke Bool) ;; {"when_to_set_to_true":"Set to true if the patient's clinical diagnosis of frontotemporal dementia is confirmed at the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke.","when_to_set_to_false":"Set to false if the patient's clinical diagnosis of frontotemporal dementia is not confirmed at the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke.","when_to_set_to_null":"Set to null if it is unknown, not documented, or cannot be determined whether the diagnosis is confirmed at the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke.","meaning":"Boolean indicating whether the patient's clinical diagnosis of frontotemporal dementia is confirmed at the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke."} ;; "confirmed at the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke"

;; ===================== Auxiliary Assertions (REQ 1) =====================
;; Qualifier variable implies the stem variable
(assert
  (! (=> patient_has_diagnosis_of_frontotemporal_dementia_now@@confirmed_at_cognitive_neuroscience_section_of_national_institute_of_neurological_disorders_and_stroke
         patient_has_diagnosis_of_frontotemporal_dementia_now)
     :named REQ1_AUXILIARY0)) ;; If diagnosis is confirmed at CNS-NINDS, then the patient has a clinical diagnosis of FTD

;; ===================== Constraint Assertions (REQ 1) =====================
(assert
  (! patient_has_diagnosis_of_frontotemporal_dementia_now@@confirmed_at_cognitive_neuroscience_section_of_national_institute_of_neurological_disorders_and_stroke
     :named REQ1_COMPONENT0_OTHER_REQUIREMENTS)) ;; "To be included, the patient must have a clinical diagnosis of frontotemporal dementia (confirmed at the Cognitive Neuroscience Section of the National Institute of Neurological Disorders and Stroke)."
