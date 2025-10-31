document.getElementById("btn-validate").addEventListener('click', function (e) {
    e.preventDefault();

    const nodeForm = document.getElementById("form1");
    const nodeReceiverInstitution = document.getElementById("receiver_institution");
    const nodeLogicalTerminal = document.getElementById("sender_logical_terminal");

    console.log(nodeReceiverInstitution);
    console.log(nodeLogicalTerminal);

    // Sanitasi semua input dan textarea di dalam form
    const inputs = nodeForm.querySelectorAll("input[type='text'], textarea");
    inputs.forEach(input => {
        if (input.value && input.value.length > 0) {
            let val = input.value;
            val = val
                    .replace(/&/g, "&amp;")
                    .replace(/</g, "&lt;")
                    .replace(/>/g, "&gt;");
            input.value = val;
        }
    });

    // Setelah semua input aman, baru ubah ke XML
    const xml = htmlToXML(nodeForm);
    console.log(xml);

    // Balikin lagi ke awal
    inputs.forEach(input => {
        if (input.value && input.value.length > 0) {
            let val = input.value;
            val = val
                    .replace(/&lt;/g, "<")
                    .replace(/&gt;/g, ">")
                    .replace(/&amp;/g, "&");
            input.value = val;
        }
    });

    // Bersihkan input dataXML lama
    const existingInputs = document.getElementsByName("dataXML");
    existingInputs.forEach(input => input.parentNode.removeChild(input));

    // Buat input hidden baru untuk menyimpan XML hasil konversi
    const hiddenInput = document.createElement("input");
    hiddenInput.setAttribute("id", "dataXML");
    hiddenInput.setAttribute("name", "dataXML");
    hiddenInput.setAttribute("type", "hidden");
    hiddenInput.setAttribute("value", xml);
    nodeForm.appendChild(hiddenInput);

    const sender = $('#sender_logical_terminal').val();
    const receiver = $('#receiver_institution').val();
    const messType = $('#messageType').val();

    console.log("Input dataXML telah ditambahkan:", hiddenInput);

    // Bersihkan error table
    document.getElementById("errorInformationTable").innerHTML = '';

    // Kirim data aman
    kirimData(xml, sender, receiver, messType);
});



function kirimData(input, sender, receiver, messType) {
    fetch("SCValidateMX", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: "dataXML=" + encodeURIComponent(input) + "&sender=" + encodeURIComponent(sender) + "&receiver=" + encodeURIComponent(receiver) + "&messageType=" + encodeURIComponent(messType)
    })
            .then(response => response.text())
            .then(data => {

                if (data.trim() === "null" || data.trim() === "") {
                    alert("All inputs are valid!");
                } else {
                    validateHeader();
                    document.getElementById("errorInformationTable").innerHTML += data;
                    console.log(data);
                    //open tab validate
                    $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                    //        $("#view3").css("display", "block");
                    $("#view8").css("display", "block");
                    $("#tab-view-validate").css("display", "inline");
                    $('#tab-view1').removeClass("selected").removeAttr('class');
                    $('#tab-view2').removeClass("selected").removeAttr('class');
                    $('#tab-view3').removeClass("selected").removeAttr('class');
                    $('#tab-view4').removeClass("selected").removeAttr('class');
                    $('#tab-view5').removeClass("selected").removeAttr('class');
                    $('#tab-view6').removeClass("selected").removeAttr('class');
                    $('#tab-view7').removeClass("selected").removeAttr('class');
                    $('#tab-validate').addClass("selected");
                    clickFocusValidate();
                }

            })
            .catch(error => console.error("Error:", error));
}