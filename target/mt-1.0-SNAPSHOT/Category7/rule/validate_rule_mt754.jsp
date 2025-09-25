<%-- 
    Document   : validate_rule_mt754
    Created on : Sep 24, 2025, 10:44:41 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {
    let validator = $("#form_mt754").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // --- Header ---
            sender_logical_terminal: "required",
            receiver_institution: "required",
            priority: "required",

            // --- Mandatory Body ---
            _010_mf20_sender_reference: {required:true, regex:/^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/},
            _020_mf21_related_reference: {required:true, regex:/^(?!\/)(?!.*\/\/)(?!.*\/$).{1,16}$/},

            // --- 32a Principal Amount (Option A or B) ---
            _030_mf32a_principal_amount_paid_accepted_negotiated: "required",
            _031_mf32a_date: {required:function(){return $("#_030_mf32a_principal_amount_paid_accepted_negotiated").val()=="A";}, regex:/^\d{6}$/},
            _032_mf32a_currency: {required:true, regex:/^[A-Z]{3}$/},
            _033_mf32a_amount: {required:true, regex:/^\d+(,\d{1,2})?$/},

            // --- 34a Total Amount Claimed (Option A or B) ---
            _070_of34a_total_amount_claimed: "required",
            _071_of34a_date: {required:function(){return $("#_070_of34a_total_amount_claimed").val()=="A";}, regex:/^\d{6}$/},
            _072_of34a_currency: {required:true, regex:/^[A-Z]{3}$/},
            _073_of34a_amount: {required:true, regex:/^\d+(,\d{1,2})?$/},

            // --- 53a Reimbursing Bank ---
            _080_of53a_reimbursing_bank: {regex:/^[ABD]?$/},
            _082_of53a_identifier_code: {regex:/^[A-Z0-9]{8}([A-Z0-9]{3})?$/},
            _083_of53a_location: {maxlength:35},
            _084_of53a_name_address: {maxlength:140},

            // --- 57a Account With Bank ---
            _090_of57a_account_with_bank: {regex:/^[ABD]?$/},
            _092_of57a_identifier_code: {regex:/^[A-Z0-9]{8}([A-Z0-9]{3})?$/},
            _093_of57a_location: {maxlength:35},
            _094_of57a_name_address: {maxlength:140},

            // --- 58a Beneficiary Bank ---
            _100_of58a_beneficiary_bank: {regex:/^[AD]?$/},
            _102_of58a_identifier_code: {regex:/^[A-Z0-9]{8}([A-Z0-9]{3})?$/},
            _103_of58a_name_address: {maxlength:140},

            // --- 72Z / 77 ---
            _110_of72z_sender_to_receiver_information: {maxlength:8000},
            _120_of77_narrative: {maxlength:1750}
        },
        messages: {
            sender_logical_terminal: {required:"Sender Logical Terminal wajib."},
            receiver_institution: {required:"Receiver Institution wajib."},
            priority: {required:"Priority wajib."},

            _010_mf20_sender_reference: {required:"Field 20 wajib.", regex:"Format Field 20 tidak valid."},
            _020_mf21_related_reference: {required:"Field 21 wajib.", regex:"Format Field 21 tidak valid."},

            _030_mf32a_principal_amount_paid_accepted_negotiated: {required:"Option 32a harus dipilih."},
            _031_mf32a_date: {required:"Tanggal 32a wajib untuk Option A.", regex:"Format YYMMDD."},
            _032_mf32a_currency: {required:"Currency 32a wajib.", regex:"Harus 3 huruf ISO."},
            _033_mf32a_amount: {required:"Amount 32a wajib.", regex:"Format amount tidak valid."},

            _070_of34a_total_amount_claimed: {required:"Option 34a harus dipilih."},
            _071_of34a_date: {required:"Tanggal 34a wajib untuk Option A.", regex:"Format YYMMDD."},
            _072_of34a_currency: {required:"Currency 34a wajib.", regex:"Harus 3 huruf ISO."},
            _073_of34a_amount: {required:"Amount 34a wajib.", regex:"Format amount tidak valid."},

            _082_of53a_identifier_code: {regex:"BIC 53a tidak valid."},
            _092_of57a_identifier_code: {regex:"BIC 57a tidak valid."},
            _102_of58a_identifier_code: {regex:"BIC 58a tidak valid."}
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

    // --- Custom regex ---
    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");

    // --- Extra Checks (pedoman SWIFT) ---
    function extraChecks(){
        let f72 = $("#_110_of72z_sender_to_receiver_information").val().trim();
        let f77 = $("#_120_of77_narrative").val().trim();
        if(f72!=="" && f77!==""){ alert("C1: Hanya salah satu 72Z atau 77 boleh diisi."); return false; }

        let f53 = $("#_080_of53a_reimbursing_bank").val();
        let f57 = $("#_090_of57a_account_with_bank").val();
        if(f53 && f57){ alert("C2: Hanya salah satu 53a atau 57a boleh diisi."); return false; }

        let c32 = $("#_032_mf32a_currency").val();
        let c34 = $("#_072_of34a_currency").val();
        if(c32 && c34 && c32!==c34){ alert("C3: Currency 32a dan 34a harus sama."); return false; }

        // --- Tambahan pedoman: jika 33B ada dan currency ≠ 32a, harus ada penjelasan di 72Z atau 77 ---
        let c33 = $("#_040_of33b_currency").val();
        if(c33 && c32 && c33!==c32){
            if(f72==="" && f77===""){
                alert("Rule: Jika 33B currency berbeda dengan 32a, wajib ada penjelasan di 72Z atau 77.");
                return false;
            }
        }

        return true;
    }

    // --- Button validate ---
    $("#btn-validate").click(function () {
        if($("#form_mt754").valid() && extraChecks()){ alert("Semua input valid!"); }
    });

    // --- Button submit ---
    $("#submit_mt").click(function (e) {
        e.preventDefault();
        if($("#form_mt754").valid() && extraChecks()){
            $("#form_mt754").submit();
        } else {
            alert("Masih ada error. Periksa kembali!");
        }
    });

    // --- Toggle groups ---
    function toggleGroups(){
        // 32a
        if($("#_030_mf32a_principal_amount_paid_accepted_negotiated").val()=="A"){ $("#wrap_031_mf32a_date").show(); }
        else { $("#wrap_031_mf32a_date").hide(); }

        // 34a
        if($("#_070_of34a_total_amount_claimed").val()=="A"){ $("#wrap_071_of34a_date").show(); }
        else { $("#wrap_071_of34a_date").hide(); }

        // 53a
        let opt53 = $("#_080_of53a_reimbursing_bank").val();
        $("#wrap_081_of53a_party_identifier,#wrap_082_of53a_identifier_code,#wrap_083_of53a_location,#wrap_084_of53a_name_address").hide();
        if(opt53=="A"){ $("#wrap_081_of53a_party_identifier,#wrap_082_of53a_identifier_code").show(); }
        else if(opt53=="B"){ $("#wrap_081_of53a_party_identifier,#wrap_083_of53a_location").show(); }
        else if(opt53=="D"){ $("#wrap_081_of53a_party_identifier,#wrap_084_of53a_name_address").show(); }

        // 57a
        let opt57 = $("#_090_of57a_account_with_bank").val();
        $("#wrap_091_of57a_party_identifier,#wrap_092_of57a_identifier_code,#wrap_093_of57a_location,#wrap_094_of57a_name_address").hide();
        if(opt57=="A"){ $("#wrap_091_of57a_party_identifier,#wrap_092_of57a_identifier_code").show(); }
        else if(opt57=="B"){ $("#wrap_091_of57a_party_identifier,#wrap_093_of57a_location").show(); }
        else if(opt57=="D"){ $("#wrap_091_of57a_party_identifier,#wrap_094_of57a_name_address").show(); }

        // 58a
        let opt58 = $("#_100_of58a_beneficiary_bank").val();
        $("#wrap_101_of58a_party_identifier,#wrap_102_of58a_identifier_code,#wrap_103_of58a_name_address").hide();
        if(opt58=="A"){ $("#wrap_101_of58a_party_identifier,#wrap_102_of58a_identifier_code").show(); }
        else if(opt58=="D"){ $("#wrap_101_of58a_party_identifier,#wrap_103_of58a_name_address").show(); }
    }

    // Bind change events
    $("#_030_mf32a_principal_amount_paid_accepted_negotiated,#_070_of34a_total_amount_claimed,#_080_of53a_reimbursing_bank,#_090_of57a_account_with_bank,#_100_of58a_beneficiary_bank").change(toggleGroups);

    // Initial call
    toggleGroups();
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
