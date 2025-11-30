import os
from flask import Flask, render_template, request, jsonify, session, send_from_directory
from flask_cors import CORS
from conversation_agent import ConversationalTrialAssistant
import sqlite3
import os
from dotenv import load_dotenv
from typing import Dict, List, Optional, Tuple, Any
import json
import re
from llm_service import LLMService

load_dotenv()

app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY', 'dev-secret-key')
CORS(app)

app.config.update(
    SESSION_COOKIE_SECURE=True,
    SESSION_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE='Lax',
)

# Add CSP headers
@app.after_request
def add_security_headers(response):
    # Allow unsafe-inline for development only
    csp = """
    default-src 'self';
    script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.tailwindcss.com;
    style-src 'self' 'unsafe-inline' https://cdn.tailwindcss.com;
    img-src 'self' data:;
    connect-src 'self' http://localhost:5000;
    """
    response.headers['Content-Security-Policy'] = csp.replace('\n', ' ').strip()
    return response

# Ensure the static files are served
@app.route('/static/<path:path>')
def serve_static(path):
    return send_from_directory('templates/static', path)


# Database configuration
DB_PATH = os.path.join(os.path.dirname(__file__), 'trial_data.sqlite')

class TrialMatcher:
    def __init__(self):
        self.db_path = DB_PATH
        self.conn = None
        self._connect()
    
    def _connect(self):
        """Establish a new database connection."""
        try:
            if self.conn:
                try:
                    self.conn.close()
                except Exception as close_error:
                    print(f"Error closing previous connection: {close_error}")
            
            print(f"Connecting to database at: {self.db_path}")
            print(f"File exists: {os.path.exists(self.db_path)}")
            print(f"File permissions: {oct(os.stat(self.db_path).st_mode & 0o777) if os.path.exists(self.db_path) else 'N/A'}")
            
            self.conn = sqlite3.connect(self.db_path)
            self.conn.row_factory = sqlite3.Row
            
            # Test the connection with a simple query
            cursor = self.conn.cursor()
            cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
            tables = cursor.fetchall()
            print(f"Connected to database. Found tables: {[t[0] for t in tables]}")
            
            # Check if the trials table exists and has data
            cursor.execute("SELECT COUNT(*) as count FROM trials;")
            count = cursor.fetchone()['count']
            print(f"Found {count} trials in the database")
            
            return True
            
        except Exception as e:
            print(f"\n--- DATABASE CONNECTION ERROR ---")
            print(f"Error type: {type(e).__name__}")
            print(f"Error message: {str(e)}")
            if hasattr(e, 'args') and e.args:
                print(f"Error details: {e.args}")
            print("--- END ERROR ---\n")
            raise
    
    def _execute_query(self, query, params=()):
        """Execute a query with error handling and automatic reconnection."""
        max_retries = 2
        last_error = None
        
        for attempt in range(max_retries):
            try:
                # Ensure we have a valid connection
                if not self.conn:
                    self._connect()
                    
                cursor = self.conn.cursor()
                
                # Log the query (without parameters for security)
                print(f"\n--- Executing query (attempt {attempt + 1}) ---")
                print(f"Query: {query.split('FROM')[0]}..." if len(query) > 100 else f"Query: {query}")
                print(f"Params: {params}")
                
                # Execute the query
                cursor.execute(query, params)
                
                # If it's a SELECT, fetch one row to check for errors
                if query.strip().upper().startswith('SELECT'):
                    try:
                        # Try to get column names to verify the query structure
                        columns = [desc[0] for desc in cursor.description] if cursor.description else []
                        print(f"Query successful. Columns: {columns}")
                    except Exception as e:
                        print(f"Note: Could not get column descriptions: {e}")
                
                return cursor
                
            except (sqlite3.OperationalError, sqlite3.InterfaceError, sqlite3.DatabaseError) as e:
                last_error = e
                print(f"\n--- QUERY ERROR (attempt {attempt + 1}) ---")
                print(f"Error type: {type(e).__name__}")
                print(f"Error message: {str(e)}")
                print(f"Query: {query[:200]}..." if len(query) > 200 else f"Query: {query}")
                print("--- END ERROR ---\n")
                
                if attempt == max_retries - 1:
                    print(f"Database query failed after {max_retries} attempts")
                    # Add more detailed error information for common issues
                    if "no such table" in str(e).lower():
                        print("\nERROR: The required database table is missing.")
                        print("Please make sure you've run the database setup script.")
                    raise
                    
                # Wait a bit before retrying
                import time
                time.sleep(0.5)
                
                # Reconnect and try again
                try:
                    self._connect()
                except Exception as connect_error:
                    print(f"Failed to reconnect to database: {connect_error}")
                    raise last_error
        
        # If we get here, all retries failed
        raise last_error or Exception("Unknown database error")
    
    def find_matching_trials(self, patient_data: Dict[str, Any]) -> List[Dict]:
        """Find trials that match the patient's profile."""
        print(f"\n--- find_matching_trials ---")
        print(f"Patient data: {patient_data}")
        
        try:
            test_query = "SELECT COUNT(*) as count FROM trials"
            cursor = self._execute_query(test_query)
            trial_count = cursor.fetchone()['count']
            print(f"Found {trial_count} trials in database")

            search_terms = patient_data.get('search_queries') or [patient_data.get('condition', '')]
            search_terms = [t for t in (search_terms or []) if isinstance(t, str) and t.strip()]
            if not search_terms:
                print("No search terms provided; returning empty list")
                return []

            all_trials: List[Dict] = []
            seen: set = set()

            for term in search_terms[:5]:
                query = """
                SELECT DISTINCT t.*
                FROM trials t
                LEFT JOIN criteria c ON t.nct_id = c.nct_id
                WHERE 1=1
                """
                params: List[Any] = []

                if 'age' in patient_data and patient_data['age']:
                    try:
                        age = int(patient_data['age'])
                        query += " AND (c.criterion_type != 'age' OR (c.comparison = '>=' AND ? >= CAST(c.criterion_value AS INTEGER)) OR (c.comparison = '<=' AND ? <= CAST(c.criterion_value AS INTEGER)))"
                        params.extend([age, age])
                        print(f"Added age filter: {age}")
                    except (ValueError, TypeError) as e:
                        print(f"Invalid age value: {patient_data['age']} - {e}")

                if 'gender' in patient_data and patient_data['gender']:
                    gender = str(patient_data['gender']).lower()
                    query += " AND (c.criterion_type != 'gender' OR LOWER(c.criterion_value) = ?)"
                    params.append(gender)
                    print(f"Added gender filter: {gender}")

                like = f"%{term.lower()}%"
                query += """
                AND (LOWER(t.title) LIKE ?
                     OR LOWER(t.brief_summary) LIKE ?
                     OR LOWER(COALESCE(t.diseases,'')) LIKE ?
                     OR LOWER(COALESCE(t.metadata_json,'')) LIKE ?)
                GROUP BY t.nct_id
                ORDER BY t.phase DESC, t.enrollment DESC
                LIMIT 5
                """
                params.extend([like, like, like, like])

                print(f"Executing query for term: {term}")
                cursor = self._execute_query(query, params)
                rows = cursor.fetchall()
                print(f"Term '{term}' returned {len(rows)} trials")

                for row in rows:
                    d = dict(row)
                    if d['nct_id'] in seen:
                        continue
                    seen.add(d['nct_id'])
                    try:
                        d['explanation'] = llm_service.explain_trial_match(patient_data, d)
                    except Exception:
                        d['explanation'] = None
                    all_trials.append(d)

            print(f"Returning {len(all_trials)} unique trials")
            return all_trials
            
        except Exception as e:
            print(f"\n--- ERROR in find_matching_trials ---")
            print(f"Error type: {type(e).__name__}")
            print(f"Error message: {str(e)}")
            print(f"Patient data: {patient_data}")
            import traceback
            traceback.print_exc()
            print("--- End of error ---\n")
            
            # Try a fallback query if the main one fails
            try:
                print("Attempting fallback query...")
                cursor = self._execute_query("""
                    SELECT * FROM trials 
                    WHERE brief_summary IS NOT NULL 
                    ORDER BY RANDOM() 
                    LIMIT 3
                """)
                trials = [dict(row) for row in cursor.fetchall()]
                print(f"Fallback query returned {len(trials)} trials")
                return trials
            except Exception as fallback_error:
                print(f"Fallback query also failed: {fallback_error}")
                raise Exception("Unable to retrieve clinical trials. The database may be unavailable or the query could not be processed.") from e
    
    def get_trial_details(self, nct_id: str) -> Optional[Dict]:
        """Get detailed information about a specific trial."""
        try:
            # Get trial details
            cursor = self._execute_query("SELECT * FROM trials WHERE nct_id = ?", (nct_id,))
            trial = cursor.fetchone()
            
            if trial:
                trial = dict(trial)
                # Get criteria
                cursor = self._execute_query("""
                    SELECT * FROM criteria 
                    WHERE nct_id = ?
                    ORDER BY is_inclusion DESC, criterion_type
                """, (nct_id,))
                trial['criteria'] = [dict(row) for row in cursor.fetchall()]
                return trial
            return None
            
        except Exception as e:
            print(f"Error in get_trial_details: {e}")
            raise

