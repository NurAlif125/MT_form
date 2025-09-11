<%-- 
    Document   : validate_rule_mt708
    Created on : Sep 10, 2025, 10:14:47 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function () {

    // Custom methods

    // YYMMDD date check
    $.validator.addMethod("yymmdd", function(value, element) {
        if (!value) return true;
        if (!/^\d{6}$/.test(value)) return false;
        const yy = parseInt(value.slice(0,2),10);
        const mm = parseInt(value.slice(2,4),10);
        const dd = parseInt(value.slice(4,6),10);
        if (mm<1 || mm>12) return false;
        if (dd<1 || dd>31) return false;
        const thisYear=new Date().getFullYear();
        const century=Math.floor(thisYear/100)*100;
        let fullYear=century+yy;
        if (fullYear-thisYear>10) fullYear-=100;
        const dim=[31,((fullYear%4===0&&fullYear%100!==0)||(fullYear%400===0))?29:28,31,30,31,30,31,31,30,31,30,31];
        return dd<=dim[mm-1];
    }, "Format tanggal YYMMDD tidak valid");

    // T26 Rule: tidak boleh diawali/diakhiri "/" atau mengandung "//"
    $.validator.addMethod("t26Rule", function(value, element) {
        if (!value) return true;
        if (value.startsWith("/") || value.endsWith("/")) return false;
        if (value.indexOf("//") !== -1) return false;
        return true;
    }, "Tidak boleh diawali/diakhiri '/' atau mengandung '//'");

    // Structured narrative check (ADD/DELETE/REPALL)
    $.validator.addMethod("structured", function(value, element) {
        if (!value) return true;
        const lines=value.split(/\r?\n/);
        let repallCount=0, anyOther=false;
        for (let i=0;i<lines.length;i++) {
            const ln=lines[i].trim();
            if (ln.startsWith("/")) {
                const m=ln.match(/^\/([A-Z]{3,6})\//);
                if (!m) return false;
                const code=m[1];
                if (["ADD","DELETE","REPALL"].indexOf(code)===-1) return false;
                if (code==="REPALL") repallCount++; else anyOther=true;
            }
        }
        if (repallCount>1) return false;
        if (repallCount===1 && anyOther) return false;
        return true;
    }, "Structured text tidak valid (kode ADD/DELETE/REPALL, REPALL tidak boleh bercampur)");

    // MF27 rule: n/n format + number range + number ≤ total
    $.validator.addMethod("mf27rule", function(value, element) {
        if (!value) return true;
        const m=value.match(/^(\d{1,3})\/(\d{1,3})$/);
        if (!m) return false;
        const num=parseInt(m[1],10);
        const tot=parseInt(m[2],10);
        if (num<2 || num>8) return false;
        if (num>tot) return false;
        return true;
    }, "MF27 harus format n/n, n antara 2–8, dan n ≤ total");

    // regex helper
    $.validator.addMethod("regex", function(value, element, param){
        return this.optional(element) || param.test(value);
    }, "Format tidak valid");


    // Apply validator
    let validator=$("#form1").validate({
        ignore: [],
        onkeyup: false,
        onfocusout: false,
        rules: {
            // Mandatory
            _010_mf27_sequence_of_total: {required:true, mf27rule:true},
            _020_mf20_sender_reference: {required:true, maxlength:16, t26Rule:true},
            _030_mf21_receiver_reference: {required:true, maxlength:16, t26Rule:true},
            _040_mf23_issuing_bank_reference: {required:true, maxlength:16},
            _050_mf26e_number_of_amendment: {required:true, digits:true, maxlength:3},
            _060_mf30_date_of_amendment: {required:true, yymmdd:true},

            // Optional structured
            _070_of45b_description_goods: {structured:true},
            _080_of46b_documents_required: {structured:true},
            _090_of47b_additional_conditions: {structured:true},
            _100_of49m_special_payment_beneficiary: {structured:true},
            _110_of49n_special_payment_bank: {structured:true}
        },
        messages: {
            _010_mf27_sequence_of_total: {required:"MF27 harus diisi", mf27rule:"Format MF27 tidak valid (contoh 2/3)"},
            _020_mf20_sender_reference: {required:"MF20 harus diisi", maxlength:"Maks 16 karakter", t26Rule:"Format MF20 tidak valid"},
            _030_mf21_receiver_reference: {required:"MF21 harus diisi", maxlength:"Maks 16 karakter", t26Rule:"Format MF21 tidak valid"},
            _040_mf23_issuing_bank_reference: {required:"MF23 harus diisi", maxlength:"Maks 16 karakter"},
            _050_mf26e_number_of_amendment: {required:"MF26E harus diisi", digits:"Harus angka", maxlength:"Maks 3 digit"},
            _060_mf30_date_of_amendment: {required:"MF30 harus diisi", yymmdd:"Harus format YYMMDD yang valid"},

            _070_of45b_description_goods: {structured:"OF45B tidak valid"},
            _080_of46b_documents_required: {structured:"OF46B tidak valid"},
            _090_of47b_additional_conditions: {structured:"OF47B tidak valid"},
            _100_of49m_special_payment_beneficiary: {structured:"OF49M tidak valid"},
            _110_of49n_special_payment_bank: {structured:"OF49N tidak valid"}
        },
        errorPlacement: function(error, element) {
            error.insertAfter(element);
            $("#tab-validate").removeAttr("hidden");
        },
        showErrors: function(errorMap, errorList) {
            this.defaultShowErrors();
            $("#tab-validate").removeAttr("hidden");
            let errorContainer=document.getElementById("error-container");
            if (errorList.length===0){ errorContainer.innerHTML=""; return; }
            let tableHTML="<table border='1' style='width:100%; font-size:8pt; border-collapse:collapse;'><tr><th>Field</th><th>Message</th></tr>";
            errorList.forEach(err=>{
                tableHTML+="<tr><td>"+(err.element.id||"")+"</td><td>"+err.message+"</td></tr>";
            });
            tableHTML+="</table>";
            errorContainer.innerHTML=tableHTML;
        }
    });

    // tombol validate
    $("#btn-validate").click(function(){
        let ok=$("#form1").valid();
        if(ok) alert("Semua input MT708 valid!");
    });

    $("#submit_mt").click(function(e){
        e.preventDefault();
        let mf21=$("#_030_mf21_receiver_reference");
        if(mf21.val().trim()===""){ mf21.val("NONREF"); }
        if($("#form1").valid()) $("#form1").submit();
        else alert("Masih ada error, perbaiki dulu.");
    });

});
</script>
<link rel="stylesheet" type="text/css" href="css/validate.css" />


