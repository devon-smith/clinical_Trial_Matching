// Clinician Dashboard JavaScript
// Synthetic data modeled after n2c2 and TREC/SIGIR benchmarks

// ==================== DATA (starts with synthetic, replaced by API) ====================

let syntheticPatients = [
    {
        id: "SYN-P-001",
        name: "Margaret Chen",
        age: 62,
        sex: "Female",
        mrn: "SYN-847291",
        status: "pending",
        primaryCondition: "Type 2 Diabetes Mellitus",
        diagnoses: ["Type 2 Diabetes (5 years)", "Hypertension", "Hyperlipidemia"],
        recentLabs: {
            hba1c: { value: 8.4, date: "2024-02-10", unit: "%" },
            egfr: { value: 67, date: "2024-02-10", unit: "mL/min/1.73m²" },
            creatinine: { value: 1.1, date: "2024-02-10", unit: "mg/dL" }
        },
        medications: ["Metformin 1000mg BID", "Lisinopril 10mg daily", "Atorvastatin 20mg daily"],
        notes: [
            {
                type: "Progress Note",
                date: "2024-02-15",
                excerpt: "62 y/o female with T2DM since 2019, presenting for routine follow-up. HbA1c 8.4% (up from 7.8% last visit). Patient reports good medication adherence but increased stress at work affecting diet..."
            },
            {
                type: "Discharge Summary",
                date: "2024-01-08",
                excerpt: "Admitted for elective cholecystectomy. History of T2DM managed with metformin, well-controlled hypertension. Surgery uncomplicated, discharged POD1 in stable condition..."
            }
        ],
        matchedTrials: 3
    },
    {
        id: "SYN-P-002",
        name: "Robert Williams",
        age: 58,
        sex: "Male",
        mrn: "SYN-382716",
        status: "pending",
        primaryCondition: "Type 2 Diabetes Mellitus",
        diagnoses: ["Type 2 Diabetes (8 months)", "CKD Stage 3a", "Obesity"],
        recentLabs: {
            hba1c: { value: 7.6, date: "2024-02-01", unit: "%" },
            egfr: { value: 52, date: "2024-02-01", unit: "mL/min/1.73m²" },
            creatinine: { value: 1.4, date: "2024-02-01", unit: "mg/dL" }
        },
        medications: ["Metformin 500mg BID"],
        notes: [
            {
                type: "Progress Note",
                date: "2024-02-01",
                excerpt: "58 y/o male with newly diagnosed T2DM (Nov 2023), here for diabetes management. HbA1c 7.6%, improved from 8.2% at diagnosis. Concern for CKD progression, eGFR 52..."
            }
        ],
        matchedTrials: 2
    },
    {
        id: "SYN-P-003",
        name: "David Park",
        age: 51,
        sex: "Male",
        mrn: "SYN-592847",
        status: "pending",
        primaryCondition: "Type 2 Diabetes Mellitus",
        diagnoses: ["Type 2 Diabetes (~2 years per patient)", "Possible heart failure (pending workup)", "Obesity"],
        recentLabs: {
            hba1c: { value: null, date: "2023-10-05", unit: "%", note: "Repeat ordered, result pending" },
            egfr: { value: 78, date: "2023-10-01", unit: "mL/min/1.73m²" },
            bnp: { value: 180, date: "2023-08-20", unit: "pg/mL", note: "Mildly elevated" }
        },
        medications: ["Metformin 500mg BID"],
        notes: [
            {
                type: "Consult Note",
                date: "2023-09-14",
                excerpt: "Cardiology consult for dyspnea evaluation. Patient reports diabetes diagnosed 'approximately two years ago' per patient report. No formal diagnosis date documented. Echo ordered..."
            },
            {
                type: "Discharge Summary",
                date: "2023-08-20",
                excerpt: "Admitted for chest pain evaluation. Troponins negative x3. BNP mildly elevated at 180. Mild dyspnea on exertion. Echo pending at discharge..."
            }
        ],
        matchedTrials: 2
    },
    {
        id: "SYN-P-004",
        name: "Sarah Thompson",
        age: 45,
        sex: "Female",
        mrn: "SYN-194826",
        status: "reviewed",
        primaryCondition: "Type 2 Diabetes Mellitus",
        diagnoses: ["Type 2 Diabetes (3 years)", "Depression", "PCOS"],
        recentLabs: {
            hba1c: { value: 9.2, date: "2024-02-12", unit: "%" },
            egfr: { value: 95, date: "2024-02-12", unit: "mL/min/1.73m²" },
            creatinine: { value: 0.8, date: "2024-02-12", unit: "mg/dL" }
        },
        medications: ["Metformin 1000mg BID", "Glipizide 5mg daily", "Sertraline 50mg daily"],
        notes: [
            {
                type: "Progress Note",
                date: "2024-02-12",
                excerpt: "45 y/o female with poorly controlled T2DM, HbA1c 9.2%. Reports difficulty with medication adherence due to depression. Interested in clinical trial options for better glycemic control..."
            }
        ],
        matchedTrials: 4,
        clinicianNotes: "Patient highly motivated for trial participation. Discussed options, will follow up next week."
    },
    {
        id: "SYN-P-005",
        name: "James Morrison",
        age: 71,
        sex: "Male",
        mrn: "SYN-847362",
        status: "pending",
        primaryCondition: "Type 2 Diabetes Mellitus",
        diagnoses: ["Type 2 Diabetes (12 years)", "CAD s/p CABG 2019", "Atrial Fibrillation", "Hypertension"],
        recentLabs: {
            hba1c: { value: 7.8, date: "2024-01-28", unit: "%" },
            egfr: { value: 58, date: "2024-01-28", unit: "mL/min/1.73m²" },
            creatinine: { value: 1.3, date: "2024-01-28", unit: "mg/dL" }
        },
        medications: ["Metformin 500mg BID", "Insulin glargine 20u QHS", "Apixaban 5mg BID", "Metoprolol 50mg BID", "Lisinopril 20mg daily"],
        notes: [
            {
                type: "Progress Note",
                date: "2024-01-28",
                excerpt: "71 y/o male with longstanding T2DM on insulin, history of CABG 2019, presents for routine DM follow-up. HbA1c stable at 7.8%. Patient asks about newer diabetes medications..."
            },
            {
                type: "Cardiology Note",
                date: "2024-01-15",
                excerpt: "Follow-up for CAD/AFib. LVEF 45% on last echo. Rate well controlled on metoprolol. Anticoagulated on apixaban. No recent angina..."
            }
        ],
        matchedTrials: 1
    },
    {
        id: "SYN-P-006",
        name: "Linda Garcia",
        age: 55,
        sex: "Female",
        mrn: "SYN-293847",
        status: "reviewed",
        primaryCondition: "Type 2 Diabetes Mellitus",
        diagnoses: ["Type 2 Diabetes (6 years)", "Obesity", "OSA on CPAP", "NAFLD"],
        recentLabs: {
            hba1c: { value: 8.8, date: "2024-02-05", unit: "%" },
            egfr: { value: 88, date: "2024-02-05", unit: "mL/min/1.73m²" },
            alt: { value: 52, date: "2024-02-05", unit: "U/L" }
        },
        medications: ["Metformin 1000mg BID", "Empagliflozin 10mg daily"],
        notes: [
            {
                type: "Progress Note",
                date: "2024-02-05",
                excerpt: "55 y/o female with T2DM, obesity (BMI 38), and NAFLD. Recently started on empagliflozin. HbA1c 8.8%, down from 9.4%. ALT mildly elevated at 52..."
            }
        ],
        matchedTrials: 3,
        clinicianNotes: "Good candidate for GLP-1 trial. Discussed with patient, awaiting decision."
    }
];

