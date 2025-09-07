var nodeErrorMessage = document.getElementById("error-msg")
const toastLiveExample = document.getElementById('liveToast')

// event after the page is loaded perfectly
window.onload = function () {
    if (nodeErrorMessage.innerHTML !== "") {
        // show the toast is ther is no error
        console.log("Show the toast span")
        const toast = new bootstrap.Toast(toastLiveExample)
        toast.show();
    } else {
        console.log("dont show the toast")
    }
}