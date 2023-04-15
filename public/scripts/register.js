const password = document.getElementById("password");
const passwordConfirmation = document.getElementById("confirm-password");
const warningMessage = document.getElementById("warning-message");
const submitButton = document.getElementById("submit");

warningMessage.style.color = "transparent";
submitButton.disabled = true;
submitButton.style.backgroundColor = "grey";


const passwordInputs = [password, passwordConfirmation];

// Add listeners to each password input field, so the 'Submit' button is disabled if their values do not match
passwordInputs.forEach((input) => {
  input.addEventListener("input", () => {
    if (password.value && password.value === passwordConfirmation.value) {
      warningMessage.style.color = "transparent";
      submitButton.disabled = false;
      submitButton.style.backgroundColor = "green";
    } else {
      warningMessage.style.color = "black";
      submitButton.disabled = true;
      submitButton.style.backgroundColor = "grey";
    }
  });
});
