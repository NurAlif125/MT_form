<%-- 
    Document   : validate_rule_mt740
    Created on : Sep 15, 2025, 11:08:56 AM
    Author     : mslam
--%>
    
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(document).ready(function () {
        /* ===================== Custom Validator Methods ===================== */
        $.validator.addMethod("regex", function(value, element, param) {
            return this.optional(element) || param.test(value);
        }, "Format tidak valid");

        $.validator.addMethod("yymmdd", function(value, element) {
            if (this.optional(element)) return true;
            if (!/^\d{6}$/.test(value)) return false;
            let yy = parseInt(value.substr(0,2),10);
            let mm = parseInt(value.substr(2,2),10);
            let dd = parseInt(value.substr(4,2),10);
            if (mm < 1 || mm > 12) return false;
            let dim = [31, (yy % 4 === 0 ? 29 : 28),31,30,31,30,31,31,30,31,30,31];
            return dd <= dim[mm-1];
        }, "Format tanggal harus YYMMDD");

        $.validator.addMethod("bic", function(value, element) {
            return this.optional(element) || /^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$/.test(value);
        }, "Format BIC tidak valid");

        $.validator.addMethod("currency", function(value, element) {
            return this.optional(element) || /^[A-Z]{3}$/.test(value);
        }, "Mata uang harus 3 huruf ISO");

        $.validator.addMethod("swiftAmount", function(value, element) {
            return this.optional(element) || /^\d+(,\d{2})?$/.test(value);
        }, "Format jumlah salah, gunakan n,dd (misal: 1000,00)");

        $.validator.addMethod("pct", function(value, element) {
            if (this.optional(element)) return true;
            if (!/^\d{1,2}$/.test(value)) return false;
            let n = parseInt(value, 10);
            return n >= 0 && n <= 99;
        }, "Persentase harus 0–99");
        
        $.validator.addMethod("dc20", function(value, element) {
            return this.optional(element) || (!/^\/|\/$/.test(value) && !/\/\//.test(value));
        }, "Field 20 tidak boleh diawali/diakhiri '/' atau mengandung '//'");

        $.validator.addMethod("code40f", function(value, element) {
            return this.optional(element) || /^(NOTURR|URR LATEST VERSION)$/.test(value);
        }, "40F hanya boleh NOTURR atau URR LATEST VERSION");

        $.validator.addMethod("code41a", function(value, element) {
            return this.optional(element) || /^(BY ACCEPTANCE|BY DEF PAYMENT|BY MIXED PYMT|BY NEGOTIATION|BY PAYMENT)$/.test(value);
        }, "41a Code tidak valid");

        $.validator.addMethod("code71a", function(value, element) {
            return this.optional(element) || /^(CLM|OUR)$/.test(value);
        }, "71A hanya boleh CLM atau OUR");

        /* ===================== Validator Setup ===================== */
        let validator = $("#form1").validate({
            ignore: [],
            onkeyup: false,
            onfocusout: false,
            rules: {
                /* Header */
                sender_logical_terminal: "required",
                receiver_institution: "required",
                priority: "required",

                /* Body - mandatory core */
                _010_mf20_documentary_credit_number: "required",
                _030_mf40f_applicable_rules: "required",
                _040_of31d_date_of_expiry: { yymmdd: true },
                _070_mf32b_currency: { required:true, currency:true },
                _071_mf32b_amount: { required:true, swiftAmount:true },
                _100_mf41a_available_with_by: { required:true },
                _101_mf41a_identifier_code: { bic:true },
                _102_mf41a_name_address: {},
                _103_mf41a_code: { required:true, code41a:true },

                /* 39A Tolerance */
                _080_of39a_plus: { pct:true },
                _081_of39a_minus: { pct:true },

                /* 58a Negotiating Bank */
                _052_of58a_identifier_code: { bic:true },

                /* 42a Drawee */
                _121_of42a_identifier_code: { bic:true },

                /* 59 Beneficiary */
                _060_of59_account: {},
                _061_of59_name_address: {}
            },
            messages: {
                sender_logical_terminal: {required: "Sender LT harus diisi..!!"},
                receiver_institution: {required: "Receiver Institution harus diisi..!!"},
                priority: {required: "Priority harus diisi..!!"},
                _010_mf20_documentary_credit_number: {required: "Documentary Credit Number (20) harus diisi..!!"},
                _030_mf40f_applicable_rules: {required: "Applicable Rules (40F) harus diisi..!!"},
                _040_of31d_date_of_expiry: {yymmdd: "Tanggal Expiry salah, gunakan YYMMDD"},
                _070_mf32b_currency: {
                    required:"Currency (32B) harus diisi..!!",
                    currency:"Gunakan kode mata uang ISO (3 huruf)"
                },
                _071_mf32b_amount: {
                    required:"Amount (32B) harus diisi..!!",
                    swiftAmount:"Format amount salah, gunakan n,dd (misal: 1000,00)"
                },
                _080_of39a_plus: {pct:"Plus tolerance harus 0–99"},
                _081_of39a_minus: {pct:"Minus tolerance harus 0–99"},
                _052_of58a_identifier_code: {bic:"BIC Negotiating Bank salah"},
                _100_mf41a_available_with_by: { required:"Available With (41a) harus dipilih..!!" },
                _101_mf41a_identifier_code: {bic:"BIC Available With salah"},
                _103_mf41a_code: { required:"Code (41a) harus diisi..!!" },
                _121_of42a_identifier_code: {bic:"BIC Drawee salah"},
                _060_of59_account: {required:"Account (59) harus diisi"},
                _061_of59_name_address: {required:"Beneficiary Name/Address (59) harus diisi"}
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

                $('#tab-view1, #tab-view2, #tab-view3, #tab-view4, #tab-view5, #tab-view6, #tab-view7').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                if (errorList.length === 0) {
                    errorContainer.innerHTML = "";
                    return;
                }

                let tableHTML = `<table border="0" style="width:100% !important; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                    <tr style="background:#d6d6d6;">
                                    <th>Type</th><th>Location</th><th>Node</th><th>Message</th></tr>`;
                errorList.forEach(errors => {
                    let inputID = errors.element.id || "";
                    let locationTab = errors.element.getAttribute("location") || "Body";
                    let inputType = errors.element.getAttribute("input_type") || "";

                    tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" style="cursor:pointer;">';
                    tableHTML += '<td>Error</td>';
                    tableHTML += '<td>'+locationTab+'</td>';
                    tableHTML += '<td>'+inputType+'</td>';
                    tableHTML += '<td>'+errors.message+'</td></tr>';
                });
                tableHTML += `</table>`;
                errorContainer.innerHTML = tableHTML;

                document.querySelectorAll(".error__row").forEach(row => {
                    row.addEventListener("click", function (event) {
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").hide();
                                $("#view1").show();
                                $('#tab-view1').addClass("selected");
                            } else {
                                $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").hide();
                                $("#view2").show();
                                $('#tab-view2').addClass("selected");
                            }
                            input.focus();
                        }
                    });
                });
            }
        });


        /* ===================== Extra Logic ===================== */
        // toggle beneficiary (59)
        $("#check_of59").hide();
        $("#_060_of59_account").prop("required", false).prop("disabled", true);
        $("#_061_of59_name_address").prop("required", false).prop("disabled", true);

        $("#beneficiary_checkbox").click(function (){
            if($(this).is(":checked")){
                $("#check_of59").show();
                $("#_060_of59_account").prop("required", true).prop("disabled", false);
                $("#_061_of59_name_address").prop("required", true).prop("disabled", false);
            }else {
                $("#check_of59").hide();
                $("#_060_of59_account").prop("required", false).prop("disabled", true);
                $("#_061_of59_name_address").prop("required", false).prop("disabled", true);
            }
        });

        // toggle option fields (58a, 41a, 42a)
        function toggle58a(){
            let opt = $("#_050_of58a_negotiating_bank").val();
            if(opt === "A"){
                $("#wrap_051_of58a_party_identifier").show();
                $("#wrap_052_of58a_identifier_code").show().prop("disabled", false);
                $("#wrap_053_of58a_name_address").hide();
            } else if(opt === "D"){
                $("#wrap_051_of58a_party_identifier").show();
                $("#wrap_052_of58a_identifier_code").hide().prop("disabled", true);
                $("#wrap_053_of58a_name_address").show();
            } else {
                $("#wrap_051_of58a_party_identifier, #wrap_052_of58a_identifier_code, #wrap_053_of58a_name_address").hide();
            }
        }
        function toggle41a(){
            let opt = $("#_100_mf41a_available_with_by").val();
            if(opt === "A"){
                $("#wrap_101_mf41a_identifier_code").show().prop("disabled", false);
                $("#wrap_102_mf41a_name_address").hide();
                $("#wrap_103_mf41a_code").show();
            } else if(opt === "D"){
                $("#wrap_101_mf41a_identifier_code").hide().prop("disabled", true);
                $("#wrap_102_mf41a_name_address").show();
                $("#wrap_103_mf41a_code").show();
            } else {
                $("#wrap_101_mf41a_identifier_code, #wrap_102_mf41a_name_address, #wrap_103_mf41a_code").hide();
            }
        }
        function toggle42a(){
            let opt = $("#_120_of42a_drawee").val();
            if(opt === "A"){
                $("#wrap_121_of42a_identifier_code").show().prop("disabled", false);
                $("#wrap_122_of42a_name_address").hide();
            } else if(opt === "D"){
                $("#wrap_121_of42a_identifier_code").hide().prop("disabled", true);
                $("#wrap_122_of42a_name_address").show();
            } else {
                $("#wrap_121_of42a_identifier_code, #wrap_122_of42a_name_address").hide();
            }
        }
        $("#_050_of58a_negotiating_bank").change(toggle58a);
        $("#_100_mf41a_available_with_by").change(toggle41a);
        $("#_120_of42a_drawee").change(toggle42a);

        toggle58a();
        toggle41a();
        toggle42a();


        /* ===================== Submit Events ===================== */
        $("#btn-validate, #submit_mt").click(function(e) {
            if(e.type==="click") e.preventDefault();
            let v = $("#form1").valid();

            // C3: Either 58a or 59, not both
            let has58a = $("#_050_of58a_negotiating_bank").val() !== "";
            let has59 = $("#beneficiary_checkbox").is(":checked");
            if(has58a && has59){
                v=false;
                alert("C3 Violation: Either 58a or 59 may be present, not both.");
            }

            // C1 & C2
            let has42C = $("#_110_of42c_drafts_at").val().trim()!=="";
            let has42a = $("#_120_of42a_drawee").val()!=="";
            let has42M = $("#_130_of42m_mixed_payment_details").val().trim()!=="";
            let has42P = $("#_140_of42p_negotiation_deferred_payment_details").val().trim()!=="";

            if(has42C && !has42a){
                v=false;
                alert("C1 Violation: If 42C is present, 42a must also be present.");
            }

            let combo = [has42C||has42a, has42M, has42P].filter(Boolean).length;
            if(combo>1){
                v=false;
                alert("C2 Violation: Only one of [(42C+42a), 42M, 42P] allowed.");
            }

            if(v && e.target.id==="submit_mt") $("#form1").submit();
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