let syntheticTrials = [
    {
        id: "SYN-NCT-00001",
        title: "Phase 3 Study of Novel GLP-1 Agonist in Type 2 Diabetes",
        phase: "Phase 3",
        condition: "Type 2 Diabetes Mellitus",
        status: "Recruiting",
        criteria: [
            { id: "C1", text: "Diagnosis of T2DM for ≥6 months", type: "inclusion", constraint: "HARD", category: "diagnosis" },
            { id: "C2", text: "Age 40-75 years", type: "inclusion", constraint: "HARD", category: "age" },
            { id: "C3", text: "HbA1c 7.5-11.0%", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C4", text: "eGFR ≥30 mL/min/1.73m²", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C5", text: "No history of pancreatitis", type: "exclusion", constraint: "HARD", category: "comorbidity" },
            { id: "C6", text: "No current insulin use", type: "exclusion", constraint: "HARD", category: "medication" },
            { id: "C7", text: "BMI 25-45 kg/m²", type: "inclusion", constraint: "SOFT", category: "measurement" },
            { id: "C8", text: "Able to attend weekly visits for first month", type: "inclusion", constraint: "SOFT", category: "logistics" }
        ],
        // Required tests/procedures for eligibility
        requiredTests: {
            hard: [
                { id: "T1", name: "HbA1c Blood Test", icon: "blood", description: "Fasting blood draw to confirm HbA1c in range 7.5-11.0%", status: "required" },
                { id: "T2", name: "Comprehensive Metabolic Panel", icon: "blood", description: "CMP including eGFR calculation to confirm kidney function", status: "required" },
                { id: "T3", name: "Lipase/Amylase Panel", icon: "blood", description: "Rule out history of pancreatitis", status: "required" },
                { id: "T4", name: "Pregnancy Test", icon: "blood", description: "For women of childbearing potential", status: "required" }
            ],
            soft: [
                { id: "T5", name: "Body Composition Assessment", icon: "measurement", description: "BMI measurement and body composition analysis", status: "preferred" },
                { id: "T6", name: "ECG (12-lead)", icon: "cardiac", description: "Baseline cardiac assessment", status: "preferred" }
            ]
        }
    },
    {
        id: "SYN-NCT-00002",
        title: "Phase 2 Study of Novel SGLT2 Inhibitor in Early T2DM",
        phase: "Phase 2",
        condition: "Type 2 Diabetes Mellitus",
        status: "Recruiting",
        criteria: [
            { id: "C1", text: "Diagnosis of T2DM for ≥3 months", type: "inclusion", constraint: "HARD", category: "diagnosis" },
            { id: "C2", text: "Age 30-70 years", type: "inclusion", constraint: "HARD", category: "age" },
            { id: "C3", text: "HbA1c 7.0-9.0%", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C4", text: "eGFR ≥60 mL/min/1.73m²", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C5", text: "No history of recurrent UTIs (≥3 in past year)", type: "exclusion", constraint: "HARD", category: "comorbidity" },
            { id: "C6", text: "No prior SGLT2 inhibitor use", type: "exclusion", constraint: "HARD", category: "medication" },
            { id: "C7", text: "Willing to wear CGM device", type: "inclusion", constraint: "SOFT", category: "logistics" }
        ],
        requiredTests: {
            hard: [
                { id: "T1", name: "HbA1c Blood Test", icon: "blood", description: "Confirm HbA1c in range 7.0-9.0%", status: "required" },
                { id: "T2", name: "Renal Function Panel", icon: "blood", description: "eGFR must be ≥60 mL/min/1.73m²", status: "required" },
                { id: "T3", name: "Urinalysis with Culture", icon: "blood", description: "Rule out active UTI and assess baseline", status: "required" },
                { id: "T4", name: "Liver Function Tests", icon: "blood", description: "AST, ALT, bilirubin baseline", status: "required" }
            ],
            soft: [
                { id: "T5", name: "CGM Device Training", icon: "device", description: "Patient education on continuous glucose monitoring", status: "preferred" },
                { id: "T6", name: "Dietary Assessment", icon: "assessment", description: "Nutritionist evaluation for study compliance", status: "optional" }
            ]
        }
    },
    {
        id: "SYN-NCT-00003",
        title: "Phase 3 Combination Therapy Study for Uncontrolled T2DM",
        phase: "Phase 3",
        condition: "Type 2 Diabetes Mellitus",
        status: "Recruiting",
        criteria: [
            { id: "C1", text: "Diagnosis of T2DM for ≥12 months", type: "inclusion", constraint: "HARD", category: "diagnosis" },
            { id: "C2", text: "Age 18-65 years", type: "inclusion", constraint: "HARD", category: "age" },
            { id: "C3", text: "HbA1c 8.0-12.0%", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C4", text: "eGFR ≥45 mL/min/1.73m²", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C5", text: "No history of heart failure", type: "exclusion", constraint: "HARD", category: "comorbidity" },
            { id: "C6", text: "Currently on metformin monotherapy", type: "inclusion", constraint: "HARD", category: "medication" },
            { id: "C7", text: "BMI ≥27 kg/m²", type: "inclusion", constraint: "SOFT", category: "measurement" },
            { id: "C8", text: "Available for 24-month study duration", type: "inclusion", constraint: "SOFT", category: "logistics" }
        ],
        requiredTests: {
            hard: [
                { id: "T1", name: "HbA1c Blood Test", icon: "blood", description: "Confirm poorly controlled diabetes (8.0-12.0%)", status: "required" },
                { id: "T2", name: "BNP/NT-proBNP", icon: "blood", description: "Rule out heart failure", status: "required" },
                { id: "T3", name: "Echocardiogram", icon: "imaging", description: "Assess cardiac function, rule out HF", status: "required" },
                { id: "T4", name: "Comprehensive Metabolic Panel", icon: "blood", description: "Full metabolic assessment including renal function", status: "required" }
            ],
            soft: [
                { id: "T5", name: "DEXA Scan", icon: "imaging", description: "Body composition and bone density assessment", status: "preferred" },
                { id: "T6", name: "Quality of Life Assessment", icon: "assessment", description: "SF-36 or similar validated questionnaire", status: "optional" }
            ]
        }
    },
    {
        id: "SYN-NCT-00004",
        title: "Phase 2 Study of Oral Insulin Formulation",
        phase: "Phase 2",
        condition: "Type 2 Diabetes Mellitus",
        status: "Recruiting",
        criteria: [
            { id: "C1", text: "Diagnosis of T2DM for ≥2 years", type: "inclusion", constraint: "HARD", category: "diagnosis" },
            { id: "C2", text: "Age 35-70 years", type: "inclusion", constraint: "HARD", category: "age" },
            { id: "C3", text: "HbA1c 7.5-10.0%", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C4", text: "eGFR ≥45 mL/min/1.73m²", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C5", text: "No history of gastroparesis", type: "exclusion", constraint: "HARD", category: "comorbidity" },
            { id: "C6", text: "No current injectable diabetes medications", type: "exclusion", constraint: "HARD", category: "medication" },
            { id: "C7", text: "Stable weight (±5%) for past 3 months", type: "inclusion", constraint: "SOFT", category: "measurement" }
        ],
        requiredTests: {
            hard: [
                { id: "T1", name: "HbA1c Blood Test", icon: "blood", description: "Confirm HbA1c 7.5-10.0%", status: "required" },
                { id: "T2", name: "Gastric Emptying Study", icon: "imaging", description: "Rule out gastroparesis (nuclear medicine or breath test)", status: "required" },
                { id: "T3", name: "Upper GI Endoscopy", icon: "procedure", description: "Assess GI tract for absorption study", status: "required" },
                { id: "T4", name: "C-Peptide Level", icon: "blood", description: "Assess endogenous insulin production", status: "required" }
            ],
            soft: [
                { id: "T5", name: "Weight History Review", icon: "assessment", description: "Document weight stability over 3 months", status: "preferred" },
                { id: "T6", name: "Dietary Compliance Assessment", icon: "assessment", description: "Evaluate ability to follow study meal requirements", status: "optional" }
            ]
        }
    },
    {
        id: "SYN-NCT-00005",
        title: "Cardiovascular Outcomes Study in T2DM with Established CVD",
        phase: "Phase 3",
        condition: "Type 2 Diabetes with Cardiovascular Disease",
        status: "Recruiting",
        criteria: [
            { id: "C1", text: "Diagnosis of T2DM for ≥6 months", type: "inclusion", constraint: "HARD", category: "diagnosis" },
            { id: "C2", text: "Age 50-85 years", type: "inclusion", constraint: "HARD", category: "age" },
            { id: "C3", text: "History of established cardiovascular disease (MI, stroke, or revascularization)", type: "inclusion", constraint: "HARD", category: "comorbidity" },
            { id: "C4", text: "HbA1c 7.0-10.5%", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C5", text: "eGFR ≥30 mL/min/1.73m²", type: "inclusion", constraint: "HARD", category: "lab_value" },
            { id: "C6", text: "No NYHA Class IV heart failure", type: "exclusion", constraint: "HARD", category: "comorbidity" },
            { id: "C7", text: "Stable cardiac medications for ≥4 weeks", type: "inclusion", constraint: "SOFT", category: "medication" }
        ],
        requiredTests: {
            hard: [
                { id: "T1", name: "HbA1c Blood Test", icon: "blood", description: "Confirm HbA1c 7.0-10.5%", status: "required" },
                { id: "T2", name: "Echocardiogram with LVEF", icon: "imaging", description: "Assess cardiac function, document ejection fraction", status: "required" },
                { id: "T3", name: "12-Lead ECG", icon: "cardiac", description: "Baseline cardiac rhythm assessment", status: "required" },
                { id: "T4", name: "Cardiac Biomarkers", icon: "blood", description: "Troponin, BNP to assess cardiac status", status: "required" },
                { id: "T5", name: "Stress Test or Cardiac Imaging", icon: "imaging", description: "Stress echo, nuclear perfusion, or CT angiography", status: "required" }
            ],
            soft: [
                { id: "T6", name: "Carotid Ultrasound", icon: "imaging", description: "Assess carotid artery disease burden", status: "preferred" },
                { id: "T7", name: "Ankle-Brachial Index", icon: "measurement", description: "Screen for peripheral artery disease", status: "optional" }
            ]
        }
    }
];

// Pre-computed patient-trial evaluations
let patientTrialEvaluations = {
    "SYN-P-001": [
        {
            trialId: "SYN-NCT-00001",
            eligibility: "MAYBE",
            confidence: 0.89,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM diagnosed in 2019 (5 years)", rationale: "Exceeds 6-month minimum requirement" },
                { criterionId: "C2", status: "MET", evidence: "Age 62", rationale: "Within 40-75 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 8.4%", rationale: "Within 7.5-11.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 67 mL/min/1.73m²", rationale: "Above 30 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No pancreatitis documented", rationale: "Reviewed all available notes" },
                { criterionId: "C6", status: "MET", evidence: "Current meds: Metformin, Lisinopril, Atorvastatin", rationale: "No insulin in medication list" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "BMI not documented in recent notes", rationale: "Needs verification" },
                { criterionId: "C8", status: "UNCLEAR", evidence: "Schedule availability not assessed", rationale: "Discuss with patient" }
            ],
            hardMet: 6, hardTotal: 6, softMet: 0, softUnclear: 2, softTotal: 2
        },
        {
            trialId: "SYN-NCT-00002",
            eligibility: "NO",
            confidence: 0.95,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM diagnosed 2019", rationale: "Exceeds 3-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 62", rationale: "Within 30-70 range" },
                { criterionId: "C3", status: "NOT_MET", evidence: "HbA1c 8.4%", rationale: "Exceeds maximum of 9.0%" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 67", rationale: "Above 60 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No UTI history documented", rationale: "No recurrent UTIs noted" },
                { criterionId: "C6", status: "MET", evidence: "No prior SGLT2i use documented", rationale: "Current meds reviewed" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "CGM willingness not assessed", rationale: "Would need to discuss" }
            ],
            hardMet: 5, hardTotal: 6, hardNotMet: 1, softMet: 0, softUnclear: 1, softTotal: 1
        },
        {
            trialId: "SYN-NCT-00004",
            eligibility: "MAYBE",
            confidence: 0.82,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM since 2019 (5 years)", rationale: "Exceeds 2-year minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 62", rationale: "Within 35-70 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 8.4%", rationale: "Within 7.5-10.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 67", rationale: "Above 45 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No gastroparesis documented", rationale: "Reviewed GI history" },
                { criterionId: "C6", status: "MET", evidence: "No injectable diabetes meds", rationale: "On oral metformin only" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "Weight stability not documented", rationale: "Need weight trend data" }
            ],
            hardMet: 6, hardTotal: 6, softMet: 0, softUnclear: 1, softTotal: 1
        }
    ],
    "SYN-P-002": [
        {
            trialId: "SYN-NCT-00002",
            eligibility: "NO",
            confidence: 0.98,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM diagnosed Nov 2023 (8 months)", rationale: "Exceeds 3-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 58", rationale: "Within 30-70 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 7.6%", rationale: "Within 7.0-9.0% range" },
                { criterionId: "C4", status: "NOT_MET", evidence: "eGFR 52 mL/min/1.73m²", rationale: "Below 60 threshold - CKD Stage 3a documented" },
                { criterionId: "C5", status: "MET", evidence: "No recurrent UTIs documented", rationale: "No UTI history in notes" },
                { criterionId: "C6", status: "MET", evidence: "No prior SGLT2i", rationale: "On metformin only" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "CGM willingness not assessed", rationale: "Would need to discuss" }
            ],
            hardMet: 5, hardTotal: 6, hardNotMet: 1, softMet: 0, softUnclear: 1, softTotal: 1
        },
        {
            trialId: "SYN-NCT-00001",
            eligibility: "MAYBE",
            confidence: 0.75,
            criteriaEvaluations: [
                { criterionId: "C1", status: "NOT_MET", evidence: "T2DM diagnosed Nov 2023 (8 months)", rationale: "Does not meet 6-month minimum (borderline)" },
                { criterionId: "C2", status: "MET", evidence: "Age 58", rationale: "Within 40-75 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 7.6%", rationale: "Within 7.5-11.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 52", rationale: "Above 30 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No pancreatitis documented", rationale: "Reviewed available history" },
                { criterionId: "C6", status: "MET", evidence: "No insulin use", rationale: "On metformin only" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "BMI not documented", rationale: "Obesity noted but BMI value needed" },
                { criterionId: "C8", status: "UNCLEAR", evidence: "Schedule not assessed", rationale: "Would need to discuss availability" }
            ],
            hardMet: 5, hardTotal: 6, hardNotMet: 1, softMet: 0, softUnclear: 2, softTotal: 2
        }
    ],
    "SYN-P-003": [
        {
            trialId: "SYN-NCT-00003",
            eligibility: "MAYBE",
            confidence: 0.45,
            criteriaEvaluations: [
                { criterionId: "C1", status: "UNCLEAR", evidence: "Diabetes diagnosed 'approximately two years ago' per patient", rationale: "No formal diagnosis date - requires verification" },
                { criterionId: "C2", status: "MET", evidence: "Age 51", rationale: "Within 18-65 range" },
                { criterionId: "C3", status: "UNCLEAR", evidence: "Last confirmed HbA1c 7.4% (June 2023), repeat ordered Oct 2023", rationale: "Result pending - may now be in range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 78", rationale: "Above 45 threshold" },
                { criterionId: "C5", status: "UNCLEAR", evidence: "BNP 180, echo pending", rationale: "Cannot confirm no HF without echo results" },
                { criterionId: "C6", status: "MET", evidence: "On metformin 500mg BID only", rationale: "Confirmed metformin monotherapy" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "BMI not documented", rationale: "Obesity noted but value needed" },
                { criterionId: "C8", status: "UNCLEAR", evidence: "Study duration commitment not assessed", rationale: "Would need to discuss" }
            ],
            hardMet: 2, hardTotal: 6, hardUnclear: 3, hardNotMet: 0, softMet: 0, softUnclear: 2, softTotal: 2
        },
        {
            trialId: "SYN-NCT-00004",
            eligibility: "MAYBE",
            confidence: 0.55,
            criteriaEvaluations: [
                { criterionId: "C1", status: "UNCLEAR", evidence: "'Approximately two years' per patient report", rationale: "Meets threshold if accurate, but needs verification" },
                { criterionId: "C2", status: "MET", evidence: "Age 51", rationale: "Within 35-70 range" },
                { criterionId: "C3", status: "UNCLEAR", evidence: "Last HbA1c 7.4%, repeat pending", rationale: "May be in range now - needs current value" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 78", rationale: "Above 45 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No gastroparesis documented", rationale: "No GI motility issues noted" },
                { criterionId: "C6", status: "MET", evidence: "On oral metformin only", rationale: "No injectable diabetes medications" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "Weight trend not documented", rationale: "Need recent weight measurements" }
            ],
            hardMet: 4, hardTotal: 6, hardUnclear: 2, softMet: 0, softUnclear: 1, softTotal: 1
        }
    ],
    "SYN-P-004": [
        {
            trialId: "SYN-NCT-00001",
            eligibility: "MAYBE",
            confidence: 0.92,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 3 years", rationale: "Exceeds 6-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 45", rationale: "Within 40-75 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 9.2%", rationale: "Within 7.5-11.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 95", rationale: "Well above 30 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No pancreatitis documented", rationale: "GI history reviewed" },
                { criterionId: "C6", status: "MET", evidence: "On oral agents only", rationale: "Metformin + glipizide, no insulin" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "BMI not documented", rationale: "Would need to measure" },
                { criterionId: "C8", status: "UNCLEAR", evidence: "Schedule availability unknown", rationale: "Patient works - need to assess" }
            ],
            hardMet: 6, hardTotal: 6, softMet: 0, softUnclear: 2, softTotal: 2
        },
        {
            trialId: "SYN-NCT-00003",
            eligibility: "MAYBE",
            confidence: 0.78,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 3 years", rationale: "Exceeds 12-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 45", rationale: "Within 18-65 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 9.2%", rationale: "Within 8.0-12.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 95", rationale: "Above 45 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No heart failure documented", rationale: "Cardiac history negative" },
                { criterionId: "C6", status: "NOT_MET", evidence: "On metformin + glipizide", rationale: "Not on metformin monotherapy - on dual therapy" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "BMI not documented", rationale: "Would need measurement" },
                { criterionId: "C8", status: "UNCLEAR", evidence: "24-month availability not assessed", rationale: "Long commitment - need to discuss" }
            ],
            hardMet: 5, hardTotal: 6, hardNotMet: 1, softMet: 0, softUnclear: 2, softTotal: 2
        },
        {
            trialId: "SYN-NCT-00002",
            eligibility: "NO",
            confidence: 0.95,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 3 years", rationale: "Exceeds 3-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 45", rationale: "Within 30-70 range" },
                { criterionId: "C3", status: "NOT_MET", evidence: "HbA1c 9.2%", rationale: "Exceeds maximum of 9.0%" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 95", rationale: "Above 60 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No recurrent UTIs", rationale: "No UTI history documented" },
                { criterionId: "C6", status: "MET", evidence: "No prior SGLT2i documented", rationale: "On metformin/glipizide" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "CGM willingness not assessed", rationale: "Would need to discuss" }
            ],
            hardMet: 5, hardTotal: 6, hardNotMet: 1, softMet: 0, softUnclear: 1, softTotal: 1
        },
        {
            trialId: "SYN-NCT-00004",
            eligibility: "MAYBE",
            confidence: 0.85,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 3 years", rationale: "Exceeds 2-year minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 45", rationale: "Within 35-70 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 9.2%", rationale: "Within 7.5-10.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 95", rationale: "Above 45 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No gastroparesis", rationale: "No GI motility issues" },
                { criterionId: "C6", status: "MET", evidence: "No injectable diabetes meds", rationale: "On oral agents only" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "Weight stability not documented", rationale: "Need weight trend data" }
            ],
            hardMet: 6, hardTotal: 6, softMet: 0, softUnclear: 1, softTotal: 1
        }
    ],
    "SYN-P-005": [
        {
            trialId: "SYN-NCT-00005",
            eligibility: "MAYBE",
            confidence: 0.88,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 12 years", rationale: "Exceeds 6-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 71", rationale: "Within 50-85 range" },
                { criterionId: "C3", status: "MET", evidence: "History of CABG 2019", rationale: "Established CVD documented" },
                { criterionId: "C4", status: "MET", evidence: "HbA1c 7.8%", rationale: "Within 7.0-10.5% range" },
                { criterionId: "C5", status: "MET", evidence: "eGFR 58", rationale: "Above 30 threshold" },
                { criterionId: "C6", status: "MET", evidence: "LVEF 45%, no Class IV HF symptoms", rationale: "No severe HF documented" },
                { criterionId: "C7", status: "MET", evidence: "Stable on current cardiac meds", rationale: "Per cardiology note, stable regimen" }
            ],
            hardMet: 6, hardTotal: 6, softMet: 1, softTotal: 1
        }
    ],
    "SYN-P-006": [
        {
            trialId: "SYN-NCT-00001",
            eligibility: "NO",
            confidence: 0.92,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 6 years", rationale: "Meets 6-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 55", rationale: "Within 40-75 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 8.8%", rationale: "Within 7.5-11.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 88", rationale: "Above 30 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No pancreatitis documented", rationale: "GI history reviewed" },
                { criterionId: "C6", status: "NOT_MET", evidence: "Currently on empagliflozin", rationale: "SGLT2i is excluded - some trials consider this similar to insulin class" },
                { criterionId: "C7", status: "MET", evidence: "BMI 38 documented", rationale: "Within 25-45 range" },
                { criterionId: "C8", status: "UNCLEAR", evidence: "Schedule not assessed", rationale: "Would need to discuss availability" }
            ],
            hardMet: 5, hardTotal: 6, hardNotMet: 1, softMet: 1, softUnclear: 1, softTotal: 2
        },
        {
            trialId: "SYN-NCT-00003",
            eligibility: "NO",
            confidence: 0.95,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 6 years", rationale: "Exceeds 12-month minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 55", rationale: "Within 18-65 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 8.8%", rationale: "Within 8.0-12.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 88", rationale: "Above 45 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No heart failure documented", rationale: "Cardiac history negative" },
                { criterionId: "C6", status: "NOT_MET", evidence: "On metformin + empagliflozin", rationale: "Not on metformin monotherapy" },
                { criterionId: "C7", status: "MET", evidence: "BMI 38", rationale: "Above 27 threshold" },
                { criterionId: "C8", status: "UNCLEAR", evidence: "24-month availability not assessed", rationale: "Long commitment" }
            ],
            hardMet: 5, hardTotal: 6, hardNotMet: 1, softMet: 1, softUnclear: 1, softTotal: 2
        },
        {
            trialId: "SYN-NCT-00004",
            eligibility: "MAYBE",
            confidence: 0.80,
            criteriaEvaluations: [
                { criterionId: "C1", status: "MET", evidence: "T2DM for 6 years", rationale: "Exceeds 2-year minimum" },
                { criterionId: "C2", status: "MET", evidence: "Age 55", rationale: "Within 35-70 range" },
                { criterionId: "C3", status: "MET", evidence: "HbA1c 8.8%", rationale: "Within 7.5-10.0% range" },
                { criterionId: "C4", status: "MET", evidence: "eGFR 88", rationale: "Above 45 threshold" },
                { criterionId: "C5", status: "MET", evidence: "No gastroparesis documented", rationale: "No GI motility issues" },
                { criterionId: "C6", status: "MET", evidence: "Empagliflozin is not injectable", rationale: "No injectable diabetes meds" },
                { criterionId: "C7", status: "UNCLEAR", evidence: "Weight stability not documented", rationale: "Recently started SGLT2i - weight may be changing" }
            ],
            hardMet: 6, hardTotal: 6, softMet: 0, softUnclear: 1, softTotal: 1
        }
    ]
};

