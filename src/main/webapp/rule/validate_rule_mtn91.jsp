<%-- 
    Document   : validate_rule_mtn91
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false, 
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
                _010_mf20_transaction_reference_number: "required",
                _020_mf21_related_reference: "required",
//                _012_mf25_: "required",

                //mf32_b
                _030_mf32b_currency: "required",
                _031_mf32b_amount: "required",

                //of52_a_d
                _041_of52a_identifier_code: "required",
                _044_of52d_name_address: "required",

                //of57
                _051_of57a_identifier_code: "required",
                _057_of57d_name_address: "required",

                //MF71B
                _060_mf71b_details_charges: "required"

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20 harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _031_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _041_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _044_of52d_name_address: {required: "of52d_name_address harus diisi..!!"},
                _051_of57a_identifier_code: {required: "of57a_identifier_code harus diisi..!!"},
                _057_of57d_name_address: {required: "of57d_name_address harus diisi..!!"},
                _060_mf71b_details_charges: {required: "mf71b_details_charges harus diisi..!!"}
            },
            errorPlacement: function(error,element){
                error.insertAfter(element);
//                alert(error.html());
                $("#tab-validate").removeAttr("hidden");
            },
            showErrors: function(errorMap, errorList){
                this.defaultShowErrors();
                
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5").css("display", "none");
                $("#view6").css("display", "block");
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
                
                let tableHTML = `<table style="width:100% !important; font-size:8pt !important;">
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
                                $("#view2, #view3, #view4, #view5, #view6").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $('#tab-view2').addClass("selected");
                                $("#view2").css("display", "block");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                
                            }
                            
                            input.focus();
                        } else {
                            console.log("nothing input element")
                        }
                    }
                    });
                });
            },
        });
        
         $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("Semua input valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                $("#form1").submit(); 
            } else {
                alert("Masih ada error! Harap perbaiki sebelum menyimpan.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
            return this.optional(element) || param.test(value); 
//            Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
        }, "Format tidak valid");
        
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        
        //of52_a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_040_of52a_party_identifier").attr("disabled", true);
        $("#_041_of52a_identifier_code").attr("disabled", true);
        $("#_042_of52a_address").attr("disabled", true);
        $("#_043_of52d_party_identifier").attr("disabled", true);
        $("#_044_of52d_name_address").attr("disabled", true);
        $("#type_of52_ordering_institution").change(function() {
            if ( $("#type_of52_ordering_institution").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_040_of52a_party_identifier").attr("disabled", false);
                $("#_041_of52a_identifier_code").attr("disabled", false);
                $("#_042_of52a_address").attr("disabled", false);
                $("#_043_of52d_party_identifier").attr("disabled", true);
                $("#_044_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_ordering_institution").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_040_of52a_party_identifier").attr("disabled", true);
                $("#_041_of52a_identifier_code").attr("disabled", true);
                $("#_042_of52a_address").attr("disabled", true);
                $("#_043_of52d_party_identifier").attr("disabled", false);
                $("#_044_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_040_of52a_party_identifier").attr("disabled", true);
                $("#_041_of52a_identifier_code").attr("disabled", true);
                $("#_042_of52a_address").attr("disabled", true);
                $("#_043_of52d_party_identifier").attr("disabled", true);
                $("#_044_of52d_name_address").attr("disabled", true);
            }
        });

        //of57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_050_of57a_party_identifier").attr("disabled", true);
        $("#_051_of57a_identifier_code").attr("disabled", true);
        $("#_052_of57a_address").attr("disabled", true);
        $("#_053_of57b_party_identifier").attr("disabled", true);
        $("#_054_of57b_location").attr("disabled", true);
        $("#_056_of57d_party_identifier").attr("disabled", true);
        $("#_057_of57d_name_address").attr("disabled", true);
        $("#type_of57_account_with_institution").change(function() {
            if ( $("#type_of57_account_with_institution").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_050_of57a_party_identifier").attr("disabled", false);
                $("#_051_of57a_identifier_code").attr("disabled", false);
                $("#_052_of57a_address").attr("disabled", true);
                $("#_053_of57b_party_identifier").attr("disabled", true);
                $("#_054_of57b_location").attr("disabled", true);
                $("#_056_of57d_party_identifier").attr("disabled", true);
                $("#_057_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_institution").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_050_of57a_party_identifier").attr("disabled", true);
                $("#_051_of57a_identifier_code").attr("disabled", true);
                $("#_052_of57a_address").attr("disabled", true);
                $("#_053_of57b_party_identifier").attr("disabled", false);
                $("#_054_of57b_location").attr("disabled", false);
                $("#_056_of57d_party_identifier").attr("disabled", true);
                $("#_057_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_institution").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_050_of57a_party_identifier").attr("disabled", true);
                $("#_051_of57a_identifier_code").attr("disabled", true);
                $("#_052_of57a_address").attr("disabled", true);
                $("#_053_of57b_party_identifier").attr("disabled", true);
                $("#_054_of57b_location").attr("disabled", true);
                $("#_056_of57d_party_identifier").attr("disabled", false);
                $("#_057_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_050_of57a_party_identifier").attr("disabled", true);
                $("#_051_of57a_identifier_code").attr("disabled", true);
                $("#_052_of57a_address").attr("disabled", true);
                $("#_053_of57b_party_identifier").attr("disabled", true);
                $("#_054_of57b_location").attr("disabled", true);
                $("#_056_of57d_party_identifier").attr("disabled", true);
                $("#_057_of57d_name_address").attr("disabled", true);
            }
        });
    });

</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        //of52_a_d
        if ($("#_040_of52a_party_identifier").val() != "" || $("#_041_of52a_identifier_code").val() != ""){
            $("#type_of52_ordering_institution").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_040_of52a_party_identifier").attr("disabled", false);
            $("#_041_of52a_identifier_code").attr("disabled", false);
            $("#_042_of52a_address").attr("disabled", false);
            $("#_043_of52d_party_identifier").attr("disabled", true);
            $("#_044_of52d_name_address").attr("disabled", true);
        } else if ($("#_043_of52d_party_identifier").val() != "" || $("#_044_of52d_name_address").val() != ""){
            $("#type_of52_ordering_institution").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_040_of52a_party_identifier").attr("disabled", true);
            $("#_041_of52a_identifier_code").attr("disabled", true);
            $("#_042_of52a_address").attr("disabled", true);
            $("#_043_of52d_party_identifier").attr("disabled", false);
            $("#_044_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_040_of52a_party_identifier").attr("disabled", true);
            $("#_041_of52a_identifier_code").attr("disabled", true);
            $("#_042_of52a_address").attr("disabled", true);
            $("#_043_of52d_party_identifier").attr("disabled", true);
            $("#_044_of52d_name_address").attr("disabled", true);
        }

        //of57_a_b_d
        if ($("#_050_of57a_party_identifier").val() != "" || $("#_051_of57a_identifier_code").val() != ""){
            $("#type_of57_account_with_institution").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_050_of57a_party_identifier").attr("disabled", false);
            $("#_051_of57a_identifier_code").attr("disabled", false);
            $("#_052_of57a_address").attr("disabled", false);
            $("#_053_of57b_party_identifier").attr("disabled", true);
            $("#_054_of57b_location").attr("disabled", true);
            $("#_056_of57d_party_identifier").attr("disabled", true);
            $("#_057_of57d_name_address").attr("disabled", true);
        } else if ($("#_053_of57b_party_identifier").val() != "" || $("#_054_of57b_location").val() != ""){
            $("#type_of57_account_with_institution").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_050_of57a_party_identifier").attr("disabled", true);
            $("#_051_of57a_identifier_code").attr("disabled", true);
            $("#_052_of57a_address").attr("disabled", true);
            $("#_053_of57b_party_identifier").attr("disabled", false);
            $("#_054_of57b_location").attr("disabled", false);
            $("#_056_of57d_party_identifier").attr("disabled", true);
            $("#_057_of57d_name_address").attr("disabled", true);
        } else if ($("#_056_of57d_party_identifier").val() != "" || $("#_057_of57d_name_address").val() != ""){
            $("#type_of57_account_with_institution").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_050_of57a_party_identifier").attr("disabled", true);
            $("#_051_of57a_identifier_code").attr("disabled", true);
            $("#_052_of57a_address").attr("disabled", true);
            $("#_053_of57b_party_identifier").attr("disabled", true);
            $("#_054_of57b_location").attr("disabled", true);
            $("#_056_of57d_party_identifier").attr("disabled", false);
            $("#_057_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_050_of57a_party_identifier").attr("disabled", true);
            $("#_051_of57a_identifier_code").attr("disabled", true);
            $("#_052_of57a_address").attr("disabled", true);
            $("#_053_of57b_party_identifier").attr("disabled", true);
            $("#_054_of57b_location").attr("disabled", true);
            $("#_056_of57d_party_identifier").attr("disabled", true);
            $("#_057_of57d_name_address").attr("disabled", true);
        }
    });
</script>
