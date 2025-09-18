<%-- 
    Document   : validate_rule_mt701
    Created on : Sep 3, 2025, 11:40:17 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
    (function (global) {
        // ===== HELPERS =====
        const t = v => (v || "").trim();
        const up = v => t(v).toUpperCase();

        // ===== VALIDATOR =====
        global.validateMT701 = function () {
            const E = [];

            // === Mandatory fields ===
            const fieldNames = {
                "#_010_mf27_sequence_of_total": "27 Sequence of Total",
                "#_020_mf20_documentary_credit_number": "20 Documentary Credit Number"
            };
            Object.keys(fieldNames).forEach(id => {
                if (!t($(id).val()))
                    E.push(`${fieldNames[id]} wajib diisi`);
            });

            // FIELD 27 : Sequence of Total
            $("#_010_mf27_sequence_of_total").off("blur").on("blur", function () {
                var val = $(this).val().trim();
                var regex = /^[0-9]{1,3}\/[0-9]{1,3}$/;
                if (val !== "" && regex.test(val)) {
                    var parts = val.split("/");
                    var num = parseInt(parts[0], 10);
                    var total = parseInt(parts[1], 10);
                    if (num > total) {
                        alert("Field 27: nomor urut tidak boleh lebih besar dari total.");
                        $(this).focus();
                    }
                } else if (val !== "") {
                    alert("Field 27 harus format n/nn (contoh: 1/1 atau 2/10).");
                    $(this).focus();
                }
            });

            // FIELD 20 : Documentary Credit Number
            $("#_020_mf20_documentary_credit_number").off("input").on("input", function () {
                var val = $(this).val().toUpperCase();
                val = val.replace(/[^A-Z0-9\/]/g, "").substring(0, 16);
                $(this).val(val);
                if (val.startsWith("/") || val.endsWith("/") || val.includes("//")) {
                    alert("Field 20 tidak boleh diawali/diakhiri '/' atau berisi '//'.");
                    $(this).val(val.replace(/\//g, ""));
                }
            });

            // FIELD 45A : Description of Goods and/or Services
            $("#_030_of45a_description_of_goods_and_or_services").off("input").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 45A maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 46A : Documents Required
            $("#_040_of46a_documents_required").off("input").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 46A maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 47A : Additional Conditions
            $("#_050_of47a_additional_conditions").off("input").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 47A maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 49G : Special Payment Conditions for Beneficiary
            $("#_060_of49g_special_payment_conditions_for_beneficiary").off("input").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 49G maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // FIELD 49H : Special Payment Conditions for Bank Only
            $("#_070_of49h_special_payment_conditions_for_bank_only").off("input").on("input", function () {
                var val = $(this).val();
                if (val.length > 6500) {
                    alert("Field 49H maksimal 6500 karakter.");
                    $(this).val(val.substring(0, 6500));
                }
            });

            // Output
            if (E.length) {
                alert('Mohon perbaiki isian MT701 berikut:\n\n- ' + E.join('\n- '));
                return false;
            }
            return true;
        };
    })(window);
</script>