# Initialize LLM service
llm_service = LLMService()

# Initialize matcher
matcher = TrialMatcher()

def process_user_message(message: str, session: dict) -> dict:
    """Process the user message and return an appropriate response."""
    # Convert message to lowercase for easier processing
    message = message.lower()
    
    # Initialize session if needed
    if 'patient_data' not in session:
        session['patient_data'] = {}
        session['awaiting_info'] = 'age'
        session['conversation_count'] = 0
        return {
            'text': "Hello! I'm your clinical trial assistant. To help you find suitable trials, I'll need some information. "
                   "Could you please tell me your age?"
        }
    
    # Get current state
    awaiting = session.get('awaiting_info')
    patient_data = session['patient_data']
    conversation_count = session.get('conversation_count', 0)
    
    # Universal intent handling
    if message in ['reset', 'start over', 'restart', 'new conversation']:
        session.clear()
        session['patient_data'] = {}
        session['awaiting_info'] = 'age'
        session['conversation_count'] = 0
        return {
            'text': "Okay, let's start over. What is your age?",
            'patient_data': {}
        }
    
    # Extract age from any message text (e.g., "I'm 45", "age 67")
    age_match = re.search(r"\b([1-9][0-9]{0,2})\b", message)
    if age_match:
        try:
            new_age = int(age_match.group(1))
            if 1 <= new_age <= 120:
                patient_data['age'] = new_age
                if not patient_data.get('gender'):
                    session['awaiting_info'] = 'gender'
                    return {
                        'text': "Got it. What is your gender? (male/female/other)",
                        'patient_data': patient_data
                    }
                if not patient_data.get('condition'):
                    session['awaiting_info'] = 'condition'
                    return {
                        'text': "Thanks. Please describe your condition or symptoms.",
                        'patient_data': patient_data
                    }
                session['awaiting_info'] = 'search_confirm'
                return {
                    'text': f"Updated your age to {new_age}. Would you like me to search for trials now? (yes/no)",
                    'patient_data': patient_data
                }
        except Exception:
            pass
    
    # Detect gender anywhere in the message when not explicitly awaiting gender
    if awaiting != 'gender' and any(g in message for g in ['male', 'female', 'other']):
        gender_value = 'male' if 'male' in message else ('female' if 'female' in message else 'other')
        patient_data['gender'] = gender_value
        if not patient_data.get('age'):
            session['awaiting_info'] = 'age'
            return {
                'text': "Thanks. What is your age?",
                'patient_data': patient_data
            }
        if not patient_data.get('condition'):
            session['awaiting_info'] = 'condition'
            return {
                'text': "Thanks. Please describe your condition or symptoms.",
                'patient_data': patient_data
            }
        session['awaiting_info'] = 'search_confirm'
        return {
            'text': f"Updated your gender to {gender_value}. Would you like me to search now? (yes/no)",
            'patient_data': patient_data
        }

    # Universal condition update: if user provides a condition/symptom phrase at any time
    # Trigger when the message contains letters, is not a simple greeting/thanks, and not a plain yes/no
    simple_affirm = {'yes','y','ok','sure'}
    simple_negative = {'no','n'}
    greetings = {'hi','hello','hey'}
    thanks_set = {'thanks','thank you'}
    has_letters = re.search(r"[a-z]", message) is not None
    if has_letters and message not in simple_affirm and message not in simple_negative and message not in greetings and message not in thanks_set and awaiting != 'condition':
        # Treat as a new condition description
        age = patient_data.get('age', 0)
        gender = patient_data.get('gender', 'unknown')
        try:
            analysis = llm_service.analyze_symptoms(message, age, gender)
            patient_data['condition'] = message
            patient_data['condition_analysis'] = analysis
            patient_data['search_queries'] = llm_service.generate_search_query(analysis)
            session['awaiting_info'] = 'search_confirm'
            return {
                'text': f"Updated condition to: {analysis.get('summary', message)}. Would you like me to search for clinical trials now? (yes/no)",
                'patient_data': patient_data
            }
        except Exception as e:
            print(f"Universal condition update failed: {e}")
            session['awaiting_info'] = 'condition'
            return {
                'text': "Please describe the condition you want to search for.",
                'patient_data': patient_data
            }

    # Process based on what we're waiting for
    if awaiting == 'age':
        try:
            age = int(message)
            if 18 <= age <= 120:
                patient_data['age'] = age
                session['awaiting_info'] = 'gender'
                return {
                    'text': "Great! What is your gender? (male/female/other)",
                    'patient_data': patient_data
                }
            else:
                return {
                    'text': "Please enter a valid age between 18 and 120.",
                    'patient_data': patient_data
                }
        except ValueError:
            return {
                'text': "Please enter your age as a number.",
                'patient_data': patient_data
            }
    
    elif awaiting == 'gender':
        if message in ['male', 'female', 'other']:
            patient_data['gender'] = message
            session['awaiting_info'] = 'condition'
            return {
                'text': "What medical condition are you looking to treat? Please describe your symptoms or condition in detail.",
                'patient_data': patient_data
            }
        else:
            return {
                'text': "Please specify your gender as 'male', 'female', or 'other'.",
                'patient_data': patient_data
            }
    
    elif awaiting == 'condition':
        # Use LLM to analyze the condition description
        age = patient_data.get('age', 0)
        gender = patient_data.get('gender', 'unknown')
        
        try:
            condition_analysis = llm_service.analyze_symptoms(message, age, gender)
            patient_data['condition'] = message
            patient_data['condition_analysis'] = condition_analysis
            patient_data['search_queries'] = llm_service.generate_search_query(condition_analysis)
            
            # Ask clarifying questions if needed
            if condition_analysis.get('needs_clarification'):
                session['awaiting_info'] = 'condition_clarify'
                return {
                    'text': f"I understand you're experiencing {condition_analysis['symptoms']}. "
                           f"{condition_analysis['clarification_question']}",
                    'patient_data': patient_data
                }
            else:
                session['awaiting_info'] = 'search_confirm'
                return {
                    'text': f"I understand you're looking for trials related to {condition_analysis['summary']}. "
                           "Would you like me to search for clinical trials for you? (yes/no)",
                    'patient_data': patient_data
                }
        except Exception as e:
            print(f"Error in LLM analysis: {e}")
            # Fallback to basic analysis
            condition_analysis = analyze_condition(message)
            patient_data['condition'] = message
            patient_data['condition_analysis'] = condition_analysis
            
            if condition_analysis.get('needs_clarification'):
                session['awaiting_info'] = 'condition_clarify'
                return {
                    'text': f"I understand you're experiencing {condition_analysis['symptoms']}. "
                           f"{condition_analysis['clarification_question']}",
                    'patient_data': patient_data
                }
            else:
                session['awaiting_info'] = 'search_confirm'
                return {
                    'text': f"I understand you're looking for trials related to {condition_analysis['summary']}. "
                           "Would you like me to search for clinical trials for you? (yes/no)",
                    'patient_data': patient_data
                }
    
    elif awaiting == 'condition_clarify':
        # Process the clarification
        patient_data['condition_clarification'] = message
        
        # Update condition analysis
        condition_analysis = patient_data.get('condition_analysis', {})
        condition_analysis['clarification'] = message
        condition_analysis['needs_clarification'] = False
        condition_analysis['summary'] = f"{condition_analysis.get('symptoms', '')} with {message}"
        
        session['awaiting_info'] = 'search_confirm'
        return {
            'text': f"Thank you for the clarification. I understand you're looking for trials related to {condition_analysis['summary']}. "
                   "Would you like me to search for clinical trials for you? (yes/no)",
            'patient_data': patient_data
        }
    
    elif awaiting == 'search_confirm':
        affirmative = ['yes', 'y', 'sure', 'ok']
        negative = ['no', 'n']
        if message in affirmative:
            try:
                # Find matching trials (now supports LLM-generated queries)
                trials = matcher.find_matching_trials(patient_data)
                session['awaiting_info'] = 'done'
                session['conversation_count'] = conversation_count + 1
                if trials:
                    return {
                        'action': 'show_trials',
                        'trials': trials,
                        'text': f"I found {len(trials)} clinical trials that might be relevant to your condition:",
                        'patient_data': patient_data
                    }
                else:
                    return {
                        'text': f"I couldn't find any matching clinical trials for '{patient_data.get('condition', 'your condition')}'. "
                               "You can provide different wording (e.g., 'migraine', 'left-sided headache').",
                        'patient_data': patient_data
                    }
            except Exception as e:
                print(f"Error finding trials: {e}")
                return {
                    'text': "I'm having trouble accessing the trial database. Please try again later.",
                    'patient_data': patient_data
                }
        elif message in negative:
            # Offer to change condition, do not repeat age/gender
            session['awaiting_info'] = 'condition'
            session['conversation_count'] = conversation_count + 1
            return {
                'text': "No problem. Please describe a different condition you want to search for.",
                'patient_data': patient_data
            }
        else:
            # Treat any other input here as a NEW condition phrase
            new_condition = message.strip()
            if new_condition:
                age = patient_data.get('age', 0)
                gender = patient_data.get('gender', 'unknown')
                try:
                    analysis = llm_service.analyze_symptoms(new_condition, age, gender)
                    patient_data['condition'] = new_condition
                    patient_data['condition_analysis'] = analysis
                    patient_data['search_queries'] = llm_service.generate_search_query(analysis)
                    session['awaiting_info'] = 'search_confirm'
                    return {
                        'text': f"Updated condition to: {analysis.get('summary', new_condition)}. "
                                "Would you like me to search for clinical trials now? (yes/no)",
                        'patient_data': patient_data
                    }
                except Exception as e:
                    print(f"Error analyzing new condition in search_confirm: {e}")
                    session['awaiting_info'] = 'condition'
                    return {
                        'text': "Please describe the condition you want to search for.",
                        'patient_data': patient_data
                    }
            # Fallback
            session['awaiting_info'] = 'condition'
            return {
                'text': "Please describe the condition you want to search for.",
                'patient_data': patient_data
            }
    
    # Default response if we're not in a specific state
    if any(word in message for word in ['hi', 'hello', 'hey']):
        # Check if we have existing patient data
        if patient_data and 'age' in patient_data:
            return {
                'text': f"Hello again! I remember you're {patient_data.get('age')} years old and {patient_data.get('gender')}. "
                       "Would you like to search for more clinical trials? (yes/no)",
                'patient_data': patient_data
            }
        else:
            # Reset the conversation
            session.clear()
            session['patient_data'] = {}
            session['awaiting_info'] = 'age'
            session['conversation_count'] = 0
            return {
                'text': "Hello! I'm here to help you find clinical trials. Let's get started. What is your age?",
                'patient_data': {}
            }
    
    elif any(word in message for word in ['thanks', 'thank you']):
        return {
            'text': "You're welcome! Is there anything else I can help you with?",
            'patient_data': patient_data
        }
    
    else:
        # If we're in 'done' state, allow new searches
        if awaiting == 'done':
            if 'different' in message or 'new' in message or 'another' in message:
                session['awaiting_info'] = 'condition'
                return {
                    'text': f"Sure! What other condition would you like to search for?",
                    'patient_data': patient_data
                }
        
        # If we don't know what to do, prefer asking for missing info instead of looping
        if awaiting == 'condition':
            return {
                'text': "Please describe the condition or symptoms you want to search for.",
                'patient_data': patient_data
            }
        if patient_data and any(patient_data.values()):
            return {
                'text': f"I have your information (age: {patient_data.get('age', 'unknown')}, "
                       f"gender: {patient_data.get('gender', 'unknown')}, "
                       f"condition: {patient_data.get('condition', 'unknown')}). "
                       "Would you like me to search for trials with this information? (yes/no)",
                'patient_data': patient_data
            }
        else:
            # Start over
            session.clear()
            session['patient_data'] = {}
            session['awaiting_info'] = 'age'
            session['conversation_count'] = 0
            return {
                'text': "I'm here to help you find clinical trials. To get started, I'll need some information. What is your age?",
                'patient_data': {}
            }

