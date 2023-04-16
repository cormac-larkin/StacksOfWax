const trackCountInput = document.getElementById("track-count");
const trackInputs = document.getElementById("track-inputs");
const nextBtn = document.getElementById("nextBtn");
const submitBtn = document.getElementById("submitBtn");

submitBtn.style.display = "none";

nextBtn.addEventListener("click", () => {

    const trackCount = trackCountInput.value;
    if (trackCount > 20) {
        alert("The maximum number of tracks is 20!");
        trackCountInput.value = "";
        return;
    }

    for (let i = 0; i < trackCount; i++) {

        // Create the input element & label
        const trackInput = document.createElement("input");
        const trackInputLabel = document.createElement("label");
        trackInputLabel.innerText = `Track ${i+1}`;
        trackInputLabel.setAttribute("for", `track-${i+1}`);
        trackInput.setAttribute("id", `track-${i+1}`);
        trackInput.setAttribute("name", `track${i+1}`);
        trackInput.setAttribute("type", "text");
        trackInput.setAttribute("required", "");

        // Add the track name input and label to the form
        nextBtn.before(trackInput);
        trackInput.before(trackInputLabel);

        // Hide the 'next' button and show the 'add vinyl' button
        nextBtn.style.display = "none";
        submitBtn.style.display = "block"

    }

})