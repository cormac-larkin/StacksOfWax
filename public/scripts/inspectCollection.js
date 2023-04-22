const ratingSlider = document.getElementById("rating");
const ratingDisplay = document.getElementById("rating-display");
const submitButton = document.getElementById("submitButton");

ratingSlider.addEventListener("change", () => {
  let description;
  const currentRating = ratingSlider.value;
  switch (currentRating) {
    case "1":
      description = "Awful!";
      break;
    case "2":
      description = "Not Great";
      break;
    case "3":
      description = "Decent";
      break;
    case "4":
      description = "Pretty Good";
      break;
    case "5":
      description = "Amazing!";
      break;
    default:
      description = "";
      break;
  }
  ratingDisplay.innerText = `${currentRating}/5 (${description})`;
});

// When the Submit button is clicked, display a confirmation prompt before submitting the review
if(submitButton) {
  submitButton.addEventListener("click", (event) => {
    if (!confirm("Are you sure you want submit this review?")) {
      event.preventDefault();
    }
  })
}
