document.addEventListener('DOMContentLoaded', function() {
    const messageForm = document.getElementById('message-form');
    const userInput = document.getElementById('user-input');
    const messagesContainer = document.getElementById('messages');
    const trialModal = document.getElementById('trial-modal');
    const closeModal = document.getElementById('close-modal');
    let isWaitingForResponse = false;

    // Initialize the chat
    function initChat() {
        // Add event listeners
        messageForm.addEventListener('submit', handleSubmit);
        closeModal.addEventListener('click', () => {
            trialModal.classList.add('hidden');
        });

        // Close modal when clicking outside
        trialModal.addEventListener('click', (e) => {
            if (e.target === trialModal) {
                trialModal.classList.add('hidden');
            }
        });

        // Focus the input field
        userInput.focus();
    }

    // Handle form submission
    async function handleSubmit(e) {
        e.preventDefault();
    
        const message = userInput.value.trim();
        if (!message || isWaitingForResponse) return;

        // Add user message to chat
        addMessage('user', message);
        userInput.value = '';
    
        // Show typing indicator
        showTypingIndicator();
        isWaitingForResponse = true;

        try {
            // Send message to server
            const response = await fetch('/api/chat', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
            },
            body: JSON.stringify({ message }),
            credentials: 'same-origin'
        });

        console.log('Response status:', response.status);
        
        if (!response.ok) {
            const errorText = await response.text();
            console.error('Error response:', errorText);
            throw new Error(`Server responded with status ${response.status}: ${errorText}`);
        }

        const data = await response.json();
        console.log('Parsed response data:', data);
        
        // Remove typing indicator
        removeTypingIndicator();
        
        // Handle different response types
        if (data.trials) {
            // Handle trial results
            if (data.trials.length > 0) {
                showTrialMatches(data.trials);
            } else {
                addMessage('assistant', 'No matching trials found. Would you like to try a different search?');
            }
        } else if (data.response) {
            // Handle text response
            addMessage('assistant', data.response);
        } else if (data.text) {
            // Alternative response format
            addMessage('assistant', data.text);
        } else {
            console.warn('Unexpected response format:', data);
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
        
        const messageContent = document.createElement('div');
        messageContent.className = `message p-3 rounded-lg ${
            role === 'user' 
                ? 'bg-blue-600 text-white rounded-tr-none' 
                : 'bg-gray-100 text-gray-800 rounded-tl-none'
        }`;
        
        // Handle newlines in the message
        const formattedContent = content.replace(/\n/g, '<br>');
        messageContent.innerHTML = formattedContent;
        
        messageDiv.appendChild(messageContent);
        messagesContainer.appendChild(messageDiv);
        
        // Scroll to bottom
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    // Show typing indicator
    function showTypingIndicator() {
        const typingDiv = document.createElement('div');
        typingDiv.className = 'typing-indicator';
        typingDiv.id = 'typing-indicator';
        typingDiv.innerHTML = `
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
            <div class="typing-dot"></div>
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

    // Show trial matches
    function showTrialMatches(trials) {
        const container = document.createElement('div');
        container.className = 'space-y-4';
        
        const message = document.createElement('div');
        message.className = 'assistant-message p-3 rounded-lg bg-gray-100 text-gray-800 rounded-tl-none';
        
        message.innerHTML = `
            <p>I found ${trials.length} clinical trials that might be a good match for you:</p>
        `;
        
        const trialsList = document.createElement('div');
        trialsList.className = 'mt-3 space-y-3';
        
        trials.forEach((trial, index) => {
            const trialCard = document.createElement('div');
            trialCard.className = 'trial-card bg-white p-4 rounded-lg shadow-sm border border-gray-200';
            trialCard.innerHTML = `
                <h4 class="font-semibold text-blue-700">${trial.title || 'Clinical Trial'}</h4>
                <p class="text-sm text-gray-600 mb-2">${trial.brief_summary ? trial.brief_summary.substring(0, 150) + '...' : 'No description available.'}</p>
                <div class="flex flex-wrap">
                    ${trial.phase ? `<span class="badge">${trial.phase}</span>` : ''}
                    ${trial.enrollment ? `<span class="badge">Enrollment: ${trial.enrollment}</span>` : ''}
                </div>
                <button class="mt-2 text-sm text-blue-600 hover:text-blue-800" 
                        onclick="viewTrialDetails('${trial.nct_id}')">
                    View Details
                </button>
            `;
            trialsList.appendChild(trialCard);
        });
        
        message.appendChild(trialsList);
        container.appendChild(message);
        messagesContainer.appendChild(container);
        
        // Add viewport meta tag for mobile responsiveness
        const viewportMeta = document.createElement('meta');
        viewportMeta.name = 'viewport';
        viewportMeta.content = 'width=device-width, initial-scale=1.0';
        document.head.appendChild(viewportMeta);
        
        // Scroll to bottom
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    // View trial details
    window.viewTrialDetails = async function(nctId) {
        try {
            const response = await fetch(`/api/trials/${nctId}`);
            const data = await response.json();
            
            if (data.success && data.trial) {
                const trial = data.trial;
                const modalContent = document.getElementById('trial-details');
                
                // Format criteria
                let criteriaHtml = '';
                if (trial.criteria && trial.criteria.length > 0) {
                    criteriaHtml = `
                        <div class="mt-4">
                            <h4 class="font-semibold text-lg mb-2">Eligibility Criteria</h4>
                            <div class="space-y-2">
                                ${trial.criteria.map(c => 
                                    `<div class="p-2 bg-gray-50 rounded border border-gray-100">
                                        <p class="text-sm">${c.criterion_type}: ${c.criterion_value}</p>
                                    </div>`
                                ).join('')}
                            </div>
                        </div>
                    `;
                }
                
                // Set modal content
                document.getElementById('trial-title').textContent = trial.title || 'Clinical Trial Details';
                modalContent.innerHTML = `
                    <div class="space-y-4">
                        <div>
                            <h4 class="font-semibold">Description</h4>
                            <p class="text-gray-700 mt-1">${trial.brief_summary || 'No description available.'}</p>
                        </div>
                        
                        <div class="grid grid-cols-2 gap-4">
                            ${trial.phase ? `
                                <div>
                                    <h4 class="font-semibold">Phase</h4>
                                    <p class="text-gray-700">${trial.phase}</p>
                                </div>
                            ` : ''}
                            
                            ${trial.enrollment ? `
                                <div>
                                    <h4 class="font-semibold">Enrollment</h4>
                                    <p class="text-gray-700">${trial.enrollment} participants</p>
                                </div>
                            ` : ''}
                            
                            ${trial.drugs ? `
                                <div class="col-span-2">
                                    <h4 class="font-semibold">Drugs</h4>
                                    <p class="text-gray-700">${trial.drugs}</p>
                                </div>
                            ` : ''}
                        </div>
                        
                        ${criteriaHtml}
                        
                        <div class="mt-6 pt-4 border-t border-gray-200">
                            <a href="https://clinicaltrials.gov/ct2/show/${trial.nct_id}" 
                               target="_blank" 
                               class="inline-block bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
                                View on ClinicalTrials.gov
                            </a>
                        </div>
                    </div>
                `;
                
                // Show modal
                trialModal.classList.remove('hidden');
            } else {
                addMessage('assistant', 'Sorry, I could not load the trial details.');
            }
        } catch (error) {
            console.error('Error loading trial details:', error);
            addMessage('assistant', 'Sorry, something went wrong while loading the trial details.');
        }
    };

    // Initialize the chat
    initChat();
});
