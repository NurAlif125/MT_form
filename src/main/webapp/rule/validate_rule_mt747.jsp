<%-- 
    Document   : mt747
    Created on : Aug 14, 2018
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

                //mf30
                _030_mf30_date_of_the_original_authorisation_to_reimburse: "required",
                
                //of23s
                _040_of31e_new_date_of_expiry: {
                    required: function(element) {
                      return $("#_040_of31e_new_date_of_expiry").val() == "" 
                              && $("#_050_of32b_currency").val() == ""
                              && $("#_051_of32b_amount").val() == ""
                              && $("#_060_of33b_currency").val() == ""
                              && $("#_061_of33b_amount").val() == ""
                              && $("#_070_of34b_currency").val() == ""
                              && $("#_071_of34b_amount").val() == ""
                              && $("#_080_of39a_percentage_credit_amount_tolerance1").val() == ""
                              && $("#_081_of39a_percentage_credit_amount_tolerance2").val() == ""
                              && $("#_090_of39c_additional_amount_covered").val() == ""
                              && $("#_100_of72z_sender_to_receiver").val() == ""
                              && $("#_110_of77_narrative").val() == "";
                    }
                },
                
                //of34b
                new_credit_amount_after_amendment_checkbox: {
                    required: function(element) {
                      return ($("#_060_of33b_currency").val() != "" && $("#_061_of33b_amount").val() != "")
                             || ($("#_050_of32b_currency").val() != "" && $("#_051_of32b_amount").val() != "");
                    }
                },
                
                //of33b
                decrease_documentary_credit_amount_checkbox: {
                    required: function(element) {
                      return ($("#_070_of34b_currency").val() != "" && $("#_071_of34b_amount").val() != "" && $("#_050_of32b_currency").val() == "" && $("#_051_of32b_amount").val() == "");
                    }
                },
                
                //of32b
                increase_documentary_credit_amount_checkbox: {
                    required: function(element) {
                      return ($("#_070_of34b_currency").val() != "" && $("#_071_of34b_amount").val() != "" && $("#_060_of33b_currency").val() == "" && $("#_061_of33b_amount").val() == "");
                    }
                },
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf20_documentary_credit_number: {required: "mf20_documentary_credit_number must be filled..!!"},
                _030_mf30_date_of_the_original_authorisation_to_reimburse: {required: "mf30_date_of_authorisation_to_reimburse must be filled..!!"},
                _040_of31e_new_date_of_expiry: {required: "fill in at least one field after mf30..!!"},
                new_credit_amount_after_amendment_checkbox: {required: "of34b must be filled if of32b or of33b already filled..!!"},
                decrease_documentary_credit_amount_checkbox: {required: "fill in between of32b or of33b if of34b is filled in..!!"},
                increase_documentary_credit_amount_checkbox: {required: "fill in between of32b or of33b if of34b is filled in..!!"},
                
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
        $("#_050_of32b_currency").attr("disabled", true);
        $("#_051_of32b_amount").attr("disabled", true);
        $("#increase_documentary_credit_amount_checkbox").click(function(){
            if ($("#increase_documentary_credit_amount_checkbox").is(":checked")){
                $("#check_of32b").show();
                $("#_050_of32b_currency").attr("disabled", false);
                $("#_051_of32b_amount").attr("disabled", false);
            } else {
                $("#check_of32b").hide();
                $("#_050_of32b_currency").attr("disabled", true);
                $("#_051_of32b_amount").attr("disabled", true);
            }
        });
        
        //OF33B_check
        $("#check_of33b").hide();
        $("#_060_of33b_currency").attr("disabled", true);
        $("#_061_of33b_amount").attr("disabled", true);
        $("#decrease_documentary_credit_amount_checkbox").click(function(){
            if ($("#decrease_documentary_credit_amount_checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_060_of33b_currency").attr("disabled", false);
                $("#_061_of33b_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_060_of33b_currency").attr("disabled", true);
                $("#_061_of33b_amount").attr("disabled", true);
            }
        });
        
        //OF34B_check
        $("#check_of34b").hide();
        $("#_070_of34b_currency").attr("disabled", true);
        $("#_071_of34b_amount").attr("disabled", true);
        $("#new_credit_amount_after_amendment_checkbox").click(function(){
            if ($("#new_credit_amount_after_amendment_checkbox").is(":checked")){
                $("#check_of34b").show();
                $("#_070_of34b_currency").attr("disabled", false);
                $("#_071_of34b_amount").attr("disabled", false);
            } else {
                $("#check_of34b").hide();
                $("#_070_of34b_currency").attr("disabled", true);
                $("#_071_of34b_amount").attr("disabled", true);
            }
        });
        
        //OF39A_check
        $("#check_of39a").hide();
        $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
        $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function(){
            if ($("#percentage_credit_amount_checkbox").is(":checked")){
                $("#check_of39a").show();
                $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
            }
        });
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF32B_check
        if ($("#_050_of32b_currency").val() != "" || $("#_051_of32b_amount").val() != ""){
            $("#increase_documentary_credit_amount_checkbox").attr("checked", true);
            $("#check_of32b").show();
            $("#_050_of32b_currency").attr("disabled", false);
            $("#_051_of32b_amount").attr("disabled", false);
        } else {
            $("#check_of32b").hide();
            $("#_050_of32b_currency").attr("disabled", true);
            $("#_051_of32b_amount").attr("disabled", true);
        }
        
        //OF33B_check
        if ($("#_060_of33b_currency").val() != "" || $("#_061_of33b_amount").val() != ""){
            $("#decrease_documentary_credit_amount_checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_060_of33b_currency").attr("disabled", false);
            $("#_061_of33b_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_060_of33b_currency").attr("disabled", true);
            $("#_061_of33b_amount").attr("disabled", true);
        }
        
        //OF34B_check
        if ($("#_070_of34b_currency").val() != "" || $("#_071_of34b_amount").val() != ""){
            $("#new_credit_amount_after_amendment_checkbox").attr("checked", true);
            $("#check_of34b").show();
            $("#_070_of34b_currency").attr("disabled", false);
            $("#_071_of34b_amount").attr("disabled", false);
        } else {
            $("#check_of34b").hide();
            $("#_070_of34b_currency").attr("disabled", true);
            $("#_071_of34b_amount").attr("disabled", true);
        }
        
        //OF39A_check
        if ($("#_080_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_081_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
    });
</script>