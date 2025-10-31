<%-- 
    Document   : mt761
    Created on : Jun 14, 2021, 2:02:58 PM
    Author     : Ovasae
--%>

<script type="text/javascript">
    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false,       // Nonaktifkan validasi saat pindah input
//            onclick: false,          // Nonaktifkan validasi saat klik
            rules: {
//              header
//              unit: "required",
                sender_logical_terminal: "required",
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //Mandatory Sequence A General Information
                //15A New Sequence
                //body
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                
//                15B New Sequence
                //MF20
                _020_mf20_undertaking_number: "required",
                
//                MF52a Issuer
                _030_mf52a_issuer: "required",
                _032_mf52a_identifier_code: "required",
                _034_mf52d_name_address: "required",
                
                //of77u
                _040_of77u_undertaking_terms_and_conditions: {
                    required: function(element) {
                        // Required jika 77L kosong (artinya minimal salah satu harus ada)
                        return $("#_050_of77l_requested_local_undertaking_terms_and_conditions").val().trim() == "";
                    }
                },

                //of77l
                _050_of77l_requested_local_undertaking_terms_and_conditions: {
                    required: function(element) {
                        // Required jika 77U kosong (artinya minimal salah satu harus ada)
                        return $("#_040_of77u_undertaking_terms_and_conditions").val().trim() == "";
                    }
                },
                
                
                //template
                template_name: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                _010_mf27_number: {required: "mf27_number must be filled..!!"},
                _011_mf27_total: {required: "mf27_total must be filled..!!"},
                _020_mf20_undertaking_number: {required: "mf20_undertaking_number must be filled..!!"},
                _032_mf52a_identifier_code: {required: "mf52a_identifier_code must be filled..!!"},
                _034_mf52d_name_address: {required: "mf52d_name_address must be filled..!!"},
                _040_of77u_undertaking_terms_and_conditions: {required: "field 77U or field 77L must be present, both may be present..!!"},
                _050_of77l_requested_local_undertaking_terms_and_conditions: {required: "field 77U or field 77L must be present, both may be present..!!"},
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
        
        // Custom validation for Network Validated Rule C1
        // Either field 77U or field 77L must be present (Error code: C19)
        $("#form1").submit(function(e) {
            
            // Validation for Field 27: Number and Total must be in range 2-8
            // Number must be less than or equal to Total (Error code: T75)
            var number = parseInt($("#_010_mf27_number").val());
            var total = parseInt($("#_011_mf27_total").val());
            
            if (isNaN(number) || isNaN(total)) {
                e.preventDefault();
                alert("Error T75: MF27 Number and Total must be numeric values..!!");
                return false;
            }
            
            if (number < 2 || number > 8 || total < 2 || total > 8) {
                e.preventDefault();
                alert("Error T75: MF27 Number and Total must have a value in the range 2 to 8..!!");
                return false;
            }
            
            if (number > total) {
                e.preventDefault();
                alert("Error T75: MF27 Number must be less than or equal to Total..!!");
                return false;
            }
            
            // Validation for Field 20: Must not start or end with '/' and must not contain '//'
            // (Error code: T26)
            var undertakingNumber = $("#_020_mf20_undertaking_number").val();
            if (undertakingNumber.startsWith("/") || undertakingNumber.endsWith("/") || undertakingNumber.includes("//")) {
                e.preventDefault();
                alert("Error T26: MF20 Undertaking Number must not start or end with a slash '/' and must not contain two consecutive slashes '//'..!!");
                return false;
            }
            
            return true;
        });
    
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<!--Script untuk menampilkan-->
<script type="text/javascript">
    $(document).ready(function () {
      //MF52a Issuer
        $("#div_mf52a_issuer").hide();
        $("#div_mf52d_issuer").hide();
        $("#_031_mf52a_party_identifier").attr("disabled", true);
        $("#_032_mf52a_identifier_code").attr("disabled", true);
        $("#_033_mf52d_party_identifier").attr("disabled", true);
        $("#_034_mf52d_name_address").attr("disabled", true);
        $("#_030_mf52a_issuer").change(function () {
            if ($("#_030_mf52a_issuer").val() == "a") {
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
                $("#_031_mf52a_party_identifier").attr("disabled", false);
                $("#_032_mf52a_identifier_code").attr("disabled", false);
                $("#_033_mf52d_party_identifier").attr("disabled", true);
                $("#_034_mf52d_name_address").attr("disabled", true);
            } else if ($("#_030_mf52a_issuer").val() == "d") {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").show();
                $("#_031_mf52a_party_identifier").attr("disabled", true);
                $("#_032_mf52a_identifier_code").attr("disabled", true);
                $("#_033_mf52d_party_identifier").attr("disabled", false);
                $("#_034_mf52d_name_address").attr("disabled", false);
            } else {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").hide();
                $("#_031_mf52a_party_identifier").attr("disabled", true);
                $("#_032_mf52a_identifier_code").attr("disabled", true);
                $("#_033_mf52d_party_identifier").attr("disabled", true);
                $("#_034_mf52d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        
    });
</script>



<!--Script untuk mengedit-->
<!--rule view-->
<script language="javascript">
    $(document).ready(function () {
        //MF52a Issuer
        if ($("#_031_mf52a_party_identifier").val() != "" || $("#_032_mf52a_identifier_code").val() != "") {
            $("#_030_mf52a_issuer").val("a").attr("selected", true);
            $("#div_mf52a_issuer").show();
            $("#div_mf52d_issuer").hide();
            $("#_031_mf52a_party_identifier").attr("disabled", false);
            $("#_032_mf52a_identifier_code").attr("disabled", false);
            $("#_033_mf52d_party_identifier").attr("disabled", true);
            $("#_034_mf52d_name_address").attr("disabled", true);
        } else if ($("#_033_mf52d_party_identifier").val() != "" || $("#_034_mf52d_name_address").val() != "") {
            $("#_030_mf52a_issuer").val("d").attr("selected", true);
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").show();
            $("#_031_mf52a_party_identifier").attr("disabled", true);
            $("#_032_mf52a_identifier_code").attr("disabled", true);
            $("#_033_mf52d_party_identifier").attr("disabled", false);
            $("#_034_mf52d_name_address").attr("disabled", false);
        } else {
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").hide();
            $("#_031_mf52a_party_identifier").attr("disabled", true);
            $("#_032_mf52a_identifier_code").attr("disabled", true);
            $("#_033_mf52d_party_identifier").attr("disabled", true);
            $("#_034_mf52d_name_address").attr("disabled", true);
        }
        //end of the line
        
        
        
    });
</script>