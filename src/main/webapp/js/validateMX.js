// function fetchValidate() {
//     $.ajax({
//         url: SCValidateMX,
//         method: "GET",
//         dataType: JSON,
//         success: function (data) {
//             console.log(data)
//         },
//         error: function (xhr, status, error) {
//             console.error("Error fetching validation:", error);
//         }
//     })
// }
document.getElementById("btn-validate").addEventListener('click', function (e) {
    var nodeIsGenerator = document.getElementById("generator-farras")

    var nodeReceiverInstitution = document.getElementById("receiver_institution")
    var nodeLogicalTerminal = document.getElementById("sender_logical_terminal")

    console.log(nodeReceiverInstitution)
    console.log(nodeLogicalTerminal)
    console.log("testing")
    e.preventDefault()

    var nodeForm = document.getElementById("form1")

    var xml = htmlToXML(nodeForm)
    console.log(xml)

    //cek element input data XML
    var existingInputs = document.getElementsByName("dataXML")
    existingInputs.forEach(input => input.parentNode.removeChild(input))

    // buat element untuk menampung data XML
    var input = document.createElement("input")

    input.setAttribute("id", "dataXML")
    input.setAttribute("name", "dataXML")
    input.setAttribute("type", "hidden")
    input.setAttribute("value", xml)
    nodeForm.appendChild(input)
    let sender = $('#sender_logical_terminal').val();
    let receiver = $('#receiver_institution').val();
    let messType = $('#messageType').val();

    console.log("Input dataXML telah ditambahkan:", input)
    document.getElementById("errorInformationTable").innerHTML = '';
    kirimData(xml, sender, receiver, messType)


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
                console.log(data)
                //open tab validate
                $("#view1, #view2").css("display", "none");
                //        $("#view3").css("display", "block");
                $("#view8").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");
                clickFocusValidate();
            }

        })
        .catch(error => console.error("Error:", error));
}