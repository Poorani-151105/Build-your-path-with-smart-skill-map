// Smart Skill Map System - Global Logic

const API_BASE_URL = "/api";

// Auto-check backend connection on load
(async function checkBackend() {
    try {
        const res = await fetch(`${API_BASE_URL}/assessments`, { method: 'GET' });
        if (!res.ok && res.status !== 401 && res.status !== 403) throw new Error(); 
        console.log("✅ Backend Connected");
    } catch (err) {
        console.warn("⚠️ Backend connection failed.");
        const currentPage = window.location.pathname.split('/').pop() || 'index.html';
        if (currentPage !== 'index.html') {
            alert("Error: Backend services not responding. Please check your data connection.");
        }
    }
})();

// Logout Function
function logout() {
    localStorage.removeItem('user');
    window.location.href = 'login.html';
}

// Check Auth Status on protected pages
document.addEventListener('DOMContentLoaded', () => {
    const publicPages = ['index.html', 'login.html', 'signup.html', ''];
    let currentPage = window.location.pathname.split('/').pop().toLowerCase();
    
    // Normalize index
    if (currentPage === '' || currentPage === '/') currentPage = 'index.html';

    const userStr = localStorage.getItem('user');
    const user = userStr ? JSON.parse(userStr) : null;

    // 1. Redirect logic
    if (!publicPages.includes(currentPage) && !currentPage.includes('index.html')) {
        if (!user) {
            window.location.href = 'login.html';
        }
    }

    // 2. Dynamic UI Logic (for index.html etc)
    const authBtns = document.querySelector('.auth-btns');
    if (authBtns && user) {
        authBtns.innerHTML = `
            <span style="color: var(--text-secondary); align-self: center; font-size: 0.9rem;">@${user.username}</span>
            <a href="dashboard.html" class="btn btn-outline" style="padding: 0.6rem 1.2rem;">Dashboard</a>
            <button onclick="logout()" class="btn btn-primary" style="padding: 0.6rem 1.2rem; cursor: pointer;">Logout</button>
        `;
    }
});


// Helper to get Auth Header
function getAuthHeader() {
    const user = JSON.parse(localStorage.getItem('user'));
    return user ? { 'Authorization': `Bearer ${user.token}` } : {};
}

// Utility for fetching with error handling
async function apiFetch(endpoint, options = {}) {
    try {
        const response = await fetch(`${API_BASE_URL}${endpoint}`, {
            ...options,
            headers: {
                'Content-Type': 'application/json',
                ...getAuthHeader(),
                ...options.headers
            }
        });
        if (!response.ok) {
            const error = await response.text();
            throw new Error(error || 'API request failed');
        }
        return await response.json();
    } catch (err) {
        console.error(`API Error (${endpoint}):`, err);
        throw err;
    }
}
