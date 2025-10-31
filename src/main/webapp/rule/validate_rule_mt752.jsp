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
                _010_mf20_documentary_credit_number: "required",

                //mf21
                _020_mf21_presenting_bank_reference: "required",

                //mf23
                _030_mf23_further_identification: "required",

                //mf30
                _040_mf30_date_of_advice: "required",
                
                //of33a
                type_of33_net_amount: {
                    required: function(element) {
                      return ($("#_050_of32b_total_amount_advised_currency").val() != "" && $("#_051_of32b_amount").val() != "" && $("#_060_of71d_charges_deducated").val() != "");
                    }
                },

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_documentary_credit_number: {required: "mf20_documentary_credit_number must be filled..!!"},
                _020_mf21_presenting_bank_reference: {required: "mf21_presenting_bank_reference must be filled..!!"},
                _030_mf23_further_identification: {required: "mf23_further_identification must be filled..!!"},
                _040_mf30_date_of_advice: {required: "mf30_date_of_advice must be filled..!!"},
                type_of33_net_amount: {required: "of33 must be filled if of32b and of71d are filled..!!"},
                
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
        
        //OF32B_check
        $("#check_of32b").hide();
        $("#_050_of32b_total_amount_advised_currency").attr("disabled", true);
        $("#_051_of32b_amount").attr("disabled", true);
        $("#total_amount_advised_checkbox").click(function(){
            if ($("#total_amount_advised_checkbox").is(":checked")){
                $("#check_of32b").show();
                $("#_050_of32b_total_amount_advised_currency").attr("disabled", false);
                $("#_051_of32b_amount").attr("disabled", false);
            } else {
                $("#check_of32b").hide();
                $("#_050_of32b_total_amount_advised_currency").attr("disabled", true);
                $("#_051_of32b_amount").attr("disabled", true);
            }
        });

        //OF33_a_b
        $("#div_of33a_").hide();
        $("#div_of33b_").hide();
        $("#_070_of33a_date").attr("disabled", true);
        $("#_071_of33a_currency").attr("disabled", true);
        $("#_072_of33a_amount").attr("disabled", true);
        $("#_073_of33b_currency").attr("disabled", true);
        $("#_074_of33b_amount").attr("disabled", true);
        $("#type_of33_net_amount").change(function() {
            if ( $("#type_of33_net_amount").val() == "a"){
                $("#div_of33a_").show();
                $("#div_of33b_").hide();
                $("#_070_of33a_date").attr("disabled", false);
                $("#_071_of33a_currency").attr("disabled", false);
                $("#_072_of33a_amount").attr("disabled", false);
                $("#_073_of33b_currency").attr("disabled", true);
                $("#_074_of33b_amount").attr("disabled", true);
            } else if ( $("#type_of33_net_amount").val() == "b"){
                $("#div_of33a_").hide();
                $("#div_of33b_").show();
                $("#_070_of33a_date").attr("disabled", true);
                $("#_071_of33a_currency").attr("disabled", true);
                $("#_072_of33a_amount").attr("disabled", true);
                $("#_073_of33b_currency").attr("disabled", false);
                $("#_074_of33b_amount").attr("disabled", false);
            } else{
                $("#div_of33a_").hide();
                $("#div_of33b_").hide();
                $("#_070_of33a_date").attr("disabled", true);
                $("#_071_of33a_currency").attr("disabled", true);
                $("#_072_of33a_amount").attr("disabled", true);
                $("#_073_of33b_currency").attr("disabled", true);
                $("#_074_of33b_amount").attr("disabled", true);
            }
        });
        
        //OF53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_080_of53a_party_identifier").attr("disabled", true);
        $("#_081_of53a_identifier_code").attr("disabled", true);
        $("#_082_of53b_party_identifier").attr("disabled", true);
        $("#_083_of53b_location").attr("disabled", true);
        $("#_084_of53d_party_identifier").attr("disabled", true);
        $("#_085_of53d_name_address").attr("disabled", true);
        $("#type_of53_sender_correspondent").change(function() {
            if ( $("#type_of53_sender_correspondent").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", false);
                $("#_081_of53a_identifier_code").attr("disabled", false);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_sender_correspondent").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", false);
                $("#_083_of53b_location").attr("disabled", false);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_sender_correspondent").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", false);
                $("#_085_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_080_of53a_party_identifier").attr("disabled", true);
                $("#_081_of53a_identifier_code").attr("disabled", true);
                $("#_082_of53b_party_identifier").attr("disabled", true);
                $("#_083_of53b_location").attr("disabled", true);
                $("#_084_of53d_party_identifier").attr("disabled", true);
                $("#_085_of53d_name_address").attr("disabled", true);
            }
        });
        
        //OF54_a_b_d
        $("#div_of54a_").hide();
        $("#div_of54b_").hide();
        $("#div_of54d_").hide();
        $("#_090_of54a_party_identifier").attr("disabled", true);
        $("#_091_of54a_identifier_code").attr("disabled", true);
        $("#_092_of54b_party_identifier").attr("disabled", true);
        $("#_093_of54b_location").attr("disabled", true);
        $("#_094_of54d_party_identifier").attr("disabled", true);
        $("#_095_of54d_name_address").attr("disabled", true);
        $("#type_of54_receiver_correspondent").change(function() {
            if ( $("#type_of54_receiver_correspondent").val() == "a"){
                $("#div_of54a_").show();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_090_of54a_party_identifier").attr("disabled", false);
                $("#_091_of54a_identifier_code").attr("disabled", false);
                $("#_092_of54b_party_identifier").attr("disabled", true);
                $("#_093_of54b_location").attr("disabled", true);
                $("#_094_of54d_party_identifier").attr("disabled", true);
                $("#_095_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_receiver_correspondent").val() == "b"){
                $("#div_of54a_").hide();
                $("#div_of54b_").show();
                $("#div_of54d_").hide();
                $("#_090_of54a_party_identifier").attr("disabled", true);
                $("#_091_of54a_identifier_code").attr("disabled", true);
                $("#_092_of54b_party_identifier").attr("disabled", false);
                $("#_093_of54b_location").attr("disabled", false);
                $("#_094_of54d_party_identifier").attr("disabled", true);
                $("#_095_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_receiver_correspondent").val() == "d"){
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").show();
                $("#_090_of54a_party_identifier").attr("disabled", true);
                $("#_091_of54a_identifier_code").attr("disabled", true);
                $("#_092_of54b_party_identifier").attr("disabled", true);
                $("#_093_of54b_location").attr("disabled", true);
                $("#_094_of54d_party_identifier").attr("disabled", false);
                $("#_095_of54d_name_address").attr("disabled", false);
            } else{
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_090_of54a_party_identifier").attr("disabled", true);
                $("#_091_of54a_identifier_code").attr("disabled", true);
                $("#_092_of54b_party_identifier").attr("disabled", true);
                $("#_093_of54b_location").attr("disabled", true);
                $("#_094_of54d_party_identifier").attr("disabled", true);
                $("#_095_of54d_name_address").attr("disabled", true);
            }
        });

    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF32B_check
        if ($("#_050_of32b_total_amount_advised_currency").val() != "" || $("#_051_of32b_amount").val() != ""){
            $("#total_amount_advised_checkbox").attr("checked", true);
            $("#check_of32b").show();
            $("#_050_of32b_total_amount_advised_currency").attr("disabled", false);
            $("#_051_of32b_amount").attr("disabled", false);
        } else {
            $("#check_of32b").hide();
            $("#_050_of32b_total_amount_advised_currency").attr("disabled", true);
            $("#_051_of32b_amount").attr("disabled", true);
        }
        
        //OF33_a_b
        if ($("#_070_of33a_date").val() != "" || $("#_071_of33a_currency").val() != "" || $("#_072_of33a_amount").val() != ""){
            $("#type_of33_net_amount").val("a").attr("selected",true);
            $("#div_of33a_").show();
            $("#div_of33b_").hide();
            $("#_070_of33a_date").attr("disabled", false);
            $("#_071_of33a_currency").attr("disabled", false);
            $("#_072_of33a_amount").attr("disabled", false);
            $("#_073_of33b_currency").attr("disabled", true);
            $("#_074_of33b_amount").attr("disabled", true);
        } else if ($("#_073_of33b_currency").val() != "" || $("#_074_of33b_amount").val() != ""){
            $("#type_of33_net_amount").val("b").attr("selected",true);
            $("#div_of33a_").hide();
            $("#div_of33b_").show();
            $("#_070_of33a_date").attr("disabled", true);
            $("#_071_of33a_currency").attr("disabled", true);
            $("#_072_of33a_amount").attr("disabled", true);
            $("#_073_of33b_currency").attr("disabled", false);
            $("#_074_of33b_amount").attr("disabled", false);
        } else{
            $("#div_of33a_").hide();
            $("#div_of33b_").hide();
            $("#_070_of33a_date").attr("disabled", true);
            $("#_071_of33a_currency").attr("disabled", true);
            $("#_072_of33a_amount").attr("disabled", true);
            $("#_073_of33b_currency").attr("disabled", true);
            $("#_074_of33b_amount").attr("disabled", true);
        }
        
        //OF53_a_b_d
        if ($("#_080_of53a_party_identifier").val() != "" || $("#_081_of53a_identifier_code").val() != ""){
            $("#type_of53_sender_correspondent").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", false);
            $("#_081_of53a_identifier_code").attr("disabled", false);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        } else if ($("#_082_of53b_party_identifier").val() != "" || $("#_083_of53b_location").val() != ""){
            $("#type_of53_sender_correspondent").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", false);
            $("#_083_of53b_location").attr("disabled", false);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        } else if ($("#_084_of53d_party_identifier").val() != "" || $("#_085_of53d_name_address").val() != ""){
            $("#type_of53_sender_correspondent").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", false);
            $("#_085_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_080_of53a_party_identifier").attr("disabled", true);
            $("#_081_of53a_identifier_code").attr("disabled", true);
            $("#_082_of53b_party_identifier").attr("disabled", true);
            $("#_083_of53b_location").attr("disabled", true);
            $("#_084_of53d_party_identifier").attr("disabled", true);
            $("#_085_of53d_name_address").attr("disabled", true);
        }
        
        //OF54_a_b_d
        if ($("#_090_of54a_party_identifier").val() != "" || $("#_091_of54a_identifier_code").val() != ""){
            $("#type_of54_receiver_correspondent").val("a").attr("selected",true);
            $("#div_of54a_").show();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_090_of54a_party_identifier").attr("disabled", false);
            $("#_091_of54a_identifier_code").attr("disabled", false);
            $("#_092_of54b_party_identifier").attr("disabled", true);
            $("#_093_of54b_location").attr("disabled", true);
            $("#_094_of54d_party_identifier").attr("disabled", true);
            $("#_095_of54d_name_address").attr("disabled", true);
        } else if ($("#_092_of54b_party_identifier").val() != "" || $("#_093_of54b_location").val() != ""){
            $("#type_of54_receiver_correspondent").val("b").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").show();
            $("#div_of54d_").hide();
            $("#_090_of54a_party_identifier").attr("disabled", true);
            $("#_091_of54a_identifier_code").attr("disabled", true);
            $("#_092_of54b_party_identifier").attr("disabled", false);
            $("#_093_of54b_location").attr("disabled", false);
            $("#_094_of54d_party_identifier").attr("disabled", true);
            $("#_095_of54d_name_address").attr("disabled", true);
        } else if ($("#_094_of54d_party_identifier").val() != "" || $("#_095_of54d_name_address").val() != ""){
            $("#type_of54_receiver_correspondent").val("d").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").show();
            $("#_090_of54a_party_identifier").attr("disabled", true);
            $("#_091_of54a_identifier_code").attr("disabled", true);
            $("#_092_of54b_party_identifier").attr("disabled", true);
            $("#_093_of54b_location").attr("disabled", true);
            $("#_094_of54d_party_identifier").attr("disabled", false);
            $("#_095_of54d_name_address").attr("disabled", false);
        } else{
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_090_of54a_party_identifier").attr("disabled", true);
            $("#_091_of54a_identifier_code").attr("disabled", true);
            $("#_092_of54b_party_identifier").attr("disabled", true);
            $("#_093_of54b_location").attr("disabled", true);
            $("#_094_of54d_party_identifier").attr("disabled", true);
            $("#_095_of54d_name_address").attr("disabled", true);
        }

    });
</script>