<%-- 
    Document   : validate_rule_mt759
    Created on : Sep 24, 2025, 4:30:59 PM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {
    
    let validator = $("#form_mt759").validate({
        ignore: [],  
        onkeyup: false,
        onfocusout: false,

        rules: {
            // === Header (common) ===
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // === Body MT759 ===
            _010_mf27_number: {
                required: true,
                regex: /^[1-8]$/
            },
            _011_mf27_total: {
                required: true,
                regex: /^[1-8]$/
            },
            _020_mf20_transaction_reference_number: {
                required: true,
                regex: /^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/
            },
            _030_of21_related_reference_number: {
                regex: /^$|^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/
            },
            _040_mf22d_form_of_undertaking: "required",
            _050_of23_undertaking_number: {
                maxlength: 16
            },
            
            // Field 52a - Issuer
            _061_of52a_party_identifier: {
                maxlength: 35
            },
            _062_of52a_identifier_code: {
                regex: /^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/
            },
            _063_of52a_party_identifier: {
                maxlength: 35
            },
            _064_of52a_name_address: {
                maxlength: 140
            },
            
            _070_mf23h_function_of_message: "required",
            _080_mf45d_narrative: "required",
            
            // Field 23X - File Identification
            _090_of23x_file_identification: {
                regex: /^(COUR|EMAL|FACT|FAXT|HOST|MAIL|OTHR)?$/
            },
            _091_of23x_file_name: {
                maxlength: 65
            }
        },

        messages: {
            sender_logical_terminal: {
                required: "Sender LT must be filled."
            },
            receiver_institution: {
                required: "Receiver institution must be filled."
            },
            priority: {
                required: "Priority must be filled."
            },

            _010_mf27_number: {
                required: "Field 27 Number is mandatory.",
                regex: "Number must be 1-8 (Error T75)."
            },
            _011_mf27_total: {
                required: "Field 27 Total is mandatory.",
                regex: "Total must be 1-8 (Error T75)."
            },
            _020_mf20_transaction_reference_number: {
                required: "Field 20 Transaction Reference Number is mandatory.",
                regex: "Field 20 cannot start/end with '/' or contain '//' (Error T26)."
            },
            _030_of21_related_reference_number: {
                regex: "Field 21 cannot start/end with '/' or contain '//' (Error T26)."
            },
            _040_mf22d_form_of_undertaking: {
                required: "Field 22D Form of Undertaking is mandatory."
            },
            _050_of23_undertaking_number: {
                maxlength: "Maximum 16 characters."
            },
            _061_of52a_party_identifier: {
                maxlength: "Maximum 35 characters."
            },
            _062_of52a_identifier_code: {
                regex: "Identifier Code must be valid BIC (8 or 11 alphanumeric) (Error T27/T28/T29)."
            },
            _063_of52a_party_identifier: {
                maxlength: "Maximum 35 characters."
            },
            _064_of52a_name_address: {
                maxlength: "Maximum 140 characters."
            },
            _070_mf23h_function_of_message: {
                required: "Field 23H Function of Message is mandatory."
            },
            _080_mf45d_narrative: {
                required: "Field 45D Narrative is mandatory."
            },
            _090_of23x_file_identification: {
                regex: "Code must be one of: COUR, EMAL, FACT, FAXT, HOST, MAIL, OTHR (Error T93)."
            },
            _091_of23x_file_name: {
                maxlength: "Maximum 65 characters."
            }
        },

        errorPlacement: function (error, element) {
            error.insertAfter(element);
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
        let isValid = $("#form_mt759").valid(); 
        if (isValid) {
            alert("All inputs are valid!");
        } 
    });

    $("#submit_mt").click(function (e) {
        e.preventDefault();
        let isValid = $("#form_mt759").valid(); 
        if (isValid) {  
            $("#form_mt759").submit(); 
        } else {
            alert("There are still errors! Please fix them before saving.");
        }
    });
    
    // === Custom regex method ===
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Invalid format");

    // === Cross-field & Business Rules ===
    $("#form_mt759").on("submit", function (e) {
        
        // Field 27 logic: Number/Total range check
        const number = parseInt($("#_010_mf27_number").val());
        const total = parseInt($("#_011_mf27_total").val());
        
        if (isNaN(number) || number < 1 || number > 8) {
            alert("Field 27 Number must be between 1-8 (Error T75)");
            $("#_010_mf27_number").focus();
            e.preventDefault();
            return false;
        }
        
        if (isNaN(total) || total < 1 || total > 8) {
            alert("Field 27 Total must be between 1-8 (Error T75)");
            $("#_011_mf27_total").focus();
            e.preventDefault();
            return false;
        }
        
        if (number > total) {
            alert("Field 27: Number cannot exceed Total (Error T75)");
            $("#_010_mf27_number").focus();
            e.preventDefault();
            return false;
        }

        // Rule C1: 22D and 23H dependency
        const f22d = $("#_040_mf22d_form_of_undertaking").val();
        const f23h = $("#_070_mf23h_function_of_message").val();
        
        if (["ISSUANCE","REQISSUE","REQAMEND","ISSAMEND"].includes(f23h) && f22d !== "UNDK") {
            alert("Rule C1 (Error D87): If 23H is ISSUANCE/REQISSUE/REQAMEND/ISSAMEND, then 22D must be UNDK.");
            $("#_040_mf22d_form_of_undertaking").focus();
            e.preventDefault();
            return false;
        }
        
        if (f23h === "TRANSFER" && !["DGAR","STBY","UNDK"].includes(f22d)) {
            alert("Rule C1 (Error D87): If 23H is TRANSFER, then 22D must be DGAR, STBY, or UNDK.");
            $("#_040_mf22d_form_of_undertaking").focus();
            e.preventDefault();
            return false;
        }
        
        if (["CLSVOPEN","CLSVCLOS","FRAUDMSG","GENINFAD","OTHERFNC","REIMBURS","REQFINAN"].includes(f23h) &&
            !["DGAR","DOCR","STBY","UNDK"].includes(f22d)) {
            alert("Rule C1 (Error D87): For this 23H function, 22D must be DGAR, DOCR, STBY, or UNDK.");
            $("#_040_mf22d_form_of_undertaking").focus();
            e.preventDefault();
            return false;
        }

        // Rule 52a: Validation for Option A and D
        const issuerOption = $("#_060_of52a_issuer").val();
        if (issuerOption === "A") {
            const partyId = $("#_061_of52a_party_identifier").val().trim();
            const bic = $("#_062_of52a_identifier_code").val().trim();
            
            // At least one must be filled
            if (!partyId && !bic) {
                alert("Field 52a Option A: Either Party Identifier or BIC is required");
                $("#_061_of52a_party_identifier").focus();
                e.preventDefault();
                return false;
            }
            
            // If BIC is filled, validate format
            if (bic && !/^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(bic)) {
                alert("Field 52a: Invalid BIC format. Must be 8 or 11 alphanumeric (Error T27/T28/T29)");
                $("#_062_of52a_identifier_code").focus();
                e.preventDefault();
                return false;
            }
        } else if (issuerOption === "D") {
            const partyId = $("#_063_of52a_party_identifier").val().trim();
            const nameAddr = $("#_064_of52a_name_address").val().trim();
            
            // At least one must be filled
            if (!partyId && !nameAddr) {
                alert("Field 52a Option D: Either Party Identifier or Name & Address is required");
                $("#_063_of52a_party_identifier").focus();
                e.preventDefault();
                return false;
            }
        }

        // Rule 23X: File name/reference required if code is provided
        let f23xCode = $("#_090_of23x_file_identification").val();
        let f23xName = $("#_091_of23x_file_name").val().trim();
        
        if (f23xCode && !f23xName) {
            alert("Field 23X: File name/reference is required when code is provided");
            $("#_091_of23x_file_name").focus();
            e.preventDefault();
            return false;
        }
        
        if (f23xName && /[\/\\]/.test(f23xName)) {
            alert("Field 23X: File name must not contain path separators ('/' or '\\')");
            $("#_091_of23x_file_name").focus();
            e.preventDefault();
            return false;
        }
        
        // Field 45D: Narrative line and character count validation
        const narrative = $("#_080_mf45d_narrative").val();
        if (narrative) {
            const lines = narrative.split('\n');
            if (lines.length > 150) {
                alert("Field 45D: Maximum 150 lines allowed (Error: 150*65z format)");
                $("#_080_mf45d_narrative").focus();
                e.preventDefault();
                return false;
            }
            
            if (narrative.length > 9750) {
                alert("Field 45D: Maximum 9750 characters allowed (150 lines × 65 chars)");
                $("#_080_mf45d_narrative").focus();
                e.preventDefault();
                return false;
            }
        }
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {
        
        // === Field 52a - Issuer Option Handler ===
        $("#_060_of52a_issuer").change(function () {
            const option = $(this).val();
            
            if (option === "A") {
                $("#div_060_of52a_A").show();
                $("#div_060_of52a_D").hide();
                $("#_061_of52a_party_identifier").attr("disabled", false);
                $("#_062_of52a_identifier_code").attr("disabled", false);
                $("#_063_of52a_party_identifier").attr("disabled", true);
                $("#_064_of52a_name_address").attr("disabled", true);
                // Clear Option D fields
                $("#_063_of52a_party_identifier").val('');
                $("#_064_of52a_name_address").val('');
            } else if (option === "D") {
                $("#div_060_of52a_A").hide();
                $("#div_060_of52a_D").show();
                $("#_061_of52a_party_identifier").attr("disabled", true);
                $("#_062_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52a_party_identifier").attr("disabled", false);
                $("#_064_of52a_name_address").attr("disabled", false);
                // Clear Option A fields
                $("#_061_of52a_party_identifier").val('');
                $("#_062_of52a_identifier_code").val('');
            } else {
                $("#div_060_of52a_A").hide();
                $("#div_060_of52a_D").hide();
                $("#_061_of52a_party_identifier").attr("disabled", true);
                $("#_062_of52a_identifier_code").attr("disabled", true);
                $("#_063_of52a_party_identifier").attr("disabled", true);
                $("#_064_of52a_name_address").attr("disabled", true);
            }
        });
        
        // Initialize on page load based on existing values
        const issuerVal = $("#_060_of52a_issuer").val();
        if (issuerVal === "A") {
            $("#div_060_of52a_A").show();
            $("#div_060_of52a_D").hide();
            $("#_061_of52a_party_identifier").attr("disabled", false);
            $("#_062_of52a_identifier_code").attr("disabled", false);
            $("#_063_of52a_party_identifier").attr("disabled", true);
            $("#_064_of52a_name_address").attr("disabled", true);
        } else if (issuerVal === "D") {
            $("#div_060_of52a_A").hide();
            $("#div_060_of52a_D").show();
            $("#_061_of52a_party_identifier").attr("disabled", true);
            $("#_062_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52a_party_identifier").attr("disabled", false);
            $("#_064_of52a_name_address").attr("disabled", false);
        } else {
            $("#div_060_of52a_A").hide();
            $("#div_060_of52a_D").hide();
            $("#_061_of52a_party_identifier").attr("disabled", true);
            $("#_062_of52a_identifier_code").attr("disabled", true);
            $("#_063_of52a_party_identifier").attr("disabled", true);
            $("#_064_of52a_name_address").attr("disabled", true);
        }
        
    });
</script>
