var nodeIsGenerator = document.getElementById("generator-farras")

var nodeReceiverInstitution = document.getElementById("receiver_institution")
var nodeLogicalTerminal = document.getElementById("sender_logical_terminal")

console.log(nodeReceiverInstitution)
console.log(nodeLogicalTerminal)

if (nodeIsGenerator) {
    var nodeForm = document.getElementById("form1")

    nodeForm.addEventListener("submit", function (e) {
        console.log("Ini ada di mod")
        e.preventDefault()
        var xml = htmlToXML(nodeForm)

        // buat element untuk menampung data XML
        var input = document.createElement("input")

        input.setAttribute("name", "dataXML")
        input.setAttribute("value", xml)
        nodeForm.appendChild(input)

        // disini untuk append child receiver dan logical terminal
        nodeForm.appendChild(nodeReceiverInstitution)
        nodeForm.appendChild(nodeLogicalTerminal)

        nodeForm.submit()
    })
    console.log("Ini XML")
} else {
    console.log("Ini MT")
}