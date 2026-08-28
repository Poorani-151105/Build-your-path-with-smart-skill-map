document.addEventListener("DOMContentLoaded", function () {
    const params = new URLSearchParams(window.location.search);
    const user = params.get("user");
    if (user) {
        localStorage.setItem("user", user);
    }
});

function openPath() {
    window.location.href = "build-path.html";
}

function openSkill() {
    window.location.href = "choose-skill.html";
}