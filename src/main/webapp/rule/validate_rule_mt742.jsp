<%-- 
    Document   : validate_rule_mt900
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
    $(document).ready(function () {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
            rules: {
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
                _010_mf20_claiming_bank_reference: "required",

                //mf21
                _020_mf21_documentary_credit_number: "required",

                //mf52a
                _041_mf52a_Identifier_Code: "required",
                _043_mf52d_Name_and_Address: "required",

                //mf32b
                _050_mf32b_currency: "required",
                _051_mf32b_amount: "required",
                
                //mf33
                _060_of33b_currency: "required",
                _061_of33b_amount: "required",

                //mf34a
                _080_mf34a_Date: "required",
                _081_mf34a_Currency: "required",
                _082_mf34a_Amount: "required",
                _083_mf34b_Currency: "required",
                _084_mf34b_Amount: "required",

                //of57
                _091_of57a_identifier_code: "required",
                _095_of57d_name_and_address: "required",

                //of58
                _101_of58a_identifier_code: "required",
                _103_of58d_name_and_address: "required",

            },
            messages: {
               sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_claiming_bank_reference: {required: "mf20 Number must be filled..!!"},
                _020_mf21_documentary_credit_number: {required: "mf21 Total must be filled..!!"},
                 type_mf52_Issuing_Bank: {required: "mf52 Issuing Bank must be filled..!!"},
                _041_mf52a_Identifier_Code:{required: "mf52 Identifier Code must be filled..!!"},
                _043_mf52d_Name_and_Address: {required: "mf52 Name and Address must be filled..!!"},
                type_mf32_Principal_Amount_Claimed: {required: "mf32 Principal Amount Claimed must be filled..!!"},
                _050_mf32b_currency: {required: "mf32 Currency must be filled..!!"},
                _051_mf32b_amount: {required: "mf32 Amount must be filled..!!"},
                type_of33_: {required: "of33 must be filled..!!"},
                _060_of33b_currency: {required: "of33 Currency must be filled..!!"},
                _061_of33b_amount: {required: "of33 Amount must be filled..!!"},
                type_mf34a_Total_Amount_Claimed: {required: "mf34a Total Amount Claimed must be filled..!!"},
                _080_mf34a_Date: {required: "mf34 date must be filled..!!"},
                _081_mf34a_Currency: {required: "mf34 Currency must be filled..!!"},
                _082_mf34a_Amount: {required: "mf34 Amount must be filled..!!"},
                _083_mf34b_Currency: {required: "mf34 Currency must be filled..!!"},
                _084_mf34b_Amount: {required: "mf34 Amount must be filled..!!"},
                type_of57_Account_With_Bank: {required: "of57 Account With Bank must be filled..!!"},
                _091_of57a_identifier_code:{required: "of57 Identifier_Code must be filled..!!"},
                _095_of57d_name_and_address: {required: "of57 Name and Address must be filled..!!"},
                type_of58_Issuing_Bank: {required: "of58 Issuing Bank must be filled..!!"},
                _101_of58a_identifier_code:{required: "of58 Identifier Code must be filled..!!"},
                _103_of58d_name_and_address: {required: "of58 Name and Address must be filled..!!"},
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

<script type="text/javascript">
    $(document).ready(function () {

        //mf52a
        $("#div_mf52a_").hide();
        $("#div_mf52d_").hide();
        $("#_040_mf52a_Party_Identifier").attr("disabled", true);
        $("#_041_mf52a_Identifier_Code").attr("disabled", true);
        $("#_042_mf52d_Party_Identifier").attr("disabled", true);
        $("#_043_mf52d_Name_and_Address").attr("disabled", true);
        $("#type_mf52_Issuing_Bank").change(function () {
            if ($("#type_mf52_Issuing_Bank").val() == "a") {
                $("#div_mf52a_").show();
                $("#div_mf52d_").hide();
                $("#_040_mf52a_Party_Identifier").attr("disabled", false);
                $("#_041_mf52a_Identifier_Code").attr("disabled", false);
                $("#_042_mf52d_Party_Identifier").attr("disabled", true);
                $("#_043_mf52d_Name_and_Address").attr("disabled", true);
            } else if ($("#type_mf52_Issuing_Bank").val() == "d") {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").show();
                $("#_040_mf52a_Party_Identifier").attr("disabled", true);
                $("#_041_mf52a_Identifier_Code").attr("disabled", true);
                $("#_042_mf52d_Party_Identifier").attr("disabled", false);
                $("#_043_mf52d_Name_and_Address").attr("disabled", false);
            } else {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").hide();
                $("#_040_mf52a_Party_Identifier").attr("disabled", true);
                $("#_041_mf52a_Identifier_Code").attr("disabled", true);
                $("#_042_mf52d_Party_Identifier").attr("disabled", true);
                $("#_043_mf52d_Name_and_Address").attr("disabled", true);
            }
        });

        //mf32b
        $("#div_mf32b_").hide();
        $("#_050_mf32b_Currency").attr("disabled", true);
        $("#_051_mf32b_Amount").attr("disabled", true);
        $("#type_mf32_Principal_Amount_Claimed").change(function () {
            if ($("#type_mf32_Principal_Amount_Claimed").val() == "b") {
                $("#div_mf32b_").show();
                $("#_050_mf32b_Currency").attr("disabled", false);
                $("#_051_mf32b_Amount").attr("disabled", false);
            } else {
                $("#div_mf32b_").hide();
                $("#_050_mf32b_Currency").attr("disabled", true);
                $("#_051_mf32b_Amount").attr("disabled", true);
            }
        });

        //OF33B_check
        $("#check_of33b").hide();
        $("#_060_of33b_currency").attr("disabled", true);
        $("#_061_of33b_amount").attr("disabled", true);
        $("#Additional_Amount_Claimed_Checkbox").click(function(){
            if ($("#Additional_Amount_Claimed_Checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_060_of33b_currency").attr("disabled", false);
                $("#_061_of33b_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_060_of33b_currency").attr("disabled", true);
                $("#_061_of33b_amount").attr("disabled", true);
            }
        });

        //mf34a
        $("#div_mf34a_a_").hide();
        $("#div_mf34a_b_").hide();
        $("#_080_mf34a_Date").attr("disabled", true);
        $("#_081_mf34a_Currency").attr("disabled", true);
        $("#_082_mf34a_Amount").attr("disabled", true);
        $("#_083_mf34b_Currency").attr("disabled", true);
        $("#_084_mf34b_Amount").attr("disabled", true);
        $("#type_mf34a_Total_Amount_Claimed").change(function () {
            if ($("#type_mf34a_Total_Amount_Claimed").val() == "a") {
                $("#div_mf34a_a_").show();
                $("#div_mf34a_b_").hide();
                $("#_080_mf34a_Date").attr("disabled", false);
                $("#_081_mf34a_Currency").attr("disabled", false);
                $("#_082_mf34a_Amount").attr("disabled", false);
                $("#_083_mf34b_Currency").attr("disabled", true);
                $("#_084_mf34b_Amount").attr("disabled", true);
            } else if ($("#type_mf34a_Total_Amount_Claimed").val() == "b") {
                $("#div_mf34a_a_").hide();
                $("#div_mf34a_b_").show();
                $("#_080_mf34a_Date").attr("disabled", true);
                $("#_081_mf34a_Currency").attr("disabled", true);
                $("#_082_mf34a_Amount").attr("disabled", true);
                $("#_083_mf34b_Currency").attr("disabled", false);
                $("#_084_mf34b_Amount").attr("disabled", false);
            } else {
                $("#div_mf34a_a_").hide();
                $("#div_mf34a_b_").hide();
                $("#_080_mf34a_Date").attr("disabled", true);
                $("#_081_mf34a_Currency").attr("disabled", true);
                $("#_082_mf34a_Amount").attr("disabled", true);
                $("#_083_mf34b_Currency").attr("disabled", true);
                $("#_084_mf34b_Amount").attr("disabled", true);
            }
        });

        //of57a
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_090_of57a_party_identifier").attr("disabled", true);
        $("#_091_of57a_identifier_code").attr("disabled", true);
        $("#_092_of57b_party_identifier").attr("disabled", true);
        $("#_093_of57b_location").attr("disabled", true);
        $("#_094_of57d_party_identifier").attr("disabled", true);
        $("#_095_of57d_name_and_address").attr("disabled", true);
        $("#type_of57_Account_With_Bank").change(function () {
            if ($("#type_of57_Account_With_Bank").val() == "a") {
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", false);
                $("#_091_of57a_identifier_code").attr("disabled", false);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_and_address").attr("disabled", true);
            } else if ($("#type_of57_Account_With_Bank").val() == "b") {
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", false);
                $("#_093_of57b_location").attr("disabled", false);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_and_address").attr("disabled", true);
            } else if ($("#type_of57_Account_With_Bank").val() == "d") {
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", false);
                $("#_095_of57d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_and_address").attr("disabled", true);
            }
        });


        //of58a
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_100_of58a_party_identifier").attr("disabled", true);
        $("#_101_of58a_identifier_code").attr("disabled", true);
        $("#_102_of58d_party_identifier").attr("disabled", true);
        $("#_103_of58d_name_and_address").attr("disabled", true);
        $("#type_of58_Issuing_Bank").change(function () {
            if ($("#type_of58_Issuing_Bank").val() == "a") {
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", false);
                $("#_101_of58a_identifier_code").attr("disabled", false);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_and_address").attr("disabled", true);
            } else if ($("#type_of58_Issuing_Bank").val() == "d") {
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", false);
                $("#_103_of58d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_and_address").attr("disabled", true);
            }
        });

    });
</script>

<%--javascript_edit--%>
<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {

        //mf52a
        if ($("#_040_mf52a_Party_Identifier").val() != "" || $("#_041_mf52a_Identifier_Code").val() != "") {
            $("#type_mf52_Issuing_Bank").val("a").attr("selected", true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_040_mf52a_Party_Identifier").attr("disabled", false);
            $("#_041_mf52a_Identifier_Code").attr("disabled", false);
            $("#_042_mf52d_Party_Identifier").attr("disabled", true);
            $("#_043_mf52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_042_mf52d_Party_Identifier").val() != "" || $("#_043_mf52d_Name_and_Address").val() != "") {
            $("#type_mf52_Issuing_Bank").val("d").attr("selected", true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_040_mf52a_Party_Identifier").attr("disabled", true);
            $("#_041_mf52a_Identifier_Code").attr("disabled", true);
            $("#_042_mf52d_Party_Identifier").attr("disabled", false);
            $("#_043_mf52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_040_mf52a_Party_Identifier").attr("disabled", true);
            $("#_041_mf52a_Identifier_Code").attr("disabled", true);
            $("#_042_mf52d_party_identifier").attr("disabled", true);
            $("#_043_mf52d_name_address").attr("disabled", true);
        }


        //mf32b
        if ($("#_050_mf32b_Currency").val() != "" || $("#_051_mf32b_Amount").val() != "") {
            $("#type_mf32_Principal_Amount_Claimed").val("b").attr("selected", true);
            $("#div_mf32b_").show();
            $("#_050_mf32b_Currency").attr("disabled", false);
            $("#_051_mf32b_Amount").attr("disabled", false);
        } else {
            $("#div_mf32b_").hide();
            $("#_050_mf32b_Currency").attr("disabled", true);
            $("#_051_mf32b_Amount").attr("disabled", true);
        }


         //OF33B_check
        if ($("#_060_of33b_currency").val() != "" || $("#_061_of33b_amount").val() != ""){
            $("#Additional_Amount_Claimed_Checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_060_of33b_currency").attr("disabled", false);
            $("#_061_of33b_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_060_of33b_currency").attr("disabled", true);
            $("#_061_of33b_amount").attr("disabled", true);
        }


        //mf34a
        if ($("#_080_mf34a_Date").val() != "" || $("#_081_mf34a_Currency").val() != "" || $("#_082_mf34a_Amount").val() != "") {
            $("#type_mf34a_Total_Amount_Claimed").val("a").attr("selected", true);
            $("#div_mf34a_a_").show();
            $("#div_mf34a_b_").hide();
            $("#_080_mf34a_Date").attr("disabled", false);
            $("#_081_mf34a_Currency").attr("disabled", false);
            $("#_082_mf34a_Amount").attr("disabled", false);
            $("#_083_mf34b_Currency").attr("disabled", true);
            $("#_084_mf34b_Amount").attr("disabled", true);
        } else if ($("#_083_mf34b_Currency").val() != "" || $("#_084_mf34b_Amount").val() != "") {
            $("#type_mf34a_Total_Amount_Claimed").val("b").attr("selected", true);
            $("#div_mf34a_a_").hide();
            $("#div_mf34a_b_").show();
            $("#_080_mf34a_Date").attr("disabled", true);
            $("#_081_mf34a_Currency").attr("disabled", true);
            $("#_082_mf34a_Amount").attr("disabled", true);
            $("#_083_mf34b_Currency").attr("disabled", false);
            $("#_084_mf34b_Amount").attr("disabled", false);
        } else {
            $("#div_mf34a_a_").hide();
            $("#div_mf34a_b_").hide();
            $("#_080_mf34a_Date").attr("disabled", true);
            $("#_081_mf34a_Currency").attr("disabled", true);
            $("#_082_mf34a_Amount").attr("disabled", true);
            $("#_083_mf34b_Currency").attr("disabled", true);
            $("#_084_mf34b_Amount").attr("disabled", true);
        }

        //of57a
        if ($("#_090_of57a_party_identifier").val() != "" || $("#_091_of57a_identifier_code").val() != "") {
            $("#type_of57_Account_With_Bank").val("a").attr("selected", true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", false);
            $("#_091_of57a_identifier_code").attr("disabled", false);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_092_of57b_party_identifier").val() != "" || $("#_093_of57b_location").val() != "") {
            $("#type_of57_Account_With_Bank").val("b").attr("selected", true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", false);
            $("#_093_of57b_location").attr("disabled", false);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_094_of57d_party_identifier").val() != "" || $("#_095_of57d_name_and_address").val() != "") {
            $("#type_of57_Account_With_Bank").val("d").attr("selected", true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", false);
            $("#_095_of57d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_and_address").attr("disabled", true);
        }

        //of58a
        if ($("#_100_of58a_party_identifier").val() != "" || $("#_101_of58a_identifier_code").val() != "") {
            $("#type_of58_Issuing_Bank").val("a").attr("selected", true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", false);
            $("#_101_of58a_identifier_code").attr("disabled", false);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_and_address").attr("disabled", true);
        } else if ($("#_102_of58d_party_identifier").val() != "" || $("#_103_of58d_name_and_address").val() != "") {
            $("#type_of58_Issuing_Bank").val("d").attr("selected", true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", false);
            $("#_103_of58d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_and_address").attr("disabled", true);
        }

    });
</script>