// ==================== STATE MANAGEMENT ====================

let selectedPatientId = null;
let currentClinicianFilter = 'all';

// ==================== API DATA LOADING ====================

async function loadPatientsFromAPI() {
    try {
        const res = await fetch('/api/clinician/patients');
        if (!res.ok) throw new Error('API unavailable');
        const data = await res.json();

        // Map API patients to the format the existing UI expects
        syntheticPatients = data.patients.map(p => ({
            id: p.id,
            name: p.id.replace('sigir-', 'SIGIR Patient '),
            age: p.age || 0,
            sex: (p.sex || '').includes('ale') ? p.sex : 'Unknown',
            mrn: p.id,
            status: p.status || 'pending',
            primaryCondition: p.note_excerpt.substring(0, 80),
            diagnoses: [],
            recentLabs: {},
            medications: [],
            notes: [{ type: 'Clinical Note', date: '', excerpt: p.note_excerpt }],
            matchedTrials: p.ranked_trials,
            attribute_count: p.attribute_count,
        }));
        console.log(`Loaded ${syntheticPatients.length} patients from API`);
        return true;
    } catch (e) {
        console.warn('API unavailable, using synthetic data:', e.message);
        return false;
    }
}

async function loadPatientEvaluationsFromAPI(patientId) {
    try {
        const res = await fetch(`/api/clinician/patient/${patientId}/evaluations`);
        if (!res.ok) return false;
        const data = await res.json();

        // Map API evaluations to the format the existing UI expects
        patientTrialEvaluations[patientId] = data.evaluations.map(ev => ({
            trialId: ev.nct_id,
            eligibility: ev.eligibility_status === 'eligible' ? 'YES'
                       : ev.eligibility_status === 'not_eligible' ? 'NO' : 'MAYBE',
            confidence: ev.match_score / 100,
            goldRank: ev.gold_rank,
            criteriaEvaluations: (ev.criteria_details || []).map((cd, i) => ({
                criterionId: `C${i+1}`,
                status: cd.met ? 'MET' : (cd.llm_status === 'NOT_MET' ? 'NOT_MET' : 'UNCLEAR'),
                evidence: cd.llm_evidence || (cd.met ? 'Criterion satisfied' : 'Needs review'),
                rationale: cd.llm_reasoning || '',
                text: cd.attribute.replace(/_/g, ' ').replace(/^patient /, ''),
                type: cd.is_inclusion ? 'inclusion' : 'exclusion',
                constraint: cd.hard ? 'HARD' : 'SOFT',
            })),
            hardMet: ev.hard_met,
            hardTotal: ev.hard_total,
            softMet: ev.soft_met,
            softTotal: ev.soft_total,
            matchScore: ev.match_score,
        }));

        // Also populate syntheticTrials with real trial data
        for (const ev of data.evaluations) {
            if (!syntheticTrials.find(t => t.id === ev.nct_id)) {
                syntheticTrials.push({
                    id: ev.nct_id,
                    title: ev.title || ev.nct_id,
                    phase: ev.phase || '',
                    condition: '',
                    status: ev.status || 'Unknown',
                    criteria: [],
                });
            }
        }

        // Update patient note with full text
        const patient = syntheticPatients.find(p => p.id === patientId);
        if (patient && data.note) {
            patient.notes = [{ type: 'Clinical Note', date: '', excerpt: data.note }];
            patient.attribute_count = data.attribute_count;
        }

        return true;
    } catch (e) {
        console.warn(`Failed to load evaluations for ${patientId}:`, e.message);
        return false;
    }
}

