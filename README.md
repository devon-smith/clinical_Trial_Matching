# Clinical Trial Matching Assistant

A web-based application that helps patients find suitable clinical trials through a conversational interface.

## Features

- **Conversational Interface**: Chat with an AI assistant to find relevant clinical trials
- **Trial Matching**: Matches patients with clinical trials based on their profile
- **Trial Details**: View detailed information about each clinical trial
- **Responsive Design**: Works on both desktop and mobile devices

## Prerequisites

- Python 3.8+
- pip (Python package installer)
- SQLite (included with Python)

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
