<%-- 
    Document   : validate_rule_mt900
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
    $(document).ready(function () {
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

                //body
                _010_mf20_Transaction_Reference_Number: "required",

                //mf21
                _020_mf21_Related_Reference: "required",

                //mf25
                _030_mf25_Account_Identification: "required",

                //mf21a
                _040_mf21_Documentary_Credit_Number: "required",

                //mf32a
                _040_mf32a_c_Date: "required",
                _041_mf32a_c_Currency: "required",
                _042_mf32a_c_Amount: "required",
                _043_mf32a_d_Date: "required",
                _044_mf32a_d_Currency: "required",
                _045_mf32a_d_Amount: "required",

                //mF52A
                _051_mf52a_Identifier_Code: "required",
                _053_mf52d_Name_and_Address: "required",
                
                //mf71b
                _060_mf71b_Details_Of_Charges: "required",

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_Transaction_Reference_Number: {required: "mf20 harus diisi..!!"},
                _020_mf21_Related_Reference: {required: "mf21 harus diisi..!!"},
                _030_mf25_Account_Identification: {required: "mf25 harus diisi..!!"},
                type_mf32a_Value_Date_Currency_Code_Amount: {required: "mf32 harus diisi..!!"},
                _040_mf32a_c_Date: {required: "mf32 Date harus diisi..!!"},
                _041_mf32a_c_Currency: {required: "mf32 Currency harus diisi..!!"},
                _042_mf32a_c_Amount: {required: "mf32 Amount harus diisi..!!"},
                _043_mf32a_d_Date: {required: "mf32 Date harus diisi..!!"},
                _044_mf32a_d_Currency: {required: "mf32 Currency harus diisi..!!"},
                _045_mf32a_d_Amount: {required: "mf32 Amount harus diisi..!!"},
                type_of52_Ordering_Institution: {required: "of52 harus diisi..!!"},
                _051_mf52a_Identifier_Code: {required: "mf52 Identifier Code harus diisi..!!"},
                _053_mf52d_Name_and_Address: {required: "mf52 Name and Address harus diisi..!!"},
                _060_mf71b_Details_Of_Charges: {required: "mf71 harus diisi..!!"},
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function () {

        //mf32a
        $("#div_mf32a_c_").hide();
        $("#div_mf32a_d_").hide();
        $("#_040_mf32a_c_Date").attr("disabled", true);
        $("#_041_mf32a_c_Currency").attr("disabled", true);
        $("#_042_mf32a_c_Amount").attr("disabled", true);
        $("#_043_mf32a_d_Date").attr("disabled", true);
        $("#_044_mf32a_d_Currency").attr("disabled", true);
        $("#_045_mf32a_d_Amount").attr("disabled", true);
        $("#type_mf32a_Value_Date_Currency_Code_Amount").change(function () {
            if ($("#type_mf32a_Value_Date_Currency_Code_Amount").val() == "C") {
                $("#div_mf32a_c_").show();
                $("#div_mf32a_d_").hide();
                $("#_040_mf32a_c_Date").attr("disabled", false);
                $("#_041_mf32a_c_Currency").attr("disabled", false);
                $("#_042_mf32a_c_Amount").attr("disabled", false);
                $("#_043_mf32a_d_Date").attr("disabled", true);
                $("#_044_mf32a_d_Currency").attr("disabled", true);
                $("#_045_mf32a_d_Amount").attr("disabled", true);
            } else if ($("#type_mf32a_Value_Date_Currency_Code_Amount").val() == "D") {
                $("#div_mf32a_c_").hide();
                $("#div_mf32a_d_").show();
                $("#_040_mf32a_c_Date").attr("disabled", true);
                $("#_041_mf32a_c_Currency").attr("disabled", true);
                $("#_042_mf32a_c_Amount").attr("disabled", true);
                $("#_043_mf32a_d_Date").attr("disabled", false);
                $("#_044_mf32a_d_Currency").attr("disabled", false);
                $("#_045_mf32a_d_Amount").attr("disabled", false);
            } else {
                $("#div_mf32a_c_").hide();
                $("#div_mf32a_d_").hide();
                $("#_040_mf32a_c_Date").attr("disabled", true);
                $("#_041_mf32a_c_Currency").attr("disabled", true);
                $("#_042_mf32a_c_Amount").attr("disabled", true);
                $("#_043_mf32a_d_Date").attr("disabled", true);
                $("#_044_mf32a_d_Currency").attr("disabled", true);
                $("#_045_mf32a_d_Amount").attr("disabled", true);
            }
        });

        //mf52a
        $("#div_mf52a_").hide();
        $("#div_mf52d_").hide();
        $("#_050_mf52a_Party_Identifier").attr("disabled", true);
        $("#_051_mf52a_Identifier_Code").attr("disabled", true);
        $("#_052_mf52d_Party_Identifier").attr("disabled", true);
        $("#_053_mf52d_Name_and_Address").attr("disabled", true);
        $("#type_mf52_Ordering_Institution").change(function () {
            if ($("#type_mf52_Ordering_Institution").val() == "A") {
                $("#div_mf52a_").show();
                $("#div_mf52d_").hide();
                $("#_050_mf52a_Party_Identifier").attr("disabled", false);
                $("#_051_mf52a_Identifier_Code").attr("disabled", false);
                $("#_052_mf52d_Party_Identifier").attr("disabled", true);
                $("#_053_mf52d_Name_and_Address").attr("disabled", true);
            } else if ($("#type_mf52_Ordering_Institution").val() == "D") {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").show();
                $("#_050_mf52a_Party_Identifier").attr("disabled", true);
                $("#_051_mf52a_Identifier_Code").attr("disabled", true);
                $("#_052_mf52d_Party_Identifier").attr("disabled", false);
                $("#_053_mf52d_Name_and_Address").attr("disabled", false);
            } else {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").hide();
                $("#_050_mf52a_Party_Identifier").attr("disabled", true);
                $("#_051_mf52a_Identifier_Code").attr("disabled", true);
                $("#_052_mf52d_Party_Identifier").attr("disabled", true);
                $("#_053_mf52d_Name_and_Address").attr("disabled", true);
            }
        });
    });
</script>

<%--javascript_edit--%>
<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {
        //mf32a
        if ($("#_040_mf32a_c_Date").val() != "" || $("#_041_mf32a_c_Currency").val() != "" || $("#_042_mf32a_c_Amount").val() != "") {
            $("#type_mf32a_Value_Date_Currency_Code_Amount").val("C").attr("selected", true);
            $("#div_mf32a_c_").show();
            $("#div_mf32a_d_").hide();
            $("#_040_mf32a_c_Date").attr("disabled", false);
            $("#_041_mf32a_c_Currency").attr("disabled", false);
            $("#_042_mf32a_c_Amount").attr("disabled", false);
            $("#_043_mf32a_d_Date").attr("disabled", true);
            $("#_044_mf32a_d_Currency").attr("disabled", true);
            $("#_045_mf32a_d_Amount").attr("disabled", true);
        } else if ($("#_043_mf32a_d_Date").val() != "" || $("#_044_mf32a_d_Currency").val() != "") || $("#_045_mf32a_d_Amount").val() != "") {
            $("#type_mf32a_Value_Date_Currency_Code_Amount").val("D").attr("selected", true);
            $("#div_mf32a_c_").hide();
            $("#div_mf32a_d_").show();
            $("#_040_mf32a_c_Date").attr("disabled", true);
            $("#_041_mf32a_c_Currency").attr("disabled", true);
            $("#_042_mf32a_c_Amount").attr("disabled", true);
            $("#_043_mf32a_d_Date").attr("disabled", false);
            $("#_044_mf32a_d_Currency").attr("disabled", false);
            $("#_045_mf32a_d_Amount").attr("disabled", false);
        } else {
            $("#div_mf32a_c_").hide();
            $("#div_mf32a_d_").hide();
            $("#_040_mf32a_c_Date").attr("disabled", true);
            $("#_041_mf32a_c_Currency").attr("disabled", true);
            $("#_042_mf32a_c_Amount").attr("disabled", true);
            $("#_043_mf32a_d_Date").attr("disabled", true);
            $("#_044_mf32a_d_Currency").attr("disabled", true);
            $("#_045_mf32a_d_Amount").attr("disabled", true);
        }

        //mf52a
        if ($("#_050_mf52a_Party_Identifier").val() != "" || $("#_051_mf52a_Identifier_Code").val() != "") {
            $("#type_mf52_Ordering_Institution").val("A").attr("selected", true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_050_mf52a_Party_Identifier").attr("disabled", false);
            $("#_051_mf52a_Identifier_Code").attr("disabled", false);
            $("#_052_mf52d_Party_Identifier").attr("disabled", true);
            $("#_053_mf52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_053_mf52d_Name_and_Address").val() != "" || $("#_052_mf52d_Party_Identifier").val() != "") {
            $("#type_mf52_Ordering_Institution").val("D").attr("selected", true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_050_mf52a_Party_Identifier").attr("disabled", false);
            $("#_051_mf52a_Identifier_Code").attr("disabled", false);
            $("#_052_mf52d_Party_Identifier").attr("disabled", true);
            $("#_053_mf52d_Name_and_Address").attr("disabled", true);
        } else {
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_050_mf52a_Party_Identifier").attr("disabled", false);
            $("#_051_mf52a_Identifier_Code").attr("disabled", false);
            $("#_052_mf52d_Party_Identifier").attr("disabled", true);
            $("#_053_mf52d_Name_and_Address").attr("disabled", true);
        }

      
    });
</script>