// ==================== INITIALIZATION ====================

async function initClinicianDashboard() {
    await loadPatientsFromAPI();
    renderPatientList();
    updateCounts();
}

// ==================== RENDERING FUNCTIONS ====================

function renderPatientList() {
    const container = document.getElementById('clinician-patient-list');
    if (!container) return;

    let filteredPatients = syntheticPatients;
    if (currentClinicianFilter === 'pending') {
        filteredPatients = syntheticPatients.filter(p => p.status === 'pending');
    } else if (currentClinicianFilter === 'reviewed') {
        filteredPatients = syntheticPatients.filter(p => p.status === 'reviewed');
    }

    container.innerHTML = filteredPatients.map(patient => `
        <div class="patient-card p-4 border-b border-slate-100 cursor-pointer hover:bg-slate-50 transition-colors ${selectedPatientId === patient.id ? 'bg-blue-50 border-l-4 border-l-blue-500' : ''}"
             onclick="selectPatient('${patient.id}')">
            <div class="flex items-start justify-between">
                <div class="flex-1 min-w-0">
                    <div class="flex items-center gap-2">
                        <h4 class="font-medium text-slate-800 truncate">${patient.name}</h4>
                        ${patient.status === 'pending'
                            ? '<span class="px-1.5 py-0.5 bg-amber-100 text-amber-700 text-xs font-medium rounded">Pending</span>'
                            : '<span class="px-1.5 py-0.5 bg-green-100 text-green-700 text-xs font-medium rounded">Reviewed</span>'
                        }
                    </div>
                    <p class="text-sm text-slate-500 mt-0.5">${patient.age}${patient.sex === 'Male' ? 'M' : 'F'} · ${patient.mrn}</p>
                    <p class="text-xs text-slate-400 mt-1 truncate">${patient.primaryCondition}</p>
                </div>
                <div class="text-right flex-shrink-0 ml-2">
                    <div class="text-lg font-semibold text-blue-600">${patient.matchedTrials}</div>
                    <div class="text-xs text-slate-400">trials</div>
                </div>
            </div>
        </div>
    `).join('');
}

