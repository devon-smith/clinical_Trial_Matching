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

## Running the Application

1. Start the Flask development server:
   ```bash
   flask run
   ```

2. Open your web browser and navigate to:
   ```
   http://127.0.0.1:5000
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

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flask](https://flask.palletsprojects.com/) - The web framework used
- [Tailwind CSS](https://tailwindcss.com/) - For styling
- [ClinicalTrials.gov](https://clinicaltrials.gov/) - For trial data
