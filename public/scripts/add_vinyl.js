const trackCountInput = document.getElementById("track-count");
const trackInputs = document.getElementById("track-inputs");
const nextBtn = document.getElementById("nextBtn");
const submitBtn = document.getElementById("submitBtn");

// Hide and disable the submit button until the number of tracks is entered
submitBtn.style.display = "none";
submitBtn.disabled = true;

// Display confirmation prompt when the submit button is clicked
submitBtn.addEventListener("click", (event) => {
  if(!confirm("Are you sure you want to add this vinyl to the catalogue?")) {
    event.preventDefault();
  }
});

// This listener dynamically adds the correct number of track input fields based on the user's input
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
    trackInputLabel.innerText = `Track ${i + 1}`;
    trackInputLabel.setAttribute("for", `track-${i + 1}`);
    trackInput.setAttribute("id", `track-${i + 1}`);
    trackInput.setAttribute("name", `track${i + 1}`);
    trackInput.setAttribute("type", "text");
    trackInput.setAttribute("required", "");

    // Add the input and label to the form
    nextBtn.before(trackInput);
    trackInput.before(trackInputLabel);

    // Hide the 'next' button and show the 'add vinyl' button
    nextBtn.style.display = "none";
    submitBtn.style.display = "block";
  }

  // Add a header over the new inputs
  const trackInputHeader = document.createElement("h2");
  trackInputHeader.setAttribute("class", "sub-heading");
  trackInputHeader.innerText = "Enter Track Names";
  trackCountInput.after(trackInputHeader);

  // Scroll down to the inputs
  window.scrollTo({
    top: 600,
    behavior: "smooth",
  });

  // Enable the submit button
  submitBtn.disabled = false;
});
