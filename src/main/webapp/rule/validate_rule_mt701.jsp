<%-- 
    Document   : validate_rule_mt701
    update on : Aug 24, 2018, 
    Author     : Sri Puji I
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
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                _020_mf20_documentary_credit_number: "required",
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf27_number: {required: "mf27 number must be filled..!!"},
                _011_mf27_total: {required: "mf27 number must be filled..!!"},
                _020_mf20_documentary_credit_number: {required: "mf20 documentary credit number must be filled..!!"},

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
                $("#form1").submit(); 
            } else {
                alert("There are still errors! Please fix them before saving.");
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

<!--<script type="text/javascript">
    $(document).ready(function () {

        $("#check_of39a").hide();
        $("#_070_of39a_tolerance1").attr("disabled", true);
        $("#_071_of39a_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function () {
            if ($("#percentage_credit_amount_checkbox").is(":checked")) {
                $("#check_of39a").show();
                $("#_070_of39a_tolerance1").attr("disabled", false);
                $("#_071_of39a_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_070_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_071_of39a_tolerance2").attr("disabled", true);
            }
        });



        //of52a//
        $("#div_of41a").hide();
        $("#div_of41d").hide();
        $("#_091_of41a_identifier_code").attr("disabled", true);
        $("#_092_of41a_code").attr("disabled", true);
        $("#_093_of41d_Name_and_address").attr("disabled", true);
        $("#_094_of41d_code").attr("disabled", true);
        $("#type_of41_Available").change(function () {
            if ($("#type_of41_Available").val() == "a") {
                $("#div_of41a").show();
                $("#div_of41d").hide();
                $("#_091_of41a_identifier_code").attr("disabled", false);
                $("#_092_of41a_code").attr("disabled", false);
                $("#_093_of41d_Name_and_address").attr("disabled", true);
                $("#_094_of41d_code").attr("disabled", true);
            } else if ($("#type_of41_Available").val() == "d") {
                $("#div_of41a").hide();
                $("#div_of41d").show();
                $("#_091_of41a_identifier_code").attr("disabled", true);
                $("#_092_of41a_code").attr("disabled", true);
                $("#_093_of41d_Name_and_address").attr("disabled", false);
                $("#_094_of41d_code").attr("disabled", false);
            } else {
                $("#div_of41a").hide();
                $("#div_of41d").hide();
                $("#_091_of41a_identifier_code").attr("disabled", true);
                $("#_092_of41a_code").attr("disabled", true);
                $("#_093_of41d_Name_and_address").attr("disabled", true);
                $("#_094_of41d_code").attr("disabled", true);
            }
        });



        //OF57A//
        $("#div_of57a").hide();
        $("#div_of57b").hide();
        $("#div_of57d").hide();
        $("#_171_of57a_party_identifire").attr("disabled", true);
        $("#_172_of57a_identifier_code").attr("disabled", true);
        $("#_173_of57b_party_identifire").attr("disabled", true);
        $("#_174_of57b_location").attr("disabled", true);
        $("#_175_of57d_party_identifire").attr("disabled", true);
        $("#_176_of57d_name_address").attr("disabled", true);
        $("#type_of57_advise_through_bank").change(function () {
            if ($("#type_of57_advise_through_bank").val() == "A") {
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_171_of57a_party_identifire").attr("disabled", false);
                $("#_172_of57a_identifier_code").attr("disabled", false);
                $("#_173_of57b_party_identifire").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57d_party_identifire").attr("disabled", true);
                $("#_176_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_advise_through_bank").val() == "B") {
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_171_of57a_party_identifire").attr("disabled", true);
                $("#_172_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifire").attr("disabled", false);
                $("#_174_of57b_location").attr("disabled", false);
                $("#_175_of57d_party_identifire").attr("disabled", true);
                $("#_176_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_advise_through_bank").val() == "D") {
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_171_of57a_party_identifire").attr("disabled", true);
                $("#_172_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifire").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57d_party_identifire").attr("disabled", false);
                $("#_176_of57d_name_address").attr("disabled", false);
            } else {
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_171_of57a_party_identifire").attr("disabled", true);
                $("#_172_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifire").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57d_party_identifire").attr("disabled", true);
                $("#_176_of57d_name_address").attr("disabled", true);
            }
        });


    });
