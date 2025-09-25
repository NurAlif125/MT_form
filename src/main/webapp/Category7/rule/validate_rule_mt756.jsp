<%-- 
    Document   : validate_rule_mt756
    Created on : Sep 24, 2025, 10:44:56 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {
    let validator = $("#form_mt756").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // --- Header ---
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // --- Mandatory Body ---
            _010_mf20_sender_reference: {required:true, regex:/^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/},   // Field 20
            _020_mf21_presenting_banks_reference: {required:true, regex:/^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/}, // Field 21

            // --- 32B Total Amount Claimed ---
            _030_mf32b_currency: {required:true, regex:/^[A-Z]{3}$/},
            _031_mf32b_amount: {required:true, regex:/^\d+(,\d{1,2})?$/},

            // --- 33A Amount Reimbursed or Paid ---
            _040_mf33a_date: {required:true, regex:/^\d{6}$/}, // YYMMDD
            _041_mf33a_currency: {required:true, regex:/^[A-Z]{3}$/},
            _042_mf33a_amount: {required:true, regex:/^\d+(,\d{1,2})?$/},

            // --- 53a Sender's Correspondent (optional) ---
            _050_of53a_senders_correspondent: {regex:/^[ABD]?$/},
            _052_of53a_identifier_code: {regex:/^[A-Z0-9]{8}([A-Z0-9]{3})?$/},
            _053_of53a_location: {maxlength:35},
            _054_of53a_name_address: {maxlength:140},

            // --- 54a Receiver's Correspondent (optional) ---
            _060_of54a_receivers_correspondent: {regex:/^[ABD]?$/},
            _062_of54a_identifier_code: {regex:/^[A-Z0-9]{8}([A-Z0-9]{3})?$/},
            _063_of54a_location: {maxlength:35},
            _064_of54a_name_address: {maxlength:140},

            // --- 72Z / 79Z ---
            _070_of72z_sender_to_receiver_information: {maxlength:210},
            _080_of79z_narrative: {maxlength:1750}
        },
        messages: {
            sender_logical_terminal: {required:"Sender Logical Terminal wajib."},
            receiver_institution: {required:"Receiver Institution wajib."},
            priority: {required:"Priority wajib."},

            _010_mf20_sender_reference: {required:"Field 20 wajib.", regex:"Format Field 20 tidak valid (T26)."},
            _020_mf21_presenting_banks_reference: {required:"Field 21 wajib.", regex:"Format Field 21 tidak valid (T26)."},

            _030_mf32b_currency: {required:"Currency 32B wajib.", regex:"Harus 3 huruf ISO."},
            _031_mf32b_amount: {required:"Amount 32B wajib.", regex:"Format amount tidak valid."},

            _040_mf33a_date: {required:"Tanggal 33A wajib.", regex:"Harus format YYMMDD (T50)."},
            _041_mf33a_currency: {required:"Currency 33A wajib.", regex:"Harus 3 huruf ISO."},
            _042_mf33a_amount: {required:"Amount 33A wajib.", regex:"Format amount tidak valid."},

            _052_of53a_identifier_code: {regex:"BIC 53a tidak valid (C05)."},
            _062_of54a_identifier_code: {regex:"BIC 54a tidak valid (C05)."}
        },
        errorPlacement: function (error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        showErrors: function (errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");

            let tableHTML = `<table border="0" style="width:100%;font-size:8pt;border-collapse:collapse;border:1px solid gray;">
                <tr style="background:#d6d6d6;"><th>Type</th><th>Field</th><th>Message</th></tr>`;
            errorList.forEach(err=>{
                let inputID = err.element.id || "";
                let fieldLabel = $(err.element).attr("input_type") || inputID;
                tableHTML += `<tr class="error__row" data-input-id="${inputID}">
                    <td>Error</td><td>${fieldLabel}</td><td>${err.message}</td></tr>`;
            });
            tableHTML += `</table>`;
            $("#error-container").html(tableHTML);

            $(".error__row").on("click", function(){
                let input = $("#"+$(this).data("input-id"));
                if(input.length){ input.focus(); }
            });
        }
    });

    // --- Button validate ---
    $("#btn-validate").click(function () {
        if($("#form_mt756").valid() && extraChecks()){ alert("Semua input valid!"); }
    });

    // --- Button submit ---
    $("#submit_mt").click(function (e) {
        e.preventDefault();
        if($("#form_mt756").valid() && extraChecks()){
            $("#form_mt756").submit();
        } else {
            alert("Masih ada error. Periksa kembali!");
        }
    });

    // --- Custom regex ---
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");

    // --- Extra Checks sesuai pedoman SWIFT ---
    function extraChecks(){
        // Rule C1: currency 32B == 33A
        let c32 = $("#_030_mf32b_currency").val().toUpperCase();
        let c33 = $("#_041_mf33a_currency").val().toUpperCase();
        if(c32 && c33 && c32!==c33){ 
            alert("C1: Currency 32B dan 33A harus sama (C02)."); 
            return false; 
        }

        // Rule T50: date valid YYMMDD
        let d33 = $("#_040_mf33a_date").val();
        if(d33 && !/^\d{6}$/.test(d33)){ 
            alert("33A Date harus YYMMDD (T50)."); 
            return false; 
        }

        // Rule RCB: hanya boleh jika 53a & 54a hadir
        let f72 = $("#_070_of72z_sender_to_receiver_information").val().trim();
        if(/^RCB\b/.test(f72)){
            if($.trim($("#_050_of53a_senders_correspondent").val())==="" || 
               $.trim($("#_060_of54a_receivers_correspondent").val())===""){
                alert("Rule: Code RCB di 72Z hanya boleh jika 53a dan 54a diisi."); 
                return false;
            }
        }

        return true;
    }

    // --- Toggle groups ---
    function toggleGroups(){
        // 53a
        let opt53 = $("#_050_of53a_senders_correspondent").val();
        $("#wrap_051_of53a_party_identifier,#wrap_052_of53a_identifier_code,#wrap_053_of53a_location,#wrap_054_of53a_name_address").hide();
        if(opt53=="A"){ $("#wrap_051_of53a_party_identifier,#wrap_052_of53a_identifier_code").show(); }
        else if(opt53=="B"){ $("#wrap_051_of53a_party_identifier,#wrap_053_of53a_location").show(); }
        else if(opt53=="D"){ $("#wrap_051_of53a_party_identifier,#wrap_054_of53a_name_address").show(); }

        // 54a
        let opt54 = $("#_060_of54a_receivers_correspondent").val();
        $("#wrap_061_of54a_party_identifier,#wrap_062_of54a_identifier_code,#wrap_063_of54a_location,#wrap_064_of54a_name_address").hide();
        if(opt54=="A"){ $("#wrap_061_of54a_party_identifier,#wrap_062_of54a_identifier_code").show(); }
        else if(opt54=="B"){ $("#wrap_061_of54a_party_identifier,#wrap_063_of54a_location").show(); }
        else if(opt54=="D"){ $("#wrap_061_of54a_party_identifier,#wrap_064_of54a_name_address").show(); }
    }

    // Bind change events
    $("#_050_of53a_senders_correspondent,#_060_of54a_receivers_correspondent").change(toggleGroups);

    // Initial call
    toggleGroups();
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

