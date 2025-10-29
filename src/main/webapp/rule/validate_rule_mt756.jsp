<%-- 
    Document   : mt752
    Created on : Jul 23, 2018
    Author     : Andhita Deara
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
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //body
                //mf20
                _010_mf20_sender_reference: "required",

                //mf21
                _020_mf21_presenting_bank_reference: "required",

                //mf32b
                _030_mf32b_total_amount_claimed_currency: "required",
                _031_mf32b_amount: "required",

                //mf33a
                _040_mf33a_amount_reimbursed_date: "required",
                _041_mf33a_currency: "required",
                _042_mf33a_amount: "required"

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference must be filled..!!"},
                _020_mf21_presenting_bank_reference: {required: "mf21_presenting_bank_reference must be filled..!!"},
                _030_mf32b_total_amount_claimed_currency: {required: "mf32b_total_amount_claimed_currency must be filled..!!"},
                _031_mf32b_amount: {required: "mf32b_amount must be filled..!!"},
                _040_mf33a_amount_reimbursed_date: {required: "mf33a_amount_reimbursed_date must be filled..!!"},
                _041_mf33a_currency: {required: "mf33a_currency must be filled..!!"},
                _042_mf33a_amount: {required: "mf33a_amount must be filled..!!"}
                
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
    $(document).ready(function(){

        //OF53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_050_of53a_party_identifier").attr("disabled", true);
        $("#_051_of53a_identifier_code").attr("disabled", true);
        $("#_052_of53b_party_identifier").attr("disabled", true);
        $("#_053_of53b_location").attr("disabled", true);
        $("#_054_of53d_party_identifier").attr("disabled", true);
        $("#_055_of53d_name_address").attr("disabled", true);
        $("#type_of53_sender_correspondent").change(function() {
            if ( $("#type_of53_sender_correspondent").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", false);
                $("#_051_of53a_identifier_code").attr("disabled", false);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
                $("#_054_of53d_party_identifier").attr("disabled", true);
                $("#_055_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_sender_correspondent").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", false);
                $("#_053_of53b_location").attr("disabled", false);
                $("#_054_of53d_party_identifier").attr("disabled", true);
                $("#_055_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_sender_correspondent").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
                $("#_054_of53d_party_identifier").attr("disabled", false);
                $("#_055_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
                $("#_054_of53d_party_identifier").attr("disabled", true);
                $("#_055_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF54_a_b_d
        $("#div_of54a_").hide();
        $("#div_of54b_").hide();
        $("#div_of54d_").hide();
        $("#_060_of54a_party_identifier").attr("disabled", true);
        $("#_061_of54a_identifier_code").attr("disabled", true);
        $("#_062_of54b_party_identifier").attr("disabled", true);
        $("#_063_of54b_location").attr("disabled", true);
        $("#_064_of54d_party_identifier").attr("disabled", true);
        $("#_065_of54d_name_address").attr("disabled", true);
        $("#type_of54_receiver_correspondent").change(function() {
            if ( $("#type_of54_receiver_correspondent").val() == "a"){
                $("#div_of54a_").show();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_060_of54a_party_identifier").attr("disabled", false);
                $("#_061_of54a_identifier_code").attr("disabled", false);
                $("#_062_of54b_party_identifier").attr("disabled", true);
                $("#_063_of54b_location").attr("disabled", true);
                $("#_064_of54d_party_identifier").attr("disabled", true);
                $("#_065_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_receiver_correspondent").val() == "b"){
                $("#div_of54a_").hide();
                $("#div_of54b_").show();
                $("#div_of54d_").hide();
                $("#_060_of54a_party_identifier").attr("disabled", true);
                $("#_061_of54a_identifier_code").attr("disabled", true);
                $("#_062_of54b_party_identifier").attr("disabled", false);
                $("#_063_of54b_location").attr("disabled", false);
                $("#_064_of54d_party_identifier").attr("disabled", true);
                $("#_065_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_receiver_correspondent").val() == "d"){
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").show();
                $("#_060_of54a_party_identifier").attr("disabled", true);
                $("#_061_of54a_identifier_code").attr("disabled", true);
                $("#_062_of54b_party_identifier").attr("disabled", true);
                $("#_063_of54b_location").attr("disabled", true);
                $("#_064_of54d_party_identifier").attr("disabled", false);
                $("#_065_of54d_name_address").attr("disabled", false);
            } else{
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_060_of54a_party_identifier").attr("disabled", true);
                $("#_061_of54a_identifier_code").attr("disabled", true);
                $("#_062_of54b_party_identifier").attr("disabled", true);
                $("#_063_of54b_location").attr("disabled", true);
                $("#_064_of54d_party_identifier").attr("disabled", true);
                $("#_065_of54d_name_address").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF53_a_b_d
        if ($("#_050_of53a_party_identifier").val() != "" || $("#_051_of53a_identifier_code").val() != ""){
            $("#type_of53_sender_correspondent").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", false);
            $("#_051_of53a_identifier_code").attr("disabled", false);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
            $("#_054_of53d_party_identifier").attr("disabled", true);
            $("#_055_of53d_name_address").attr("disabled", true);
        } else if ($("#_052_of53b_party_identifier").val() != "" || $("#_053_of53b_location").val() != ""){
            $("#type_of53_sender_correspondent").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", false);
            $("#_053_of53b_location").attr("disabled", false);
            $("#_054_of53d_party_identifier").attr("disabled", true);
            $("#_055_of53d_name_address").attr("disabled", true);
        } else if ($("#_054_of53d_party_identifier").val() != "" || $("#_055_of53d_name_address").val() != ""){
            $("#type_of53_sender_correspondent").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
            $("#_054_of53d_party_identifier").attr("disabled", false);
            $("#_055_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
            $("#_054_of53d_party_identifier").attr("disabled", true);
            $("#_055_of53d_name_address").attr("disabled", true);
        }
        
        //OF54_a_b_d
        if ($("#_060_of54a_party_identifier").val() != "" || $("#_061_of54a_identifier_code").val() != ""){
            $("#type_of54_receiver_correspondent").val("a").attr("selected",true);
            $("#div_of54a_").show();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_060_of54a_party_identifier").attr("disabled", false);
            $("#_061_of54a_identifier_code").attr("disabled", false);
            $("#_062_of54b_party_identifier").attr("disabled", true);
            $("#_063_of54b_location").attr("disabled", true);
            $("#_064_of54d_party_identifier").attr("disabled", true);
            $("#_065_of54d_name_address").attr("disabled", true);
        } else if ($("#_062_of54b_party_identifier").val() != "" || $("#_063_of54b_location").val() != ""){
            $("#type_of54_receiver_correspondent").val("b").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").show();
            $("#div_of54d_").hide();
            $("#_060_of54a_party_identifier").attr("disabled", true);
            $("#_061_of54a_identifier_code").attr("disabled", true);
            $("#_062_of54b_party_identifier").attr("disabled", false);
            $("#_063_of54b_location").attr("disabled", false);
            $("#_064_of54d_party_identifier").attr("disabled", true);
            $("#_065_of54d_name_address").attr("disabled", true);
        } else if ($("#_064_of54d_party_identifier").val() != "" || $("#_065_of54d_name_address").val() != ""){
            $("#type_of54_receiver_correspondent").val("d").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").show();
            $("#_060_of54a_party_identifier").attr("disabled", true);
            $("#_061_of54a_identifier_code").attr("disabled", true);
            $("#_062_of54b_party_identifier").attr("disabled", true);
            $("#_063_of54b_location").attr("disabled", true);
            $("#_064_of54d_party_identifier").attr("disabled", false);
            $("#_065_of54d_name_address").attr("disabled", false);
        } else{
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_060_of54a_party_identifier").attr("disabled", true);
            $("#_061_of54a_identifier_code").attr("disabled", true);
            $("#_062_of54b_party_identifier").attr("disabled", true);
            $("#_063_of54b_location").attr("disabled", true);
            $("#_064_of54d_party_identifier").attr("disabled", true);
            $("#_065_of54d_name_address").attr("disabled", true);
        }

    });
</script>