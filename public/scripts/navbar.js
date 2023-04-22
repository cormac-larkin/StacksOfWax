const toggleButton = document.getElementsByClassName("toggle-button")[0];
const navbarLinks = document.getElementsByClassName("navbar-links")[0];

toggleButton.addEventListener("click", () => {
  navbarLinks.classList.toggle("active");
});

// If the 'logout' button is present, add a confirmation prompt before logging the user out
const logoutButton = document.getElementById("logout");

if (logoutButton) {
  logoutButton.addEventListener("click", (event) => {
    if (!confirm("Are you sure you want to logout?")) {
      event.preventDefault();
    }
  });
}