def analyze_condition(message: str) -> dict:
    """Analyze the user's condition description and determine if clarification is needed."""
    # Simple keyword-based analysis
    chest_pain_keywords = ['chest', 'heart', 'pain', 'hurts', 'tightness', 'pressure']
    head_pain_keywords = ['head', 'headache', 'migraine', 'pain']
    fever_keywords = ['fever', 'temperature', 'hot', 'feverish']
    stomach_keywords = ['stomach', 'abdomen', 'belly', 'nausea', 'vomit']
    
    symptoms = []
    needs_clarification = False
    clarification_question = ""
    
    # Check for chest pain
    if any(word in message for word in chest_pain_keywords):
        symptoms.append("chest pain")
        needs_clarification = True
        clarification_question = "Can you tell me more about the chest pain? Is it sharp, dull, constant, or does it come and go?"
    
    # Check for headache
    elif any(word in message for word in head_pain_keywords):
        symptoms.append("headache")
        needs_clarification = True
        clarification_question = "Can you describe the headache? Is it sharp, dull, on one side, or all over?"
    
    # Check for fever
    elif any(word in message for word in fever_keywords):
        symptoms.append("fever")
        needs_clarification = True
        clarification_question = "Do you know your temperature? How long have you had the fever?"
    
    # Check for stomach issues
    elif any(word in message for word in stomach_keywords):
        symptoms.append("stomach issues")
        needs_clarification = True
        clarification_question = "Can you describe the stomach issue? Is it pain, nausea, or something else?"
    
    # If no specific symptoms found, use the whole message
    if not symptoms:
        symptoms.append(message)
    
    return {
        'symptoms': ', '.join(symptoms) if symptoms else message,
        'needs_clarification': needs_clarification,
        'clarification_question': clarification_question,
        'summary': message if not needs_clarification else f"{', '.join(symptoms)}"
    }