async function selectPatient(patientId) {
    selectedPatientId = patientId;
    renderPatientList();

    // Show loading state
    const detailsContainer = document.getElementById('clinician-patient-details');
    if (detailsContainer) {
        detailsContainer.innerHTML = '<div class="flex items-center justify-center py-12"><p class="text-slate-400">Loading evaluations...</p></div>';
    }

    // Fetch real evaluations from API if not already loaded
    if (!patientTrialEvaluations[patientId] || patientTrialEvaluations[patientId].length === 0) {
        await loadPatientEvaluationsFromAPI(patientId);
    }

    renderPatientDetails(patientId);
    renderActionItems(patientId);
}

function renderPatientDetails(patientId) {
    const container = document.getElementById('clinician-patient-details');
    const patient = syntheticPatients.find(p => p.id === patientId);
    const evaluations = patientTrialEvaluations[patientId] || [];

    if (!patient) return;

    container.innerHTML = `
        <div class="space-y-6">
            <!-- Patient Header -->
            <div class="bg-white rounded-xl border border-slate-200 p-6">
                <div class="flex items-start justify-between">
                    <div>
                        <h2 class="text-xl font-bold text-slate-800">${patient.name}</h2>
                        <p class="text-slate-500 mt-1">${patient.age} years old · ${patient.sex} · MRN: ${patient.mrn}</p>
                    </div>
                    <div class="flex items-center gap-2">
                        ${patient.status === 'pending'
                            ? '<span class="px-3 py-1 bg-amber-100 text-amber-700 text-sm font-medium rounded-full">Pending Review</span>'
                            : '<span class="px-3 py-1 bg-green-100 text-green-700 text-sm font-medium rounded-full">Reviewed</span>'
                        }
                        <button onclick="markAsReviewed('${patient.id}')" class="px-3 py-1 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors">
                            ${patient.status === 'pending' ? 'Mark Reviewed' : 'Update'}
                        </button>
                    </div>
                </div>

                <!-- Quick Stats -->
                <div class="grid grid-cols-4 gap-4 mt-6">
                    <div class="bg-slate-50 rounded-lg p-3 text-center">
                        <p class="text-2xl font-bold text-slate-800">${evaluations.length}</p>
                        <p class="text-xs text-slate-500">Matched Trials</p>
                    </div>
                    <div class="bg-green-50 rounded-lg p-3 text-center">
                        <p class="text-2xl font-bold text-green-600">${evaluations.filter(e => e.eligibility === 'MAYBE' && e.confidence > 0.8).length}</p>
                        <p class="text-xs text-slate-500">Likely Eligible</p>
                    </div>
                    <div class="bg-amber-50 rounded-lg p-3 text-center">
                        <p class="text-2xl font-bold text-amber-600">${evaluations.filter(e => e.eligibility === 'MAYBE' && e.confidence <= 0.8).length}</p>
                        <p class="text-xs text-slate-500">Needs Review</p>
                    </div>
                    <div class="bg-red-50 rounded-lg p-3 text-center">
                        <p class="text-2xl font-bold text-red-600">${evaluations.filter(e => e.eligibility === 'NO').length}</p>
                        <p class="text-xs text-slate-500">Ineligible</p>
                    </div>
                </div>
            </div>

            <!-- Clinical Summary -->
            <div class="bg-white rounded-xl border border-slate-200 p-6">
                <h3 class="font-semibold text-slate-800 mb-4">Clinical Summary</h3>
                <div class="grid grid-cols-2 gap-6">
                    <div>
                        <h4 class="text-sm font-medium text-slate-600 mb-2">Diagnoses</h4>
                        <ul class="space-y-1">
                            ${patient.diagnoses.map(d => `<li class="text-sm text-slate-700 flex items-center gap-2">
                                <span class="w-1.5 h-1.5 bg-blue-500 rounded-full"></span>${d}
                            </li>`).join('')}
                        </ul>
                    </div>
                    <div>
                        <h4 class="text-sm font-medium text-slate-600 mb-2">Current Medications</h4>
                        <ul class="space-y-1">
                            ${patient.medications.map(m => `<li class="text-sm text-slate-700 flex items-center gap-2">
                                <span class="w-1.5 h-1.5 bg-green-500 rounded-full"></span>${m}
                            </li>`).join('')}
                        </ul>
                    </div>
                </div>
                <div class="mt-4 pt-4 border-t border-slate-100">
                    <h4 class="text-sm font-medium text-slate-600 mb-2">Recent Labs</h4>
                    <div class="flex flex-wrap gap-3">
                        ${Object.entries(patient.recentLabs).map(([key, lab]) => `
                            <div class="px-3 py-2 bg-slate-50 rounded-lg">
                                <span class="text-xs text-slate-500 uppercase">${key}</span>
                                <p class="font-semibold text-slate-800">${lab.value !== null ? lab.value + ' ' + lab.unit : 'Pending'}</p>
                                <p class="text-xs text-slate-400">${lab.date}</p>
                                ${lab.note ? `<p class="text-xs text-amber-600 mt-1">${lab.note}</p>` : ''}
                            </div>
                        `).join('')}
                    </div>
                </div>
            </div>

            <!-- Clinical Notes -->
            <div class="bg-white rounded-xl border border-slate-200 p-6">
                <h3 class="font-semibold text-slate-800 mb-4">Clinical Notes (${patient.notes.length})</h3>
                <div class="space-y-3">
                    ${patient.notes.map(note => `
                        <div class="border border-slate-100 rounded-lg p-4">
                            <div class="flex items-center justify-between mb-2">
                                <span class="px-2 py-1 bg-slate-100 text-slate-600 text-xs font-medium rounded">${note.type}</span>
                                <span class="text-xs text-slate-400">${note.date}</span>
                            </div>
                            <p class="text-sm text-slate-600 line-clamp-3">${note.excerpt}</p>
                            <button class="text-xs text-blue-600 hover:underline mt-2">View full note</button>
                        </div>
                    `).join('')}
                </div>
            </div>

            <!-- Trial Matches -->
            <div class="bg-white rounded-xl border border-slate-200 p-6">
                <h3 class="font-semibold text-slate-800 mb-4">Trial Matches</h3>
                <div class="space-y-4">
                    ${evaluations.map(evaluation => renderTrialEvaluation(evaluation)).join('')}
                </div>
            </div>
        </div>
    `;
}

