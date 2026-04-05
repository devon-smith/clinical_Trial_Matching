# Clinical Trial Matching

A conversational AI system that helps patients find clinical trials they're actually eligible for — instead of scrolling through ClinicalTrials.gov and hoping for the best.

Patients chat with the system, provide their details (age, gender, location, condition, symptoms), and get back ranked trial matches with eligibility assessments. The goal is to take a process that normally involves a research coordinator and a lot of back-and-forth and make it something a patient can do from a browser.

## How Matching Works

Matching patients to trials is harder than it sounds. A trial might require a specific age range, a confirmed diagnosis, certain lab values, proximity to a facility — and half of that might be buried in free-text eligibility criteria. So we built a hybrid pipeline that combines multiple scoring signals rather than relying on any single approach.

| Signal | Weight | What It Does |
|---|---|---|
| SMT Constraint Evaluation | 30% | Z3 solver checks hard eligibility criteria (age ranges, diagnoses, lab values) deterministically. Either you qualify or you don't. |
| RAG Semantic Similarity | 30% | Embedding-based retrieval scores how well patient text aligns with trial eligibility descriptions. Catches the stuff Z3 can't parse. |
| Disease Relevance | 25% | Token-overlap scoring ensures trials actually target the patient's condition — not just tangentially mention it in a footnote. |
| Distance | 15% | Haversine distance from patient location to nearest trial facility, with sigmoid decay based on how far the patient is willing to travel. |

An optional LLM Judge steps in when patient data is incomplete and structured criteria can't resolve eligibility on their own — it reads the free-text and makes an evidence-based call. Patient preferences (risk tolerance, schedule flexibility, treatment modality, travel willingness) are also collected through the UI and blended into ranking as a secondary signal at 18% weight.

## What We Built

- **Two-phase search** — strict disease-column matching first, then broader title/summary fallback. Cuts irrelevant results without killing recall.
- **Disease relevance scoring** — added as a dedicated 25% scoring component so trials that actually treat your condition rank above ones that mention it in passing.
- **Real distance calculation** — Haversine formula with geocoded trial locations pulled from the database. We were using placeholder estimates before, which is, you know, not ideal for a feature called "distance."
- **Patient preference elicitation** — soft constraints (travel, risk, schedule, modality) collected via the UI and factored into ranking. Not everyone wants to fly across the country for a Phase I trial.
- **Status filtering** — only active/recruiting trials shown, with clear status badges. No one needs to get excited about a trial that ended in 2019.
- **LLM eligibility judge** — fills gaps when structured patient data is missing, using evidence-based reasoning over the free-text eligibility criteria.

## Known Limitation

The dataset contains 680 trials — a small subset of ClinicalTrials.gov's 400K+. For common conditions like diabetes, most trials in our dataset are completed or terminated, which means few active matches come back. This is a data coverage issue, not a filtering bug. Plugging into the full ClinicalTrials.gov API would solve it, but that's a different project.

## Credits

- [ClinicalTrials.gov](https://clinicaltrials.gov/)
- [Z3 Theorem Prover](https://github.com/Z3Prover/z3)
- [OpenAI Embeddings](https://platform.openai.com/docs/guides/embeddings)
## Installation

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd [repository-name]
   ```

2. Create a virtual environment (recommended):
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. Install the required packages:
   ```bash
   pip install -r requirements.txt
   ```

4. Set up the environment variables:
   ```bash
   cp .env.example .env
   ```
   Edit the `.env` file with your configuration.

## Database Setup

This app expects a populated SQLite database file at `trial_data.sqlite` with `trials` and `criteria` tables.

1. Initialize the database schema:
   ```bash
   python setup_database.py
   ```

2. Load trial data (downloads/parses and inserts into SQLite):
   ```bash
   python load_trial_data.py
   ```

3. (Optional) Inspect/verify contents:
   ```bash
   python inspect_db.py
   ```

## Running the Application

1. Start the Flask development server (the app runs on port 5001 by default):
   ```bash
   python app.py
   ```

2. Open your web browser and navigate to:
   ```
   http://127.0.0.1:5001
   ```

If you prefer `flask run`, set the port explicitly to 5001 to match the app configuration:
```bash
export FLASK_APP=app.py
export FLASK_RUN_PORT=5001
flask run
```

## API Endpoints

- `POST /api/chat`
  - Request:
    ```json
    { "message": "I am 45 with migraines" }
    ```
  - Response (truncated example):
    ```json
    {
      "status": "continue",
      "response": "...",
      "next_question": "...",
      "conversation_state": "..."
    }
    ```

- `GET /api/trials`
  - Returns a small list of trials for demo purposes.

- `GET /api/trials/<nct_id>`
  - Returns detailed trial info including parsed criteria.

## Demo Tips

- Ensure `.env` is configured with Azure OpenAI credentials if you want LLM-powered explanations and query generation:
  - `AZURE_OPENAI_API_KEY`, `AZURE_OPENAI_ENDPOINT`, `AZURE_OPENAI_API_VERSION`, `AZURE_OPENAI_DEPLOYMENT_NAME`
- The UI is served at `/` with a simple chat interface.

## Testing

Run unit tests:
```bash
pytest -q
```

## Project Structure

```
.
├── app.py                # Main application file
├── requirements.txt      # Python dependencies
├── .env                  # Environment variables
├── trial_data.sqlite     # SQLite database
├── static/               # Static files (CSS, JS, images)
│   ├── css/
│   └── js/
├── templates/            # HTML templates
│   └── index.html
└── README.md             # This file
```

## Troubleshooting

- If the browser cannot fetch API responses, ensure you are visiting `http://127.0.0.1:5001` and the server is running on port 5001.
- If SMT features fail, make sure `z3-solver` is installed (now included in `requirements.txt`).
- If the database is missing tables, re-run `python setup_database.py` and `python load_trial_data.py`.

## License

This project is licensed under the MIT License. If sharing publicly, include a `LICENSE` file in the repository.

## Acknowledgments

- [Flask](https://flask.palletsprojects.com/) - The web framework used
- [Tailwind CSS](https://tailwindcss.com/) - For styling
- [ClinicalTrials.gov](https://clinicaltrials.gov/) - For trial data
