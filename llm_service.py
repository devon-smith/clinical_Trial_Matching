"""LLM Service for intelligent symptom analysis and trial matching using Azure OpenAI."""

import os
from typing import Dict, List, Optional, Tuple
from openai import AzureOpenAI
from dotenv import load_dotenv

load_dotenv()

class LLMService:
    """Service for using Azure OpenAI to analyze symptoms and match trials."""
    
    def __init__(self):
        """Initialize the Azure OpenAI client."""
        self.client = AzureOpenAI(
            api_key=os.getenv("AZURE_OPENAI_API_KEY"),
            api_version=os.getenv("AZURE_OPENAI_API_VERSION", "2024-02-15-preview"),
            azure_endpoint=os.getenv("AZURE_OPENAI_ENDPOINT")
        )
        self.deployment_name = os.getenv("AZURE_OPENAI_DEPLOYMENT_NAME", "gpt-4.1")
    
    def analyze_symptoms(self, symptoms: str, age: int, gender: str) -> Dict[str, any]:
        """
        Analyze patient symptoms using LLM to extract medical concepts.
        
        Args:
            symptoms: Patient's symptom description
            age: Patient's age
            gender: Patient's gender
            
        Returns:
            Dictionary with analysis results
        """
        prompt = f"""
        You are a medical AI assistant. Analyze the following patient symptoms and extract key medical information.

        Patient Information:
        - Age: {age}
        - Gender: {gender}
        - Symptoms: "{symptoms}"

        Please analyze and provide:
        1. Primary medical conditions/concepts (e.g., headache, joint pain, inflammation)
        2. Severity indicators (mild, moderate, severe)
        3. Body parts affected
        4. Potential medical keywords for trial matching
        5. Whether clarification is needed (and what questions to ask)

        Respond in JSON format:
        {{
            "primary_conditions": ["condition1", "condition2"],
            "severity": "mild|moderate|severe",
            "body_parts": ["part1", "part2"],
            "medical_keywords": ["keyword1", "keyword2", "keyword3"],
            "needs_clarification": true/false,
            "clarification_question": "Question if needed",
            "summary": "Brief summary of the medical condition"
        }}
        """
        
        try:
            response = self.client.chat.completions.create(
                model=self.deployment_name,
                messages=[
                    {"role": "system", "content": "You are a medical AI assistant that analyzes symptoms and provides structured medical information."},
                    {"role": "user", "content": prompt}
                ],
                max_tokens=500,
                temperature=0.3
            )
            
            import json
            result = json.loads(response.choices[0].message.content)
            return result
            
        except Exception as e:
            print(f"Error analyzing symptoms with LLM: {e}")
            # Fallback to basic analysis
            return {
                "primary_conditions": ["symptoms"],
                "severity": "moderate",
                "body_parts": [],
                "medical_keywords": [symptoms],
                "needs_clarification": False,
                "clarification_question": "",
                "summary": symptoms
            }
    
    def extract_intake_fields(self, message: str) -> Dict[str, any]:
        """Extract patient intake fields from a freeform message.

        Returns a dict with keys: age, gender, location, conditions, symptoms,
        treatments_tried.  Values are ``None`` when not mentioned.
        """
        prompt = (
            "You are a clinical-trial intake assistant. "
            "Extract any patient information from the following message. "
            "Return ONLY valid JSON with these keys (use null when not mentioned):\n"
            "{\n"
            '  "age": <integer or null>,\n'
            '  "gender": <"male"|"female"|"non-binary"|null>,\n'
            '  "location": <string like "San Francisco, CA" or ZIP code, or null>,\n'
            '  "conditions": <list of condition strings, or []>,\n'
            '  "symptoms": <string describing symptoms, or null>,\n'
            '  "treatments_tried": <string describing past treatments, or null>\n'
            "}\n\n"
            "Rules:\n"
            "- If the user mentions a condition for both 'conditions' and 'symptoms', "
            "put the diagnosis name in 'conditions' and descriptive details in 'symptoms'.\n"
            "- If the user only names a disease with no extra symptom detail, "
            "leave 'symptoms' as null.\n"
            "- Normalize condition names to standard medical terms when possible.\n"
            "- Extract age even if expressed as a range ('in my 40s' -> 45).\n"
            "- Do NOT confuse disease stage numbers (e.g., 'stage 2', 'grade 3') with age.\n"
            "- Extract gender from pronouns or context if explicitly stated.\n\n"
            f'User message: "{message}"'
        )

        try:
            import json as _json
            response = self.client.chat.completions.create(
                model=self.deployment_name,
                messages=[
                    {"role": "system", "content": "You extract structured patient data from freeform text. Return only valid JSON."},
                    {"role": "user", "content": prompt},
                ],
                max_tokens=300,
                temperature=0.1,
            )
            return _json.loads(response.choices[0].message.content)
        except Exception as e:
            print(f"LLM intake extraction failed: {e}")
            return {
                "age": None,
                "gender": None,
                "location": None,
                "conditions": [],
                "symptoms": None,
                "treatments_tried": None,
            }

    def generate_search_query(self, analysis: Dict[str, any]) -> List[str]:
        """
        Generate search queries for clinical trials based on symptom analysis.
        
        Args:
            analysis: Result from analyze_symptoms
            
        Returns:
            List of search queries for trials
        """
        queries = []
        
        # Use primary conditions
        for condition in analysis.get("primary_conditions", []):
            queries.append(condition)
        
        # Use medical keywords
        for keyword in analysis.get("medical_keywords", []):
            if keyword not in queries:
                queries.append(keyword)
        
        # Add body parts with conditions
        body_parts = analysis.get("body_parts", [])
        if body_parts:
            for part in body_parts:
                queries.append(f"{part} pain")
                queries.append(f"{part} inflammation")
        
        return queries[:5]  # Limit to 5 queries
    
    def generate_plain_summary(self, trial_data: Dict) -> str:
        """
        Generate a patient-friendly summary of a clinical trial at an 8th-grade
        reading level.

        Args:
            trial_data: Trial information including title, brief_summary, phase, etc.

        Returns:
            Plain-language summary string (2-4 sentences).
        """
        title = trial_data.get('title', '')
        summary = trial_data.get('brief_summary', '')
        phase = trial_data.get('phase', '')
        drugs = trial_data.get('drugs', '')

        prompt = (
            "Rewrite this clinical trial description in simple, patient-friendly "
            "language at an 8th-grade reading level. Use 2-4 short sentences. "
            "Explain what the study is testing and what a participant would do. "
            "Avoid medical jargon.\n\n"
            f"Trial: {title}\n"
            f"Phase: {phase}\n"
            f"Drugs/Interventions: {drugs}\n"
            f"Summary: {summary[:500]}"
        )

        try:
            response = self.client.chat.completions.create(
                model=self.deployment_name,
                messages=[
                    {
                        "role": "system",
                        "content": (
                            "You are a health educator who explains clinical trials "
                            "to patients in plain, clear language."
                        ),
                    },
                    {"role": "user", "content": prompt},
                ],
                max_tokens=200,
                temperature=0.5,
            )
            return response.choices[0].message.content.strip()
        except Exception as e:
            print(f"Error generating plain summary: {e}")
            return summary[:300] if summary else title

    def explain_trial_match(self, patient_data: Dict, trial_data: Dict) -> str:
        """
        Generate an explanation of why a trial matches the patient's condition.
        
        Args:
            patient_data: Patient information
            trial_data: Trial information
            
        Returns:
            Explanation string
        """
        prompt = f"""
        Explain why this clinical trial might be suitable for the patient.

        Patient Information:
        - Age: {patient_data.get('age')}
        - Gender: {patient_data.get('gender')}
        - Condition: {patient_data.get('condition', 'Not specified')}

        Trial Information:
        - Title: {trial_data.get('title', 'Not available')}
        - Summary: {trial_data.get('brief_summary', 'Not available')}
        - Enrollment: {trial_data.get('enrollment', 'Not specified')}

        Provide a brief, patient-friendly explanation (2-3 sentences) about why this trial might be relevant.
        """
        
        try:
            response = self.client.chat.completions.create(
                model=self.deployment_name,
                messages=[
                    {"role": "system", "content": "You are a helpful medical assistant explaining clinical trials to patients."},
                    {"role": "user", "content": prompt}
                ],
                max_tokens=200,
                temperature=0.7
            )
            
            return response.choices[0].message.content.strip()
            
        except Exception as e:
            print(f"Error generating trial explanation: {e}")
            return f"This trial may be relevant to your condition: {trial_data.get('title', 'Unknown trial')}"
