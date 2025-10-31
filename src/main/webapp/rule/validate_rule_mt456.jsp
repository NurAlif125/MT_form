<%-- 
    Document   : validate_rule_mt900
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
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //OF52A
                _021_of52a_Identifier_Code: "required",
                _025_of52d_Name_and_Address: "required",
                
                //MF2O
                _040_mf20_Transaction_Reference_Number: "required",
                
                //MF21
                _050_mf21_Related_Reference: "required",
                
                //MF32A
                _060_mf32a_date: "required",
                _061_mf32a_currency: "required",
                _062_mf32a_amount: "required",
                _063_mf32b_currency: "required",
                _064_mf32b_amount: "required",
                //MF33D
                
                _070_mf33d_date: "required",
                _071_mf33d_currency: "required",
                _072_mf33d_amount: "required",
                
                //MF77A
                _090_mf77a_Reason_for_Dishonour: "required",
                
                //MF77A
                _100_mf77d_Details_of_Dishonoured_Item: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                type_Of52_Sender_of_Cash_Letter: {required: "type Of52 harus diisi..!!"},
                _021_of52a_Identifier_Code: {required: "of52a Identifier Code harus diisi..!!"},
                _025_of52d_Name_and_Address: {required: "of52d Name and Address harus diisi..!!"},
                _040_mf20_Transaction_Reference_Number: {required: "mf20 harus diisi..!!"},
                _050_mf21_Related_Reference: {required: "mf21 harus diisi..!!"},
                type_mf32_Date_and_Face_Amount_of_Financial_Document: {required: "type mf32 harus diisi..!!"},
                _060_mf32a_date: {required: "mf32a date harus diisi..!!"},
                _061_mf32a_currency: {required: "mf32a currency harus diisi..!!"},
                _062_mf32a_amount: {required: "mf32a Amount harus diisi..!!"},
                _063_mf32b_currency: {required: "mf32b currency harus diisi..!!"},
                _064_mf32b_amount: {required: "mf32b Amount harus diisi..!!"},
                type_mf33_Total_Amount_Debited: {required: "type mf33 harus diisi..!!"},
                _070_mf33d_date: {required: "mf33d date harus diisi..!!"},
                _071_mf33d_currency: {required: "mf33d Currency harus diisi..!!"},
                _072_mf33d_amount: {required: "mf33d Amount harus diisi..!!"},
                _090_mf77a_Reason_for_Dishonour: {required: "of71b harus diisi..!!"},
                _100_mf77d_Details_of_Dishonoured_Item: {required: "mf77d harus diisi..!!"}
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
    $("#_020_of52a_Party_Identifier").attr("disabled", true);
    $("#_021_of52a_Identifier_Code").attr("disabled", true);
    $("#_022_of52b_Party_Identifier").attr("disabled", true);
    $("#_023_of52b_Location").attr("disabled", true);
    $("#_024_of52d_Party_Identifier").attr("disabled", true);
    $("#_025_of52d_Name_and_Address").attr("disabled", true);
    $("#type_of52_Sender_of_Cash_Letter").change(function () {
        if ($("#type_of52_Sender_of_Cash_Letter").val() == "a") {
            $("#div_of52a_").show();
            $("#div_of52b_").hide();
            $("#div_of52d_").hide();
            $("#_020_of52a_Party_Identifier").attr("disabled", false);
            $("#_021_of52a_Identifier_Code").attr("disabled", false);
            $("#_022_of52b_Party_Identifier").attr("disabled", true);
            $("#_023_of52b_Location").attr("disabled", true);
            $("#_024_of52d_Party_Identifier").attr("disabled", true);
            $("#_025_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#type_of52_Sender_of_Cash_Letter").val() == "b") {
            $("#div_of52a_").hide();
            $("#div_of52b_").show();
            $("#div_of52d_").hide();
            $("#_020_of52a_Party_Identifier").attr("disabled", true);
            $("#_021_of52a_Identifier_Code").attr("disabled", true);
            $("#_022_of52b_Party_Identifier").attr("disabled", false);
            $("#_023_of52b_Location").attr("disabled", false);
            $("#_024_of52d_Party_Identifier").attr("disabled", true);
            $("#_025_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#type_of52_Sender_of_Cash_Letter").val() == "d") {
            $("#div_of52a_").hide();
            $("#div_of52b_").hide();
            $("#div_of52d_").show();
            $("#_020_of52a_Party_Identifier").attr("disabled", true);
            $("#_021_of52a_Identifier_Code").attr("disabled", true);
            $("#_022_of52b_Party_Identifier").attr("disabled", true);
            $("#_023_of52b_Location").attr("disabled", true);
            $("#_024_of52d_Party_Identifier").attr("disabled", false);
            $("#_025_of52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_of52a_").hide();
            $("#div_of52b_").hide();
            $("#div_of52d_").hide();
            $("#_020_of52a_Party_Identifier").attr("disabled", true);
            $("#_021_of52a_Identifier_Code").attr("disabled", true);
            $("#_022_of52b_Party_Identifier").attr("disabled", true);
            $("#_023_of52b_Location").attr("disabled", true);
            $("#_024_of52d_Party_Identifier").attr("disabled", true);
            $("#_025_of52d_Name_and_Address").attr("disabled", true);
        }
    });
    
    //MF32A
    $("#div_mf32a_").hide();
    $("#div_mf32b_").hide();
    $("#_060_mf32a_date").attr("disabled", true);
    $("#_061_mf32a_currency").attr("disabled", true);
    $("#_062_mf32a_amount").attr("disabled", true);
    $("#_063_mf32b_currency").attr("disabled", true);
    $("#_064_mf32b_amount").attr("disabled", true);
    $("#type_mf32a_Date_and_Face_Amount_of_Financial_Document").change(function () {
        if ($("#type_mf32a_Date_and_Face_Amount_of_Financial_Document").val() == "A") {
            $("#div_mf32a_").show();
            $("#div_mf32b_").hide();
            $("#_060_mf32a_date").attr("disabled", false);
            $("#_061_mf32a_currency").attr("disabled", false);
            $("#_062_mf32a_amount").attr("disabled", false);
            $("#_063_mf32b_currency").attr("disabled", true);
            $("#_064_mf32b_amount").attr("disabled", true);
        } else if ($("#type_mf32a_Date_and_Face_Amount_of_Financial_Document").val() == "B") {
            $("#div_mf32a_").hide();
            $("#div_mf32b_").show();
            $("#_060_mf32a_date").attr("disabled", true);
            $("#_061_mf32a_currency").attr("disabled", true);
            $("#_062_mf32a_amount").attr("disabled", true);
            $("#_063_mf32b_currency").attr("disabled", false);
            $("#_064_mf32b_amount").attr("disabled", false);
        } else {
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#_060_mf32a_date").attr("disabled", true);
            $("#_061_mf32a_currency").attr("disabled", true);
            $("#_062_mf32a_amount").attr("disabled", true);
            $("#_063_mf32b_currency").attr("disabled", true);
            $("#_064_mf32b_amount").attr("disabled", true);
        }
    });

    //MF33D
    $("#div_mf33d_").hide();
    $("#_070_mf33d_date").attr("disabled", true);
    $("#_071_mf33d_currency").attr("disabled", true);
    $("#_072_mf33d_amount").attr("disabled", true);
    $("#type_mf33_Total_Amount_Debited").change(function () {
        if ($("#type_mf33_Total_Amount_Debited").val() == "d") {
            $("#div_mf33d_").show();
            $("#_070_mf33d_date").attr("disabled", false);
            $("#_071_mf33d_currency").attr("disabled", false);
            $("#_072_mf33d_amount").attr("disabled", false);
        } else {
            $("#div_mf33d_").hide();
            $("#_070_mf33d_date").attr("disabled", true);
            $("#_071_mf33d_currency").attr("disabled", true);
            $("#_072_mf33d_amount").attr("disabled", true);
        }
    });
});
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {

    //mf52a
    if ($("#_020_of52a_Party_Identifier").val() != "" || $("#_021_of52a_Identifier_Code").val() != "") {
        $("#type_of52_Sender_of_Cash_Letter").val("a").attr("selected", true);
        $("#div_of52a_").show();
        $("#div_of52b_").hide();
        $("#div_of52d_").hide();
        $("#_020_of52a_Party_Identifier").attr("disabled", false);
        $("#_021_of52a_Identifier_Code").attr("disabled", false);
        $("#_022_of52b_Party_Identifier").attr("disabled", true);
        $("#_023_of52b_Location").attr("disabled", true);
        $("#_024_of52d_Party_Identifier").attr("disabled", true);
        $("#_025_of52d_Name_and_Address").attr("disabled", true);
    } else if ($("#_022_of52b_Party_Identifier").val() != "" || $("#_023_of52b_Location").val() != "") {
        $("#type_of52_Sender_of_Cash_Letter").val("b").attr("selected", true);
        $("#div_of52a_").hide();
        $("#div_of52b_").show();
        $("#div_of52d_").hide();
        $("#_020_of52a_Party_Identifier").attr("disabled", true);
        $("#_021_of52a_Identifier_Code").attr("disabled", true);
        $("#_022_of52b_Party_Identifier").attr("disabled", false);
        $("#_023_of52b_Location").attr("disabled", false);
        $("#_024_of52d_Party_Identifier").attr("disabled", true);
        $("#_025_of52d_Name_and_Address").attr("disabled", true);
    } else if ($("#_024_of52d_Party_Identifier").val() != "" || $("#_025_of52d_Name_and_Address").val() != "") {
        $("#type_of52_Sender_of_Cash_Letter").val("d").attr("selected", true);
        $("#div_of52a_").hide();
        $("#div_of52b_").hide();
        $("#div_of52d_").show();
        $("#_020_of52a_Party_Identifier").attr("disabled", true);
        $("#_021_of52a_Identifier_Code").attr("disabled", true);
        $("#_022_of52b_Party_Identifier").attr("disabled", true);
        $("#_023_of52b_Location").attr("disabled", true);
        $("#_024_of52d_Party_Identifier").attr("disabled", false);
        $("#_025_of52d_Name_and_Address").attr("disabled", false);
    } else {
        $("#div_of52a_").hide();
        $("#div_of52b_").hide();
        $("#div_of52d_").hide();
        $("#_020_of52a_Party_Identifier").attr("disabled", true);
        $("#_021_of52a_Identifier_Code").attr("disabled", true);
        $("#_022_of52b_Party_Identifier").attr("disabled", true);
        $("#_023_of52b_Location").attr("disabled", true);
        $("#_024_of52d_Party_Identifier").attr("disabled", true);
        $("#_025_of52d_Name_and_Address").attr("disabled", true);
    }

    //MF32A
    if ($("#_060_mf32a_date").val() != "" || $("#_061_mf32a_currency").val() != "" || $("#_062_mf32a_amount").val() != "") {
        $("#type_mf32a_Date_and_Face_Amount_of_Financial_Document").val("A").attr("selected", true);
        $("#div_mf32a_").show();
        $("#div_mf32b_").hide();
        $("#_060_mf32a_date").attr("disabled", false);
        $("#_061_mf32a_currency").attr("disabled", false);
        $("#_062_mf32a_amount").attr("disabled", false);
        $("#_063_mf32b_currency").attr("disabled", true);
        $("#_064_mf32b_amount").attr("disabled", true);
    } else if ($("#_063_mf32b_currency").val() != "" || $("#_064_mf32b_amount").val() != "") {
        $("#type_mf32a_Date_and_Face_Amount_of_Financial_Document").val("B").attr("selected", true);
        $("#div_mf32a_").hide();
        $("#div_mf32b_").show();
        $("#_060_mf32a_date").attr("disabled", true);
        $("#_061_mf32a_currency").attr("disabled", true);
        $("#_062_mf32a_amount").attr("disabled", true);
        $("#_063_mf32b_currency").attr("disabled", false);
        $("#_064_mf32b_amount").attr("disabled", false);
    } else {
        $("#div_mf32a_").hide();
        $("#div_mf32b_").hide();
        $("#_060_mf32a_date").attr("disabled", true);
        $("#_061_mf32a_currency").attr("disabled", true);
        $("#_062_mf32a_amount").attr("disabled", true);
        $("#_063_mf32b_currency").attr("disabled", true);
        $("#_064_mf32b_amount").attr("disabled", true);
    }

    //MF33D
    if ($("#_070_mf33d_date").val() != "" || $("#_071_mf33d_currency").val() != "" || $("#_072_mf33d_amount").val() != "") {
        $("#type_mf33_Total_Amount_Debited").val("d").attr("selected", true);
        $("#div_mf33d_").show();
        $("#_070_mf33d_date").attr("disabled", false);
        $("#_071_mf33d_currency").attr("disabled", false);
        $("#_072_mf33d_amount").attr("disabled", false);
    } else {
        $("#div_mf33d_").hide();
        $("#_070_mf33d_date").attr("disabled", true);
        $("#_071_mf33d_currency").attr("disabled", true);
        $("#_072_mf33d_amount").attr("disabled", true);
    }
});
</script>