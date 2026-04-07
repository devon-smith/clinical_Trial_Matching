document.addEventListener('DOMContentLoaded', function() {
    const messageForm = document.getElementById('message-form');
    const userInput = document.getElementById('user-input');
    const messagesContainer = document.getElementById('messages');
    const trialModal = document.getElementById('trial-modal');
    const closeModal = document.getElementById('close-modal');
    let isWaitingForResponse = false;
    let currentStep = 1;
    let conversationState = 'intake';
    let savedTrials = new Map(); // Track saved/shortlisted trials with their data
    let allTrials = []; // Store all trials for load more functionality
    let displayedTrialCount = 6; // Initial number of trials to show
    let currentSortBy = 'match'; // match, phase, title
    let currentFilter = 'all'; // all, eligible, review

    // --- localStorage session persistence ---
    const SESSION_KEY = 'ctf_session';
    const SESSION_MAX_AGE_MS = 24 * 60 * 60 * 1000; // 24 hours

    // Patient profile tracked client-side (updated from server responses)
    let patientProfile = {
        demographics: { age: null, gender: null, location: null },
        condition: null,
        symptoms: null,
        conditionDetails: {},
        conditionCategory: null,
    };

    // Conversation messages (role + content pairs for clean restore)
    let conversationMessages = [];

    function _generateSessionId() {
        return 'ctf_' + Date.now().toString(36) + '_' + Math.random().toString(36).slice(2, 8);
    }

    function saveSession() {
        // Don't persist empty sessions (no condition yet)
        if (!patientProfile.condition) return;

        try {
            const session = {
                sessionId: loadSession()?. sessionId || _generateSessionId(),
                timestamp: Date.now(),
                patientProfile,
                conversationMessages,
                conversationState,
                searchResults: allTrials.map(t => ({
                    trial: t.trial,
                    eligibility: t.eligibility,
                })),
                chatHtml: messagesContainer.innerHTML,
            };
            localStorage.setItem(SESSION_KEY, JSON.stringify(session));
        } catch (e) {
            // localStorage full or unavailable — silently ignore
        }
    }

    function loadSession() {
        try {
            const raw = localStorage.getItem(SESSION_KEY);
            if (!raw) return null;
            const session = JSON.parse(raw);
            // Expire after 24 hours
            if (Date.now() - session.timestamp > SESSION_MAX_AGE_MS) {
                localStorage.removeItem(SESSION_KEY);
                return null;
            }
            return session;
        } catch (e) {
            localStorage.removeItem(SESSION_KEY);
            return null;
        }
    }

    function clearSession() {
        localStorage.removeItem(SESSION_KEY);
        patientProfile = {
            demographics: { age: null, gender: null, location: null },
            condition: null,
            symptoms: null,
            conditionDetails: {},
            conditionCategory: null,
        };
        conversationMessages = [];
    }

    function restoreSession(session) {
        // Restore patient profile
        if (session.patientProfile) {
            patientProfile = session.patientProfile;
        }
        conversationMessages = session.conversationMessages || [];
        conversationState = session.conversationState || 'intake';
        allTrials = session.searchResults || [];

        // Restore chat UI
        messagesContainer.innerHTML = session.chatHtml || '';
        initQuickButtons();
        scrollToBottom();

        // Sync server session by sending a restore message
        _syncServerSession(patientProfile);
    }

    async function _syncServerSession(profile) {
        // Tell the server about the restored patient profile so the
        // Flask session matches what the client has
        try {
            await fetch('/api/chat', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ message: '/restore', profile }),
                credentials: 'same-origin',
            });
        } catch (e) {
            // Non-critical — server session will rebuild on next real message
        }
    }

    function _updatePatientProfile(data) {
        // Update client-side profile from server response data
        if (data.patient_summary) {
            const s = data.patient_summary;
            if (s.age) patientProfile.demographics.age = s.age;
            if (s.gender) patientProfile.demographics.gender = s.gender;
            if (s.location) patientProfile.demographics.location = s.location;
            if (s.condition) patientProfile.condition = s.condition;
            if (s.symptoms) patientProfile.symptoms = s.symptoms;
        }
        // Also pick up condition from condition_followups if available
        if (data.condition_followups && data.condition_followups.length > 0) {
            const cat = data.condition_followups[0];
            if (cat.category) patientProfile.conditionCategory = cat.category;
            if (cat.category_display) patientProfile.condition = patientProfile.condition || cat.category_display;
        }
    }

    // Smooth scroll to bottom of chat
    function scrollToBottom() {
        const chatContainer = document.getElementById('chat-container');
        if (chatContainer) {
            chatContainer.scrollTo({
                top: chatContainer.scrollHeight,
                behavior: 'smooth'
            });
        }
    }

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

        // Check for saved session and offer to resume
        const saved = loadSession();
        if (saved && saved.patientProfile && saved.patientProfile.condition) {
            showResumePrompt(saved);
        } else {
            initQuickButtons();
            userInput.focus();
        }
    }

    function showResumePrompt(saved) {
        const profile = saved.patientProfile || {};
        const demos = profile.demographics || {};
        const condition = profile.condition || '';
        const location = demos.location || '';
        const age = demos.age;
        const trialCount = (saved.searchResults || saved.allTrials || []).length;

        // Build context string
        let contextParts = [];
        if (condition) contextParts.push(`<strong>${condition}</strong>`);
        if (location) contextParts.push(`near <strong>${location}</strong>`);

        let description;
        if (contextParts.length > 0 && trialCount > 0) {
            description = `Last time you searched for ${contextParts.join(' ')} trials and found ${trialCount} result${trialCount !== 1 ? 's' : ''}.`;
        } else if (contextParts.length > 0) {
            description = `Last time you were looking into ${contextParts.join(' ')} trials.`;
        } else {
            description = `You had a search in progress.`;
        }

        // Demographics we'd keep on "New search"
        let demoNote = '';
        const demoParts = [];
        if (age) demoParts.push(`age ${age}`);
        if (demos.gender) demoParts.push(demos.gender);
        if (location) demoParts.push(location);
        if (demoParts.length > 0) {
            demoNote = `<p class="text-slate-400 text-xs mt-2">"New search" keeps your info (${demoParts.join(', ')}) — only the condition resets.</p>`;
        }

        const resumeDiv = document.createElement('div');
        resumeDiv.className = 'flex justify-start message-enter';
        resumeDiv.id = 'resume-prompt';
        resumeDiv.innerHTML = `
            <div class="max-w-[85%]">
                <div class="bg-[#f5f5f0] text-slate-700 px-4 py-3 rounded-xl rounded-tl-sm text-sm leading-relaxed">
                    <p class="mb-3">Welcome back! ${description} Want to pick up where you left off, or start a new search?</p>
                    <div class="flex gap-2">
                        <button id="resume-btn" class="px-4 py-2 bg-primary text-white text-xs font-medium rounded-lg hover:bg-primary-dark transition-colors min-h-[44px]">Continue</button>
                        <button id="new-search-btn" class="px-4 py-2 bg-white text-slate-600 text-xs font-medium rounded-lg border border-warm-border hover:bg-slate-50 transition-colors min-h-[44px]">New search</button>
                    </div>
                    ${demoNote}
                </div>
            </div>
        `;

        messagesContainer.appendChild(resumeDiv);
        scrollToBottom();

        document.getElementById('resume-btn').addEventListener('click', () => {
            resumeDiv.remove();
            restoreSession(saved);
        });

        document.getElementById('new-search-btn').addEventListener('click', () => {
            // Keep demographics, clear condition data
            const savedDemographics = (saved.patientProfile || {}).demographics || {};
            resumeDiv.remove();
            clearSession();
            // Restore demographics only
            patientProfile.demographics = savedDemographics;
            initQuickButtons();
            userInput.focus();
            // Send "new search" to server so it keeps demographics
            if (savedDemographics.age || savedDemographics.location) {
                _syncServerSession({ demographics: savedDemographics });
            }
        });
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
    // Internal step tracking only — no visual stepper
    function updateProgress(step) {
        currentStep = step;
    }

    // Detect conversation state from response text
    function detectStateFromResponse(response) {
        const lower = response.toLowerCase();
        if (lower.includes('preference') && lower.includes('rank')) {
            conversationState = 'preferences';
        } else if (lower.includes('searching') || lower.includes('looking for trials')) {
            conversationState = 'searching';
        } else if (lower.includes('also need to know') || lower.includes('can you tell me more')) {
            conversationState = 'followup';
        } else {
            conversationState = 'intake';
        }
    }

    // Get Tailwind color class for trial status
    function getStatusColor(status) {
        if (!status) return 'text-slate-500';
        const s = status.toLowerCase();
        if (s === 'recruiting') return 'text-green-600';
        if (s.includes('active') || s.includes('enrolling')) return 'text-slate-600';
        return 'text-slate-500';
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
        // Prefer the rich eligibility_breakdown from the visualization API
        const vizBreakdown = trial.eligibility_breakdown;
        const criteria = eligibility.criteriaDetails || [];

        if (!vizBreakdown && criteria.length === 0) {
            return `
                <div class="bg-slate-50 rounded-lg p-3">
                    <div class="flex items-start gap-2">
                        <svg class="w-4 h-4 text-slate-500 mt-0.5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <p class="text-sm text-slate-600">${eligibility.explanation}</p>
                    </div>
                </div>`;
        }

        // Use visualization breakdown if available
        if (vizBreakdown && vizBreakdown.criteria && vizBreakdown.criteria.length > 0) {
            return buildVizCriteriaBreakdown(trial, vizBreakdown);
        }

        // Fallback to old criteria-based rendering
        const hardCriteria = criteria.filter(c => c.hard || c.hard_constraint);
        const softCriteria = criteria.filter(c => !c.hard && !c.hard_constraint);

        const metCount = criteria.filter(c => c.met).length;
        const unclearCount = criteria.filter(c => !c.met && c.llm_status === 'UNCLEAR').length;

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

        const hardPreview = hardCriteria.slice(0, 5);
        const softPreview = softCriteria.slice(0, 3);
        const moreHard = hardCriteria.length > 5 ? `<p class="text-[10px] text-slate-400 mt-1">+${hardCriteria.length - 5} more required criteria...</p>` : '';
        const moreSoft = softCriteria.length > 3 ? `<p class="text-[10px] text-slate-400 mt-1">+${softCriteria.length - 3} more preference criteria...</p>` : '';

        return `
            <div class="border border-slate-200 rounded-lg overflow-hidden">
                <button onclick="this.nextElementSibling.classList.toggle('hidden'); this.querySelector('.expand-icon').classList.toggle('rotate-180')"
                        class="w-full flex items-center justify-between px-3 py-2.5 bg-slate-50 hover:bg-slate-100 transition-colors text-left">
                    <span class="text-xs font-medium text-slate-700 flex items-center gap-1.5">
                        <svg class="w-3.5 h-3.5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
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

    // Build the rich visualization-based criteria breakdown for trial cards
    function buildVizCriteriaBreakdown(trial, viz) {
        const eligibleCount = viz.eligible_count || 0;
        const ineligibleCount = viz.ineligible_count || 0;
        const unknownCount = viz.unknown_count || 0;

        // Use pre-grouped data from backend when available
        const grouped = viz.grouped || {};
        const qualified = grouped.qualified || (viz.criteria || []).filter(c => c.status === 'eligible');
        const notQualified = grouped.not_qualified || (viz.criteria || []).filter(c => c.status === 'ineligible');
        const patientQuestions = grouped.patient_questions || [];
        const doctorVerify = grouped.doctor_verify || [];

        // --- Render helpers ---

        function renderQualifiedCriterion(c) {
            const explanation = c.explanation
                ? `<p class="text-[10px] text-green-600/70 mt-0.5 ml-5">${c.explanation}</p>`
                : '';
            return `
                <div class="py-1.5 border-b border-green-50 last:border-0">
                    <div class="flex items-center gap-1.5">
                        <span class="inline-flex items-center justify-center w-4 h-4 rounded-full bg-green-100 text-green-600 text-[10px] font-bold flex-shrink-0">&#10003;</span>
                        <span class="text-xs text-slate-600 flex-1">${c.human_label}</span>
                    </div>
                    ${explanation}
                </div>`;
        }

        function renderNotQualifiedCriterion(c) {
            const explanation = c.explanation
                ? `<p class="text-[10px] text-red-600/80 mt-0.5 ml-5">${c.explanation}</p>`
                : '';
            return `
                <div class="py-1.5 border-b border-red-50 last:border-0">
                    <div class="flex items-center gap-1.5">
                        <span class="inline-flex items-center justify-center w-4 h-4 rounded-full bg-red-100 text-red-600 text-[10px] font-bold flex-shrink-0">&#10007;</span>
                        <span class="text-xs text-slate-600 flex-1">${c.human_label}</span>
                    </div>
                    ${explanation}
                </div>`;
        }

        function renderPatientQuestion(c) {
            // Show as a conversational question the patient can answer
            const question = c.explanation || `Do you know about ${c.human_label.toLowerCase()}?`;
            return `
                <div class="py-1.5 border-b border-amber-50 last:border-0">
                    <div class="flex items-start gap-1.5">
                        <span class="inline-flex items-center justify-center w-4 h-4 rounded-full bg-amber-100 text-amber-600 text-[10px] font-bold flex-shrink-0 mt-0.5">?</span>
                        <span class="text-xs text-slate-600">${c.human_label}</span>
                    </div>
                </div>`;
        }

        function renderDoctorVerify(c) {
            return `
                <div class="py-1 border-b border-slate-50 last:border-0">
                    <div class="flex items-center gap-1.5">
                        <svg class="w-3.5 h-3.5 text-slate-400 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                        <span class="text-[11px] text-slate-500">${c.human_label}</span>
                    </div>
                </div>`;
        }

        // --- Build sections ---

        // "You qualify" section (green)
        let qualifiedHtml = '';
        if (qualified.length > 0) {
            const preview = qualified.slice(0, 5);
            const more = qualified.length > 5
                ? `<p class="text-[10px] text-green-600/60 mt-1">+${qualified.length - 5} more criteria met</p>` : '';
            qualifiedHtml = `
                <div class="mb-2">
                    <p class="text-[10px] font-semibold text-green-700 uppercase tracking-wide mb-1 flex items-center gap-1">
                        <span>&#10003;</span> You qualify (${qualified.length})
                    </p>
                    <div class="bg-green-50/50 rounded-lg px-2 py-1">
                        ${preview.map(renderQualifiedCriterion).join('')}
                        ${more}
                    </div>
                </div>`;
        }

        // "You may not qualify" section (red)
        let notQualifiedHtml = '';
        if (notQualified.length > 0) {
            notQualifiedHtml = `
                <div class="mb-2">
                    <p class="text-[10px] font-semibold text-red-700 uppercase tracking-wide mb-1 flex items-center gap-1">
                        <span>&#10007;</span> You may not qualify (${notQualified.length})
                    </p>
                    <div class="bg-red-50/50 rounded-lg px-2 py-1">
                        ${notQualified.map(renderNotQualifiedCriterion).join('')}
                    </div>
                </div>`;
        }

        // "Needs verification" section (amber) — split into patient questions and doctor verify
        let verificationHtml = '';
        if (patientQuestions.length > 0 || doctorVerify.length > 0) {
            let patientQuestionsHtml = '';
            if (patientQuestions.length > 0) {
                const preview = patientQuestions.slice(0, 4);
                const more = patientQuestions.length > 4
                    ? `<p class="text-[10px] text-amber-600/60 mt-1">+${patientQuestions.length - 4} more questions</p>` : '';
                patientQuestionsHtml = `
                    <p class="text-[10px] font-medium text-amber-700 mb-1">Questions for you</p>
                    ${preview.map(renderPatientQuestion).join('')}
                    ${more}`;
            }

            let doctorVerifyHtml = '';
            if (doctorVerify.length > 0) {
                const preview = doctorVerify.slice(0, 3);
                const more = doctorVerify.length > 3
                    ? `<p class="text-[10px] text-slate-400 mt-1">+${doctorVerify.length - 3} more lab/clinical checks</p>` : '';
                doctorVerifyHtml = `
                    <p class="text-[10px] font-medium text-slate-500 ${patientQuestions.length > 0 ? 'mt-2' : ''} mb-1">Your doctor would verify</p>
                    ${preview.map(renderDoctorVerify).join('')}
                    ${more}`;
            }

            const totalVerify = patientQuestions.length + doctorVerify.length;
            verificationHtml = `
                <div class="mb-2">
                    <p class="text-[10px] font-semibold text-amber-700 uppercase tracking-wide mb-1 flex items-center gap-1">
                        <span>?</span> Needs verification (${totalVerify})
                    </p>
                    <div class="bg-amber-50/50 rounded-lg px-2 py-1">
                        ${patientQuestionsHtml}
                        ${doctorVerifyHtml}
                    </div>
                </div>`;
        }

        return `
            <div class="border border-slate-200 rounded-lg overflow-hidden">
                <button onclick="this.nextElementSibling.classList.toggle('hidden'); this.querySelector('.expand-icon').classList.toggle('rotate-180')"
                        class="w-full flex items-center justify-between px-3 py-2.5 bg-slate-50 hover:bg-slate-100 transition-colors text-left">
                    <span class="text-xs font-medium text-slate-700 flex items-center gap-1.5">
                        <svg class="w-3.5 h-3.5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                        Eligibility Breakdown
                    </span>
                    <div class="flex items-center gap-1.5">
                        ${eligibleCount > 0 ? `<span class="px-1.5 py-0.5 text-[10px] font-medium rounded bg-green-100 text-green-700">${eligibleCount} met</span>` : ''}
                        ${ineligibleCount > 0 ? `<span class="px-1.5 py-0.5 text-[10px] font-medium rounded bg-red-100 text-red-700">${ineligibleCount} not met</span>` : ''}
                        ${unknownCount > 0 ? `<span class="px-1.5 py-0.5 text-[10px] font-medium rounded bg-amber-100 text-amber-700">${unknownCount} to verify</span>` : ''}
                        <svg class="w-3.5 h-3.5 text-slate-400 expand-icon transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                    </div>
                </button>
                <div class="hidden px-3 py-2 bg-white border-t border-slate-100 max-h-72 overflow-y-auto">
                    ${notQualifiedHtml}
                    ${qualifiedHtml}
                    ${verificationHtml}
                    ${buildPreferenceBreakdown(trial)}
                </div>
            </div>`;
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

    // Render the concept audit transparency panel
    function renderConceptAuditPanel(conceptAudit) {
        const panelDiv = document.createElement('div');
        panelDiv.className = 'flex justify-start w-full';

        const successAudits = conceptAudit.filter(a => a.query_success);
        const failedAudits = conceptAudit.filter(a => !a.query_success);

        const successItems = successAudits.map(audit => {
            const canon = audit.canonical_concept;
            const included = audit.included_concepts || [];
            const excluded = audit.excluded_concepts || [];
            const related = audit.related_concepts || [];
            const trialTerms = audit.trial_terms_matched || [];
            const rejected = audit.rejected_concepts || [];

            return `
                <div class="p-3 bg-white border border-slate-200 rounded-lg">
                    <div class="flex items-center gap-2 mb-2">
                        <span class="w-5 h-5 rounded-full bg-green-100 text-green-600 flex items-center justify-center text-xs font-bold">&#10003;</span>
                        <span class="text-sm font-medium text-slate-800">"${audit.query}"</span>
                        <svg class="w-3.5 h-3.5 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"></path></svg>
                        <span class="text-sm font-medium text-slate-700">${canon ? canon.canonical_name : audit.query}</span>
                        ${canon ? `<span class="px-1.5 py-0.5 text-[10px] font-medium rounded bg-slate-100 text-slate-600">${canon.match_type} match</span>` : ''}
                    </div>

                    ${canon ? `<p class="text-[10px] font-mono text-slate-400 ml-7 mb-2">${canon.snomed_pattern}</p>` : ''}

                    <div class="ml-7">
                        <button onclick="this.nextElementSibling.classList.toggle('hidden'); this.querySelector('.expand-text').textContent = this.nextElementSibling.classList.contains('hidden') ? 'Show details' : 'Hide details'"
                                class="text-xs text-primary/60 hover:text-primary mb-1">
                            <span class="expand-text">Show details</span>
                        </button>
                        <div class="hidden space-y-2 mt-1">
                            ${included.length > 0 ? `
                                <div>
                                    <p class="text-[10px] font-semibold text-green-600 uppercase">Included in search (${included.length})</p>
                                    ${included.map(c => `
                                        <div class="flex items-center gap-1 py-0.5">
                                            <span class="text-green-500 text-[10px]">+</span>
                                            <span class="text-xs text-slate-600">${c.canonical_name}</span>
                                            ${c.trial_count > 0 ? `<span class="text-[10px] text-slate-400">(${c.trial_count} trials)</span>` : ''}
                                        </div>
                                    `).join('')}
                                </div>
                            ` : ''}

                            ${excluded.length > 0 ? `
                                <div>
                                    <p class="text-[10px] font-semibold text-red-500 uppercase">Excluded from search (${excluded.length})</p>
                                    ${excluded.map(c => `
                                        <div class="flex items-center gap-1 py-0.5">
                                            <span class="text-red-400 text-[10px]">-</span>
                                            <span class="text-xs text-slate-500">${c.canonical_name}</span>
                                        </div>
                                    `).join('')}
                                </div>
                            ` : ''}

                            ${rejected.length > 0 ? `
                                <div>
                                    <p class="text-[10px] font-semibold text-slate-500 uppercase">Considered but rejected</p>
                                    ${rejected.map(r => `
                                        <div class="py-0.5">
                                            <span class="text-xs text-slate-500">${r.concept}: </span>
                                            <span class="text-[10px] text-slate-400 italic">${r.reason}</span>
                                        </div>
                                    `).join('')}
                                </div>
                            ` : ''}

                            ${related.length > 0 ? `
                                <div>
                                    <p class="text-[10px] font-semibold text-amber-600 uppercase">Related concepts (may entail)</p>
                                    ${related.map(c => `
                                        <div class="flex items-center gap-1 py-0.5">
                                            <span class="text-amber-400 text-[10px]">~</span>
                                            <span class="text-xs text-slate-600">${c.canonical_name}</span>
                                            ${c.trial_count > 0 ? `<span class="text-[10px] text-slate-400">(${c.trial_count} trials)</span>` : ''}
                                        </div>
                                    `).join('')}
                                </div>
                            ` : ''}

                            ${trialTerms.length > 0 ? `
                                <div>
                                    <p class="text-[10px] font-semibold text-slate-600 uppercase">Trial eligibility terms matched</p>
                                    ${trialTerms.slice(0, 8).map(t => `<p class="text-xs text-slate-600 py-0.5">${t}</p>`).join('')}
                                    ${trialTerms.length > 8 ? `<p class="text-[10px] text-slate-400">+${trialTerms.length - 8} more...</p>` : ''}
                                </div>
                            ` : ''}
                        </div>
                    </div>
                </div>`;
        }).join('');

        const failedToggle = failedAudits.length > 0 ? `
            <div class="mt-1">
                <button onclick="this.nextElementSibling.classList.toggle('hidden'); this.querySelector('.failed-toggle-text').textContent = this.nextElementSibling.classList.contains('hidden') ? '${failedAudits.length} concept${failedAudits.length > 1 ? 's' : ''} couldn\\'t be mapped' : 'Hide unmapped concepts'"
                        class="text-xs text-slate-400 hover:text-slate-600 flex items-center gap-1">
                    <span class="w-4 h-4 rounded-full bg-slate-100 text-slate-400 flex items-center justify-center text-[10px] font-bold">?</span>
                    <span class="failed-toggle-text">${failedAudits.length} concept${failedAudits.length > 1 ? 's' : ''} couldn't be mapped</span>
                </button>
                <div class="hidden space-y-2 mt-2">
                    ${failedAudits.map(audit => `
                        <div class="p-2 bg-slate-50 border border-slate-200 rounded-lg">
                            <div class="flex items-center gap-2">
                                <span class="text-xs text-slate-500">"${audit.query}"</span>
                                <span class="text-[10px] text-slate-400 italic">${audit.failure_reason || 'No matching medical concept'}</span>
                            </div>
                            ${audit.suggestions && audit.suggestions.length > 0 ? `
                                <p class="text-[10px] text-slate-400 mt-1">Try: ${audit.suggestions.slice(0, 3).join(', ')}</p>
                            ` : ''}
                        </div>
                    `).join('')}
                </div>
            </div>
        ` : '';

        panelDiv.innerHTML = `
            <div class="w-full max-w-[98%]">
                <div class="border border-warm-border rounded-xl overflow-hidden">
                    <button onclick="this.nextElementSibling.classList.toggle('hidden'); this.querySelector('.expand-icon').classList.toggle('rotate-180')"
                            class="w-full flex items-center justify-between px-4 py-3 bg-[#f5f5f0] hover:bg-[#eeedea] transition-colors text-left">
                        <span class="text-sm font-medium text-slate-700 flex items-center gap-2">
                            <svg class="w-4 h-4 text-slate-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>
                            What We Searched For
                        </span>
                        <svg class="w-4 h-4 text-slate-400 expand-icon transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                    </button>
                    <div class="hidden px-4 py-3 bg-white space-y-3">
                        <p class="text-xs text-slate-500">Here's how we interpreted your search and what medical concepts we looked for:</p>
                        ${successItems}
                        ${failedToggle}
                    </div>
                    </div>
                </div>
            </div>`;

        messagesContainer.appendChild(panelDiv);
        scrollToBottom();
    }

    // Handle form submission
    async function handleSubmit(e) {
        e.preventDefault();

        const message = userInput.value.trim();
        if (!message || isWaitingForResponse) return;

        const existingQuickSelects = document.querySelectorAll('[id^="quick-select"]');
        existingQuickSelects.forEach(el => el.remove());

        // Handle session on reset/new search
        if (/\b(start over|restart|reset|begin again|clear)\b/i.test(message)) {
            clearSession();
        } else if (/\b(new search|different condition|another condition|search for something)\b/i.test(message)) {
            // Keep demographics, clear condition data
            const savedDemos = { ...patientProfile.demographics };
            clearSession();
            patientProfile.demographics = savedDemos;
        }

        // Track conversation message
        conversationMessages.push({ role: 'user', content: message });

        // Don't show internal /update commands as user messages
        if (!message.startsWith('/update ')) {
            addMessage('user', message);
        }
        userInput.value = '';

        showTypingIndicator();
        isWaitingForResponse = true;

        // Show progress message if search takes more than 5 seconds
        const searchTimer = setTimeout(() => {
            const indicator = document.getElementById('typing-indicator');
            if (indicator) {
                indicator.innerHTML = `
                    <div class="bg-[#f5f5f0] px-4 py-3 rounded-xl rounded-tl-sm inline-flex items-center gap-3">
                        <div class="typing-indicator-dots flex space-x-1.5 items-center">
                            <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                            <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                            <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                        </div>
                        <span class="text-xs text-slate-500">Searching across trials — this can take a moment...</span>
                    </div>
                `;
            }
        }, 5000);

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

            clearTimeout(searchTimer);

            if (!response.ok) {
                throw new Error(`Server responded with status ${response.status}`);
            }

            const data = await response.json();

            removeTypingIndicator();
            handleResponse(data);
        } catch (error) {
            clearTimeout(searchTimer);
            console.error('Error in handleSubmit:', error);
            removeTypingIndicator();

            addMessage('assistant', "I'm having trouble processing that right now. Could you try again in a moment?");
        } finally {
            isWaitingForResponse = false;
        }
    }

    // Render editable patient summary card before results
    function renderPatientSummary(summary) {
        if (!summary) return;
        const fields = [
            { key: 'condition', label: 'Condition', value: summary.condition },
            { key: 'age', label: 'Age', value: summary.age },
            { key: 'location', label: 'Location', value: summary.location },
            { key: 'gender', label: 'Gender', value: summary.gender },
        ].filter(f => f.value);

        if (fields.length === 0) return;

        const card = document.createElement('div');
        card.className = 'flex justify-start mb-2';
        card.id = 'patient-summary-card';

        const fieldsHtml = fields.map(f => `
            <div class="flex items-center justify-between py-1.5 group">
                <span class="text-xs text-slate-400">${f.label}</span>
                <div class="flex items-center gap-2">
                    <span class="text-xs text-slate-700 font-medium">${f.value}</span>
                    <button onclick="editPatientField('${f.key}', '${String(f.value).replace(/'/g, "\\'")}')"
                        class="opacity-0 group-hover:opacity-100 text-[10px] text-slate-400 hover:text-primary transition-opacity px-1.5 py-0.5 rounded hover:bg-slate-100">
                        Edit
                    </button>
                </div>
            </div>
        `).join('');

        card.innerHTML = `
            <div class="w-full max-w-[85%]">
                <div class="bg-white border border-warm-border rounded-xl px-4 py-3">
                    <p class="text-[10px] text-slate-400 uppercase tracking-wide mb-1">Your search profile</p>
                    <div class="divide-y divide-slate-100">
                        ${fieldsHtml}
                    </div>
                </div>
            </div>
        `;

        messagesContainer.appendChild(card);
    }

    // Handle field edit from summary card
    window.editPatientField = function(field, currentValue) {
        const newValue = prompt(`Update ${field}:`, currentValue);
        if (newValue && newValue.trim() !== currentValue) {
            // Remove old summary card
            const oldCard = document.getElementById('patient-summary-card');
            if (oldCard) oldCard.remove();

            // Send update command
            userInput.value = `/update ${field}=${newValue.trim()}`;
            messageForm.dispatchEvent(new Event('submit'));
        }
    };

    // Build a transparent no-results message based on server diagnostics
    function buildNoResultsMessage(info) {
        if (!info) {
            // Fallback when server doesn't provide diagnostics
            return `We couldn't find trials matching your criteria. A few things to try:\n\n` +
                `\u2022 **Use a broader condition term** \u2014 e.g., "cancer" instead of a specific subtype\n` +
                `\u2022 **Expand your travel distance** \u2014 there may be trials further away\n` +
                `\u2022 **Remove treatment type preference** \u2014 if you specified drug-only or avoided surgery, relaxing that may help\n\n` +
                `You can start a new search by telling me about a different condition.`;
        }

        const condition = info.condition || 'your condition';

        if (info.reason === 'no_coverage') {
            return `Our database doesn't currently include **${condition}** trials. ` +
                `We're expanding our coverage \u2014 in the meantime, you can search ClinicalTrials.gov directly:\n\n` +
                `[\ud83d\udd17 Search ClinicalTrials.gov for ${condition}](${info.ctgov_link})\n\n` +
                `You can also try a broader term (e.g., the general disease category) to see if related trials are available.`;
        }

        if (info.reason === 'all_inactive') {
            const statusList = info.inactive_statuses
                ? Object.entries(info.inactive_statuses)
                    .map(([s, n]) => `${n} ${s.toLowerCase().replace(/_/g, ' ')}`)
                    .join(', ')
                : '';
            return `I found **${info.total_in_db} ${condition}** trial${info.total_in_db > 1 ? 's' : ''} in our database, ` +
                `but none are currently recruiting` +
                (statusList ? ` (${statusList})` : '') + `.\n\n` +
                `Clinical trials open and close frequently. Check ClinicalTrials.gov for the latest:\n\n` +
                `[\ud83d\udd17 Search ClinicalTrials.gov for ${condition}](${info.ctgov_link})\n\n` +
                `You can also start a new search with a different condition.`;
        }

        if (info.reason === 'filtered_out') {
            return `I found **${info.total_active} ${condition}** trial${info.total_active > 1 ? 's' : ''}, ` +
                `but none matched your specific criteria. ` +
                `Most common reason: **${info.primary_reason}**.\n\n` +
                `A few things to try:\n` +
                `\u2022 **Expand your travel range** \u2014 there may be trials further away\n` +
                `\u2022 **Adjust your preferences** \u2014 relaxing treatment type or schedule constraints may help\n` +
                `\u2022 **Use a broader condition term** \u2014 e.g., "cancer" instead of a specific subtype\n\n` +
                `Or check ClinicalTrials.gov for the full list:\n\n` +
                `[\ud83d\udd17 Search ClinicalTrials.gov for ${condition}](${info.ctgov_link})`;
        }

        // Unknown reason — generic fallback
        return `We couldn't find trials matching your criteria for **${condition}**.\n\n` +
            (info.ctgov_link
                ? `You can search ClinicalTrials.gov directly:\n\n[\ud83d\udd17 Search ClinicalTrials.gov](${info.ctgov_link})\n\n`
                : '') +
            `You can also start a new search by telling me about a different condition.`;
    }

    // Handle API response data
    function handleResponse(data) {
        // Update patient profile from server data
        _updatePatientProfile(data);

        if (data.trials) {
            if (data.trials.length > 0) {
                updateProgress(4);
                renderPatientSummary(data.patient_summary);
                if (data.concept_audit && data.concept_audit.length > 0) {
                    renderConceptAuditPanel(data.concept_audit);
                }
                showTrialMatches(data.trials, data.data_last_updated, data.broad_match_banner);
                conversationMessages.push({ role: 'assistant', content: '[trial results]', trialCount: data.trials.length });
            } else {
                if (data.concept_audit && data.concept_audit.length > 0) {
                    renderConceptAuditPanel(data.concept_audit);
                }
                const noResultsHtml = buildNoResultsMessage(data.no_results_info);
                addMessage('assistant', noResultsHtml);
                conversationMessages.push({ role: 'assistant', content: noResultsHtml });
            }
        } else if (data.response) {
            const responseText = data.response;
            detectStateFromResponse(responseText);

            // If entering condition_detail state, show a brief "searching" moment
            if (data.conversation_state === 'condition_detail' && data.quick_replies) {
                // Show searching animation briefly before revealing questions
                const searchingDiv = document.createElement('div');
                searchingDiv.className = 'flex justify-start message-enter';
                searchingDiv.id = 'searching-moment';
                searchingDiv.innerHTML = `
                    <div class="max-w-[85%]">
                        <div class="bg-[#f5f5f0] text-slate-700 px-4 py-3 rounded-xl rounded-tl-sm text-sm leading-relaxed">
                            <div class="flex items-center gap-2">
                                <div class="typing-indicator-dots flex space-x-1 items-center">
                                    <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                                    <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                                    <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                                </div>
                                <span class="text-xs text-slate-500">Searching for relevant trials...</span>
                            </div>
                        </div>
                    </div>
                `;
                messagesContainer.appendChild(searchingDiv);
                scrollToBottom();
                // Replace with actual questions after a brief delay
                setTimeout(() => {
                    const el = document.getElementById('searching-moment');
                    if (el) el.remove();
                    addMessageWithServerQuickReplies('assistant', responseText, data.quick_replies);
                    scrollToBottom();
                }, 1200);
            } else if (data.quick_replies && data.quick_replies.length > 0) {
                addMessageWithServerQuickReplies('assistant', responseText, data.quick_replies);
            } else {
                addMessageWithQuickSelect('assistant', responseText);
            }
            conversationMessages.push({ role: 'assistant', content: responseText });
        } else if (data.text) {
            detectStateFromResponse(data.text);
            addMessageWithQuickSelect('assistant', data.text);
            conversationMessages.push({ role: 'assistant', content: data.text });
        } else {
            addMessage('assistant', "I didn't quite get that. Could you rephrase or try again?");
        }

        // Persist session after every response
        saveSession();
    }

    // Add a message to the chat
    // Get the correct ClinicalTrials.gov URL for a trial
    function ctGovUrl(nctId, source) {
        // API-sourced trials use the new URL format
        if (source === 'clinicaltrials.gov') {
            return `https://clinicaltrials.gov/study/${nctId}`;
        }
        return `https://clinicaltrials.gov/study/${nctId}`;
    }

    // Simple markdown renderer for chat bubbles
    function renderMarkdown(text) {
        return text
            .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
            .replace(/\*(.+?)\*/g, '<em>$1</em>')
            .replace(/\n\n/g, '</p><p class="mt-2">')
            .replace(/\n• /g, '</p><p class="mt-1">• ')
            .replace(/\n/g, '<br>');
    }

    function addMessage(role, content) {
        const messageDiv = document.createElement('div');
        messageDiv.className = `flex ${role === 'user' ? 'justify-end' : 'justify-start'} message-enter`;

        if (role === 'user') {
            messageDiv.innerHTML = `
                <div class="max-w-[80%]">
                    <div class="bg-primary text-white px-4 py-3 rounded-xl rounded-tr-sm text-sm leading-relaxed">
                        <p>${renderMarkdown(content)}</p>
                    </div>
                </div>
            `;
        } else {
            messageDiv.innerHTML = `
                <div class="max-w-[85%]">
                    <div class="bg-[#f5f5f0] text-slate-700 px-4 py-3 rounded-xl rounded-tl-sm text-sm leading-relaxed">
                        <p>${renderMarkdown(content)}</p>
                    </div>
                </div>
            `;
        }

        messagesContainer.appendChild(messageDiv);
        scrollToBottom();
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
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Male">Male</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Female">Female</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Other">Other</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Prefer not to say">Prefer not to say</button>
                </div>
            `;
        } else if (lowerContent.includes('location') || lowerContent.includes('where are you') || lowerContent.includes('zip')) {
            quickSelectHtml = `
                <div id="quick-select-location" class="mt-3 flex flex-wrap gap-2">
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="San Francisco, CA">San Francisco, CA</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="New York, NY">New York, NY</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Los Angeles, CA">Los Angeles, CA</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Chicago, IL">Chicago, IL</button>
                </div>
            `;
        } else if (lowerContent.includes('condition') || lowerContent.includes('symptom') || lowerContent.includes('health')) {
            quickSelectHtml = `
                <div id="quick-select-condition" class="mt-3 flex flex-wrap gap-2">
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Cancer">Cancer</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Diabetes">Diabetes</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Heart Disease">Heart Disease</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Arthritis">Arthritis</button>
                </div>
            `;
        } else if (lowerContent.includes('search') || lowerContent.includes('proceed') || lowerContent.includes('confirm')) {
            quickSelectHtml = `
                <div id="quick-select-confirm" class="mt-3 flex flex-wrap gap-2">
                    <button class="quick-btn px-4 py-2 bg-green-50 border border-green-200 rounded-full text-sm text-green-700 hover:bg-green-100 hover:border-green-300 transition-all" data-value="Yes, search for trials">Yes, search for trials</button>
                    <button class="quick-btn px-4 py-2 bg-white border border-slate-200 rounded-full text-sm text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="Let me add more details">Add more details</button>
                </div>
            `;
        }

        messageDiv.innerHTML = `
            <div class="max-w-[85%]">
                <div class="bg-[#f5f5f0] text-slate-700 px-4 py-3 rounded-xl rounded-tl-sm text-sm leading-relaxed">
                    <p>${renderMarkdown(content)}</p>
                </div>
                ${quickSelectHtml}
            </div>
        `;

        messagesContainer.appendChild(messageDiv);
        scrollToBottom();
        initQuickButtons();
    }

    // Add message with server-driven quick-reply buttons
    function addMessageWithServerQuickReplies(role, content, quickReplies) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'flex justify-start message-enter';

        // Build quick-reply buttons from server data
        let buttonsHtml = '';
        if (quickReplies && quickReplies.length > 0) {
            const buttons = [];
            for (const qr of quickReplies) {
                if (qr.type === 'skip') {
                    // Skip button — styled differently
                    for (const opt of (qr.options || [])) {
                        buttons.push(
                            `<button class="quick-btn px-3 py-2 bg-white border border-slate-200 rounded-full text-xs text-slate-500 hover:bg-slate-50 hover:border-slate-300 transition-all" data-value="${opt}">${opt}</button>`
                        );
                    }
                } else if (qr.type === 'yes_no') {
                    // Yes/No buttons with question number context
                    const prefix = qr.question_num ? `${qr.question_num}. ` : '';
                    for (const opt of (qr.options || [])) {
                        const val = prefix + opt;
                        const style = opt === 'Yes'
                            ? 'bg-green-50 border-green-200 text-green-700 hover:bg-green-100 hover:border-green-300'
                            : opt === 'No'
                            ? 'bg-red-50 border-red-200 text-red-700 hover:bg-red-100 hover:border-red-300'
                            : 'bg-white border-slate-200 text-slate-500 hover:bg-slate-50 hover:border-slate-300';
                        buttons.push(
                            `<button class="quick-btn px-3 py-2 border rounded-full text-xs ${style} transition-all" data-value="${val}">${prefix}${opt}</button>`
                        );
                    }
                } else if (qr.type === 'choice') {
                    // Choice buttons (stage, treatment type, preferences)
                    const prefix = qr.question_num ? `${qr.question_num}. ` : '';
                    for (const opt of (qr.options || [])) {
                        const val = prefix + opt;
                        buttons.push(
                            `<button class="quick-btn px-3 py-2 bg-white border border-slate-200 rounded-full text-xs text-slate-600 hover:bg-accent/5 hover:border-accent/30 hover:text-accent transition-all" data-value="${val}">${opt}</button>`
                        );
                    }
                }
            }
            if (buttons.length > 0) {
                buttonsHtml = `<div id="quick-select-server" class="mt-3 flex flex-wrap gap-2">${buttons.join('')}</div>`;
            }
        }

        messageDiv.innerHTML = `
            <div class="max-w-[85%]">
                <div class="bg-[#f5f5f0] text-slate-700 px-4 py-3 rounded-xl rounded-tl-sm text-sm leading-relaxed">
                    <p>${renderMarkdown(content)}</p>
                </div>
                ${buttonsHtml}
            </div>
        `;

        messagesContainer.appendChild(messageDiv);
        scrollToBottom();
        initQuickButtons();
    }

    // Show typing indicator
    function showTypingIndicator() {
        const typingDiv = document.createElement('div');
        typingDiv.className = 'flex justify-start';
        typingDiv.id = 'typing-indicator';
        typingDiv.innerHTML = `
            <div class="bg-[#f5f5f0] px-4 py-3 rounded-xl rounded-tl-sm inline-flex">
                <div class="typing-indicator-dots flex space-x-1.5 items-center">
                    <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                    <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                    <div class="typing-dot w-1.5 h-1.5 bg-slate-400 rounded-full"></div>
                </div>
            </div>
        `;
        messagesContainer.appendChild(typingDiv);
        scrollToBottom();
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

        // --- Eligibility summary sentence ---
        const totalChecked = eligibility.hardCriteriaTotal + eligibility.softCriteriaTotal;
        const totalMet = eligibility.hardCriteriaMet + eligibility.softCriteriaMet;
        const totalUnknown = totalChecked - totalMet;

        let eligSummaryText, eligSummaryClass, eligSummaryIcon;
        if (eligibility.hardStatus === 'met') {
            eligSummaryText = 'Strong eligibility match';
            eligSummaryClass = 'text-green-700 bg-green-50 border-green-200';
            eligSummaryIcon = `<svg class="w-4 h-4 text-green-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>`;
        } else if (eligibility.hardStatus === 'violated') {
            eligSummaryText = 'May not qualify — key criteria not met';
            eligSummaryClass = 'text-red-700 bg-red-50 border-red-200';
            eligSummaryIcon = `<svg class="w-4 h-4 text-red-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>`;
        } else {
            eligSummaryText = 'Partial match — some criteria need review';
            eligSummaryClass = 'text-amber-700 bg-amber-50 border-amber-200';
            eligSummaryIcon = `<svg class="w-4 h-4 text-amber-500 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>`;
        }

        let criteriaDetail = '';
        if (totalChecked > 0) {
            if (totalUnknown === 0) {
                criteriaDetail = `You meet ${totalMet} of ${totalChecked} checked criteria.`;
            } else if (totalUnknown > totalMet) {
                // Most criteria are unknown — frame as study-team verification
                criteriaDetail = `${totalMet} of ${totalChecked} criteria confirmed. The remaining ${totalUnknown} would need to be verified by the study team.`;
            } else {
                criteriaDetail = `You meet ${totalMet} of ${totalChecked} checked criteria. ${totalUnknown} still need to be verified.`;
            }
        }

        // --- Match score color ---
        const scoreColor = eligibility.matchScore >= 70
            ? 'from-green-500 to-green-600'
            : eligibility.matchScore >= 40
                ? 'from-primary to-primary-dark'
                : 'from-slate-400 to-slate-500';

        // --- Key facts ---
        let locationLine = '';
        if (trial.distance && trial.distance < 9000) {
            const dist = Math.round(trial.distance);
            const distColor = dist <= 50
                ? 'bg-green-100 text-green-700'
                : dist <= 200
                    ? 'bg-amber-100 text-amber-700'
                    : 'bg-red-100 text-red-700';
            locationLine = `<span class="inline-flex items-center gap-1 text-slate-600">${dist} mi <span class="px-1.5 py-0.5 text-[10px] font-medium rounded-full ${distColor}">${dist <= 50 ? 'Nearby' : dist <= 200 ? 'Regional' : 'Distant'}</span></span>`;
        }
        const phaseLine = trial.phase || '';
        const enrollmentLine = trial.enrollment ? `${trial.enrollment} enrolled` : '';
        const phaseEnrollment = [phaseLine, enrollmentLine].filter(Boolean).join(' · ');
        const drugsLine = trial.drugs || '';

        return `
            <div class="trial-card bg-white rounded-xl border border-warm-border overflow-hidden hover:shadow-lg transition-all duration-200" data-nct="${trial.nct_id}" data-status="${eligibility.hardStatus}">
                <div class="p-5">
                    <!-- TOP: Title + Match Score + Status -->
                    <div class="flex items-start justify-between gap-4 mb-3">
                        <div class="flex-1 min-w-0">
                            <h3 class="font-semibold text-slate-800 text-base leading-snug line-clamp-2">
                                ${trial.title || 'Clinical Trial'}
                            </h3>
                            <div class="flex flex-wrap items-center gap-2 mt-2">
                                ${getStatusChip(eligibility.hardStatus)}
                                ${trial.status ? `<span class="px-2.5 py-1 bg-slate-100 ${getStatusColor(trial.status)} rounded-full text-xs font-medium">${trial.status}</span>` : ''}
                                ${trial.match_type ? `<span class="px-2 py-0.5 rounded-full text-[10px] font-medium ${trial.match_type === 'specific' ? 'bg-blue-50 text-blue-600 border border-blue-200' : 'bg-orange-50 text-orange-600 border border-orange-200'}" title="How this trial was matched to your search">Matched on: ${trial.match_label || trial.match_type}${trial.match_type === 'broad' ? ' (broad match)' : ''}</span>` : ''}
                            </div>
                        </div>
                        <div class="flex-shrink-0 text-center">
                            <div class="w-14 h-14 rounded-2xl bg-gradient-to-br ${scoreColor} flex items-center justify-center shadow-sm">
                                <span class="text-white font-bold text-lg">${eligibility.matchScore}%</span>
                            </div>
                            <p class="text-[10px] text-slate-400 mt-1 font-medium">match</p>
                        </div>
                    </div>

                    <!-- MIDDLE: Key Facts -->
                    <div class="text-sm space-y-1 mb-4 py-3 border-y border-slate-100">
                        ${locationLine ? `<div class="flex items-center gap-2"><svg class="w-3.5 h-3.5 text-slate-400 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>${locationLine}</div>` : ''}
                        ${phaseEnrollment ? `<div class="flex items-center gap-2"><svg class="w-3.5 h-3.5 text-slate-400 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"></path></svg><span class="text-slate-600">${phaseEnrollment}</span></div>` : ''}
                        ${drugsLine ? `<div class="flex items-center gap-2"><svg class="w-3.5 h-3.5 text-slate-400 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"></path></svg><span class="text-slate-600 text-xs line-clamp-1">${drugsLine}</span></div>` : ''}
                    </div>

                    <!-- BOTTOM: Eligibility Summary -->
                    <div class="flex items-start gap-2 px-3 py-2.5 rounded-lg border ${eligSummaryClass}">
                        ${eligSummaryIcon}
                        <div>
                            <p class="text-sm font-medium">${eligSummaryText}</p>
                            ${criteriaDetail ? `<p class="text-xs opacity-75 mt-0.5">${criteriaDetail}</p>` : ''}
                        </div>
                    </div>
                </div>

                <!-- CTA -->
                <div class="px-5 py-3 bg-slate-50 border-t border-slate-100">
                    <button onclick="viewTrialDetails('${trial.nct_id}')" class="w-full px-4 py-2.5 bg-primary text-white text-sm font-medium rounded-lg hover:bg-primary-dark transition-colors">
                        View Details
                    </button>
                </div>
            </div>
        `;
    }

    // Show trial matches grouped by eligibility status
    function showTrialMatches(trials, dataLastUpdated, broadMatchBanner) {
        const container = document.createElement('div');
        container.className = 'flex justify-start w-full';

        // Generate eligibility data and store globally
        allTrials = trials.map(trial => ({
            trial,
            eligibility: generateEligibilityData(trial)
        }));

        // Group by status, sorted by match score within each group
        const eligible = allTrials.filter(t => t.eligibility.hardStatus === 'met')
            .sort((a, b) => b.eligibility.matchScore - a.eligibility.matchScore);
        const review = allTrials.filter(t => t.eligibility.hardStatus === 'review')
            .sort((a, b) => b.eligibility.matchScore - a.eligibility.matchScore);
        const ineligible = allTrials.filter(t => t.eligibility.hardStatus === 'violated')
            .sort((a, b) => b.eligibility.matchScore - a.eligibility.matchScore);

        // Build section HTML
        function buildSection(items, title, colorClass, iconSvg) {
            if (items.length === 0) return '';
            const cards = items.map((item, i) =>
                createTrialCard(item.trial, item.eligibility, i)
            ).join('');
            return `
                <div class="mb-6">
                    <div class="flex items-center gap-2 mb-3">
                        ${iconSvg}
                        <h4 class="text-sm font-semibold ${colorClass}">${title} (${items.length})</h4>
                    </div>
                    <div class="grid grid-cols-1 gap-4">
                        ${cards}
                    </div>
                </div>`;
        }

        const eligibleSection = buildSection(eligible, 'Strong matches',
            'text-green-700',
            '<svg class="w-4 h-4 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>'
        );
        const reviewSection = buildSection(review, 'Needs review',
            'text-amber-700',
            '<svg class="w-4 h-4 text-amber-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>'
        );
        const ineligibleSection = buildSection(ineligible, 'May not qualify',
            'text-red-700',
            '<svg class="w-4 h-4 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>'
        );

        // Sort dropdown only for 10+ results
        const sortControl = allTrials.length >= 10 ? `
            <div class="flex items-center justify-end gap-2 mb-4">
                <span class="text-xs text-slate-500">Sort by:</span>
                <select onchange="sortTrials(this.value)" class="text-xs border border-slate-200 rounded-lg px-2 py-1 bg-white focus:outline-none focus:ring-2 focus:ring-primary/30">
                    <option value="match" ${currentSortBy === 'match' ? 'selected' : ''}>Match Score</option>
                    <option value="phase" ${currentSortBy === 'phase' ? 'selected' : ''}>Phase</option>
                </select>
            </div>` : '';

        // Broad match banner — shown when no specific-condition trials exist
        let broadBannerHtml = '';
        if (broadMatchBanner) {
            broadBannerHtml = `
                <div class="flex items-start gap-3 px-4 py-3 mb-4 rounded-lg border border-amber-200 bg-amber-50 text-sm">
                    <svg class="w-5 h-5 text-amber-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <div>
                        <p class="font-medium text-amber-800">No trials specifically for ${broadMatchBanner.specific_condition} found.</p>
                        <p class="text-amber-700 mt-0.5">Showing broader <strong>${broadMatchBanner.broad_term}</strong> trials \u2014 these may not target your specific condition. Check the "Matched on" tag on each trial for details.</p>
                    </div>
                </div>`;
        }

        container.innerHTML = `
            <div class="w-full max-w-[98%]">
                <div class="bg-[#f5f5f0] text-slate-700 px-4 py-3 rounded-xl rounded-tl-sm text-sm mb-5">
                    <p>I found <strong>${trials.length} clinical trial${trials.length > 1 ? 's' : ''}</strong> that may be relevant.</p>
                    ${trials.length === 1 ? '<p class="text-xs text-slate-500 mt-1">Only 1 trial matched. You could try broadening your search by expanding your travel range or using a broader condition term.</p>' : ''}
                    ${dataLastUpdated ? `<p class="text-[10px] text-slate-400 mt-1">Trial data last updated: ${new Date(dataLastUpdated).toLocaleDateString('en-US', { month: 'long', day: 'numeric', year: 'numeric' })}</p>` : ''}
                </div>

                ${broadBannerHtml}
                ${sortControl}

                <div id="trials-grid">
                    ${eligibleSection}
                    ${reviewSection}
                    ${ineligibleSection}
                </div>
            </div>
        `;

        messagesContainer.appendChild(container);
        scrollToBottom();
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
    // Sort trials and re-render grouped sections (only shown for 10+ results)
    window.sortTrials = function(sortBy) {
        currentSortBy = sortBy;
        const grid = document.getElementById('trials-grid');
        if (!grid || !allTrials.length) return;

        const sorter = (a, b) => {
            if (sortBy === 'phase') {
                const phaseA = a.trial.phase || '';
                const phaseB = b.trial.phase || '';
                return phaseB.localeCompare(phaseA);
            }
            return b.eligibility.matchScore - a.eligibility.matchScore;
        };

        const eligible = allTrials.filter(t => t.eligibility.hardStatus === 'met').sort(sorter);
        const review = allTrials.filter(t => t.eligibility.hardStatus === 'review').sort(sorter);
        const ineligible = allTrials.filter(t => t.eligibility.hardStatus === 'violated').sort(sorter);

        function renderSection(items, title, colorClass, iconSvg) {
            if (items.length === 0) return '';
            const cards = items.map((item, i) => createTrialCard(item.trial, item.eligibility, i)).join('');
            return `
                <div class="mb-6">
                    <div class="flex items-center gap-2 mb-3">
                        ${iconSvg}
                        <h4 class="text-sm font-semibold ${colorClass}">${title} (${items.length})</h4>
                    </div>
                    <div class="grid grid-cols-1 gap-4">${cards}</div>
                </div>`;
        }

        grid.innerHTML =
            renderSection(eligible, 'Strong matches', 'text-green-700',
                '<svg class="w-4 h-4 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>') +
            renderSection(review, 'Needs review', 'text-amber-700',
                '<svg class="w-4 h-4 text-amber-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>') +
            renderSection(ineligible, 'May not qualify', 'text-red-700',
                '<svg class="w-4 h-4 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>');
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
                        <a href="https://clinicaltrials.gov/study/${nctId}" target="_blank" class="p-1.5 text-slate-600 hover:bg-slate-50 rounded transition-colors" title="View on ClinicalTrials.gov">
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
            exportText += `Link: https://clinicaltrials.gov/study/${nctId}\n`;
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

    // Build the full eligibility visualization for the trial detail modal
    function buildModalVizCriteria(viz) {
        const hardCriteria = (viz.criteria || []).filter(c => c.is_hard);
        const softCriteria = (viz.criteria || []).filter(c => !c.is_hard);

        function statusConfig(status) {
            return {
                eligible: { border: 'border-green-400', bg: 'bg-green-50', icon: '&#10003;', iconColor: 'text-green-600', iconBg: 'bg-green-100', label: 'Eligible' },
                ineligible: { border: 'border-red-400', bg: 'bg-red-50', icon: '&#10007;', iconColor: 'text-red-600', iconBg: 'bg-red-100', label: 'Ineligible' },
                unknown: { border: 'border-amber-400', bg: 'bg-amber-50', icon: '?', iconColor: 'text-amber-600', iconBg: 'bg-amber-100', label: 'Unknown' },
            }[status] || { border: 'border-slate-300', bg: 'bg-slate-50', icon: '-', iconColor: 'text-slate-500', iconBg: 'bg-slate-100', label: status };
        }

        function renderModalCriterion(c) {
            const cfg = statusConfig(c.status);
            const patientFactHtml = c.patient_value
                ? `<p class="text-xs text-slate-500 ml-7 mt-0.5">Your value: <span class="font-medium">${c.patient_value}</span></p>`
                : `<p class="text-xs text-slate-400 ml-7 mt-0.5 italic">No data available</p>`;
            const formalHtml = c.formal_constraint
                ? `<p class="text-[10px] font-mono text-slate-400 ml-7 mt-1">${c.formal_constraint}</p>`
                : '';

            return `
                <div class="rounded-lg border-l-4 ${cfg.border} ${cfg.bg} overflow-hidden">
                    <div class="p-4">
                        <div class="flex items-start justify-between">
                            <div class="flex-1">
                                <div class="flex items-center gap-2 mb-1">
                                    <span class="w-5 h-5 rounded-full ${cfg.iconBg} ${cfg.iconColor} flex items-center justify-center text-sm font-bold">${cfg.icon}</span>
                                    <span class="font-medium text-slate-800">${c.human_label}</span>
                                    <span class="px-1.5 py-0.5 text-[10px] font-medium rounded ${cfg.iconBg} ${cfg.iconColor}">${cfg.label}</span>
                                </div>
                                ${patientFactHtml}
                            </div>
                            <button onclick="this.closest('.rounded-lg').querySelector('.criterion-detail').classList.toggle('hidden')" class="text-xs text-primary/60 hover:text-primary whitespace-nowrap ml-2">
                                Details
                            </button>
                        </div>
                        <div class="criterion-detail hidden mt-3 ml-7 p-3 bg-white/50 rounded-lg border border-slate-200">
                            <p class="text-sm text-slate-600">${c.explanation || 'No additional details.'}</p>
                            ${formalHtml}
                            ${c.description ? `<p class="text-xs text-slate-400 mt-1">Source: ${c.description}</p>` : ''}
                        </div>
                    </div>
                </div>`;
        }

        // Ineligibility explanation section
        let ineligSection = '';
        if (viz.ineligibility_explanation) {
            const lines = viz.ineligibility_explanation.split('\n').map(l => l.trim()).filter(Boolean);
            const formalCore = (viz.unsat_core?.formal || []);
            ineligSection = `
                <div class="mb-6 p-4 bg-red-50 border border-red-200 rounded-xl">
                    <div class="flex items-center gap-2 mb-2">
                        <svg class="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                        <span class="font-medium text-red-700">Why You May Not Qualify</span>
                    </div>
                    <div class="space-y-1 mb-3">
                        ${lines.map(l => `<p class="text-sm text-red-600">${l}</p>`).join('')}
                    </div>
                    ${formalCore.length > 0 ? `
                        <button onclick="this.nextElementSibling.classList.toggle('hidden')" class="text-xs text-red-500 hover:text-red-700">Show formal constraints</button>
                        <div class="hidden mt-2 p-2 bg-red-100/50 rounded-lg">
                            <p class="text-[10px] font-semibold text-red-500 uppercase mb-1">Formal Constraint Representation (UNSAT Core)</p>
                            ${formalCore.map(f => `<p class="text-xs font-mono text-red-600">${f}</p>`).join('')}
                        </div>
                    ` : ''}
                </div>`;
        }

        // Clarifying questions section
        let questionsSection = '';
        if (viz.clarifying_questions && viz.clarifying_questions.length > 0) {
            questionsSection = `
                <div class="mb-6 p-4 bg-accent/5 border border-accent/20 rounded-xl">
                    <div class="flex items-center gap-2 mb-3">
                        <svg class="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <span class="font-medium text-slate-700">Help Us Determine Your Eligibility</span>
                        <span class="text-xs text-slate-500">(${viz.clarifying_questions.length} questions)</span>
                    </div>
                    <p class="text-sm text-slate-600 mb-3">We don't have enough information to check some criteria. Answering these questions could change your eligibility status:</p>
                    <div class="space-y-3">
                        ${viz.clarifying_questions.map((q, i) => `
                            <div class="p-3 bg-white rounded-lg border border-warm-border">
                                <div class="flex items-start gap-2">
                                    <span class="flex-shrink-0 w-5 h-5 rounded-full bg-slate-100 text-slate-600 flex items-center justify-center text-xs font-bold">${i + 1}</span>
                                    <div>
                                        <p class="text-sm text-slate-700 font-medium mb-0.5">${q.human_label}</p>
                                        <p class="text-sm text-slate-600">${q.question}</p>
                                        ${q.formal_constraint ? `<p class="text-[10px] font-mono text-slate-400 mt-1">Constraint: ${q.formal_constraint}</p>` : ''}
                                        ${q.is_hard ? '<span class="inline-block mt-1 px-1.5 py-0.5 text-[10px] font-medium rounded bg-red-100 text-red-600">Required criterion</span>' : '<span class="inline-block mt-1 px-1.5 py-0.5 text-[10px] font-medium rounded bg-slate-100 text-slate-600">Preference criterion</span>'}
                                    </div>
                                </div>
                            </div>
                        `).join('')}
                    </div>
                </div>`;
        }

        // Summary counts
        const eligible = viz.eligible_count || 0;
        const ineligible = viz.ineligible_count || 0;
        const unknown = viz.unknown_count || 0;

        return `
            <div class="mt-6">
                <h4 class="font-semibold text-lg mb-4 text-slate-800 flex items-center gap-2">
                    Eligibility Assessment
                    <span class="text-xs font-normal text-slate-500 bg-slate-100 px-2 py-1 rounded">Personalized for you</span>
                </h4>

                <!-- Status summary bar -->
                <div class="flex items-center gap-3 mb-4 p-3 bg-slate-50 rounded-lg border border-slate-200">
                    <div class="flex items-center gap-1.5">
                        <span class="w-3 h-3 rounded-full bg-green-500"></span>
                        <span class="text-sm text-slate-600"><span class="font-semibold text-green-700">${eligible}</span> eligible</span>
                    </div>
                    <div class="flex items-center gap-1.5">
                        <span class="w-3 h-3 rounded-full bg-red-500"></span>
                        <span class="text-sm text-slate-600"><span class="font-semibold text-red-700">${ineligible}</span> ineligible</span>
                    </div>
                    <div class="flex items-center gap-1.5">
                        <span class="w-3 h-3 rounded-full bg-amber-500"></span>
                        <span class="text-sm text-slate-600"><span class="font-semibold text-amber-700">${unknown}</span> unknown</span>
                    </div>
                    <div class="ml-auto text-xs text-slate-500">${eligible + ineligible + unknown} total criteria</div>
                </div>

                ${ineligSection}
                ${questionsSection}

                ${hardCriteria.length > 0 ? `
                    <div class="mb-6">
                        <div class="flex items-center gap-2 mb-3">
                            <svg class="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
                            <span class="font-medium text-slate-700">Required Criteria</span>
                            <span class="text-xs text-slate-500">(Must meet all)</span>
                        </div>
                        <div class="space-y-3">
                            ${hardCriteria.map(renderModalCriterion).join('')}
                        </div>
                    </div>
                ` : ''}

                ${softCriteria.length > 0 ? `
                    <div>
                        <div class="flex items-center gap-2 mb-3">
                            <svg class="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"></path></svg>
                            <span class="font-medium text-slate-700">Preference Criteria</span>
                            <span class="text-xs text-slate-500">(Flexible)</span>
                        </div>
                        <div class="space-y-3">
                            ${softCriteria.map(renderModalCriterion).join('')}
                        </div>
                    </div>
                ` : ''}
            </div>`;
    }

    // View trial details with expanded criteria
    window.viewTrialDetails = async function(nctId) {
        try {
            const response = await fetch(`/api/trials/${nctId}`);
            const data = await response.json();

            if (data.success && data.trial) {
                const trial = data.trial;
                const modalContent = document.getElementById('trial-details');
                const eligibility = generateEligibilityData(trial);

                // Find the visualization breakdown and source from the allTrials data
                const trialData = allTrials.find(t => t.trial.nct_id === nctId);
                const vizBreakdown = trialData?.trial?.eligibility_breakdown;
                const trialSource = trialData?.trial?.source || trial.source || 'sigir';
                const trialUrl = ctGovUrl(nctId, trialSource);

                // --- 1. ELIGIBILITY CHECKLIST ---
                let criteriaHtml = '';
                if (vizBreakdown && vizBreakdown.criteria && vizBreakdown.criteria.length > 0) {
                    criteriaHtml = buildModalVizCriteria(vizBreakdown);
                } else if (trial.criteria && trial.criteria.length > 0) {
                    const hardCriteria = trial.criteria.filter(c => c.hard_constraint !== false);
                    const softCriteria = trial.criteria.filter(c => c.hard_constraint === false);
                    criteriaHtml = `
                        ${hardCriteria.length > 0 ? `
                            <div class="mb-4">
                                <p class="text-sm font-medium text-slate-600 mb-2">Required Criteria (${hardCriteria.length})</p>
                                <div class="space-y-2">
                                    ${hardCriteria.map(c => `
                                        <div class="rounded-lg border-l-4 border-slate-300 bg-slate-50 p-3">
                                            <span class="font-medium text-sm text-slate-700">${c.criterion_type}</span>
                                            <span class="text-sm text-slate-500 ml-2">${c.criterion_value}</span>
                                        </div>
                                    `).join('')}
                                </div>
                            </div>
                        ` : ''}
                        ${softCriteria.length > 0 ? `
                            <div>
                                <p class="text-sm font-medium text-slate-600 mb-2">Preference Criteria (${softCriteria.length})</p>
                                <div class="space-y-2">
                                    ${softCriteria.map(c => `
                                        <div class="rounded-lg border-l-4 border-slate-300 bg-slate-50 p-3">
                                            <span class="font-medium text-sm text-slate-700">${c.criterion_type}</span>
                                            <span class="text-sm text-slate-500 ml-2">${c.criterion_value}</span>
                                        </div>
                                    `).join('')}
                                </div>
                            </div>
                        ` : ''}
                    `;
                }

                // Check for unknown criteria to show progressive check inline
                const unknownCount = vizBreakdown?.counts?.unknown_count ?? 0;
                const progressiveCheckHtml = unknownCount > 0 ? `
                    <div class="mt-3 p-3 bg-indigo-50 border border-indigo-200 rounded-lg">
                        <div class="flex items-start gap-3">
                            <svg class="w-5 h-5 text-indigo-500 flex-shrink-0 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                            <div class="flex-1">
                                <p class="text-sm font-medium text-indigo-800">${unknownCount} criteria couldn't be checked with your current info</p>
                                <p class="text-xs text-indigo-600 mt-0.5">Answer a few quick questions to get a more accurate assessment.</p>
                                <button onclick="startProgressiveCheck('${trial.nct_id}')"
                                    class="mt-2 px-4 py-2 bg-indigo-600 text-white text-sm font-medium rounded-lg hover:bg-indigo-700 transition-colors inline-flex items-center gap-1.5">
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path></svg>
                                    Check My Eligibility Step-by-Step
                                </button>
                            </div>
                        </div>
                    </div>
                    <div id="progressive-check-container"></div>
                ` : '<div id="progressive-check-container"></div>';

                // --- Match score color ---
                const scoreColor = eligibility.matchScore >= 70
                    ? 'from-green-500 to-green-600'
                    : eligibility.matchScore >= 40
                        ? 'from-primary to-primary-dark'
                        : 'from-slate-400 to-slate-500';

                document.getElementById('trial-title').textContent = trial.title || 'Clinical Trial Details';
                modalContent.innerHTML = `
                    <div class="space-y-6">

                        <!-- 1. ELIGIBILITY — "Am I a fit?" -->
                        <div>
                            <div class="flex items-center justify-between mb-3">
                                <h4 class="font-semibold text-lg text-slate-800 flex items-center gap-2">
                                    <svg class="w-5 h-5 text-accent" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                    Am I Eligible?
                                </h4>
                                <div class="flex items-center gap-2">
                                    <div class="w-10 h-10 rounded-xl bg-gradient-to-br ${scoreColor} flex items-center justify-center">
                                        <span class="text-white font-bold text-sm">${eligibility.matchScore}%</span>
                                    </div>
                                </div>
                            </div>
                            <div class="flex items-center gap-3 mb-3">
                                ${getStatusChip(eligibility.hardStatus)}
                                <span class="text-sm text-slate-500">${eligibility.hardCriteriaMet + eligibility.softCriteriaMet} of ${eligibility.hardCriteriaTotal + eligibility.softCriteriaTotal} criteria met</span>
                            </div>
                            ${criteriaHtml}
                            ${progressiveCheckHtml}
                        </div>

                        <hr class="border-slate-200">

                        <!-- 2. PRACTICAL DETAILS — scannable grid -->
                        <div>
                            <h4 class="font-semibold text-slate-800 mb-3 flex items-center gap-2">
                                <svg class="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
                                Practical Details
                            </h4>
                            <div class="grid grid-cols-2 gap-3">
                                ${trial.distance && trial.distance < 9000 ? `
                                    <div class="bg-slate-50 p-3 rounded-lg">
                                        <p class="text-xs text-slate-500 mb-1">Nearest Site</p>
                                        <p class="font-semibold text-slate-800">${Math.round(trial.distance)} miles</p>
                                    </div>
                                ` : ''}
                                ${trial.phase ? `
                                    <div class="bg-slate-50 p-3 rounded-lg">
                                        <p class="text-xs text-slate-500 mb-1">Phase</p>
                                        <p class="font-semibold text-slate-800">${trial.phase}</p>
                                    </div>
                                ` : ''}
                                ${trial.enrollment ? `
                                    <div class="bg-slate-50 p-3 rounded-lg">
                                        <p class="text-xs text-slate-500 mb-1">Enrollment</p>
                                        <p class="font-semibold text-slate-800">${trial.enrollment} participants</p>
                                    </div>
                                ` : ''}
                                <div class="bg-slate-50 p-3 rounded-lg">
                                    <p class="text-xs text-slate-500 mb-1">Status</p>
                                    <p class="font-semibold ${getStatusColor(trial.status)}">${trial.status || 'Unknown'}</p>
                                </div>
                                ${trial.drugs ? `
                                    <div class="bg-slate-50 p-3 rounded-lg col-span-2">
                                        <p class="text-xs text-slate-500 mb-1">Treatment</p>
                                        <p class="font-semibold text-slate-800">${trial.drugs}</p>
                                    </div>
                                ` : ''}
                            </div>
                        </div>

                        <hr class="border-slate-200">

                        <!-- 3. WHAT TO EXPECT -->
                        ${trial.plain_summary ? `
                            <div>
                                <h4 class="font-semibold text-slate-800 mb-2 flex items-center gap-2">
                                    <svg class="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                    What to Expect
                                </h4>
                                <p class="text-slate-600 bg-accent/5 border border-warm-border rounded-lg p-4 text-sm leading-relaxed">${trial.plain_summary}</p>
                            </div>
                            <hr class="border-slate-200">
                        ` : ''}

                        <!-- 4. ABOUT THIS STUDY -->
                        <div>
                            <h4 class="font-semibold text-slate-800 mb-2 flex items-center gap-2">
                                <svg class="w-5 h-5 text-slate-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"></path></svg>
                                About This Study
                            </h4>
                            <p class="text-sm text-slate-600 leading-relaxed">${trial.brief_summary || 'No description available.'}</p>
                        </div>

                        <hr class="border-slate-200">

                        <!-- 5. HOW TO JOIN -->
                        <div>
                            <h4 class="font-semibold text-slate-800 mb-3 flex items-center gap-2">
                                <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path></svg>
                                How to Join
                            </h4>
                            <a href="${trialUrl}" target="_blank"
                                class="w-full px-4 py-3 bg-green-600 text-white font-medium rounded-xl hover:bg-green-700 transition-colors flex items-center justify-center gap-2">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path></svg>
                                View on ClinicalTrials.gov to Request Screening
                            </a>
                            <p class="text-xs text-slate-500 text-center mt-2">Contact the study team through ClinicalTrials.gov for enrollment details.</p>
                        </div>

                        <hr class="border-slate-200">

                        <!-- 6. ACTIONS & RAW DATA — for power users -->
                        <div>
                            <button onclick="this.nextElementSibling.classList.toggle('hidden'); this.querySelector('.expand-text').textContent = this.nextElementSibling.classList.contains('hidden') ? 'Show clinical details & actions' : 'Hide clinical details & actions'"
                                class="text-sm text-slate-500 hover:text-slate-700 flex items-center gap-1.5">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
                                <span class="expand-text">Show clinical details & actions</span>
                            </button>
                            <div class="hidden mt-3 space-y-4">
                                <div class="text-sm text-slate-500">
                                    <p class="font-mono text-xs">${trial.nct_id}</p>
                                </div>
                                <div class="flex flex-col sm:flex-row gap-3">
                                    <button onclick="toggleSaveTrial('${trial.nct_id}')" class="flex-1 text-center bg-amber-100 text-amber-700 border border-amber-200 px-4 py-3 rounded-xl hover:bg-amber-200 transition-colors flex items-center justify-center gap-2" id="modal-save-btn-${trial.nct_id}">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5a2 2 0 012-2h10a2 2 0 012 2v16l-7-3.5L5 21V5z"></path></svg>
                                        Save to Shortlist
                                    </button>
                                    <button onclick="shareWithDoctor('${trial.nct_id}')" class="flex-1 text-center bg-white text-slate-700 border border-slate-200 px-4 py-3 rounded-xl hover:bg-slate-100 transition-colors flex items-center justify-center gap-2">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z"></path></svg>
                                        Share with Doctor
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                trialModal.classList.remove('hidden');
                trialModal.classList.add('flex');
            } else {
                addMessage('assistant', "I couldn't load the details for that trial. Please try again.");
            }
        } catch (error) {
            console.error('Error loading trial details:', error);
            addMessage('assistant', "I couldn't load the details for that trial. Please try again.");
        }
    };

    // ============ Progressive Eligibility Check ============

    // Start progressive eligibility check for a trial
    window.startProgressiveCheck = async function(nctId) {
        const container = document.getElementById('progressive-check-container');
        if (!container) return;

        container.innerHTML = `
            <div class="p-4 bg-accent/5 border border-accent/20 rounded-xl">
                <div class="flex items-center gap-2">
                    <div class="typing-indicator-dots flex space-x-1">
                        <div class="typing-dot w-2 h-2 bg-slate-400 rounded-full"></div>
                        <div class="typing-dot w-2 h-2 bg-slate-400 rounded-full"></div>
                        <div class="typing-dot w-2 h-2 bg-slate-400 rounded-full"></div>
                    </div>
                    <span class="text-sm text-slate-600">Starting eligibility check...</span>
                </div>
            </div>`;

        try {
            const response = await fetch('/api/eligibility/progressive/start', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ patient_profile: {}, nct_id: nctId }),
            });
            const data = await response.json();

            if (data.success) {
                renderProgressiveState(container, data.state);
            } else {
                container.innerHTML = `<p class="text-sm text-slate-500">Could not start eligibility check. Please try again.</p>`;
            }
        } catch (error) {
            console.error('Progressive check error:', error);
            container.innerHTML = `<p class="text-sm text-red-600">Failed to start eligibility check.</p>`;
        }
    };

    // Render the current progressive check state
    function renderProgressiveState(container, state) {
        const progress = state.progress_percent || 0;
        const statusColors = {
            checking: { bg: 'bg-slate-50', border: 'border-slate-200', text: 'text-slate-700', bar: 'bg-slate-500', label: 'Checking...' },
            eligible: { bg: 'bg-green-50', border: 'border-green-200', text: 'text-green-700', bar: 'bg-green-500', label: 'Eligible' },
            ineligible: { bg: 'bg-red-50', border: 'border-red-200', text: 'text-red-700', bar: 'bg-red-500', label: 'Not Eligible' },
            needs_review: { bg: 'bg-amber-50', border: 'border-amber-200', text: 'text-amber-700', bar: 'bg-amber-500', label: 'Needs Clinical Review' },
        };
        const sc = statusColors[state.current_status] || statusColors.checking;

        // Answered criteria list
        const answeredHtml = state.answered_criteria.map(a => {
            const icon = a.status === 'eligible'
                ? '<span class="w-5 h-5 rounded-full bg-green-100 text-green-600 flex items-center justify-center text-xs font-bold">&#10003;</span>'
                : a.status === 'ineligible'
                ? '<span class="w-5 h-5 rounded-full bg-red-100 text-red-600 flex items-center justify-center text-xs font-bold">&#10007;</span>'
                : '<span class="w-5 h-5 rounded-full bg-amber-100 text-amber-600 flex items-center justify-center text-xs font-bold">?</span>';
            return `
                <div class="flex items-center gap-2 py-1.5 border-b border-slate-100 last:border-0">
                    ${icon}
                    <span class="text-sm text-slate-700 flex-1">${a.human_label}</span>
                    ${a.patient_value ? `<span class="text-xs text-slate-400">(${a.patient_value})</span>` : ''}
                </div>`;
        }).join('');

        // Hard exclusion banner
        let exclusionBanner = '';
        if (state.hard_exclusion_hit) {
            exclusionBanner = `
                <div class="p-3 bg-red-50 border border-red-200 rounded-lg mb-3">
                    <div class="flex items-center gap-2 mb-1">
                        <svg class="w-5 h-5 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                        <span class="font-medium text-red-700">Hard Exclusion</span>
                    </div>
                    <p class="text-sm text-red-600">${state.exclusion_reason}</p>
                    <p class="text-xs text-red-500 mt-1">Remaining criteria checks have been skipped since this is a required criterion.</p>
                </div>`;
        }

        // Boundary cases
        let boundaryHtml = '';
        if (state.boundary_cases && state.boundary_cases.length > 0) {
            boundaryHtml = state.boundary_cases.map(bc => `
                <div class="p-3 bg-amber-50 border border-amber-200 rounded-lg mb-2">
                    <div class="flex items-center gap-2 mb-1">
                        <svg class="w-4 h-4 text-amber-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                        <span class="text-sm font-medium text-amber-700">Boundary Case: ${bc.human_label}</span>
                    </div>
                    <p class="text-xs text-amber-600">${bc.boundary_info.boundary_explanation}</p>
                    <p class="text-xs text-amber-700 font-medium mt-1">${bc.boundary_info.recommendation}</p>
                </div>
            `).join('');
        }

        // Next question UI
        let questionHtml = '';
        const nextQ = state.next_question;
        if (nextQ && !state.hard_exclusion_hit) {
            const priorityLabel = nextQ.priority <= 2 ? 'Critical Check' : nextQ.priority <= 4 ? 'Important Check' : 'Additional Info';
            const priorityColor = nextQ.priority <= 2 ? 'text-red-600 bg-red-100' : nextQ.priority <= 4 ? 'text-amber-600 bg-amber-100' : 'text-slate-600 bg-slate-100';

            questionHtml = `
                <div class="p-4 bg-white border border-slate-200 rounded-xl mt-3">
                    <div class="flex items-center gap-2 mb-2">
                        <span class="px-2 py-0.5 text-[10px] font-medium rounded ${priorityColor}">${priorityLabel}</span>
                        ${nextQ.is_hard ? '<span class="px-2 py-0.5 text-[10px] font-medium rounded bg-red-100 text-red-600">Required</span>' : '<span class="px-2 py-0.5 text-[10px] font-medium rounded bg-slate-100 text-slate-600">Preferred</span>'}
                        ${nextQ.is_boundary_case ? '<span class="px-2 py-0.5 text-[10px] font-medium rounded bg-amber-100 text-amber-600">Boundary Case</span>' : ''}
                    </div>
                    <p class="text-sm font-medium text-slate-800 mb-1">${nextQ.human_label}</p>
                    <p class="text-sm text-slate-600 mb-2">${nextQ.question}</p>
                    <p class="text-xs text-slate-500 mb-1"><strong>Why this matters:</strong> ${nextQ.why_it_matters}</p>
                    <p class="text-xs text-slate-400 mb-3"><strong>How to answer:</strong> ${nextQ.examples}</p>

                    ${nextQ.is_boundary_case ? `
                        <div class="p-2 bg-amber-50 border border-amber-100 rounded-lg mb-3">
                            <p class="text-xs text-amber-700">${nextQ.boundary_explanation || ''}</p>
                            ${nextQ.follow_up_questions ? `
                                <p class="text-xs text-amber-600 font-medium mt-1">The trial coordinator may ask:</p>
                                <ul class="text-xs text-amber-600 mt-0.5 list-disc list-inside">
                                    ${nextQ.follow_up_questions.map(fq => `<li>${fq}</li>`).join('')}
                                </ul>
                            ` : ''}
                        </div>
                    ` : ''}

                    <div class="flex gap-2">
                        <input type="text" id="progressive-answer-input" placeholder="Type your answer..."
                            class="flex-1 px-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/30"
                            onkeypress="if(event.key==='Enter')submitProgressiveAnswer('${state.nct_id}','${nextQ.attribute}')">
                        <button onclick="submitProgressiveAnswer('${state.nct_id}','${nextQ.attribute}')"
                            class="px-4 py-2 bg-primary text-white text-sm font-medium rounded-lg hover:bg-primary-dark transition-colors">
                            Submit
                        </button>
                        <button onclick="submitProgressiveAnswer('${state.nct_id}','${nextQ.attribute}','skip')"
                            class="px-3 py-2 bg-slate-100 text-slate-500 text-sm rounded-lg hover:bg-slate-200 transition-colors">
                            Skip
                        </button>
                    </div>
                </div>`;
        }

        container.innerHTML = `
            <div class="p-4 ${sc.bg} border ${sc.border} rounded-xl">
                <div class="flex items-center justify-between mb-3">
                    <div class="flex items-center gap-2">
                        <svg class="w-5 h-5 ${sc.text}" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4"></path></svg>
                        <span class="font-medium ${sc.text}">Progressive Eligibility Check</span>
                        <span class="px-2 py-0.5 text-xs font-medium rounded ${sc.bg} ${sc.text} border ${sc.border}">${sc.label}</span>
                    </div>
                    <span class="text-sm ${sc.text}">${state.checked_criteria}/${state.total_criteria} checked</span>
                </div>

                <!-- Progress bar -->
                <div class="h-2.5 bg-white/50 rounded-full overflow-hidden mb-3">
                    <div class="h-full ${sc.bar} rounded-full transition-all duration-500" style="width: ${progress}%"></div>
                </div>

                <!-- Status counts -->
                <div class="flex items-center gap-4 mb-3 text-xs">
                    <span class="text-green-600"><strong>${state.eligible_count}</strong> eligible</span>
                    <span class="text-red-600"><strong>${state.ineligible_count}</strong> ineligible</span>
                    <span class="text-amber-600"><strong>${state.unknown_count}</strong> remaining</span>
                </div>

                ${exclusionBanner}
                ${boundaryHtml}

                <!-- Answered criteria -->
                ${answeredHtml ? `
                    <div class="bg-white/50 rounded-lg p-3 mb-2">
                        <p class="text-[10px] font-semibold text-slate-500 uppercase mb-1">Evaluated Criteria</p>
                        ${answeredHtml}
                    </div>
                ` : ''}

                ${questionHtml}

                ${!nextQ && !state.hard_exclusion_hit && state.current_status === 'eligible' ? `
                    <div class="p-3 bg-green-100 border border-green-200 rounded-lg mt-3">
                        <p class="text-sm font-medium text-green-700">All criteria checked — you appear eligible for this trial!</p>
                        <p class="text-xs text-green-600 mt-1">We recommend discussing with your healthcare provider to confirm.</p>
                    </div>
                ` : ''}
            </div>`;
    }

    // Submit answer in progressive check
    window.submitProgressiveAnswer = async function(nctId, attribute, skipValue) {
        const input = document.getElementById('progressive-answer-input');
        const answer = skipValue || (input ? input.value.trim() : '');
        if (!answer) return;

        const container = document.getElementById('progressive-check-container');
        if (!container) return;

        try {
            const response = await fetch('/api/eligibility/progressive/answer', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ attribute, answer }),
            });
            const data = await response.json();

            if (data.success) {
                renderProgressiveState(container, data.state);
            }
        } catch (error) {
            console.error('Progressive answer error:', error);
        }
    };

    // Initialize
    initChat();
});
