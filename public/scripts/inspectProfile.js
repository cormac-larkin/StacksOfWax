const deleteButton = document.getElementById("delete-btn");
const renameButton = document.getElementById("rename-btn");

// Display confirmation prompt before letting user delete their collection
if(deleteButton) {
    deleteButton.addEventListener("click", (event) => {
        if(!confirm("Are you sure you want to delete this collection? Deleted collections cannot be recovered!")) {
            event.preventDefault();
        }
    });
}

// Display text input prompt to let user rename the collection

// if(renameButton) {
//     renameButton.addEventListener("click", () => {
//         prompt()
//     })
// }

