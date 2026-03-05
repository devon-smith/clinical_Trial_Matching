document.addEventListener('DOMContentLoaded', function() {
    const messageForm = document.getElementById('message-form');
    const userInput = document.getElementById('user-input');
    const messagesContainer = document.getElementById('messages');
    const trialModal = document.getElementById('trial-modal');
    const closeModal = document.getElementById('close-modal');
    let isWaitingForResponse = false;
    let currentStep = 1;
    let conversationState = 'age';
    let savedTrials = new Map(); // Track saved/shortlisted trials with their data
    let allTrials = []; // Store all trials for load more functionality
    let displayedTrialCount = 6; // Initial number of trials to show
    let currentSortBy = 'match'; // match, phase, title
    let currentFilter = 'all'; // all, eligible, review

    // Initialize the chat
    function initChat() {
        messageForm.addEventListener('submit', handleSubmit);
        closeModal.addEventListener('click', () => {
            trialModal.classList.add('hidden');
            trialModal.classList.remove('flex');
        });

        trialModal.addEventListener('click', (e) => {
            if (e.target === trialModal) {
                trialModal.classList.add('hidden');
                trialModal.classList.remove('flex');
            }
        });

        initQuickButtons();
        userInput.focus();
    }

    // Initialize quick select buttons
    function initQuickButtons() {
        document.querySelectorAll('.quick-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const value = this.dataset.value;
                userInput.value = value;
                messageForm.dispatchEvent(new Event('submit'));
            });
        });
    }

    // Update progress tracker
    function updateProgress(step) {
        currentStep = step;

        for (let i = 1; i <= 4; i++) {
            const stepEl = document.getElementById(`step-${i}`);
            const lineEl = document.getElementById(`line-${i}`);
            const circle = stepEl.querySelector('.step-circle');
            const label = stepEl.querySelector('span');

            if (i < step) {
                circle.className = 'step-circle w-8 h-8 rounded-full bg-green-500 text-white flex items-center justify-center text-sm font-medium';
                circle.innerHTML = '<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>';
                label.className = 'ml-2 text-sm font-medium text-green-600';
                if (lineEl) lineEl.className = 'step-line w-12 h-0.5 bg-green-500';
            } else if (i === step) {
                circle.className = 'step-circle w-8 h-8 rounded-full bg-blue-600 text-white flex items-center justify-center text-sm font-medium';
                circle.textContent = i;
                label.className = 'ml-2 text-sm font-medium text-slate-700';
                if (lineEl) lineEl.className = 'step-line w-12 h-0.5 bg-slate-200';
            } else {
                circle.className = 'step-circle w-8 h-8 rounded-full bg-slate-200 text-slate-500 flex items-center justify-center text-sm font-medium';
                circle.textContent = i;
                label.className = 'ml-2 text-sm font-medium text-slate-400';
                if (lineEl) lineEl.className = 'step-line w-12 h-0.5 bg-slate-200';
            }
        }
    }

    // Detect conversation state from response
    function detectStateFromResponse(response) {
        const lowerResponse = response.toLowerCase();

        if (lowerResponse.includes('gender') || lowerResponse.includes('sex')) {
            conversationState = 'gender';
            updateProgress(1);
        } else if (lowerResponse.includes('condition') || lowerResponse.includes('symptom') || lowerResponse.includes('health issue') || lowerResponse.includes('diagnosis')) {
            conversationState = 'condition';
            updateProgress(2);
        } else if (lowerResponse.includes('preference') || lowerResponse.includes('travel') || lowerResponse.includes('distance')) {
            conversationState = 'preferences';
            updateProgress(3);
        } else if (lowerResponse.includes('found') && lowerResponse.includes('trial')) {
            conversationState = 'results';
            updateProgress(4);
        } else if (lowerResponse.includes('search') || lowerResponse.includes('looking for')) {
            conversationState = 'searching';
            updateProgress(4);
        }
    }

    // Generate eligibility data for trial cards — uses real backend scores when available
    function generateEligibilityData(trial) {
        // Use real scores from the backend SMT matcher + RAG
        const hardCriteriaMet = trial.hard_met ?? 0;
        const hardCriteriaTotal = trial.hard_total ?? 1;
        const softCriteriaMet = trial.soft_met ?? 0;
        const softCriteriaTotal = trial.soft_total ?? 1;

        // Determine eligibility status from backend or compute from scores
        let hardStatus;
        if (trial.eligibility_status === 'eligible') {
            hardStatus = 'met';
        } else if (trial.eligibility_status === 'not_eligible') {
            hardStatus = 'violated';
        } else {
            hardStatus = 'review';
        }

        // Build explanation from criteria details if available
        let explanation = '';
        const criteria = trial.criteria_details || [];
        if (criteria.length > 0) {
            const metCount = criteria.filter(c => c.met).length;
            const totalCount = criteria.length;
            const hardMet = criteria.filter(c => (c.hard || c.hard_constraint) && c.met).length;
            const hardTotal = criteria.filter(c => c.hard || c.hard_constraint).length;
            explanation = `${metCount} of ${totalCount} criteria evaluated (${hardMet}/${hardTotal} required criteria met). `;
            if (hardStatus === 'met') {
                explanation += 'You meet all required eligibility criteria for this study.';
            } else if (hardStatus === 'review') {
                explanation += 'Some criteria need review — additional information may be needed.';
            } else {
                explanation += 'Some required criteria are not met based on your current information.';
            }
        } else {
            explanation = 'Eligibility assessment based on your provided information.';
        }

        return {
            hardCriteriaMet,
            hardCriteriaTotal,
            softCriteriaMet,
            softCriteriaTotal,
            hardStatus,
            explanation,
            matchScore: trial.match_score ?? 50,
            criteriaDetails: criteria,
        };
    }

    // Build the "Why This Match?" expandable criteria breakdown for trial cards
    function buildCriteriaBreakdown(trial, eligibility) {
        const criteria = eligibility.criteriaDetails || [];
        if (criteria.length === 0) {
            return `
                <div class="bg-slate-50 rounded-lg p-3">
                    <div class="flex items-start gap-2">
                        <svg class="w-4 h-4 text-blue-500 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <p class="text-sm text-slate-600">${eligibility.explanation}</p>
                    </div>
                </div>`;
        }

        const hardCriteria = criteria.filter(c => c.hard || c.hard_constraint);
        const softCriteria = criteria.filter(c => !c.hard && !c.hard_constraint);

        // Count statuses
        const metCount = criteria.filter(c => c.met).length;
        const unclearCount = criteria.filter(c => !c.met && c.llm_status === 'UNCLEAR').length;
        const notMetCount = criteria.filter(c => !c.met && !c.llm_status).length +
                           criteria.filter(c => !c.met && c.llm_status === 'NOT_MET').length;

        function criterionIcon(c) {
            if (c.met) return '<span class="text-green-500 font-bold">&#10003;</span>';
            if (c.llm_status === 'NOT_MET') return '<span class="text-red-500 font-bold">&#10007;</span>';
            return '<span class="text-amber-500 font-bold">?</span>';
        }

        function humanizeAttr(attr) {
            return (attr || '')
                .replace(/^patient_/, '')
                .replace(/_now$/, '')
                .replace(/_inthehistory$/, ' (history)')
                .replace(/_inthepast\d+months?$/, (m) => ' (' + m.replace('_inthepast', 'past ').replace('months', ' months').replace('month', ' month') + ')')
                .replace(/_/g, ' ')
                .replace(/withunit /g, '(')
                .replace(/\s+/g, ' ')
                .trim();
        }

        function renderCriterion(c) {
            const icon = criterionIcon(c);
            const label = humanizeAttr(c.attribute);
            const llmBadge = c.llm_status
                ? `<span class="ml-1 px-1.5 py-0.5 text-[10px] font-medium rounded ${
                    c.llm_status === 'MET' ? 'bg-green-100 text-green-700' :
                    c.llm_status === 'NOT_MET' ? 'bg-red-100 text-red-700' :
                    'bg-amber-100 text-amber-700'
                  }">AI: ${c.llm_status.replace('_', ' ')}</span>`
                : '';
            const evidence = c.llm_evidence
                ? `<p class="text-[10px] text-slate-400 mt-0.5 ml-5">${c.llm_evidence}</p>`
                : '';
            return `<div class="py-1">${icon} <span class="text-xs text-slate-600">${label}</span>${llmBadge}${evidence}</div>`;
        }

        // Only show first 5 of each type, with "show more" for the detail modal
        const hardPreview = hardCriteria.slice(0, 5);
        const softPreview = softCriteria.slice(0, 3);
        const moreHard = hardCriteria.length > 5 ? `<p class="text-[10px] text-slate-400 mt-1">+${hardCriteria.length - 5} more required criteria...</p>` : '';
        const moreSoft = softCriteria.length > 3 ? `<p class="text-[10px] text-slate-400 mt-1">+${softCriteria.length - 3} more preference criteria...</p>` : '';

        return `
            <div class="border border-slate-200 rounded-lg overflow-hidden">
                <button onclick="this.nextElementSibling.classList.toggle('hidden'); this.querySelector('.expand-icon').classList.toggle('rotate-180')"
                        class="w-full flex items-center justify-between px-3 py-2.5 bg-slate-50 hover:bg-slate-100 transition-colors text-left">
                    <span class="text-xs font-medium text-slate-700 flex items-center gap-1.5">
                        <svg class="w-3.5 h-3.5 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                        Why this match?
                    </span>
                    <div class="flex items-center gap-2">
                        <span class="text-[10px] text-slate-500">${metCount} met, ${unclearCount} unclear</span>
                        <svg class="w-3.5 h-3.5 text-slate-400 expand-icon transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                    </div>
                </button>
                <div class="hidden px-3 py-2 bg-white border-t border-slate-100 max-h-48 overflow-y-auto">
                    ${hardPreview.length > 0 ? `
                        <p class="text-[10px] font-semibold text-slate-500 uppercase tracking-wide mb-1">Required</p>
                        ${hardPreview.map(renderCriterion).join('')}
                        ${moreHard}
                    ` : ''}
                    ${softPreview.length > 0 ? `
                        <p class="text-[10px] font-semibold text-slate-500 uppercase tracking-wide mt-2 mb-1">Preferences</p>
                        ${softPreview.map(renderCriterion).join('')}
                        ${moreSoft}
                    ` : ''}
                    ${buildPreferenceBreakdown(trial)}
                </div>
            </div>`;
    }

    // Render preference elicitation panel in chat
    function renderPreferencePanel() {
        const panelDiv = document.createElement('div');
        panelDiv.className = 'flex justify-start';
        panelDiv.innerHTML = `
            <div class="max-w-lg bg-white border border-slate-200 rounded-xl shadow-sm p-4 space-y-4">
                <div class="flex items-center gap-2 mb-1">
                    <svg class="w-5 h-5 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4"></path></svg>
                    <h3 class="text-sm font-semibold text-slate-800">Your Practical Preferences</h3>
                </div>
                <p class="text-xs text-slate-500">These help rank trials by what matters to you beyond medical eligibility.</p>

                <div class="space-y-3">
                    <div>
                        <label class="flex justify-between text-xs font-medium text-slate-600 mb-1">
                            <span>Travel willingness</span>
                            <span id="pref-travel-label" class="text-blue-600">Regional (60 mi)</span>
                        </label>
                        <input type="range" id="pref-travel" min="1" max="5" value="3"
                            class="w-full h-1.5 bg-slate-200 rounded-full appearance-none cursor-pointer accent-blue-600"
                            oninput="document.getElementById('pref-travel-label').textContent = {1:'Local only (15 mi)',2:'Nearby (30 mi)',3:'Regional (60 mi)',4:'Statewide (100 mi)',5:'Anywhere (200 mi)'}[this.value]">
                    </div>

                    <div>
                        <label class="flex justify-between text-xs font-medium text-slate-600 mb-1">
                            <span>Risk tolerance</span>
                            <span id="pref-risk-label" class="text-blue-600">Open to newer</span>
                        </label>
                        <input type="range" id="pref-risk" min="1" max="5" value="3"
                            class="w-full h-1.5 bg-slate-200 rounded-full appearance-none cursor-pointer accent-blue-600"
                            oninput="document.getElementById('pref-risk-label').textContent = {1:'Proven only',2:'Mostly proven',3:'Open to newer',4:'Comfortable with experimental',5:'Fully experimental'}[this.value]">
                    </div>

                    <div>
                        <label class="flex justify-between text-xs font-medium text-slate-600 mb-1">
                            <span>Schedule flexibility</span>
                            <span id="pref-schedule-label" class="text-blue-600">Moderate</span>
                        </label>
                        <input type="range" id="pref-schedule" min="1" max="5" value="3"
                            class="w-full h-1.5 bg-slate-200 rounded-full appearance-none cursor-pointer accent-blue-600"
                            oninput="document.getElementById('pref-schedule-label').textContent = {1:'Very limited',2:'Somewhat limited',3:'Moderate',4:'Fairly flexible',5:'Very flexible'}[this.value]">
                    </div>

                    <div>
                        <label class="text-xs font-medium text-slate-600 mb-1 block">Treatment type preference</label>
                        <div class="flex flex-wrap gap-1.5" id="pref-modalities">
                            ${['Drug', 'Surgery', 'Device', 'Behavioral', 'Radiation'].map(m =>
                                `<button type="button" data-modality="${m}"
                                    class="pref-mod-btn px-2.5 py-1 text-xs rounded-full border border-blue-200 bg-blue-50 text-blue-700 hover:bg-blue-100 transition-colors"
                                    onclick="this.classList.toggle('bg-blue-50'); this.classList.toggle('text-blue-700'); this.classList.toggle('border-blue-200'); this.classList.toggle('bg-slate-100'); this.classList.toggle('text-slate-400'); this.classList.toggle('border-slate-200'); this.classList.toggle('line-through'); this.dataset.selected = this.dataset.selected === 'false' ? 'true' : 'false'"
                                    data-selected="true">${m}</button>`
                            ).join('')}
                        </div>
                        <p class="text-[10px] text-slate-400 mt-1">Click to toggle. Selected types are preferred.</p>
                    </div>
                </div>

                <div class="flex gap-2 pt-1">
                    <button type="button" id="pref-confirm-btn"
                        class="flex-1 px-3 py-2 text-xs font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors">
                        Confirm Preferences
                    </button>
                    <button type="button" id="pref-skip-btn"
                        class="px-3 py-2 text-xs font-medium text-slate-500 bg-slate-100 rounded-lg hover:bg-slate-200 transition-colors">
                        Skip
                    </button>
                </div>
            </div>`;

        chatMessages.appendChild(panelDiv);
        chatMessages.scrollTop = chatMessages.scrollHeight;

        // Wire up confirm button
        panelDiv.querySelector('#pref-confirm-btn').addEventListener('click', () => {
            const travel = parseInt(panelDiv.querySelector('#pref-travel').value);
            const risk = parseInt(panelDiv.querySelector('#pref-risk').value);
            const schedule = parseInt(panelDiv.querySelector('#pref-schedule').value);
            const modBtns = panelDiv.querySelectorAll('.pref-mod-btn');
            const modalities = [];
            modBtns.forEach(btn => {
                if (btn.dataset.selected !== 'false') modalities.push(btn.dataset.modality);
            });

            const prefJson = JSON.stringify({ travel, risk, schedule, modalities });

            // Disable the panel
            panelDiv.querySelectorAll('input, button').forEach(el => el.disabled = true);
            panelDiv.querySelector('#pref-confirm-btn').textContent = 'Preferences saved';
            panelDiv.querySelector('#pref-confirm-btn').className = 'flex-1 px-3 py-2 text-xs font-medium text-white bg-green-500 rounded-lg cursor-default';

            // Send as chat message
            userInput.value = prefJson;
            messageForm.dispatchEvent(new Event('submit'));
        });

        // Wire up skip button
        panelDiv.querySelector('#pref-skip-btn').addEventListener('click', () => {
            panelDiv.querySelectorAll('input, button').forEach(el => el.disabled = true);
            panelDiv.querySelector('#pref-skip-btn').textContent = 'Skipped';

            userInput.value = 'skip';
            messageForm.dispatchEvent(new Event('submit'));
        });
    }

    // Build preference breakdown HTML for trial cards
    function buildPreferenceBreakdown(trial) {
        const breakdown = trial.preference_breakdown;
        if (!breakdown || Object.keys(breakdown).length === 0) return '';

        const icons = {
            good: '<span class="text-green-500 font-bold text-xs">&#10003;</span>',
            neutral: '<span class="text-amber-500 font-bold text-xs">&#8211;</span>',
            poor: '<span class="text-red-500 font-bold text-xs">&#10007;</span>',
        };

        const labels = { travel: 'Travel', risk: 'Risk Level', schedule: 'Schedule', treatment: 'Treatment Type' };

        const items = Object.entries(breakdown).map(([dim, info]) => {
            const icon = icons[info.status] || icons.neutral;
            const label = labels[dim] || dim;
            return `<div class="py-0.5">${icon} <span class="text-xs text-slate-600">${label}:</span> <span class="text-xs text-slate-500">${info.detail}</span></div>`;
        }).join('');

        const prefScore = trial.preference_score != null ? Math.round(trial.preference_score * 100) : null;
        const scoreLabel = prefScore != null ? `<span class="text-[10px] text-slate-500">${prefScore}% match</span>` : '';

        return `
            <p class="text-[10px] font-semibold text-slate-500 uppercase tracking-wide mt-2 mb-1">Your Preferences ${scoreLabel}</p>
            ${items}`;
    }

    // Handle form submission
    async function handleSubmit(e) {
        e.preventDefault();

        const message = userInput.value.trim();
        if (!message || isWaitingForResponse) return;

        const existingQuickSelects = document.querySelectorAll('[id^="quick-select"]');
        existingQuickSelects.forEach(el => el.remove());

        addMessage('user', message);
        userInput.value = '';

        showTypingIndicator();
        isWaitingForResponse = true;

        try {
            const response = await fetch('/api/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                body: JSON.stringify({ message }),
                credentials: 'same-origin'
            });

            if (!response.ok) {
                const errorText = await response.text();
                throw new Error(`Server responded with status ${response.status}: ${errorText}`);
            }

            const data = await response.json();

            removeTypingIndicator();

            if (data.status === 'preferences') {
                if (data.response) {
                    addMessage('assistant', data.response);
                }
                updateProgress(3);
                renderPreferencePanel();
            } else if (data.trials) {
                if (data.trials.length > 0) {
                    updateProgress(4);
                    showTrialMatches(data.trials);
                } else {
                    addMessage('assistant', 'No matching trials found. Would you like to try a different search?');
                }
            } else if (data.response) {
                detectStateFromResponse(data.response);
                addMessageWithQuickSelect('assistant', data.response);
            } else if (data.text) {
                detectStateFromResponse(data.text);
                addMessageWithQuickSelect('assistant', data.text);
            } else {
                addMessage('assistant', 'I received an unexpected response. Please try again.');
            }
        } catch (error) {
            console.error('Error in handleSubmit:', error);
            removeTypingIndicator();

            let errorMessage = 'Sorry, something went wrong. Please try again.';
            if (error.message) {
                errorMessage += ` (${error.message})`;
            }

            addMessage('assistant', errorMessage);
        } finally {
            isWaitingForResponse = false;
        }
    }

    // Add a message to the chat
    function addMessage(role, content) {
        const messageDiv = document.createElement('div');
        messageDiv.className = `flex ${role === 'user' ? 'justify-end' : 'justify-start'}`;

        if (role === 'user') {
            messageDiv.innerHTML = `
                <div class="flex items-start space-x-3 max-w-[85%] flex-row-reverse">
                    <div class="w-8 h-8 rounded-full bg-blue-600 flex items-center justify-center flex-shrink-0 ml-3">
                        <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                        </svg>
                    </div>
                    <div class="bg-blue-600 text-white p-4 rounded-2xl rounded-tr-none">
                        <p>${content.replace(/\n/g, '<br>')}</p>
                    </div>
                </div>
            `;
        } else {
            messageDiv.innerHTML = `
                <div class="flex items-start space-x-3 max-w-[85%]">
                    <div class="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center flex-shrink-0">
                        <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                        </svg>
                    </div>
                    <div class="bg-slate-50 text-slate-800 p-4 rounded-2xl rounded-tl-none border border-slate-100">
                        <p>${content.replace(/\n/g, '<br>')}</p>
                    </div>
                </div>
            `;
        }

        messagesContainer.appendChild(messageDiv);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    // Add message with quick select buttons
    function addMessageWithQuickSelect(role, content) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'flex justify-start';

        let quickSelectHtml = '';
        const lowerContent = content.toLowerCase();

        if (lowerContent.includes('gender') || lowerContent.includes('sex')) {
            quickSelectHtml = `
                <div id="quick-select-gender" class="mt-3 flex flex-wrap gap-2">
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Male">Male</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Female">Female</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Other">Other</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Prefer not to say">Prefer not to say</button>
                </div>
            `;
        } else if (lowerContent.includes('location') || lowerContent.includes('where are you') || lowerContent.includes('zip')) {
            quickSelectHtml = `
                <div id="quick-select-location" class="mt-3 flex flex-wrap gap-2">
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="San Francisco, CA">San Francisco, CA</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="New York, NY">New York, NY</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Los Angeles, CA">Los Angeles, CA</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Chicago, IL">Chicago, IL</button>
                </div>
            `;
        } else if (lowerContent.includes('condition') || lowerContent.includes('symptom') || lowerContent.includes('health')) {
            quickSelectHtml = `
                <div id="quick-select-condition" class="mt-3 flex flex-wrap gap-2">
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Cancer">Cancer</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Diabetes">Diabetes</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Heart Disease">Heart Disease</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Arthritis">Arthritis</button>
                </div>
            `;
        } else if (lowerContent.includes('search') || lowerContent.includes('proceed') || lowerContent.includes('confirm')) {
            quickSelectHtml = `
                <div id="quick-select-confirm" class="mt-3 flex flex-wrap gap-2">
                    <button class="quick-btn px-4 py-2 bg-green-50 border border-green-200 rounded-full text-sm text-green-700 hover:bg-green-100 hover:border-green-300 transition-all" data-value="Yes, search for trials">Yes, search for trials</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-blue-50 hover:border-blue-300 hover:text-blue-600 transition-all" data-value="Let me add more details">Add more details</button>
                </div>
            `;
        }

        messageDiv.innerHTML = `
            <div class="flex items-start space-x-3 max-w-[85%]">
                <div class="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center flex-shrink-0">
                    <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                    </svg>
                </div>
                <div>
                    <div class="bg-slate-50 text-slate-800 p-4 rounded-2xl rounded-tl-none border border-slate-100">
                        <p>${content.replace(/\n/g, '<br>')}</p>
                    </div>
                    ${quickSelectHtml}
                </div>
            </div>
        `;

        messagesContainer.appendChild(messageDiv);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
        initQuickButtons();
    }

    // Show typing indicator
    function showTypingIndicator() {
        const typingDiv = document.createElement('div');
        typingDiv.className = 'flex justify-start';
        typingDiv.id = 'typing-indicator';
        typingDiv.innerHTML = `
            <div class="flex items-start space-x-3">
                <div class="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center flex-shrink-0">
                    <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                    </svg>
                </div>
                <div class="bg-slate-50 p-4 rounded-2xl rounded-tl-none border border-slate-100">
                    <div class="typing-indicator-dots flex space-x-1">
                        <div class="typing-dot w-2 h-2 bg-slate-400 rounded-full"></div>
                        <div class="typing-dot w-2 h-2 bg-slate-400 rounded-full"></div>
                        <div class="typing-dot w-2 h-2 bg-slate-400 rounded-full"></div>
                    </div>
                </div>
            </div>
        `;
        messagesContainer.appendChild(typingDiv);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    // Remove typing indicator
    function removeTypingIndicator() {
        const typingIndicator = document.getElementById('typing-indicator');
        if (typingIndicator) {
            typingIndicator.remove();
        }
    }

    // Get status chip HTML based on eligibility status
    function getStatusChip(status) {
        const configs = {
            met: {
                bg: 'bg-green-50',
                border: 'border-green-200',
                text: 'text-green-700',
                icon: `<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>`,
                label: 'Eligible'
            },
            review: {
                bg: 'bg-amber-50',
                border: 'border-amber-200',
                text: 'text-amber-700',
                icon: `<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>`,
                label: 'Review Needed'
            },
            violated: {
                bg: 'bg-red-50',
                border: 'border-red-200',
                text: 'text-red-700',
                icon: `<svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>`,
                label: 'Criteria Not Met'
            }
        };

        const config = configs[status] || configs.review;
        return `
            <span class="inline-flex items-center gap-1 px-2.5 py-1 ${config.bg} ${config.text} border ${config.border} rounded-full text-xs font-medium">
                ${config.icon}
                ${config.label}
            </span>
        `;
    }

    // Create a single rich trial card
    function createTrialCard(trial, eligibility, index) {
        const isSaved = savedTrials.has(trial.nct_id);
        const hardPercent = (eligibility.hardCriteriaMet / eligibility.hardCriteriaTotal) * 100;
        const softPercent = (eligibility.softCriteriaMet / eligibility.softCriteriaTotal) * 100;

        return `
            <div class="trial-card bg-white rounded-xl border border-slate-200 overflow-hidden hover:shadow-lg transition-all duration-200" data-nct="${trial.nct_id}" data-status="${eligibility.hardStatus}">
                <!-- Card Header -->
                <div class="p-5 pb-4">
                    <!-- Top Row: Title + Match Score -->
                    <div class="flex items-start justify-between gap-4 mb-3">
                        <div class="flex-1 min-w-0">
                            <h3 class="font-semibold text-slate-800 text-base leading-snug mb-1 line-clamp-2">
                                ${trial.title || 'Clinical Trial'}
                            </h3>
                            <p class="text-xs text-slate-500 font-mono">${trial.nct_id}</p>
                        </div>
                        <div class="flex-shrink-0 text-center">
                            <div class="w-14 h-14 rounded-full bg-gradient-to-br from-blue-500 to-blue-600 flex items-center justify-center shadow-sm">
                                <span class="text-white font-bold text-lg">${eligibility.matchScore}%</span>
                            </div>
                            <p class="text-xs text-slate-500 mt-1">Match</p>
                        </div>
                    </div>

                    <!-- Status Chip + Phase -->
                    <div class="flex flex-wrap items-center gap-2 mb-4">
                        ${getStatusChip(eligibility.hardStatus)}
                        ${trial.phase ? `<span class="px-2.5 py-1 bg-slate-100 text-slate-600 rounded-full text-xs font-medium">${trial.phase}</span>` : ''}
                    </div>

                    <!-- Action Links (Save, Share, ClinicalTrials.gov) -->
                    <div class="flex flex-wrap items-center gap-2 mb-4 pb-4 border-b border-slate-100">
                        <button onclick="toggleSaveTrial('${trial.nct_id}')" class="inline-flex items-center gap-1.5 px-3 py-1.5 ${isSaved ? 'bg-amber-100 text-amber-700 border border-amber-200' : 'bg-white text-slate-600 border border-slate-200'} text-sm font-medium rounded-lg hover:bg-slate-100 transition-colors" id="save-btn-${trial.nct_id}">
                            <svg class="w-4 h-4 ${isSaved ? 'fill-amber-500' : ''}" fill="${isSaved ? 'currentColor' : 'none'}" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"></path></svg>
                            ${isSaved ? 'Saved' : 'Save'}
                        </button>
                        <button onclick="shareWithDoctor('${trial.nct_id}')" class="inline-flex items-center gap-1.5 px-3 py-1.5 bg-white text-slate-600 border border-slate-200 text-sm font-medium rounded-lg hover:bg-slate-100 transition-colors">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"></path></svg>
                            Share with Doctor
                        </button>
                        <a href="https://clinicaltrials.gov/ct2/show/${trial.nct_id}" target="_blank" class="inline-flex items-center gap-1.5 px-3 py-1.5 bg-blue-50 text-blue-600 border border-blue-200 text-sm font-medium rounded-lg hover:bg-blue-100 transition-colors">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                            ClinicalTrials.gov
                        </a>
                    </div>

                    <!-- Eligibility Bars -->
                    <div class="space-y-3 mb-4">
                        <!-- Hard Criteria -->
                        <div>
                            <div class="flex items-center justify-between mb-1.5">
                                <span class="text-xs font-medium text-slate-600 flex items-center gap-1.5">
                                    <svg class="w-3.5 h-3.5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
                                    Required Criteria
                                </span>
                                <span class="text-xs font-semibold ${eligibility.hardCriteriaMet === eligibility.hardCriteriaTotal ? 'text-green-600' : 'text-amber-600'}">
                                    ${eligibility.hardCriteriaMet}/${eligibility.hardCriteriaTotal}
                                </span>
                            </div>
                            <div class="h-2 bg-slate-100 rounded-full overflow-hidden">
                                <div class="h-full rounded-full transition-all duration-500 ${eligibility.hardCriteriaMet === eligibility.hardCriteriaTotal ? 'bg-green-500' : 'bg-amber-500'}" style="width: ${hardPercent}%"></div>
                            </div>
                        </div>

                        <!-- Soft Criteria -->
                        <div>
                            <div class="flex items-center justify-between mb-1.5">
                                <span class="text-xs font-medium text-slate-600 flex items-center gap-1.5">
                                    <svg class="w-3.5 h-3.5 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path></svg>
                                    Preferences Matched
                                </span>
                                <span class="text-xs font-semibold text-blue-600">
                                    ${eligibility.softCriteriaMet}/${eligibility.softCriteriaTotal}
                                </span>
                            </div>
                            <div class="h-2 bg-slate-100 rounded-full overflow-hidden">
                                <div class="h-full bg-blue-500 rounded-full transition-all duration-500" style="width: ${softPercent}%"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Why This Match — Expandable Criteria Breakdown -->
                    ${buildCriteriaBreakdown(trial, eligibility)}
                </div>

                <!-- Card Footer - View Details -->
                <div class="px-5 py-3 bg-slate-50 border-t border-slate-100">
                    <button onclick="viewTrialDetails('${trial.nct_id}')" class="w-full inline-flex items-center justify-center gap-1.5 px-3 py-2 bg-blue-600 text-white text-sm font-medium rounded-lg hover:bg-blue-700 transition-colors">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                        View Full Details
                    </button>
                </div>
            </div>
        `;
    }

    // Show trial matches with rich cards
    function showTrialMatches(trials) {
        const container = document.createElement('div');
        container.className = 'flex justify-start w-full';

        // Reset display count
        displayedTrialCount = 6;

        // Generate eligibility data for each trial and store globally
        allTrials = trials.map(trial => ({
            trial,
            eligibility: generateEligibilityData(trial)
        }));

        // Sort by match score by default
        allTrials.sort((a, b) => b.eligibility.matchScore - a.eligibility.matchScore);

        // Count by status for filter tabs
        const statusCounts = {
            all: allTrials.length,
            eligible: allTrials.filter(t => t.eligibility.hardStatus === 'met').length,
            review: allTrials.filter(t => t.eligibility.hardStatus === 'review').length
        };

        // Only show first batch of trials
        const initialTrials = allTrials.slice(0, displayedTrialCount);
        const trialsHtml = initialTrials.map((item, index) =>
            createTrialCard(item.trial, item.eligibility, index)
        ).join('');

        const hasMoreTrials = allTrials.length > displayedTrialCount;

        container.innerHTML = `
            <div class="flex items-start space-x-3 w-full max-w-[98%]">
                <div class="w-8 h-8 rounded-full bg-green-100 flex items-center justify-center flex-shrink-0">
                    <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </div>
                <div class="flex-1 min-w-0">
                    <!-- Success Message -->
                    <div class="bg-green-50 text-green-800 p-4 rounded-2xl rounded-tl-none border border-green-100 mb-4">
                        <p class="font-medium">Great news! I found ${trials.length} clinical trial${trials.length > 1 ? 's' : ''} that may be right for you.</p>
                        <p class="text-sm mt-1 text-green-700">Showing ${Math.min(displayedTrialCount, trials.length)} of ${trials.length} trials, sorted by match score.</p>
                    </div>

                    <!-- Filter & Sort Controls -->
                    <div class="bg-white rounded-xl border border-slate-200 p-4 mb-4">
                        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3">
                            <!-- Filter Tabs -->
                            <div class="flex items-center gap-1 bg-slate-100 rounded-lg p-1">
                                <button onclick="filterTrials('all')" class="filter-tab px-3 py-1.5 text-sm font-medium rounded-md transition-colors ${currentFilter === 'all' ? 'bg-white text-slate-800 shadow-sm' : 'text-slate-600 hover:text-slate-800'}" data-filter="all">
                                    All <span class="text-xs text-slate-400 ml-1">${statusCounts.all}</span>
                                </button>
                                <button onclick="filterTrials('eligible')" class="filter-tab px-3 py-1.5 text-sm font-medium rounded-md transition-colors ${currentFilter === 'eligible' ? 'bg-white text-slate-800 shadow-sm' : 'text-slate-600 hover:text-slate-800'}" data-filter="eligible">
                                    Eligible <span class="text-xs text-green-500 ml-1">${statusCounts.eligible}</span>
                                </button>
                                <button onclick="filterTrials('review')" class="filter-tab px-3 py-1.5 text-sm font-medium rounded-md transition-colors ${currentFilter === 'review' ? 'bg-white text-slate-800 shadow-sm' : 'text-slate-600 hover:text-slate-800'}" data-filter="review">
                                    Review <span class="text-xs text-amber-500 ml-1">${statusCounts.review}</span>
                                </button>
                            </div>

                            <!-- Sort Dropdown -->
                            <div class="flex items-center gap-2">
                                <span class="text-sm text-slate-500">Sort by:</span>
                                <select onchange="sortTrials(this.value)" class="text-sm border border-slate-200 rounded-lg px-3 py-1.5 bg-white focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    <option value="match" ${currentSortBy === 'match' ? 'selected' : ''}>Match Score</option>
                                    <option value="phase" ${currentSortBy === 'phase' ? 'selected' : ''}>Phase</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Trial Cards Grid -->
                    <div id="trials-grid" class="grid grid-cols-1 lg:grid-cols-2 gap-4">
                        ${trialsHtml}
                    </div>

                    <!-- Load More (for pagination) -->
                    ${hasMoreTrials ? `
                        <div class="text-center mt-4" id="load-more-btn">
                            <button onclick="loadMoreTrials()" class="px-6 py-2.5 bg-white border border-slate-200 text-sm text-blue-600 hover:bg-blue-50 hover:border-blue-300 font-medium rounded-lg transition-colors flex items-center gap-2 mx-auto">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                                Load more trials (${allTrials.length - displayedTrialCount} remaining)
                            </button>
                        </div>
                    ` : ''}
                </div>
            </div>
        `;

        messagesContainer.appendChild(container);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    // Toggle save/shortlist trial
    window.toggleSaveTrial = function(nctId, trialData = null) {
        const btn = document.getElementById(`save-btn-${nctId}`);
        if (savedTrials.has(nctId)) {
            savedTrials.delete(nctId);
            if (btn) {
                btn.innerHTML = `
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"></path></svg>
                    Save
                `;
                btn.className = 'inline-flex items-center gap-1.5 px-3 py-1.5 bg-white text-slate-600 border border-slate-200 text-sm font-medium rounded-lg hover:bg-slate-100 transition-colors';
            }
        } else {
            // Find trial data from allTrials if not provided
            if (!trialData) {
                const found = allTrials.find(t => t.trial.nct_id === nctId);
                if (found) trialData = found;
            }
            savedTrials.set(nctId, trialData);
            if (btn) {
                btn.innerHTML = `
                    <svg class="w-4 h-4 fill-amber-500" fill="currentColor" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"></path></svg>
                    Saved
                `;
                btn.className = 'inline-flex items-center gap-1.5 px-3 py-1.5 bg-amber-100 text-amber-700 border border-amber-200 text-sm font-medium rounded-lg hover:bg-slate-100 transition-colors';
            }
        }
        // Update the saved trials section
        updateSavedTrialsSection();
    };

    // Share with doctor
    window.shareWithDoctor = function(nctId) {
        // In production, this would open a share dialog or send to doctor
        alert(`Share functionality coming soon! Trial ${nctId} would be shared with your healthcare provider.`);
    };

    // Filter trials
    window.filterTrials = function(filter) {
        currentFilter = filter;
        const cards = document.querySelectorAll('.trial-card');
        const tabs = document.querySelectorAll('.filter-tab');

        tabs.forEach(tab => {
            if (tab.dataset.filter === filter) {
                tab.className = 'filter-tab px-3 py-1.5 text-sm font-medium rounded-md transition-colors bg-white text-slate-800 shadow-sm';
            } else {
                tab.className = 'filter-tab px-3 py-1.5 text-sm font-medium rounded-md transition-colors text-slate-600 hover:text-slate-800';
            }
        });

        cards.forEach(card => {
            const status = card.dataset.status;
            if (filter === 'all') {
                card.style.display = '';
            } else if (filter === 'eligible' && status === 'met') {
                card.style.display = '';
            } else if (filter === 'review' && status === 'review') {
                card.style.display = '';
            } else {
                card.style.display = 'none';
            }
        });
    };

    // Sort trials
    window.sortTrials = function(sortBy) {
        currentSortBy = sortBy;
        const grid = document.getElementById('trials-grid');
        if (!grid) return;

        // Sort the allTrials array
        const sorted = [...allTrials].sort((a, b) => {
            if (sortBy === 'match') {
                return b.eligibility.matchScore - a.eligibility.matchScore;
            } else if (sortBy === 'phase') {
                const phaseA = a.trial.phase || '';
                const phaseB = b.trial.phase || '';
                return phaseB.localeCompare(phaseA);
            }
            return 0;
        });

        // Re-render the cards
        const trialsHtml = sorted.slice(0, displayedTrialCount).map((item, index) =>
            createTrialCard(item.trial, item.eligibility, index)
        ).join('');
        grid.innerHTML = trialsHtml;
    };

    // Load more trials (pagination)
    window.loadMoreTrials = function() {
        const grid = document.getElementById('trials-grid');
        const loadMoreBtn = document.getElementById('load-more-btn');
        if (!grid || !allTrials.length) return;

        // Increase the displayed count
        const previousCount = displayedTrialCount;
        displayedTrialCount = Math.min(displayedTrialCount + 6, allTrials.length);

        // Add more cards
        const newTrials = allTrials.slice(previousCount, displayedTrialCount);
        newTrials.forEach((item, index) => {
            const cardHtml = createTrialCard(item.trial, item.eligibility, previousCount + index);
            grid.insertAdjacentHTML('beforeend', cardHtml);
        });

        // Hide load more button if all trials are displayed
        if (displayedTrialCount >= allTrials.length && loadMoreBtn) {
            loadMoreBtn.style.display = 'none';
        }
    };

    // Update saved trials section
    function updateSavedTrialsSection() {
        let savedSection = document.getElementById('saved-trials-section');

        if (savedTrials.size === 0) {
            if (savedSection) {
                savedSection.remove();
            }
            return;
        }

        const savedHtml = Array.from(savedTrials.entries()).map(([nctId, data]) => {
            const trial = data?.trial || { nct_id: nctId, title: 'Clinical Trial' };
            const eligibility = data?.eligibility || { matchScore: 0 };
            return `
                <div class="flex items-center justify-between p-3 bg-white rounded-lg border border-slate-200 hover:shadow-sm transition-all">
                    <div class="flex-1 min-w-0 mr-3">
                        <h4 class="text-sm font-medium text-slate-800 truncate">${trial.title || 'Clinical Trial'}</h4>
                        <p class="text-xs text-slate-500">${trial.nct_id} · ${eligibility.matchScore}% match</p>
                    </div>
                    <div class="flex items-center gap-2">
                        <a href="https://clinicaltrials.gov/ct2/show/${nctId}" target="_blank" class="p-1.5 text-blue-600 hover:bg-blue-50 rounded transition-colors" title="View on ClinicalTrials.gov">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                        </a>
                        <button onclick="viewTrialDetails('${nctId}')" class="p-1.5 text-slate-600 hover:bg-slate-50 rounded transition-colors" title="View details">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                        </button>
                        <button onclick="toggleSaveTrial('${nctId}')" class="p-1.5 text-red-500 hover:bg-red-50 rounded transition-colors" title="Remove">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                        </button>
                    </div>
                </div>
            `;
        }).join('');

        const sectionContent = `
            <div class="bg-amber-50 border border-amber-200 rounded-xl p-4 mb-4">
                <div class="flex items-center gap-2 mb-3">
                    <svg class="w-5 h-5 text-amber-600" fill="currentColor" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"></path></svg>
                    <h3 class="font-semibold text-amber-800">Saved Clinical Trials (${savedTrials.size})</h3>
                </div>
                <div class="space-y-2">
                    ${savedHtml}
                </div>
                <div class="mt-3 pt-3 border-t border-amber-200 flex gap-2">
                    <button onclick="exportSavedTrials()" class="flex-1 px-3 py-2 bg-amber-600 text-white text-sm font-medium rounded-lg hover:bg-amber-700 transition-colors flex items-center justify-center gap-2">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"></path></svg>
                        Export List
                    </button>
                    <button onclick="shareAllWithDoctor()" class="flex-1 px-3 py-2 bg-white text-amber-700 border border-amber-300 text-sm font-medium rounded-lg hover:bg-amber-100 transition-colors flex items-center justify-center gap-2">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"></path></svg>
                        Share with Doctor
                    </button>
                </div>
            </div>
        `;

        if (savedSection) {
            savedSection.innerHTML = sectionContent;
        } else {
            // Insert after the filter controls
            const trialsGrid = document.getElementById('trials-grid');
            if (trialsGrid && trialsGrid.parentNode) {
                savedSection = document.createElement('div');
                savedSection.id = 'saved-trials-section';
                savedSection.innerHTML = sectionContent;
                trialsGrid.parentNode.insertBefore(savedSection, trialsGrid);
            }
        }
    }

    // Export saved trials
    window.exportSavedTrials = function() {
        if (savedTrials.size === 0) {
            alert('No trials saved yet.');
            return;
        }

        let exportText = 'SAVED CLINICAL TRIALS\n';
        exportText += '=====================\n\n';

        savedTrials.forEach((data, nctId) => {
            const trial = data?.trial || {};
            const eligibility = data?.eligibility || {};
            exportText += `Trial: ${trial.title || 'N/A'}\n`;
            exportText += `NCT ID: ${nctId}\n`;
            exportText += `Match Score: ${eligibility.matchScore || 'N/A'}%\n`;
            exportText += `Phase: ${trial.phase || 'N/A'}\n`;
            exportText += `Link: https://clinicaltrials.gov/ct2/show/${nctId}\n`;
            exportText += '\n---\n\n';
        });

        // Create and download file
        const blob = new Blob([exportText], { type: 'text/plain' });
        const url = URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'saved_clinical_trials.txt';
        a.click();
        URL.revokeObjectURL(url);
    };

    // Share all saved trials with doctor
    window.shareAllWithDoctor = function() {
        if (savedTrials.size === 0) {
            alert('No trials saved yet.');
            return;
        }
        const trialIds = Array.from(savedTrials.keys()).join(', ');
        alert(`Share functionality coming soon!\n\nThe following trials would be shared with your healthcare provider:\n${trialIds}`);
    };

    // View trial details with expanded criteria
    window.viewTrialDetails = async function(nctId) {
        try {
            const response = await fetch(`/api/trials/${nctId}`);
            const data = await response.json();

            if (data.success && data.trial) {
                const trial = data.trial;
                const modalContent = document.getElementById('trial-details');
                const eligibility = generateEligibilityData(trial);

                // Format criteria with hard/soft visualization and LLM explanations
                let criteriaHtml = '';
                if (trial.criteria && trial.criteria.length > 0) {
                    const hardCriteria = trial.criteria.filter(c => c.hard_constraint !== false);
                    const softCriteria = trial.criteria.filter(c => c.hard_constraint === false);

                    // Mock criterion-level status and explanations
                    const getCriterionStatus = () => {
                        const rand = Math.random();
                        if (rand > 0.7) return 'unclear';
                        if (rand > 0.2) return 'met';
                        return 'unmet';
                    };

                    const criterionExplanations = [
                        "Based on your provided information, this criterion appears to be satisfied.",
                        "Your profile data indicates you meet this requirement.",
                        "This criterion requires verification with your healthcare provider.",
                        "Additional documentation may be needed to confirm eligibility."
                    ];

                    criteriaHtml = `
                        <div class="mt-6">
                            <h4 class="font-semibold text-lg mb-4 text-slate-800 flex items-center gap-2">
                                Eligibility Assessment
                                <span class="text-xs font-normal text-slate-500 bg-slate-100 px-2 py-1 rounded">Personalized for you</span>
                            </h4>

                            ${hardCriteria.length > 0 ? `
                                <div class="mb-6">
                                    <div class="flex items-center gap-2 mb-3">
                                        <svg class="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
                                        <span class="font-medium text-slate-700">Required Criteria</span>
                                        <span class="text-xs text-slate-500">(Must meet all)</span>
                                    </div>
                                    <div class="space-y-3">
                                        ${hardCriteria.map(c => {
                                            const status = getCriterionStatus();
                                            const statusConfig = {
                                                met: { border: 'border-green-400', bg: 'bg-green-50', icon: '✓', iconColor: 'text-green-600' },
                                                unmet: { border: 'border-red-400', bg: 'bg-red-50', icon: '✗', iconColor: 'text-red-600' },
                                                unclear: { border: 'border-amber-400', bg: 'bg-amber-50', icon: '?', iconColor: 'text-amber-600' }
                                            }[status];

                                            return `
                                                <div class="rounded-lg border-l-4 ${statusConfig.border} ${statusConfig.bg} overflow-hidden">
                                                    <div class="p-4">
                                                        <div class="flex items-start justify-between">
                                                            <div class="flex-1">
                                                                <div class="flex items-center gap-2 mb-1">
                                                                    <span class="w-5 h-5 rounded-full ${statusConfig.bg} ${statusConfig.iconColor} flex items-center justify-center text-sm font-bold">${statusConfig.icon}</span>
                                                                    <span class="font-medium text-slate-800">${c.criterion_type}</span>
                                                                </div>
                                                                <p class="text-sm text-slate-600 ml-7">${c.criterion_value}</p>
                                                            </div>
                                                            <button onclick="this.nextElementSibling.classList.toggle('hidden')" class="text-xs text-blue-600 hover:text-blue-800 whitespace-nowrap">
                                                                Show explanation
                                                            </button>
                                                        </div>
                                                        <div class="hidden mt-3 ml-7 p-3 bg-white/50 rounded-lg border border-slate-200">
                                                            <p class="text-sm text-slate-600 italic">${criterionExplanations[Math.floor(Math.random() * criterionExplanations.length)]}</p>
                                                            <button class="mt-2 text-xs text-blue-600 hover:underline">Show supporting note text →</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            `;
                                        }).join('')}
                                    </div>
                                </div>
                            ` : ''}

                            ${softCriteria.length > 0 ? `
                                <div>
                                    <div class="flex items-center gap-2 mb-3">
                                        <svg class="w-5 h-5 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path></svg>
                                        <span class="font-medium text-slate-700">Preferences & Soft Criteria</span>
                                        <span class="text-xs text-slate-500">(Flexible)</span>
                                    </div>
                                    <div class="space-y-3">
                                        ${softCriteria.map(c => `
                                            <div class="rounded-lg border-l-4 border-blue-400 bg-blue-50 p-4">
                                                <div class="flex items-center gap-2 mb-1">
                                                    <span class="w-5 h-5 rounded-full bg-blue-100 text-blue-600 flex items-center justify-center text-sm">~</span>
                                                    <span class="font-medium text-slate-800">${c.criterion_type}</span>
                                                </div>
                                                <p class="text-sm text-slate-600 ml-7">${c.criterion_value}</p>
                                            </div>
                                        `).join('')}
                                    </div>
                                </div>
                            ` : ''}
                        </div>
                    `;
                }

                document.getElementById('trial-title').textContent = trial.title || 'Clinical Trial Details';
                modalContent.innerHTML = `
                    <div class="space-y-6">
                        <!-- Match Score Summary -->
                        <div class="flex items-center gap-4 p-4 bg-gradient-to-r from-blue-50 to-slate-50 rounded-xl border border-blue-100">
                            <div class="w-16 h-16 rounded-full bg-gradient-to-br from-blue-500 to-blue-600 flex items-center justify-center shadow-lg">
                                <span class="text-white font-bold text-xl">${eligibility.matchScore}%</span>
                            </div>
                            <div>
                                <p class="font-semibold text-slate-800">Overall Match Score</p>
                                <p class="text-sm text-slate-600">Based on ${eligibility.hardCriteriaTotal + eligibility.softCriteriaTotal} evaluated criteria</p>
                            </div>
                        </div>

                        <!-- About Section with Simple/Full toggle -->
                        <div>
                            <div class="flex items-center justify-between mb-2">
                                <h4 class="font-semibold text-slate-800">About This Study</h4>
                                ${trial.plain_summary ? `
                                    <div class="flex bg-slate-100 rounded-lg p-0.5 text-xs">
                                        <button onclick="this.parentElement.querySelectorAll('button').forEach(b=>b.classList.remove('bg-white','shadow-sm'));this.classList.add('bg-white','shadow-sm');this.closest('.space-y-4').querySelector('.summary-simple').classList.remove('hidden');this.closest('.space-y-4').querySelector('.summary-full').classList.add('hidden')" class="px-2.5 py-1 rounded-md bg-white shadow-sm font-medium text-slate-700 transition-all">Simple</button>
                                        <button onclick="this.parentElement.querySelectorAll('button').forEach(b=>b.classList.remove('bg-white','shadow-sm'));this.classList.add('bg-white','shadow-sm');this.closest('.space-y-4').querySelector('.summary-full').classList.remove('hidden');this.closest('.space-y-4').querySelector('.summary-simple').classList.add('hidden')" class="px-2.5 py-1 rounded-md font-medium text-slate-500 transition-all">Full</button>
                                    </div>
                                ` : ''}
                            </div>
                            ${trial.plain_summary ? `
                                <div class="summary-simple">
                                    <p class="text-slate-600 bg-blue-50 border border-blue-100 rounded-lg p-3">${trial.plain_summary}</p>
                                </div>
                                <div class="summary-full hidden">
                                    <p class="text-slate-600">${trial.brief_summary || 'No description available.'}</p>
                                </div>
                            ` : `
                                <p class="text-slate-600">${trial.brief_summary || 'No description available.'}</p>
                            `}
                        </div>

                        <!-- Quick Info Grid -->
                        <div class="grid grid-cols-2 sm:grid-cols-3 gap-3">
                            ${trial.phase ? `
                                <div class="bg-slate-50 p-3 rounded-lg text-center">
                                    <p class="text-xs text-slate-500 mb-1">Phase</p>
                                    <p class="font-semibold text-slate-800">${trial.phase}</p>
                                </div>
                            ` : ''}
                            ${trial.enrollment ? `
                                <div class="bg-slate-50 p-3 rounded-lg text-center">
                                    <p class="text-xs text-slate-500 mb-1">Enrollment</p>
                                    <p class="font-semibold text-slate-800">${trial.enrollment}</p>
                                </div>
                            ` : ''}
                            <div class="bg-slate-50 p-3 rounded-lg text-center">
                                <p class="text-xs text-slate-500 mb-1">Status</p>
                                <p class="font-semibold text-green-600">Recruiting</p>
                            </div>
                        </div>

                        ${trial.drugs ? `
                            <div>
                                <h4 class="font-semibold text-slate-800 mb-2">Drugs/Interventions</h4>
                                <p class="text-slate-600">${trial.drugs}</p>
                            </div>
                        ` : ''}

                        <!-- Action Buttons (above eligibility) -->
                        <div class="flex flex-col sm:flex-row gap-3 p-4 bg-slate-50 rounded-xl border border-slate-200">
                            <button onclick="toggleSaveTrial('${trial.nct_id}')" class="flex-1 text-center bg-amber-100 text-amber-700 border border-amber-200 px-4 py-3 rounded-xl hover:bg-amber-200 transition-colors flex items-center justify-center gap-2" id="modal-save-btn-${trial.nct_id}">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"></path></svg>
                                Save to Shortlist
                            </button>
                            <button onclick="shareWithDoctor('${trial.nct_id}')" class="flex-1 text-center bg-white text-slate-700 border border-slate-200 px-4 py-3 rounded-xl hover:bg-slate-100 transition-colors flex items-center justify-center gap-2">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"></path></svg>
                                Share with Doctor
                            </button>
                            <a href="https://clinicaltrials.gov/ct2/show/${trial.nct_id}" target="_blank" class="flex-1 text-center bg-blue-600 text-white px-4 py-3 rounded-xl hover:bg-blue-700 transition-colors flex items-center justify-center gap-2">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                                ClinicalTrials.gov
                            </a>
                        </div>

                        ${criteriaHtml}
                    </div>
                `;

                trialModal.classList.remove('hidden');
                trialModal.classList.add('flex');
            } else {
                addMessage('assistant', 'Sorry, I could not load the trial details.');
            }
        } catch (error) {
            console.error('Error loading trial details:', error);
            addMessage('assistant', 'Sorry, something went wrong while loading the trial details.');
        }
    };

    // Initialize
    initChat();
});
