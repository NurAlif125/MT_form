<%-- 
    Document   : tabValidateMX
    Created on : Apr 5, 2025, 2:39:17 AM
    Author     : HP PROBOOK 430 G8
--%>

<style>
    table {
        border-collapse: collapse;
        width:100% !important; 
        font-size:8pt !important;
    } 
    table thead {
        font-size:8pt !important;
        background: #d6d6d6;
        padding: 4px;
    }
    table tbody a{
        text-decoration: none;
        color: #20696d;
        font-weight: bold;
    }
    table tbody a:hover{
        text-decoration: underline;
    }
    table, th, td {
        border: 1px solid #000;
    }
    tbody tr td{
        padding: 4px;
        cursor: pointer;
        text-align: center;
    }
    tbody tr:hover{
        background: #f6f6f6;
    }
    
</style>

<script>
    
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

            formHeaderValidate += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
    //        formHeaderValidate += '<td style="padding: 5px;">Error</td>';
            formHeaderValidate += '<td style="padding: 5px;">'+errors.message+'</td>'; // Message dulu
            formHeaderValidate += '<td style="padding: 5px;">'+inputType+' (Header)</td>';   
    //        formHeaderValidate += '<td style="padding: 5px;">'+locationTab+'</td></tr>';
            formHeaderValidate += '</tr>';
        });    

    //    let tableValidate = `<table id="errorInfoTable">
    //        <thead>
    //            <tr>
    //            <th>Message</th>
    //            <th>Path</th>
    //            </tr>
    //        </thead>`;
    //        tableValidate += '<tbody id="errorInformationTable">'+formHeaderValidate+'</tbody>'
    //        tableValidate += `</table>`;

        document.getElementById("errorInformationTable").innerHTML = formHeaderValidate;
    }
    
    function clickFocusValidate() {
//        document.querySelectorAll(".error__row").forEach(row => {
//            row.addEventListener("click", function (event) {
//    //                    let targetRow = event.target.closest(".error__row"); 
//    //                    let inputId = getAttribute("data-input-id");
//    //                    let tabContentGroup = getAttribute("content-body");
//
//            let targetRow = event.target.closest(".error__row"); 
//            if (!targetRow) return;
//
//            // Perbaikan: Panggil getAttribute pada targetRow
//            let inputId = targetRow.getAttribute("data-input-id");
//            let tabContentGroup = targetRow.getAttribute("content-body");
//
//            console.log("Baris error diklik");
//
//            let input = document.getElementById(inputId);
//            if (!input) {
//                console.log("Element input tidak ditemukan");
//                return;
//            }
//
//                if (targetRow) {
//                    let input = document.getElementById(inputId);
//                    if (input) {
//                        if(tabContentGroup == "Header") {
//                            $("#view2, #view3").hide();
//                            $("#view1").show();
//                            $('#tab-view1').addClass("selected");
//                            $('#tab-view2, #tab-validate').removeClass("selected").removeAttr('class');
//                        } else { //open mesage body or create massage
//                            $("#view1, #view3").hide();
//                            $("#view2").show();
//                            $('#tab-view2').addClass("selected");
//                            $('#tab-view1, #tab-validate').removeClass("selected").removeAttr('class');
//                        }
//
//                    input.focus();
//                    } else {
//                        console.log("nothing input element")
//                    }
//                }
//            });
//        });

document.querySelectorAll(".error__row").forEach(row => {
    row.addEventListener("click", function(event) {
        const targetRow = event.target.closest(".error__row");
        if (!targetRow) return;
        
        const tabContentGroup = targetRow.getAttribute("content-body") || "Header";
        let targetElement = null;

        // Jika Header, cari berdasarkan ID
        if (tabContentGroup === "Header") {
            const inputId = targetRow.getAttribute("data-input-id");
            if (inputId) {
                targetElement = document.getElementById(inputId);
            }
        } 
        // Jika bukan Header, cari berdasarkan custom attribute
        else {
            let xpath = targetRow.getAttribute("data-input-id");
            let fullXPath = '/Document/'+xpath;
            if (fullXPath) {
                targetElement = document.querySelector(`[data-xsd2html2xml-xpath="${CSS.escape(fullXPath)}"]`);
            }
        }

        if (!targetElement) {
            console.error("Elemen target tidak ditemukan");
            return;
        }

        // Atur tampilan tab
        if (tabContentGroup === "Header") {
            $("#view2, #view3").hide();
            $("#view1").show();
            $('#tab-view1').addClass("selected");
            $('#tab-view2, #tab-validate').removeClass("selected").removeAttr('class');
        } else {
            $("#view1, #view3").hide();
            $("#view2").show();
            $('#tab-view2').addClass("selected");
            $('#tab-view1, #tab-validate').removeClass("selected").removeAttr('class');
        }

        // Fokuskan ke elemen target
        targetElement.focus();
        targetElement.scrollIntoView({ behavior: 'smooth', block: 'center' });
        
        // Opsional: Highlight visual
//        const originalBorder = targetElement.style.border;
//        targetElement.style.border = "2px solid red";
//        setTimeout(() => {
//            targetElement.style.border = originalBorder;
//        }, 1500);
    });
});
    }
    
</script>