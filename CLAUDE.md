# CLAUDE.md

This file provides guidance to Claude Code when working with code in this repository.

## Project Overview

CS 224v Clinical Trial Matching — a Flask web application that helps patients find and evaluate clinical trials through conversational AI. Features a patient-facing chat interface and a clinician-facing dashboard for trial evaluation.

## Architecture

### Backend (Python/Flask)
- `app.py` — Flask server with session management, API endpoints, ZIP-to-coordinates mapping
- `conversation_agent.py` — Conversational state machine for patient intake (age, gender, location, condition, symptoms)
- `smt_matcher.py` — Z3-based SMT solver for evaluating clinical trial eligibility constraints
- `Matcher.py` — Trial matching logic, interfaces with SQLite database
- `llm_service.py` — Azure OpenAI LLM integration
- `llm_questioner.py` — LLM-powered question generation for patient intake
- `rag_retriever.py` — Retrieval-augmented generation for trial information
- `trial_characteristics.py` — Trial characteristic analysis

### Frontend
- `templates/index.html` — Main template with tabbed navigation (Patient / Clinician views)
- `static/js/chat.js` — Patient chat interface (eligibility cards, save/share/export)
- `static/js/clinician.js` — Clinician dashboard (three-panel layout, synthetic data, hard/soft constraints)
- `static/css/styles.css` — Tailwind CSS styles

### Database
- `trial_data.sqlite` / `Trials.db` — SQLite databases with clinical trial data
- `setup_database.py` — Database initialization
- `load_trial_data.py` — External trial data loading
- `migrations/` — Database migration scripts

## Environment Setup

```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
cp .env.example .env  # Then fill in your Azure OpenAI credentials
```

Required environment variables (see `.env.example`):
- `SECRET_KEY` — Flask session secret
- `DATABASE_URL` — SQLite connection string
- `AZURE_OPENAI_API_KEY` — Azure OpenAI API key
- `AZURE_OPENAI_ENDPOINT` — Azure OpenAI endpoint URL
- `AZURE_OPENAI_API_VERSION` — API version
- `AZURE_OPENAI_DEPLOYMENT_NAME` — Deployment name (e.g., gpt-4.1)

## Running the App

```bash
source venv/bin/activate
python app.py  # Runs on port 5001
```

## Testing

```bash
pytest                    # Run all tests
pytest test_matcher.py    # SMT matcher tests
pytest test_conversation_agent.py  # Conversation flow tests
pytest test_constraints.py  # Constraint validation tests
pytest --cov=. --cov-report=term-missing  # With coverage
```

## Key Conventions

- **Language:** Python 3, Flask framework
- **Styling:** Tailwind CSS via CDN
- **Database:** SQLite with SQLAlchemy ORM
- **SMT Solver:** z3-solver for constraint evaluation
- **LLM:** Azure OpenAI (GPT-4.1)
- **Immutability:** Prefer creating new objects over mutation
- **Error handling:** Explicit at every level, user-friendly messages in UI
- **File size:** Keep under 800 lines per file

## Linting & Formatting

```bash
ruff check .         # Lint
ruff check --fix .   # Auto-fix lint issues
black .              # Format
mypy .               # Type check
```