@app.route('/')
def index():
    """Render the main chat interface."""
    # Initialize session
    if 'patient_data' not in session:
        session['patient_data'] = {}
        session['awaiting_info'] = 'age'
    return render_template('index.html')

# In app.py, update the chat endpoint
@app.route('/api/chat', methods=['POST'])
def chat():
    try:
        data = request.get_json()
        user_message = data.get('message', '').strip()
        
        # Initialize session if needed
        if 'assistant' not in session:
            session['assistant'] = {
                'conversation_state': 'initial',
                'patient_data': {
                    'age': None,
                    'gender': None,
                    'conditions': [],
                    'symptoms': '',
                    'primary_condition': None
                }
            }
        
        # Get or create conversation assistant
        assistant = ConversationalTrialAssistant()
        assistant.conversation_state = session['assistant']['conversation_state']
        assistant.patient_data = session['assistant']['patient_data']
        
        # Process the message
        if assistant.conversation_state == 'ready_to_search' and user_message.lower() in ['yes', 'no', 'update']:
            # Handle search confirmation/update flow
            if user_message.lower() == 'yes':
                patient_data = assistant.get_patient_data_for_matching()
                # Save session before returning
                session['assistant'] = {
                    'conversation_state': assistant.conversation_state,
                    'patient_data': assistant.patient_data
                }
                session.modified = True
                
                # Call your trial matching logic here
                # matched_trials = assistant.matcher.find_matching_trials(patient_data)
                return jsonify({
                    'status': 'searching',
                    'message': 'Searching for clinical trials...',
                    'patient_data': patient_data
                })
            elif user_message.lower() == 'update':
                return jsonify({
                    'status': 'update',
                    'message': 'What information would you like to update? (age/gender/conditions/symptoms)'
                })
            else:
                return jsonify({
                    'status': 'goodbye',
                    'message': 'Thank you for using our service. Goodbye!'
                })
        
        # Process regular conversation flow
        response, _ = assistant.process_response(user_message)
        
        # Update session
        session['assistant'] = {
            'conversation_state': assistant.conversation_state,
            'patient_data': assistant.patient_data
        }
        session.modified = True
        
        # Get next question
        next_question = assistant.get_next_question()
        
        return jsonify({
            'status': 'continue',
            'response': response,
            'next_question': next_question,
            'conversation_state': assistant.conversation_state
        })
        
    except Exception as e:
        return jsonify({
            'status': 'error',
            'message': str(e)
        }), 500

@app.route('/api/trials/<nct_id>')
def get_trial(nct_id: str):
    """Get detailed information about a specific trial."""
    trial = matcher.get_trial_details(nct_id)
    if trial:
        return jsonify({
            'success': True,
            'trial': trial
        })
    return jsonify({'success': False, 'error': 'Trial not found'}), 404

@app.route('/api/trials')
def list_trials():
    """List all available trials (for demo purposes)."""
    cursor = matcher.conn.cursor()
    cursor.execute("SELECT nct_id, brief_title, brief_summary FROM trials LIMIT 20")
    trials = [dict(row) for row in cursor.fetchall()]
    return jsonify({'trials': trials})

if __name__ == '__main__':
    # Create templates directory if it doesn't exist
    os.makedirs('templates', exist_ok=True)
    
    # Run the app
    app.run(debug=True, port=5001, host='0.0.0.0')
