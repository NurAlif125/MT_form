<%-- 
    Document   : validate_rule_mt708
    Created on : Sep 10, 2025, 10:14:47 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    $.validator.addMethod("yymmdd", function(value, element) {
        if (!value) return true;
        if (!/^\d{6}$/.test(value)) return false;
        
        const yy = parseInt(value.slice(0, 2), 10);
        const mm = parseInt(value.slice(2, 4), 10);
        const dd = parseInt(value.slice(4, 6), 10);
        
        if (mm < 1 || mm > 12) return false;
        if (dd < 1 || dd > 31) return false;
        
        const thisYear = new Date().getFullYear();
        const century = Math.floor(thisYear / 100) * 100;
        let fullYear = century + yy;
        if (fullYear - thisYear > 10) fullYear -= 100;
        
        const daysInMonth = [31, ((fullYear % 4 === 0 && fullYear % 100 !== 0) || (fullYear % 400 === 0)) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        return dd <= daysInMonth[mm - 1];
    }, "Format tanggal YYMMDD tidak valid");

    $.validator.addMethod("t26Rule", function(value, element) {
        if (!value) return true;
        if (value.startsWith("/") || value.endsWith("/")) return false;
        if (value.indexOf("//") !== -1) return false;
        return true;
    }, "Tidak boleh diawali/diakhiri '/' atau mengandung '//'");

    $.validator.addMethod("mf27rule", function(value, element) {
        if (!value) return true;
        const m = value.match(/^(\d{1,3})\/(\d{1,3})$/);
        if (!m) return false;
        
        const num = parseInt(m[1], 10);
        const tot = parseInt(m[2], 10);
        
        if (num < 2 || num > 8) return false;
        if (tot < 2 || tot > 8) return false;
        if (num > tot) return false;
        
        return true;
    }, "MF27 harus format n/n (2-8), n ≤ total");

    $.validator.addMethod("structured", function(value, element) {
        if (!value) return true;
        
        const lines = value.split(/\r?\n/);
        let repallCount = 0;
        let anyOtherCode = false;
        let hasCode = false;
        
        for (let i = 0; i < lines.length; i++) {
            const ln = lines[i].trim();
            
            if (ln.startsWith("/")) {
                const codeMatch = ln.match(/^\/([A-Z]{3,6})\//);
                if (!codeMatch) return false; 
                
                hasCode = true;
                const code = codeMatch[1];
                
                if (!["ADD", "DELETE", "REPALL"].includes(code)) {
                    return false;
                }
                
                if (code === "REPALL") {
                    repallCount++;
                } else {
                    anyOtherCode = true;
                }
            }
        }
        
        if (repallCount > 1) return false;
        if (repallCount === 1 && anyOtherCode) return false;
        if (!hasCode) return false;
        
        return true;
    }, "Structured text tidak valid (gunakan ADD/DELETE/REPALL, REPALL hanya boleh satu)");

    $.validator.addMethod("regex", function(value, element, param) {
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");


    let validator = $("#form_mt708").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        
        rules: {
            _010_mf27_number: {
                required: true,
                digits: true,
                maxlength: 1,
                min: 2,
                max: 8
            },
            _011_mf27_total: {
                required: true,
                digits: true,
                maxlength: 1,
                min: 2,
                max: 8
            },
            _020_mf20_sender_reference: {
                required: true,
                maxlength: 16,
                t26Rule: true
            },
            _030_mf21_receiver_reference: {
                required: true,
                maxlength: 16,
                t26Rule: true
            },
            _040_mf23_issuing_bank_reference: {
                required: true,
                maxlength: 16
            },
            _050_mf26e_number_of_amendment: {
                required: true,
                digits: true,
                maxlength: 3
            },
            _060_mf30_date_of_amendment: {
                required: true,
                yymmdd: true
            },
            
            _070_of45b_description_of_goods_and_or_services: {
                structured: true
            },
            _080_of46b_documents_required: {
                structured: true
            },
            _090_of47b_additional_conditions: {
                structured: true
            },
            _100_of49m_special_payment_conditions_for_beneficiary: {
                structured: true
            },
            _110_of49n_special_payment_conditions_for_bank_only: {
                structured: true
            }
        },
        
        messages: {
            _010_mf27_number: {
                required: "MF27 Number harus diisi",
                digits: "Harus angka",
                maxlength: "Maks 1 digit",
                min: "Minimal 2",
                max: "Maksimal 8"
            },
            _011_mf27_total: {
                required: "MF27 Total harus diisi",
                digits: "Harus angka",
                maxlength: "Maks 1 digit",
                min: "Minimal 2",
                max: "Maksimal 8"
            },
            
            _020_mf20_sender_reference: {
                required: "MF20 Sender's Reference harus diisi",
                maxlength: "Maks 16 karakter",
                t26Rule: "Format MF20 tidak valid (Error T26)"
            },
            
            _030_mf21_receiver_reference: {
                required: "MF21 Receiver's Reference harus diisi",
                maxlength: "Maks 16 karakter",
                t26Rule: "Format MF21 tidak valid (Error T26)"
            },
            
            _040_mf23_issuing_bank_reference: {
                required: "MF23 Issuing Bank's Reference harus diisi",
                maxlength: "Maks 16 karakter"
            },
            
            _050_mf26e_number_of_amendment: {
                required: "MF26E Number of Amendment harus diisi",
                digits: "Harus angka",
                maxlength: "Maks 3 digit"
            },
            
            _060_mf30_date_of_amendment: {
                required: "MF30 Date of Amendment harus diisi",
                yymmdd: "Format YYMMDD tidak valid (Error T50)"
            },
            
            _070_of45b_description_of_goods_and_or_services: {
                structured: "OF45B structured text tidak valid (Error T67/D06)"
            },
            _080_of46b_documents_required: {
                structured: "OF46B structured text tidak valid (Error T93/D06)"
            },
            _090_of47b_additional_conditions: {
                structured: "OF47B structured text tidak valid (Error T67/D06)"
            },
            _100_of49m_special_payment_conditions_for_beneficiary: {
                structured: "OF49M structured text tidak valid (Error T93/D06)"
            },
            _110_of49n_special_payment_conditions_for_bank_only: {
                structured: "OF49N structured text tidak valid (Error T67/D06)"
            }
        },
        
        errorPlacement: function(error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        
        showErrors: function(errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");
            
            let errorContainer = document.getElementById("error-container");
            
            if (errorList.length === 0) {
                errorContainer.innerHTML = "";
                return;
            }
            
            let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important; border-collapse: collapse; border:1px gray solid;">
                                <tr style="background:#d6d6d6;">
                                <th>Type</th>
                                <th>Location</th>
                                <th>Field</th>
                                <th>Message</th></tr>`;
            
            errorList.forEach(err => {
                let inputID = err.element.id || "";
                let locationTab = err.element.getAttribute("location") || "Body";
                let inputType = err.element.getAttribute("input_type") || "";
                
                tableHTML += '<tr class="error__row" data-input-id="' + inputID + '" content-body="' + locationTab + '" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                tableHTML += '<td style="padding: 5px;">Error</td>';
                tableHTML += '<td style="padding: 5px;">' + locationTab + '</td>';
                tableHTML += '<td style="padding: 5px;">' + inputType + '</td>';
                tableHTML += '<td style="padding: 5px;">' + err.message + '</td></tr>';
            });
            
            tableHTML += `</table>`;
            errorContainer.innerHTML = tableHTML;
            
            document.querySelectorAll(".error__row").forEach(row => {
                row.addEventListener("click", function() {
                    let inputId = this.getAttribute("data-input-id");
                    let tabContentGroup = this.getAttribute("content-body");
                    let input = document.getElementById(inputId);
                    
                    if (input) {
                        if (tabContentGroup === "Body") {
                            $(".tabs li a[rel='view2']").click();
                        }
                        input.focus();
                        input.scrollIntoView({ behavior: "smooth", block: "center" });
                    }
                });
            });
        }
    });

    $("#btn-validate").click(function() {
        let ok = $("#form_mt708").valid();
        if (ok) {
            alert("Semua input MT708 valid!");
        }
    });

    $("#submit_mt708").click(function(e) {
        e.preventDefault();
        
        let mf21 = $("#_030_mf21_receiver_reference");
        if (mf21.val().trim() === "") {
            mf21.val("NONREF");
        }
        
        if ($("#form_mt708").valid()) {
            $("#form_mt708").submit();
        } else {
            alert("Masih ada error, perbaiki dulu.");
        }
    });

});
</script>

<script type="text/javascript">
$(document).ready(function() {
    
    function initializeMF27Display() {
        const num = $("#_010_mf27_number").val();
        const tot = $("#_011_mf27_total").val();
        
        if (num && tot) {
            // MF27 format: number/total
            // This is handled by form submission - just display fields as-is
        }
    }

    function initializeMF21() {
        const mf21 = $("#_030_mf21_receiver_reference");
        if (mf21.val().trim() === "") {
        }
    }

    function initializeStructuredFields() {
        const structuredFields = [
            "_070_of45b_description_of_goods_and_or_services",
            "_080_of46b_documents_required",
            "_090_of47b_additional_conditions",
            "_100_of49m_special_payment_conditions_for_beneficiary",
            "_110_of49n_special_payment_conditions_for_bank_only"
        ];
        
        structuredFields.forEach(id => {
            const field = $("#" + id);
            if (field.val().trim() !== "") {
                field.show();
            }
        });
    }

    initializeMF27Display();
    initializeMF21();
    initializeStructuredFields();

});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />