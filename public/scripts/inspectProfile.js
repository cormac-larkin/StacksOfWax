const collectionDeleteButtons = document.getElementsByClassName("collection-delete-btn");
const collectionRenameButtons = document.getElementsByClassName("collection-rename-btn");
const reviewDeleteButtons = document.getElementsByClassName("review-delete-btn");
const updatePictureButton = document.getElementById("update-picture-btn");
const updatePictureInput = document.getElementById("update-picture-input");

// Display text input prompt to let user enter new profile pic URL
if(updatePictureButton) {
    updatePictureButton.addEventListener("click", (event) => {
        const newPicUrl = prompt("Please enter the URL of your new Profile Picture");
        if(!newPicUrl) { // Do not accept empty strings as input
            event.preventDefault();
            alert("No URL was provided\nYour Profile Picture was not updated")
        } else {
            updatePictureInput.value = newPicUrl;
        }
    });
}

// Display confirmation prompt before letting user delete their collection
if(collectionDeleteButtons) {
    Array.from(collectionDeleteButtons).forEach((collectionDeleteButton) => {
        collectionDeleteButton.addEventListener("click", (event) => {
            if(!confirm("Are you sure you want to delete this collection?\nDeleted collections cannot be recovered!")) {
                event.preventDefault();
            }
        });
    });   
}

// Display text input prompt to let user rename the collection
if(collectionRenameButtons) {
    Array.from(collectionRenameButtons).forEach((collectionRenameButton) => {

        // Select the input element
        const collectionRenameInput = collectionRenameButton.previousElementSibling;

        collectionRenameButton.addEventListener("click", (event) => {
            const newName = prompt("Please enter the new name for this collection");
            if (!newName) { // Do not accept empty strings as input
             event.preventDefault();
             alert("No name was provided!\nCollection was not re-named");
            } else {
             collectionRenameInput.value = newName;
            }
         });
    });
}

// Display confirmation prompt before letting user delete their review
if(reviewDeleteButtons) {
    Array.from(reviewDeleteButtons).forEach((reviewDeleteButton) => {
        reviewDeleteButton.addEventListener("click", (event) => {
            if(!confirm("Are you sure you want to delete this review?\nDeleted reviews cannot be recovered!")) {
                event.preventDefault();
            }
        });
    })
}