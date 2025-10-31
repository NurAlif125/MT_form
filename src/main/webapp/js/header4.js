function userTrackMenuClick(menu_name) {
    fetch("SCUserLogMenuActivity", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "menu_name=" + encodeURIComponent(menu_name)
    })
        .then(response => response.text())
        .then(data => {

        })
        .catch(error => console.error("Error:", error));
}