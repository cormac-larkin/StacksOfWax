const deleteButton = document.getElementById("delete-btn");
const renameButton = document.getElementById("rename-btn");
const renameInput = document.getElementById("rename-input");

// Display confirmation prompt before letting user delete their collection
if(deleteButton) {
    deleteButton.addEventListener("click", (event) => {
        if(!confirm("Are you sure you want to delete this collection?\nDeleted collections cannot be recovered!")) {
            event.preventDefault();
        }
    });
}

// Display text input prompt to let user rename the collection
if(renameButton) {
    renameButton.addEventListener("click", (event) => {
       const newName = prompt("Please enter the new name for this collection");
       if (!newName) { // Do not accept empty strings as input
        event.preventDefault();
        alert("No name was provided!\nCollection was not re-named");
       } else {
        renameInput.value = newName;
       }
    });
}