function renderTrialEvaluation(evaluation) {
    const trial = syntheticTrials.find(t => t.id === evaluation.trialId);
    if (!trial) return '';

    const hardCriteria = evaluation.criteriaEvaluations.filter(c => {
        const criterion = trial.criteria.find(tc => tc.id === c.criterionId);
        return criterion && criterion.constraint === 'HARD';
    });
    const softCriteria = evaluation.criteriaEvaluations.filter(c => {
        const criterion = trial.criteria.find(tc => tc.id === c.criterionId);
        return criterion && criterion.constraint === 'SOFT';
    });

    const eligibilityColor = evaluation.eligibility === 'NO' ? 'red' :
                            evaluation.confidence > 0.8 ? 'green' : 'amber';

    return `
        <div class="border border-slate-200 rounded-xl overflow-hidden">
            <!-- Trial Header -->
            <div class="p-4 bg-slate-50 border-b border-slate-200">
                <div class="flex items-start justify-between">
                    <div class="flex-1">
                        <div class="flex items-center gap-2">
                            <h4 class="font-medium text-slate-800">${trial.title}</h4>
                            <span class="px-2 py-0.5 bg-slate-200 text-slate-600 text-xs rounded">${trial.phase}</span>
                        </div>
                        <p class="text-xs text-slate-500 mt-1">${trial.id}</p>
                    </div>
                    <div class="text-right">
                        <span class="px-3 py-1 bg-${eligibilityColor}-100 text-${eligibilityColor}-700 text-sm font-medium rounded-full">
                            ${evaluation.eligibility === 'NO' ? 'Ineligible' : 'Potentially Eligible'}
                        </span>
                        <p class="text-xs text-slate-400 mt-1">${Math.round(evaluation.confidence * 100)}% confidence</p>
                    </div>
                </div>
            </div>

            <!-- Action Links -->
            <div class="px-4 py-3 bg-white border-b border-slate-100 flex items-center gap-2">
                <button onclick="saveTrialForPatient('${evaluation.trialId}')" class="inline-flex items-center gap-1.5 px-3 py-1.5 bg-white text-slate-600 border border-slate-200 text-sm font-medium rounded-lg hover:bg-slate-100 transition-colors">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"></path></svg>
                    Save
                </button>
                <button onclick="shareTrialWithPatient('${evaluation.trialId}')" class="inline-flex items-center gap-1.5 px-3 py-1.5 bg-white text-slate-600 border border-slate-200 text-sm font-medium rounded-lg hover:bg-slate-100 transition-colors">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"></path></svg>
                    Share with Patient
                </button>
                <a href="https://clinicaltrials.gov/ct2/show/${trial.id}" target="_blank" class="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-50 text-blue-600 border border-blue-200 text-sm font-medium rounded-lg hover:bg-blue-100 transition-colors">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                    ClinicalTrials.gov
                </a>
            </div>

            <!-- Criteria Evaluation -->
            <div class="p-4">
                <!-- Hard Criteria -->
                <div class="mb-4">
                    <h5 class="text-sm font-medium text-slate-700 flex items-center gap-2 mb-3">
                        <svg class="w-4 h-4 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                        </svg>
                        Required Criteria (Hard)
                    </h5>
                    <div class="space-y-2">
                        ${hardCriteria.map(c => {
                            const criterion = trial.criteria.find(tc => tc.id === c.criterionId);
                            return renderCriterionRow(criterion, c);
                        }).join('')}
                    </div>
                </div>

                <!-- Soft Criteria -->
                ${softCriteria.length > 0 ? `
                    <div>
                        <h5 class="text-sm font-medium text-slate-700 flex items-center gap-2 mb-3">
                            <svg class="w-4 h-4 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path>
                            </svg>
                            Preferences (Soft)
                        </h5>
                        <div class="space-y-2">
                            ${softCriteria.map(c => {
                                const criterion = trial.criteria.find(tc => tc.id === c.criterionId);
                                return renderCriterionRow(criterion, c);
                            }).join('')}
                        </div>
                    </div>
                ` : ''}
            </div>
        </div>
    `;
}

