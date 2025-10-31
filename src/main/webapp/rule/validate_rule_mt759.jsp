<%-- 
    Document   : mt759
    Created on : Aug 15, 2018
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
                //mf27
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                
                //mf27
                _020_mf20_transaction_reference_number: "required",

                //mf22d
                _040_mf22d_form_of_undertaking: "required",
                
                //mf23h
                _070_mf23h_function_of_message: "required",
                
                //mf45d
                _080_mf45d_narrative: "required"
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf27_number: {required: "mf27_number must be filled..!!"},
                _011_mf27_total: {required: "mf27_total must be filled..!!"},
                _020_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number must be filled..!!"},
                _040_mf22d_form_of_undertaking: {required: "mf22d_form_of_undertaking must be filled..!!"},
                _070_mf23h_function_of_message: {required: "mf23h_function_of_message must be filled..!!"},
                _080_mf45d_narrative: {required: "mf45d_narrative must be filled..!!"}
                
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
        
        // Rule C1: Validasi hubungan antara Field 23H (Function of Message) dan Field 22D (Form of Undertaking)
        $.validator.addMethod("rule_c1_field23h_22d", function(value, element) {
            var field23h = $("#_070_mf23h_function_of_message").val();
            var field22d = $("#_040_mf22d_form_of_undertaking").val();
            
            // Jika field22d kosong, skip validasi ini (akan tertangkap oleh required)
            if (!field22d) {
                return true;
            }
            
            // Rule C1: If field 23H contains ISSUANCE, REQISSUE, REQAMEND, or ISSAMEND, then field 22D must contain UNDK
            if (field23h == "ISSUANCE" || field23h == "REQISSUE" || field23h == "REQAMEND" || field23h == "ISSAMEND") {
                if (field22d != "UNDK") {
                    return false;
                }
            }
            
            // Rule C1: If field 23H contains TRANSFER, then field 22D must contain DGAR, STBY, or UNDK
            if (field23h == "TRANSFER") {
                if (field22d != "DGAR" && field22d != "STBY" && field22d != "UNDK") {
                    return false;
                }
            }
            
            // Untuk function lainnya (CLSVOPEN, CLSVCLOS, FRAUDMSG, GENINFAD, OTHERFNC, PREDENOT, REIMBURS, REQFINAN, REXTMATU)
            // Field 22D boleh DGAR, DOCR, STBY, atau UNDK (semua valid)
            
            return true;
        }, "Field 22D (Form of Undertaking) tidak sesuai dengan Field 23H (Function of Message). Rule C1: ISSUANCE/REQISSUE/REQAMEND/ISSAMEND requires UNDK, TRANSFER requires DGAR/STBY/UNDK (Error code: D87)");

        // Tambahkan rule C1 ke field 22D
        $("#_040_mf22d_form_of_undertaking").rules("add", {
            rule_c1_field23h_22d: true
        });

        // Trigger validasi ulang field 22D ketika field 23H berubah
        $("#_070_mf23h_function_of_message").change(function() {
            $("#_040_mf22d_form_of_undertaking").valid();
        });
        
        // Trigger validasi ulang field 23H ketika field 22D berubah (opsional, untuk konsistensi)
        $("#_040_mf22d_form_of_undertaking").change(function() {
            $("#_040_mf22d_form_of_undertaking").valid();
        });
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        
        //OF52_a_d
        $("#div_060_of52a_A").hide();
        $("#div_060_of52a_D").hide();
        $("#_061_of52a_party_identifier").attr("disabled", true);
        $("#_062_of52a_identifier_code").attr("disabled", true);
        $("#_063_of52a_party_identifier").attr("disabled", true);
        $("#_064_of52a_name_address").attr("disabled", true);
        $("#_060_of52a_issuer").change(function() {
            if ( $("#_060_of52a_issuer").val() == "a"){
                $("#div_060_of52a_A").show();
                $("#div_060_of52a_D").hide();
                $("#_061_of52a_party_identifier").attr("disabled", false);
                $("#_062_of52a_identifier_code").attr("disabled", false);
                $("#_063_of52a_party_identifier").attr("disabled", true);
                $("#_064_of52a_name_address").attr("disabled", true);
            } else if ( $("#_060_of52a_issuer").val() == "d"){
                $("#div_060_of52a_A").hide();
                $("#div_060_of52a_D").show();
                $("#_061_of52a_party_identifier").attr("disabled", true);
                $("#_062_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52a_party_identifier").attr("disabled", false);
                $("#_064_of52a_name_address").attr("disabled", false);
            } else{
                $("#div_060_of52a_A").hide();
                $("#div_060_of52a_D").hide();
                $("#_061_of52a_party_identifier").attr("disabled", true);
                $("#_062_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52a_party_identifier").attr("disabled", true);
                $("#_064_of52a_name_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_061_of52a_party_identifier").val() != "" || $("#_062_of52a_identifier_code").val() != ""){
            $("#_060_of52a_issuer").val("a").attr("selected",true);
            $("#div_060_of52a_A").show();
            $("#div_060_of52a_D").hide();
            $("#_061_of52a_party_identifier").attr("disabled", false);
            $("#_062_of52a_identifier_code").attr("disabled", false);
            $("#_063_of52a_party_identifier").attr("disabled", true);
            $("#_064_of52a_name_address").attr("disabled", true);
        } else if ($("#_063_of52a_party_identifier").val() != "" || $("#_064_of52a_name_address").val() != ""){
            $("#_060_of52a_issuer").val("d").attr("selected",true);
            $("#div_060_of52a_A").hide();
            $("#div_060_of52a_D").show();
            $("#_061_of52a_party_identifier").attr("disabled", true);
            $("#_062_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52a_party_identifier").attr("disabled", false);
            $("#_064_of52a_name_address").attr("disabled", false);
        } else{
            $("#div_060_of52a_A").hide();
            $("#div_060_of52a_D").hide();
            $("#_061_of52a_party_identifier").attr("disabled", true);
            $("#_062_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52a_party_identifier").attr("disabled", true);
            $("#_064_of52a_name_address").attr("disabled", true);
        }
    });
</script>