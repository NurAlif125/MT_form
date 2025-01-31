<%-- 
    Document   : validate_rule_mt734
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
    $("#form1").validate({
        rules: {
            //header
            //unit: "required",
            sender_logical_terminal: "required",
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
            _010_mf20_Senders_TRN: "required",
            //mf21
            _020_mf21_Presenting_Banks_Reference: "required",
            //mf32a
            _030_mf32a_date: "required",
            _031_mf32a_currency: "required",
            _032_mf32a_amount: "required",
            _080_mf77j_Discrepancies: "required",
            _090_mf77b_Disposal_of_Documents: "required",
            
            //of33a
            type_of33a_Total_Amount_Claimed: {
                required: function(element) {
                  return $("#_040_of73a_Charges_Claimed").val() != "";
                }
            },
            
        },
        messages: {
            sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
            receiver_institution: {required: "receiver_institution harus diisi..!!"},
            priority: {required: "priority harus diisi..!!"},
            _010_mf20_Senders_TRN: {required: "mf20 harus diisi..!!"},
            _020_mf21_Presenting_Banks_Reference: {required: "mf21 harus diisi..!!"},
            _030_mf32a_date: {required: "mf32 date harus diisi..!!"},
            _031_mf32a_currency: {required: "mf32 currency harus diisi..!!"},
            _032_mf32a_amount: {required: "mf32 amount harus diisi..!!"},
            _080_mf77j_Discrepancies: {required: "mf77j discrepancies harus diisi..!!"},
            _090_mf77b_Disposal_of_Documents: {required: "mf77b disposal of documents harus diisi..!!"},
            type_of33a_Total_Amount_Claimed: {required: "of33a harus diisi jika of73a diisi..!!"},
            
        },
        errorPlacement: function(error, element){
            error.insertAfter(element);
            alert(error.html());
        },
        showErrors: function(errorMap, errorList){
            this.defaultShowErrors();
        }
    });
});
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />


<%--javascript_option--%>
<script type="text/javascript">
    $(document).ready(function(){
    //OF33A
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_Date").attr("disabled", true);
    $("#_051_of33a_Currency").attr("disabled", true);
    $("#_052_of33a_Amount").attr("disabled", true);
    $("#_053_of33b_Currency").attr("disabled", true);
    $("#_054_of33b_Amount").attr("disabled", true);
    $("#type_of33a_Total_Amount_Claimed").change(function() {
    if ($("#type_of33a_Total_Amount_Claimed").val() == "A"){
    $("#div_of33a_a_").show();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_Date").attr("disabled", false);
    $("#_051_of33a_Currency").attr("disabled", false);
    $("#_052_of33a_Amount").attr("disabled", false);
    $("#_053_of33b_Currency").attr("disabled", true);
    $("#_054_of33b_Amount").attr("disabled", true);
    } else if ($("#type_of33a_Total_Amount_Claimed").val() == "B"){
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").show();
    $("#_050_of33a_Date").attr("disabled", true);
    $("#_051_of33a_Currency").attr("disabled", true);
    $("#_052_of33a_Amount").attr("disabled", true);
    $("#_053_of33b_Currency").attr("disabled", false);
    $("#_054_of33b_Amount").attr("disabled", false);
    } else{
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_Date").attr("disabled", true);
    $("#_051_of33a_Currency").attr("disabled", true);
    $("#_052_of33a_Amount").attr("disabled", true);
    $("#_053_of33b_Currency").attr("disabled", true);
    $("#_054_of33b_Amount").attr("disabled", true);
    }
    });
    //OF57A
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    $("#type_of57a_Account_With_Bank").change(function() {
    if ($("#type_of57a_Account_With_Bank").val() == "A"){
    $("#div_of57a_a_").show();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", false);
    $("#_061_of57a_Identifier_Code").attr("disabled", false);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#type_of57a_Account_With_Bank").val() == "B"){
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").show();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", false);
    $("#_063_of57b_Location").attr("disabled", false);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#type_of57a_Account_With_Bank").val() == "D"){
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").show();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", false);
    $("#_065_of57d_Name_and_Address").attr("disabled", false);
    } else{
    $("#div_of57a_a").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    }
    });
    });</script>

<%--javascript_edit--%>
<!-- rule view -->
<script language="javascript">
$(document).ready(function(){

    //OF33A
    if ($("#_050_of33a_Date").val() != "" || $("#_051_of33a_Currency").val() != "" || $("#_052_of33a_Amount").val() != ""){
    $("#type_of33_Total_Amount_Claimed").val("A").attr("selected", true);
    $("#div_of33a_a_").show();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_Date").attr("disabled", false);
    $("#_051_of33a_Currency").attr("disabled", false);
    $("#_052_of33a_Amount").attr("disabled", true);
    $("#_053_of33b_Currency").attr("disabled", true);
    $("#_054_of33b_Amount").attr("disabled", true);
    } else if ($("#_053_of33b_Currency").val() != "" || $("#_054_of33b_Amount").val() != ""){
    $("#type_of33_Total_Amount_Claimed").val("B").attr("selected", true);
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").show();
    $("#_050_of33a_Date").attr("disabled", true);
    $("#_051_of33a_Currency").attr("disabled", true);
    $("#_052_of33a_Amount").attr("disabled", true);
    $("#_053_of33b_Currency").attr("disabled", false);
    $("#_054_of33b_Amount").attr("disabled", false);
    } else{
    $("#div_of33a_a_").hide();
    $("#div_of33a_b_").hide();
    $("#_050_of33a_Date").attr("disabled", true);
    $("#_051_of33a_Currency").attr("disabled", true);
    $("#_052_of33a_Amount").attr("disabled", true);
    $("#_053_of33b_Currency").attr("disabled", true);
    $("#_054_of33b_Amount").attr("disabled", true);
    }

    //OF57A
    if ($("#_060_of57a_Party_Identifier").val() != "" || $("#_061_of57a_Identifier_Code").val() != ""){
    $("#type_of57a_Account_With_Bank").val("A").attr("selected", true);
    $("#div_of57a_a_").show();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", false);
    $("#_061_of57a_Identifier_Code").attr("disabled", false);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#_062_of57b_Party_Identifier").val() != "" || $("#_063_of57b_Location").val() != ""){
    $("#type_of57a_Account_With_Bank").val("B").attr("selected", true);
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").show();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", false);
    $("#_063_of57b_Location").attr("disabled", false);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    } else if ($("#_064_of57d_Party_Identifier").val() != "" || $("#_065_of57d_Name_and_Address").val() != ""){
    $("#type_of57a_Account_With_Bank").val("D").attr("selected", true);
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").show();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", false);
    $("#_065_of57d_Name_and_Address").attr("disabled", false);
    } else{
    $("#div_of57a_a_").hide();
    $("#div_of57a_b_").hide();
    $("#div_of57a_d_").hide();
    $("#_060_of57a_Party_Identifier").attr("disabled", true);
    $("#_061_of57a_Identifier_Code").attr("disabled", true);
    $("#_062_of57b_Party_Identifier").attr("disabled", true);
    $("#_063_of57b_Location").attr("disabled", true);
    $("#_064_of57d_Party_Identifier").attr("disabled", true);
    $("#_065_of57d_Name_and_Address").attr("disabled", true);
    }

    });
</script>