function renderCriterionRow(criterion, evaluation) {
    const statusConfig = {
        MET: { bg: 'bg-green-50', border: 'border-green-200', icon: 'text-green-600', iconSvg: '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>' },
        NOT_MET: { bg: 'bg-red-50', border: 'border-red-200', icon: 'text-red-600', iconSvg: '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>' },
        UNCLEAR: { bg: 'bg-amber-50', border: 'border-amber-200', icon: 'text-amber-600', iconSvg: '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>' }
    };

    const config = statusConfig[evaluation.status];

    return `
        <div class="p-3 rounded-lg ${config.bg} border ${config.border}">
            <div class="flex items-start gap-3">
                <svg class="w-5 h-5 ${config.icon} flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    ${config.iconSvg}
                </svg>
                <div class="flex-1 min-w-0">
                    <p class="text-sm font-medium text-slate-800">${criterion.text}</p>
                    <p class="text-xs text-slate-600 mt-1"><strong>Evidence:</strong> ${evaluation.evidence}</p>
                    <p class="text-xs text-slate-500 mt-0.5"><strong>Rationale:</strong> ${evaluation.rationale}</p>
                </div>
                <span class="px-2 py-0.5 text-xs font-medium rounded ${
                    evaluation.status === 'MET' ? 'bg-green-100 text-green-700' :
                    evaluation.status === 'NOT_MET' ? 'bg-red-100 text-red-700' :
                    'bg-amber-100 text-amber-700'
                }">
                    ${evaluation.status === 'MET' ? 'Met' : evaluation.status === 'NOT_MET' ? 'Not Met' : 'Unclear'}
                </span>
            </div>
        </div>
    `;
}

function renderActionItems(patientId) {
    const container = document.getElementById('clinician-action-items');
    const patient = syntheticPatients.find(p => p.id === patientId);
    const evaluations = patientTrialEvaluations[patientId] || [];

    if (!patient) return;

    // Collect required tests from all potentially eligible trials
    const hardRequirements = [];
    const softRequirements = [];

    evaluations.forEach(evaluation => {
        const trial = syntheticTrials.find(t => t.id === evaluation.trialId);
        if (!trial || !trial.requiredTests) return;

        // Only show requirements for potentially eligible trials
        if (evaluation.eligibility === 'MAYBE') {
            // Add hard requirements (must complete)
            if (trial.requiredTests.hard) {
                trial.requiredTests.hard.forEach(test => {
                    // Check if this test relates to an unclear criterion
                    const relatedUnclear = evaluation.criteriaEvaluations.some(c =>
                        c.status === 'UNCLEAR' &&
                        (test.description.toLowerCase().includes(c.evidence.toLowerCase().substring(0, 10)) ||
                         test.name.toLowerCase().includes('hba1c') && c.criterionId === 'C3' ||
                         test.name.toLowerCase().includes('egfr') && c.criterionId === 'C4' ||
                         test.name.toLowerCase().includes('echo') && c.criterionId === 'C5')
                    );

                    hardRequirements.push({
                        ...test,
                        trialId: trial.id,
                        trialTitle: trial.title,
                        trialPhase: trial.phase,
                        isUrgent: relatedUnclear
                    });
                });
            }
            // Add soft requirements (preferred/optional)
            if (trial.requiredTests.soft) {
                trial.requiredTests.soft.forEach(test => {
                    softRequirements.push({
                        ...test,
                        trialId: trial.id,
                        trialTitle: trial.title,
                        trialPhase: trial.phase
                    });
                });
            }
        }
    });

    // Deduplicate by test name (some tests apply to multiple trials)
    const uniqueHard = [];
    const seenHard = new Set();
    hardRequirements.forEach(req => {
        if (!seenHard.has(req.name)) {
            seenHard.add(req.name);
            uniqueHard.push(req);
        } else {
            // If same test, mark as applying to multiple trials
            const existing = uniqueHard.find(r => r.name === req.name);
            if (existing && !existing.multipleTrials) {
                existing.multipleTrials = true;
            }
        }
    });

    const uniqueSoft = [];
    const seenSoft = new Set();
    softRequirements.forEach(req => {
        if (!seenSoft.has(req.name)) {
            seenSoft.add(req.name);
            uniqueSoft.push(req);
        }
    });

    // Sort: urgent items first
    uniqueHard.sort((a, b) => (b.isUrgent ? 1 : 0) - (a.isUrgent ? 1 : 0));

    // Icon mapping
    const getTestIcon = (iconType) => {
        const icons = {
            blood: '<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"></path></svg>',
            imaging: '<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17V7m0 10a2 2 0 01-2 2H5a2 2 0 01-2-2V7a2 2 0 012-2h2a2 2 0 012 2m0 10a2 2 0 002 2h2a2 2 0 002-2M9 7a2 2 0 012-2h2a2 2 0 012 2m0 10V7m0 10a2 2 0 002 2h2a2 2 0 002-2V7a2 2 0 00-2-2h-2a2 2 0 00-2 2"></path></svg>',
            cardiac: '<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg>',
            procedure: '<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path></svg>',
            measurement: '<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path></svg>',
            device: '<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z"></path></svg>',
            assessment: '<svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path></svg>'
        };
        return icons[iconType] || icons.blood;
    };

    container.innerHTML = `
        <div class="space-y-4">
            <!-- Hard Constraints Section -->
            <div>
                <div class="flex items-center gap-2 mb-3">
                    <div class="w-6 h-6 rounded-full bg-red-100 flex items-center justify-center">
                        <svg class="w-3.5 h-3.5 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                        </svg>
                    </div>
                    <h4 class="text-sm font-semibold text-slate-800">Required for Eligibility</h4>
                </div>
                ${uniqueHard.length === 0 ? `
                    <p class="text-xs text-slate-400 ml-8">No required tests pending</p>
                ` : `
                    <div class="space-y-2">
                        ${uniqueHard.map(req => `
                            <div class="p-3 rounded-lg border ${req.isUrgent ? 'bg-amber-50 border-amber-200' : 'bg-red-50 border-red-100'}">
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 rounded-lg ${req.isUrgent ? 'bg-amber-100 text-amber-600' : 'bg-red-100 text-red-600'} flex items-center justify-center flex-shrink-0">
                                        ${getTestIcon(req.icon)}
                                    </div>
                                    <div class="flex-1 min-w-0">
                                        <div class="flex items-center gap-2">
                                            <p class="text-sm font-medium text-slate-800">${req.name}</p>
                                            ${req.isUrgent ? '<span class="px-1.5 py-0.5 bg-amber-200 text-amber-800 text-xs font-medium rounded">Needs Verification</span>' : ''}
                                            ${req.multipleTrials ? '<span class="px-1.5 py-0.5 bg-blue-100 text-blue-700 text-xs font-medium rounded">Multi-trial</span>' : ''}
                                        </div>
                                        <p class="text-xs text-slate-600 mt-1">${req.description}</p>
                                        <p class="text-xs text-slate-400 mt-1">${req.trialPhase} · ${req.trialTitle.substring(0, 40)}...</p>
                                    </div>
                                    <button onclick="orderTest('${req.id}', '${req.name}')" class="px-2 py-1 bg-white border border-slate-200 text-xs font-medium text-slate-600 rounded hover:bg-slate-50 flex-shrink-0">
                                        Order
                                    </button>
                                </div>
                            </div>
                        `).join('')}
                    </div>
                `}
            </div>

            <!-- Soft Constraints Section -->
            <div>
                <div class="flex items-center gap-2 mb-3">
                    <div class="w-6 h-6 rounded-full bg-blue-100 flex items-center justify-center">
                        <svg class="w-3.5 h-3.5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path>
                        </svg>
                    </div>
                    <h4 class="text-sm font-semibold text-slate-800">Preferred / Optional</h4>
                </div>
                ${uniqueSoft.length === 0 ? `
                    <p class="text-xs text-slate-400 ml-8">No optional tests</p>
                ` : `
                    <div class="space-y-2">
                        ${uniqueSoft.map(req => `
                            <div class="p-3 rounded-lg border bg-blue-50 border-blue-100">
                                <div class="flex items-start gap-3">
                                    <div class="w-8 h-8 rounded-lg bg-blue-100 text-blue-600 flex items-center justify-center flex-shrink-0">
                                        ${getTestIcon(req.icon)}
                                    </div>
                                    <div class="flex-1 min-w-0">
                                        <div class="flex items-center gap-2">
                                            <p class="text-sm font-medium text-slate-800">${req.name}</p>
                                            <span class="px-1.5 py-0.5 ${req.status === 'preferred' ? 'bg-blue-100 text-blue-700' : 'bg-slate-100 text-slate-600'} text-xs font-medium rounded">${req.status}</span>
                                        </div>
                                        <p class="text-xs text-slate-600 mt-1">${req.description}</p>
                                        <p class="text-xs text-slate-400 mt-1">${req.trialPhase} · ${req.trialTitle.substring(0, 40)}...</p>
                                    </div>
                                    <button onclick="orderTest('${req.id}', '${req.name}')" class="px-2 py-1 bg-white border border-slate-200 text-xs font-medium text-slate-600 rounded hover:bg-slate-50 flex-shrink-0">
                                        Order
                                    </button>
                                </div>
                            </div>
                        `).join('')}
                    </div>
                `}
            </div>

            <!-- Summary Stats -->
            <div class="pt-3 border-t border-slate-200">
                <div class="grid grid-cols-2 gap-2 text-center">
                    <div class="bg-slate-50 rounded-lg p-2">
                        <p class="text-lg font-bold text-red-600">${uniqueHard.length}</p>
                        <p class="text-xs text-slate-500">Required Tests</p>
                    </div>
                    <div class="bg-slate-50 rounded-lg p-2">
                        <p class="text-lg font-bold text-blue-600">${uniqueSoft.length}</p>
                        <p class="text-xs text-slate-500">Optional Tests</p>
                    </div>
                </div>
            </div>
        </div>
    `;

    // Load existing notes
    const notesArea = document.getElementById('clinician-notes');
    if (notesArea && patient.clinicianNotes) {
        notesArea.value = patient.clinicianNotes;
    } else if (notesArea) {
        notesArea.value = '';
    }
}

