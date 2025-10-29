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
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        
        //OF52_a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_060_of52a_party_identifier").attr("disabled", true);
        $("#_061_of52a_identifier_code").attr("disabled", true);
        $("#_062_of52d_party_identifier").attr("disabled", true);
        $("#_063_of52d_name_address").attr("disabled", true);
        $("#type_of52_issuer").change(function() {
            if ( $("#type_of52_issuer").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_060_of52a_party_identifier").attr("disabled", false);
                $("#_061_of52a_identifier_code").attr("disabled", false);
                $("#_062_of52d_party_identifier").attr("disabled", true);
                $("#_063_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_issuer").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_062_of52d_party_identifier").attr("disabled", false);
                $("#_063_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_062_of52d_party_identifier").attr("disabled", true);
                $("#_063_of52d_name_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_060_of52a_party_identifier").val() != "" || $("#_061_of52a_identifier_code").val() != ""){
            $("#type_of52_issuer").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_060_of52a_party_identifier").attr("disabled", false);
            $("#_061_of52a_identifier_code").attr("disabled", false);
            $("#_062_of52d_party_identifier").attr("disabled", true);
            $("#_063_of52d_name_address").attr("disabled", true);
        } else if ($("#_062_of52d_party_identifier").val() != "" || $("#_063_of52d_name_address").val() != ""){
            $("#type_of52_issuer").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_062_of52d_party_identifier").attr("disabled", false);
            $("#_063_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_062_of52d_party_identifier").attr("disabled", true);
            $("#_063_of52d_name_address").attr("disabled", true);
        }
    });
</script>