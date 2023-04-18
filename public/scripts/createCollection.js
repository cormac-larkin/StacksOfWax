// Select all the Vinyl Cards
const vinylCards = document.getElementsByClassName("card");
const doneButton = document.querySelector(".done-button");

// The 'Done' button will be disabled until at least 3 Vinyls have been selected
doneButton.disabled = true;
doneButton.style.backgroundColor = "grey";

// Add click listener to each card
Array.from(vinylCards).forEach((vinylCard) => {

    const checkBox = vinylCard.querySelector(".check-box");

    vinylCard.addEventListener("click", () => {

        // When card is clicked, toggle the Checkbox and CSS selected class (for green box-shadow)
        vinylCard.classList.toggle("selected");
        checkBox.checked = !checkBox.checked;

        // Check if at least 3 vinyls have been selected. If true, enable the 'Done' button, otherwise disable it
        const allCheckBoxes = document.getElementsByClassName("check-box");
        let selectedVinyls = 0;
        for (let i = 0 ; i < allCheckBoxes.length; i++) {
            if (allCheckBoxes[i].checked) {
                selectedVinyls++;
            }
        }
        if (selectedVinyls >= 3) {
            doneButton.disabled = false;
            doneButton.style.backgroundColor = "green"
        } else {
            doneButton.disabled = true;
            doneButton.style.backgroundColor = "grey";
        }

    });
});