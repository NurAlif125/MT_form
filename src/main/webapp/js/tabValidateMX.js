function validateHeader() {
    let inputIDs = ["receiver_institution", "priority"];
    let errorList = [];

    inputIDs.forEach(id => {
        let input = document.getElementById(id);
        if (input && input.value.trim() === "") {
            errorList.push({
                element: input,
                message: input.getAttribute("input_type") + ' is mandatory!'
            });
        }
    });

    let formHeaderValidate = '';
    errorList.forEach(errors => {
        let inputID = errors.element.id || "";
        let locationTab = errors.element.getAttribute("location") || "";
        let inputType = errors.element.getAttribute("input_type") || "";

        formHeaderValidate += '<tr class="error__row" input-id="' + inputID + '" content-body="' + locationTab + '" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
        formHeaderValidate += '<td style="padding: 5px;">' + errors.message + '</td>';
        formHeaderValidate += '<td style="padding: 5px;">' + inputType + ' (Header)</td>';
        formHeaderValidate += '</tr>';
    });

    document.getElementById("errorInformationTable").innerHTML = formHeaderValidate;
}

function clickFocusValidate() {
    document.querySelectorAll(".error__row").forEach(row => {
        row.addEventListener("click", function (event) {
            let targetRow = event.target.closest(".error__row");
            if (!targetRow) return;
            let inputId = targetRow.getAttribute("input-id");
            let tabContentGroup = targetRow.getAttribute("content-body");

            let input = document.getElementById(inputId);
            if (!input) {
                console.log("Element input tidak ditemukan");
                return;
            }

            if (targetRow) {
                let input = document.getElementById(inputId);
                if (input) {
                    if (tabContentGroup == "Header") {
                        $("#view2, #view8").hide();
                        $("#view1").show();
                        $('#tab-view1').addClass("selected");
                        $('#tab-view2, #tab-validate').removeClass("selected").removeAttr('class');
                    } else { //open mesage body or create massage
                        $("#view1, #view8").hide();
                        $("#view2").show();
                        $('#tab-view2').addClass("selected");
                        $('#tab-view1, #tab-validate').removeClass("selected").removeAttr('class');
                    }

                    input.focus();

                    input.style.transition = 'all 0.3s';
                    input.style.outline = '1px solid red';
                    setTimeout(() => input.style.outline = '', 3000);
                } else {
                    console.log("nothing input element")
                }
            }
        });
    });

}