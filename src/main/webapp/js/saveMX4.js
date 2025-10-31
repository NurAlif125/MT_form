const nodeIsGenerator = document.getElementById("generator-farras");
const nodeReceiverInstitution = document.getElementById("receiver_institution");
const nodeLogicalTerminal = document.getElementById("sender_logical_terminal");

console.log(nodeReceiverInstitution);
console.log(nodeLogicalTerminal);

if (nodeIsGenerator) {
    const nodeForm = document.getElementById("form1");

    nodeForm.addEventListener("submit", function (e) {
        e.preventDefault();
        if (!confirm("Do you want to save this MX?")) {
            return;
        }

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

        const xml = htmlToXML(nodeForm);
        console.log(xml);

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

        const existingInputs = document.getElementsByName("dataXML");
        existingInputs.forEach(input => input.parentNode.removeChild(input));

        // buat element untuk menampung data XML
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

        document.getElementById("errorInformationTable").innerHTML = '';

        kirimData(xml, sender, receiver, messType);


    });
    console.log("Ini XML");

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
                        console.log("Data kosong, form akan dikirim...");
                        nodeForm.submit();
                    } else {
                        validateHeader();
                        document.getElementById("errorInformationTable").innerHTML += data;
                        console.log(data);
                        $("#tab-view-validate").removeAttr("hidden");
                        $("#view1, #view2").css("display", "none");
                        $("#view8").css("display", "block");
                        $('#tab-view1').removeClass("selected").removeAttr('class');
                        $('#tab-view2').removeClass("selected").removeAttr('class');
                        $('#tab-validate').addClass("selected");
                        clickFocusValidate();
                    }
                })
                .catch(error => console.error("Error:", error));
    }
} else {
    console.log("Ini MT");
}