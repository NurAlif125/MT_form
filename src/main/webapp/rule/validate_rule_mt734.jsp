<%-- 
    Document   : validate_rule_mt734
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
            rules: {
            //header
            //unit: "required",
            sender_logical_terminal: "required",
            //header
            //unit: "required",
            sender_logical_terminal: "required",
            //sender_type: "required",
            //sender_type_institution: "required",
            //receiver_type: "required",
            receiver_institution: "required",
            priority: "required",
            //monitoring: "required",

            //body
            _010_mf20_sender_trn: "required",
            //mf21
            _020_mf21_presenting_bank_reference: "required",
            //mf32a
            _030_mf32a_date: "required",
            _031_mf32a_currency: "required",
            _032_mf32a_amount: "required",
            _080_mf77j_discrepancies: "required",
            _090_mf77b_disposal_of_documents: "required",
            
            //of33a
            type_of33a_Total_Amount_Claimed: {
                required: function(element) {
                  return $("#_040_of73a_charges_claimed").val() != "";
                }
            },
            
        },
        messages: {
            sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
            receiver_institution: {required: "receiver_institution must be filled..!!"},
            priority: {required: "priority must be filled..!!"},
            _010_mf20_sender_trn: {required: "mf20 must be filled..!!"},
            _020_mf21_presenting_bank_reference: {required: "mf21 must be filled..!!"},
            _030_mf32a_date: {required: "mf32 date must be filled..!!"},
            _031_mf32a_currency: {required: "mf32 currency must be filled..!!"},
            _032_mf32a_amount: {required: "mf32 amount must be filled..!!"},
            _080_mf77j_discrepancies: {required: "mf77j discrepancies must be filled..!!"},
            _090_mf77b_disposal_of_documents: {required: "mf77b disposal of documents must be filled..!!"},
            type_of33a_Total_Amount_Claimed: {required: "of33a must be filled if of73a already filled..!!"},
            
        },
        errorPlacement: function (error, element) {
                error.insertAfter(element);
                //alert(error.html());
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-view3').removeClass("selected").removeAttr('class');
                $('#tab-view4').removeClass("selected").removeAttr('class');
                $('#tab-view5').removeClass("selected").removeAttr('class');
                $('#tab-view6').removeClass("selected").removeAttr('class');
                $('#tab-view7').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
//                    return;
                } 
                
                let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                    <tr style="background:#d6d6d6;">
                                    <th>Type</th>
                                    <th>Location</th>
                                    <th>Node</th>
                                    <th>Message</th></tr>`;

                    
                errorList.forEach(errors => {
                    let inputID = errors.element.id || "";
                    let locationTab = errors.element.getAttribute("location") || "";
                    let inputType = errors.element.getAttribute("input_type") || "";

                    tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                    tableHTML += '<td style="padding: 5px;">Error</td>';
                    tableHTML += '<td style="padding: 5px;">'+locationTab+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+inputType+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+errors.message+'</td></tr>';
                });

                tableHTML += `</table>`;
                errorContainer.innerHTML = tableHTML; 
                
                document.querySelectorAll(".error__row").forEach(row => {
                    row.addEventListener("click", function () {
                        let targetRow = event.target.closest(".error__row"); 
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                    if (targetRow) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $('#tab-view2').addClass("selected");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                $("#view2").css("display", "block");
                                
                            }
                            
                            input.focus();
                        } else {
                            console.log("nothing input element")
                        }
                    }
                    });
                });
            }
        });
        
        $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                if (confirm("Do you want to save the message?")) {
                    $("#form1").submit(); 
                }
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Invalid format");
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />


<%--javascript_option--%>
<script type="text/javascript">
    $(document).ready(function(){
    //OF33A
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_date").attr("disabled", true);
    $("#_051_of33a_currency").attr("disabled", true);
    $("#_052_of33a_amount").attr("disabled", true);
    $("#_053_of33b_currency").attr("disabled", true);
    $("#_054_of33b_amount").attr("disabled", true);
    $("#type_of33a_Total_Amount_Claimed").change(function() {
    if ($("#type_of33a_Total_Amount_Claimed").val() == "A"){
    $("#div_of33a_a_").show();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_date").attr("disabled", false);
    $("#_051_of33a_currency").attr("disabled", false);
    $("#_052_of33a_amount").attr("disabled", false);
    $("#_053_of33b_currency").attr("disabled", true);
    $("#_054_of33b_amount").attr("disabled", true);
    } else if ($("#type_of33a_Total_Amount_Claimed").val() == "B"){
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").show();
    $("#_050_of33a_date").attr("disabled", true);
    $("#_051_of33a_currency").attr("disabled", true);
    $("#_052_of33a_amount").attr("disabled", true);
    $("#_053_of33b_currency").attr("disabled", false);
    $("#_054_of33b_amount").attr("disabled", false);
    } else{
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_date").attr("disabled", true);
    $("#_051_of33a_currency").attr("disabled", true);
    $("#_052_of33a_amount").attr("disabled", true);
    $("#_053_of33b_currency").attr("disabled", true);
    $("#_054_of33b_amount").attr("disabled", true);
    }
    });
    //OF57A
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    $("#type_of57a_Account_With_Bank").change(function() {
    if ($("#type_of57a_Account_With_Bank").val() == "A"){
    $("#div_of57a_a_").show();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", false);
    $("#_061_of57a_Identifier_Code").attr("disabled", false);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#type_of57a_Account_With_Bank").val() == "B"){
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").show();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", false);
    $("#_063_of57b_Location").attr("disabled", false);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#type_of57a_Account_With_Bank").val() == "D"){
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").show();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", false);
    $("#_065_of57d_Name_and_Address").attr("disabled", false);
    } else{
    $("#div_of57a_a").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    }
    });
    });</script>

<%--javascript_edit--%>
<!-- rule view -->
<script language="javascript">
$(document).ready(function(){

    //OF33A
    if ($("#_050_of33a_date").val() != "" || $("#_051_of33a_currency").val() != "" || $("#_052_of33a_amount").val() != ""){
    $("#type_of33_Total_Amount_Claimed").val("A").attr("selected", true);
    $("#div_of33a_a_").show();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_date").attr("disabled", false);
    $("#_051_of33a_currency").attr("disabled", false);
    $("#_052_of33a_amount").attr("disabled", true);
    $("#_053_of33b_currency").attr("disabled", true);
    $("#_054_of33b_amount").attr("disabled", true);
    } else if ($("#_053_of33b_currency").val() != "" || $("#_054_of33b_amount").val() != ""){
    $("#type_of33_Total_Amount_Claimed").val("B").attr("selected", true);
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").show();
    $("#_050_of33a_date").attr("disabled", true);
    $("#_051_of33a_currency").attr("disabled", true);
    $("#_052_of33a_amount").attr("disabled", true);
    $("#_053_of33b_currency").attr("disabled", false);
    $("#_054_of33b_amount").attr("disabled", false);
    } else{
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_date").attr("disabled", true);
    $("#_051_of33a_currency").attr("disabled", true);
    $("#_052_of33a_amount").attr("disabled", true);
    $("#_053_of33b_currency").attr("disabled", true);
    $("#_054_of33b_amount").attr("disabled", true);
    }

    //OF57A
    if ($("#_060_of57a_Party_Identifier").val() != "" || $("#_061_of57a_Identifier_Code").val() != ""){
    $("#type_of57a_Account_With_Bank").val("A").attr("selected", true);
    $("#div_of57a_a_").show();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", false);
    $("#_061_of57a_Identifier_Code").attr("disabled", false);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#_062_of57b_Party_Identifier").val() != "" || $("#_063_of57b_Location").val() != ""){
    $("#type_of57a_Account_With_Bank").val("B").attr("selected", true);
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").show();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", false);
    $("#_063_of57b_Location").attr("disabled", false);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#_064_of57d_Party_Identifier").val() != "" || $("#_065_of57d_Name_and_Address").val() != ""){
    $("#type_of57a_Account_With_Bank").val("D").attr("selected", true);
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").show();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", false);
    $("#_065_of57d_Name_and_Address").attr("disabled", false);
    } else{
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    }

    });
</script>