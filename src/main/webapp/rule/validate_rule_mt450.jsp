<%-- 
    Document   : validate_rule_mt450
    Created on : Feb 21, 2024, 2:10:14 PM
    Author     : Ayun
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
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
                
                //MF2O
                _030_mf20_Transaction_Reference_Number: "required",
                
                //MF21
                _040_mf21_Related_Reference: "required",
                
                //MF30
                _050_mf30_date_of_collection: "required",
                
                //MF32A
                _060_mf32a_date: "required",
                _061_mf32a_currency: "required",
                _062_mf32a_amount: "required",
                
                //OF52A,B,D
                _071_of52a_Identifier_Code: "required",
                _073_of52b_Location: "required",
                _075_of52d_Name_and_Address: "required",
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _030_mf20_Transaction_Reference_Number: {required: "mf20 harus diisi..!!"},
                _040_mf21_Related_Reference: {required: "mf21 harus diisi..!!"},
                _050_mf30_date_of_collection: {required: "mf30 Date of Collection harus diisi..!!"},
                _060_mf32a_date: {required: "mf32a date harus diisi..!!"},
                _061_mf32a_currency: {required: "mf32a currency harus diisi..!!"},
                _062_mf32a_amount: {required: "mf32a Amount harus diisi..!!"},
                type_Of52_Sender_of_Cash_Letter: {required: "type Of52 harus diisi..!!"},
                _071_of52a_Identifier_Code: {required: "of52a Identifier Code harus diisi..!!"},
                _073_of52b_Location: {required: "of52b Location harus diisi..!!"},
                _075_of52d_Name_and_Address: {required: "of52d Name and Address harus diisi..!!"},
                
            },
            errorPlacement: function(error,element){
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

<script type="text/javascript">
    $(document).ready(function () {

    //OF52A
    $("#div_of52a_").hide();
    $("#div_of52b_").hide();
    $("#div_of52d_").hide();
    $("#_070_of52a_Party_Identifier").attr("disabled", true);
    $("#_071_of52a_Identifier_Code").attr("disabled", true);
    $("#_072_of52b_Party_Identifier").attr("disabled", true);
    $("#_073_of52b_Location").attr("disabled", true);
    $("#_074_of52d_Party_Identifier").attr("disabled", true);
    $("#_075_of52d_Name_and_Address").attr("disabled", true);
    $("#type_of52_Sender_of_Cash_Letter").change(function () {
        if ($("#type_of52_Sender_of_Cash_Letter").val() == "a") {
            $("#div_of52a_").show();
            $("#div_of52b_").hide();
            $("#div_of52d_").hide();
            $("#_070_of52a_Party_Identifier").attr("disabled", false);
            $("#_071_of52a_Identifier_Code").attr("disabled", false);
            $("#_072_of52b_Party_Identifier").attr("disabled", true);
            $("#_073_of52b_Location").attr("disabled", true);
            $("#_074_of52d_Party_Identifier").attr("disabled", true);
            $("#_075_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#type_of52_Sender_of_Cash_Letter").val() == "b") {
            $("#div_of52a_").hide();
            $("#div_of52b_").show();
            $("#div_of52d_").hide();
            $("#_070_of52a_Party_Identifier").attr("disabled", true);
            $("#_071_of52a_Identifier_Code").attr("disabled", true);
            $("#_072_of52b_Party_Identifier").attr("disabled", false);
            $("#_073_of52b_Location").attr("disabled", false);
            $("#_074_of52d_Party_Identifier").attr("disabled", true);
            $("#_075_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#type_of52_Sender_of_Cash_Letter").val() == "d") {
            $("#div_of52a_").hide();
            $("#div_of52b_").hide();
            $("#div_of52d_").show();
            $("#_070_of52a_Party_Identifier").attr("disabled", true);
            $("#_071_of52a_Identifier_Code").attr("disabled", true);
            $("#_072_of52b_Party_Identifier").attr("disabled", true);
            $("#_073_of52b_Location").attr("disabled", true);
            $("#_074_of52d_Party_Identifier").attr("disabled", false);
            $("#_075_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_of52a_").hide();
            $("#div_of52b_").hide();
            $("#div_of52d_").hide();
            $("#_070_of52a_Party_Identifier").attr("disabled", true);
            $("#_071_of52a_Identifier_Code").attr("disabled", true);
            $("#_072_of52b_Party_Identifier").attr("disabled", true);
            $("#_073_of52b_Location").attr("disabled", true);
            $("#_074_of52d_Party_Identifier").attr("disabled", true);
            $("#_075_of52d_Name_and_Address").attr("disabled", true);
        }
    });
    
});
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {

    //mf52a
    if ($("#_070_of52a_Party_Identifier").val() != "" || $("#_071_of52a_Identifier_Code").val() != "") {
        $("#type_of52_Sender_of_Cash_Letter").val("a").attr("selected", true);
        $("#div_of52a_").show();
        $("#div_of52b_").hide();
        $("#div_of52d_").hide();
        $("#_070_of52a_Party_Identifier").attr("disabled", false);
        $("#_071_of52a_Identifier_Code").attr("disabled", false);
        $("#_072_of52b_Party_Identifier").attr("disabled", true);
        $("#_073_of52b_Location").attr("disabled", true);
        $("#_074_of52d_Party_Identifier").attr("disabled", true);
        $("#_075_of52d_Name_and_Address").attr("disabled", true);
    } else if ($("#_072_of52b_Party_Identifier").val() != "" || $("#_073_of52b_Location").val() != "") {
        $("#type_of52_Sender_of_Cash_Letter").val("b").attr("selected", true);
        $("#div_of52a_").hide();
        $("#div_of52b_").show();
        $("#div_of52d_").hide();
        $("#_070_of52a_Party_Identifier").attr("disabled", true);
        $("#_071_of52a_Identifier_Code").attr("disabled", true);
        $("#_072_of52b_Party_Identifier").attr("disabled", false);
        $("#_073_of52b_Location").attr("disabled", false);
        $("#_074_of52d_Party_Identifier").attr("disabled", true);
        $("#_075_of52d_Name_and_Address").attr("disabled", true);
    } else if ($("#_074_of52d_Party_Identifier").val() != "" || $("#_075_of52d_Name_and_Address").val() != "") {
        $("#type_of52_Sender_of_Cash_Letter").val("d").attr("selected", true);
        $("#div_of52a_").hide();
        $("#div_of52b_").hide();
        $("#div_of52d_").show();
        $("#_070_of52a_Party_Identifier").attr("disabled", true);
        $("#_071_of52a_Identifier_Code").attr("disabled", true);
        $("#_072_of52b_Party_Identifier").attr("disabled", true);
        $("#_073_of52b_Location").attr("disabled", true);
        $("#_074_of52d_Party_Identifier").attr("disabled", false);
        $("#_075_of52d_Name_and_Address").attr("disabled", false);
    } else {
        $("#div_of52a_").hide();
        $("#div_of52b_").hide();
        $("#div_of52d_").hide();
        $("#_070_of52a_Party_Identifier").attr("disabled", true);
        $("#_071_of52a_Identifier_Code").attr("disabled", true);
        $("#_072_of52b_Party_Identifier").attr("disabled", true);
        $("#_073_of52b_Location").attr("disabled", true);
        $("#_074_of52d_Party_Identifier").attr("disabled", true);
        $("#_075_of52d_Name_and_Address").attr("disabled", true);
    }

});
</script>