// Order test helper function
window.orderTest = function(testId, testName) {
    alert(`Order placed for: ${testName}\n\nIn production, this would integrate with your EHR/LIS system to place the order.`);
};

// ==================== INTERACTION HANDLERS ====================

function filterClinicianPatients(filter) {
    currentClinicianFilter = filter;

    // Update button styles
    document.querySelectorAll('.clinician-filter-btn').forEach(btn => {
        if (btn.dataset.filter === filter) {
            btn.className = 'clinician-filter-btn active flex-1 px-3 py-1.5 text-xs font-medium rounded-md bg-blue-100 text-blue-700';
        } else {
            btn.className = 'clinician-filter-btn flex-1 px-3 py-1.5 text-xs font-medium rounded-md bg-slate-100 text-slate-600 hover:bg-slate-200';
        }
    });

    renderPatientList();
}

function markAsReviewed(patientId) {
    const patient = syntheticPatients.find(p => p.id === patientId);
    if (patient) {
        patient.status = patient.status === 'pending' ? 'reviewed' : 'pending';
        renderPatientList();
        renderPatientDetails(patientId);
        updateCounts();
    }
}

function saveClinicianNotes() {
    if (!selectedPatientId) return;

    const notesArea = document.getElementById('clinician-notes');
    const patient = syntheticPatients.find(p => p.id === selectedPatientId);

    if (patient && notesArea) {
        patient.clinicianNotes = notesArea.value;
        alert('Notes saved successfully!');
    }
}

function refreshClinicianData() {
    // In production, this would fetch fresh data from the server
    initClinicianDashboard();
    if (selectedPatientId) {
        selectPatient(selectedPatientId);
    }
}

function updateCounts() {
    const patientCount = document.getElementById('clinician-patient-count');
    const pendingCount = document.getElementById('clinician-pending-count');

    if (patientCount) patientCount.textContent = syntheticPatients.length;
    if (pendingCount) pendingCount.textContent = syntheticPatients.filter(p => p.status === 'pending').length;
}

function saveTrialForPatient(trialId) {
    alert(`Trial ${trialId} saved for patient review.`);
}

function shareTrialWithPatient(trialId) {
    alert(`Trial ${trialId} will be shared with the patient.`);
}

// ==================== DASHBOARD SWITCHING ====================

function switchDashboard(dashboard) {
    const patientDashboard = document.getElementById('patient-dashboard');
    const clinicianDashboard = document.getElementById('clinician-dashboard');
    const tabPatient = document.getElementById('tab-patient');
    const tabClinician = document.getElementById('tab-clinician');

    if (dashboard === 'patient') {
        patientDashboard.classList.remove('hidden');
        patientDashboard.classList.add('flex');
        clinicianDashboard.classList.add('hidden');
        clinicianDashboard.classList.remove('flex');
        tabPatient.className = 'dashboard-tab px-3 py-1 rounded-md text-xs font-medium transition-all bg-white text-primary shadow-sm';
        tabClinician.className = 'dashboard-tab px-3 py-1 rounded-md text-xs font-medium transition-all text-slate-500 hover:text-slate-700';
    } else {
        patientDashboard.classList.add('hidden');
        patientDashboard.classList.remove('flex');
        clinicianDashboard.classList.remove('hidden');
        clinicianDashboard.classList.add('flex');
        tabPatient.className = 'dashboard-tab px-3 py-1 rounded-md text-xs font-medium transition-all text-slate-500 hover:text-slate-700';
        tabClinician.className = 'dashboard-tab px-3 py-1 rounded-md text-xs font-medium transition-all bg-white text-primary shadow-sm';

        // Initialize clinician dashboard if not already done
        initClinicianDashboard();
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    // Patient search functionality
    const searchInput = document.getElementById('patient-search');
    if (searchInput) {
        searchInput.addEventListener('input', function(e) {
            const query = e.target.value.toLowerCase();
            const cards = document.querySelectorAll('.patient-card');
            cards.forEach(card => {
                const text = card.textContent.toLowerCase();
                card.style.display = text.includes(query) ? '' : 'none';
            });
        });
    }
});
