const nodeIsGenerator = document.getElementById("generator-farras");
const nodeReceiverInstitution = document.getElementById("receiver_institution");
const nodeLogicalTerminal = document.getElementById("sender_logical_terminal");

console.log(nodeReceiverInstitution);
console.log(nodeLogicalTerminal);

if (nodeIsGenerator) {
    const nodeForm = document.getElementById("form1");

    nodeForm.addEventListener("submit", function (e) {
        e.preventDefault();

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

        // buat element untuk menampung data XML
        const hiddenInput = document.createElement("input");
        hiddenInput.setAttribute("id", "dataXML");
        hiddenInput.setAttribute("name", "dataXML");
        hiddenInput.setAttribute("type", "hidden");
        hiddenInput.setAttribute("value", xml);
        nodeForm.appendChild(hiddenInput);

        // disini untuk append child receiver dan logical terminal
        nodeForm.appendChild(nodeReceiverInstitution);
        nodeForm.appendChild(nodeLogicalTerminal);

        nodeForm.submit();
    });
    console.log("Ini XML");
} else {
    console.log("Ini MT");
}