</script>-->


<!-- rule view -->
<!--<script language="javascript">
    $(document).ready(function () {

        //OF39A_check
        if ($("#_070_of39a_tolerance1").val() != "" || $("#_071_of39a_tolerance2").val() != "") {
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_070_of39a_tolerance1").attr("disabled", false);
            $("#_071_of39a_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_070_of39a_tolerance1").attr("disabled", true);
            $("#_071_of39a_tolerance2").attr("disabled", true);
        }



        //of57 a_b_d
        if ($("#_171_of57a_party_identifire").val() != "" || $("#_172_of57a_identifier_code").val() != "") {
            $("#type_of57_advise_through_bank").val("A").attr("selected", true);
            $("#div_of57a").show();
            $("#div_of57b").hide();
            $("#div_of57d").hide();
            $("#_171_of57a_party_identifire").attr("disabled", false);
            $("#_172_of57a_identifier_code").attr("disabled", false);
            $("#_173_of57b_party_identifire").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57d_party_identifire").attr("disabled", true);
            $("#_176_of57d_name_address").attr("disabled", true);

        } else if ($("#_173_of57b_party_identifire").val() != "" || $("#_174_of57b_location").val() != "") {
            $("#type_of57_advise_through_bank").val("B").attr("selected", true);
            $("#div_of57a").hide();
            $("#div_of57b").show();
            $("#div_of57d").hide();
            $("#_171_of57a_party_identifire").attr("disabled", true);
            $("#_172_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifire").attr("disabled", false);
            $("#_174_of57b_location").attr("disabled", false);
            $("#_175_of57d_party_identifire").attr("disabled", true);
            $("#_176_of57d_name_address").attr("disabled", true);
        } else if ($("#_175_of57d_party_identifire").val() != "" || $("#_176_of57d_name_address").val() != "") {
            $("#type_of57_advise_through_bank").val("D").attr("selected", true);
            $("#div_of57a").hide();
            $("#div_of57b").hide();
            $("#div_of57d").show();
            $("#_171_of57a_party_identifire").attr("disabled", true);
            $("#_172_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifire").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57d_party_identifire").attr("disabled", false);
            $("#_176_of57d_name_address").attr("disabled", false);
        } else {
            $("#div_of57a").hide();
            $("#div_of57b").hide();
            $("#div_of57d").hide();
            $("#_171_of57a_party_identifire").attr("disabled", true);
            $("#_172_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifire").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57d_party_identifire").attr("disabled", true);
            $("#_176_of57d_name_address").attr("disabled", true);
        }



        if ($("#_091_of41a_identifier_code").val() != "" || $("#_092_of41a_code").val() != "") {
            $("#type_of41_Available").val("a").attr("selected", true);
            $("#div_of41a").show();
            $("#div_of41d").hide();
            $("#_091_of41a_identifier_code").attr("disabled", false);
            $("#_092_of41a_code").attr("disabled", false);
            $("#_093_of41d_Name_and_address").attr("disabled", true);
            $("#_094_of41d_code").attr("disabled", true);
        } else if ($("#_093_of41d_Name_and_address").val() != "" || $("#_094_of41d_code").val() != "") {
            $("#type_of41_Available").val("d").attr("selected", true);
            $("#div_of41a").hide();
            $("#div_of41d").show();
            $("#_091_of41a_identifier_code").attr("disabled", true);
            $("#_092_of41a_code").attr("disabled", true);
            $("#_093_of41d_Name_and_address").attr("disabled", false);
            $("#_094_of41d_code").attr("disabled", false);
        } else {
            $("#div_of41a").hide();
            $("#div_of41d").hide();
            $("#_091_of41a_identifier_code").attr("disabled", true);
            $("#_092_of41a_code").attr("disabled", true);
            $("#_093_of41d_Name_and_address").attr("disabled", true);
            $("#_094_of41d_code").attr("disabled", true);
        }





    });
</script>-->