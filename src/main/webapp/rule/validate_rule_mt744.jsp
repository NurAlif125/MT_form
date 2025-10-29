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
                _010_mf20_Senders_Reference: "required",

                //mf21
                _020_mf21_Claiming_Banks_Reference: "required",

                //mf52a
                type_mf52_Issuing_Bank: "required",
                _031_mf52a_Identifier_Code: "required",
                _033_mf52d_Name_and_Address: "required",

                //mf21a
                _040_mf21a_Documentary_Credit_Number: "required",

                //mf34a
                type_mf34a_Total_Amount_Claimed: "required",
                _060_mf34a_Date: "required",
                _061_mf34a_Currency: "required",
                _062_mf34a_Amount: "required",
                _063_mf34b_Currency: "required",
                _064_mf34b_Amount: "required",

                //mf73r
                type_mf73_Reason_for_Non_Payment: "required",
                _070_mf73r_Code: "required",
                _071_mf73r_Narrative: "required",

                //mf73s
                type_mf73_Disposal_of_Reimbursement_Claim: "required",
                _080_mf73s_Code: "required",
                _081_mf73s_Narrative: "required",

                //of57
                _091_of57a_identifier_code: "required",
                _095_of57d_Name_And_Address: "required",

                //of58
                _101_of58a_identifier_code: "required",
                _013_of58d_Name_And_Address: "required",

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_Senders_Reference: {required: "mf20 harus diisi..!!"},
                _020_mf21_Claiming_Banks_Reference: {required: "mf21 harus diisi..!!"},
                type_mf52_Issuing_Bank: {required: "mf52 harus diisi..!!"},
                _031_mf52a_Identifier_Code: {required: "mf52 Identifier Code harus diisi..!!"},
                _033_mf52d_Name_and_Address: {required: "mf52 Name and Address harus diisi..!!"},
                _040_mf21a_Documentary_Credit_Number: {required: "mf21a harus diisi..!!"},
                type_mf34a_Total_Amount_Claimed: {required: "mf34a harus diisi..!!"},
                _060_mf34a_Date: {required: "mf34 Date harus diisi..!!"},
                _061_mf34a_Currency: {required: "mf34 Currency harus diisi..!!"},
                _062_mf34a_Amount: {required: "mf34 Amount harus diisi..!!"},
                _063_mf34b_Currency: {required: "mf34 Currency harus diisi..!!"},
                _064_mf34b_Amount: {required: "mf34 Amount harus diisi..!!"},
                type_mf73_Reason_for_Non_Payment: {required: "mf73R Reason for Non-Payment harus diisi..!!"},
                _070_mf73r_Code: {required: "mf73 Code harus diisi..!!"},
                _071_mf73r_Narrative: {required: "mf73 Narrative harus diisi..!!"},
                type_mf73_Disposal_of_Reimbursement_Claim: {required: "mf73S Disposal of Reimbursement Claim harus diisi..!!"},
                _080_mf73s_Code: {required: "mf73 Code harus diisi..!!"},
                _081_mf73s_Narrative: {required: "mf73 Narrative harus diisi..!!"},
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

        //mf52a
        $("#div_mf52a_").hide();
        $("#div_mf52d_").hide();
        $("#_030_mf52a_Party_Identifier").attr("disabled", true);
        $("#_031_mf52a_Identifier_Code").attr("disabled", true);
        $("#_032_mf52d_Party_Identifier").attr("disabled", true);
        $("#_033_mf52d_Name_and_Address").attr("disabled", true);
        $("#type_mf52_Issuing_Bank").change(function () {
            if ($("#type_mf52_Issuing_Bank").val() == "a") {
                $("#div_mf52a_").show();
                $("#div_mf52d_").hide();
                $("#_030_mf52a_Party_Identifier").attr("disabled", false);
                $("#_031_mf52a_Identifier_Code").attr("disabled", false);
                $("#_032_mf52d_Party_Identifier").attr("disabled", true);
                $("#_033_mf52d_Name_and_Address").attr("disabled", true);
            } else if ($("#type_mf52_Issuing_Bank").val() == "d") {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").show();
                $("#_030_mf52a_Party_Identifier").attr("disabled", true);
                $("#_031_mf52a_Identifier_Code").attr("disabled", true);
                $("#_032_mf52d_Party_Identifier").attr("disabled", false);
                $("#_033_mf52d_Name_and_Address").attr("disabled", false);
            } else {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").hide();
                $("#_030_mf52a_Party_Identifier").attr("disabled", true);
                $("#_031_mf52a_Identifier_Code").attr("disabled", true);
                $("#_032_mf52d_Party_Identifier").attr("disabled", true);
                $("#_033_mf52d_Name_and_Address").attr("disabled", true);
            }
        });

        //mf34a
        $("#div_mf34a_a_").hide();
        $("#div_mf34a_b_").hide();
        $("#_060_mf34a_Date").attr("disabled", true);
        $("#_061_mf34a_Currency").attr("disabled", true);
        $("#_062_mf34a_Amount").attr("disabled", true);
        $("#_063_mf34b_Currency").attr("disabled", true);
        $("#_064_mf34b_Amount").attr("disabled", true);
        $("#type_mf34a_Total_Amount_Claimed").change(function () {
            if ($("#type_mf34a_Total_Amount_Claimed").val() == "a") {
                $("#div_mf34a_a_").show();
                $("#div_mf34a_b_").hide();
                $("#_060_mf34a_Date").attr("disabled", false);
                $("#_061_mf34a_Currency").attr("disabled", false);
                $("#_062_mf34a_Amount").attr("disabled", false);
                $("#_063_mf34b_Currency").attr("disabled", true);
                $("#_064_mf34b_Amount").attr("disabled", true);
            } else if ($("#type_mf34a_Total_Amount_Claimed").val() == "b") {
                $("#div_mf34a_a_").hide();
                $("#div_mf34a_b_").show();
                $("#_060_mf34a_Date").attr("disabled", true);
                $("#_061_mf34a_Currency").attr("disabled", true);
                $("#_062_mf34a_Amount").attr("disabled", true);
                $("#_063_mf34b_Currency").attr("disabled", false);
                $("#_064_mf34b_Amount").attr("disabled", false);
            } else {
                $("#div_mf34a_a_").hide();
                $("#div_mf34a_b_").hide();
                $("#_060_mf34a_Date").attr("disabled", true);
                $("#_061_mf34a_Currency").attr("disabled", true);
                $("#_062_mf34a_Amount").attr("disabled", true);
                $("#_063_mf34b_Currency").attr("disabled", true);
                $("#_064_mf34b_Amount").attr("disabled", true);
            }
        });


        //MF73R
        $("#div_mf73r_").hide();
        $("#_070_mf73r_Code").attr("disabled", true);
        $("#_071_mf73r_Narrative").attr("disabled", true);
        $("#type_mf73_Reason_for_Non_Payment").change(function () {
            if ($("#type_mf73_Reason_for_Non_Payment").val() == "r") {
                $("#div_mf73r_").show();
                $("#_070_mf73r_Code").attr("disabled", false);
                $("#_071_mf73r_Narrative").attr("disabled", false);
            } else {
                $("#div_mf73r_").hide();
                $("#_070_mf73r_Code").attr("disabled", true);
                $("#_071_mf73r_Narrative").attr("disabled", true);
            }
        });


        //MF73S
        $("#div_mf73s_").hide();
        $("#_080_mf73s_Code").attr("disabled", true);
        $("#_081_mf73s_Narrative").attr("disabled", true);
        $("#type_mf73_Disposal_of_Reimbursement_Claim").change(function () {
            if ($("#type_mf73_Disposal_of_Reimbursement_Claim").val() == "s") {
                $("#div_mf73s_").show();
                $("#_080_mf73s_Code").attr("disabled", false);
                $("#_081_mf73s_Narrative").attr("disabled", false);
            } else {
                $("#div_mf73s_").hide();
                $("#_080_mf73s_Code").attr("disabled", true);
                $("#_081_mf73s_Narrative").attr("disabled", true);
            }
        });
    });
</script>

<%--javascript_edit--%>
<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {

        //mf52a
        if ($("#_030_mf52a_Party_Identifier").val() != "" || $("#_031_mf52a_Identifier_Code").val() != "") {
            $("#type_mf52_Issuing_Bank").val("a").attr("selected", true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_030_mf52a_Party_Identifier").attr("disabled", false);
            $("#_031_mf52a_Identifier_Code").attr("disabled", false);
            $("#_032_mf52d_Party_Identifier").attr("disabled", true);
            $("#_033_mf52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_032_mf52d_Party_Identifier").val() != "" || $("#_033_mf52d_Name_and_Address").val() != "") {
            $("#type_mf52_Issuing_Bank").val("d").attr("selected", true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_030_mf52a_Party_Identifier").attr("disabled", true);
            $("#_031_mf52a_Identifier_Code").attr("disabled", true);
            $("#_032_mf52d_Party_Identifier").attr("disabled", false);
            $("#_033_mf52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_030_mf52a_Party_Identifier").attr("disabled", true);
            $("#_031_mf52a_Identifier_Code").attr("disabled", true);
            $("#_032_mf52d_party_identifier").attr("disabled", true);
            $("#_033_mf52d_name_address").attr("disabled", true);
        }

        //mf34a
        if ($("#_060_mf34a_Date").val() != "" || $("#_061_mf34a_Currency").val() != "" || $("#_062_mf34a_Amount").val() != "") {
            $("#type_mf34a_Total_Amount_Claimed").val("a").attr("selected", true);
            $("#div_mf34a_a_").show();
            $("#div_mf34a_b_").hide();
            $("#_060_mf34a_Date").attr("disabled", false);
            $("#_061_mf34a_Currency").attr("disabled", false);
            $("#_062_mf34a_Amount").attr("disabled", false);
            $("#_063_mf34b_Currency").attr("disabled", true);
            $("#_064_mf34b_Amount").attr("disabled", true);
        } else if ($("#_063_mf34b_Currency").val() != "" || $("#_064_mf34b_Amount").val() != "") {
            $("#type_mf34a_Total_Amount_Claimed").val("b").attr("selected", true);
            $("#div_mf34a_a_").hide();
            $("#div_mf34a_b_").show();
            $("#_060_mf34a_Date").attr("disabled", true);
            $("#_061_mf34a_Currency").attr("disabled", true);
            $("#_062_mf34a_Amount").attr("disabled", true);
            $("#_063_mf34b_Currency").attr("disabled", false);
            $("#_064_mf34b_Amount").attr("disabled", false);
        } else {
            $("#div_mf34a_a_").hide();
            $("#div_mf34a_b_").hide();
            $("#_060_mf34a_Date").attr("disabled", true);
            $("#_061_mf34a_Currency").attr("disabled", true);
            $("#_062_mf34a_Amount").attr("disabled", true);
            $("#_063_mf34b_Currency").attr("disabled", true);
            $("#_064_mf34b_Amount").attr("disabled", true);
        }

        //mf73r
        if ($("#_070_mf73r_Code").val() != "" || $("#_071_mf73r_Narrative").val() != "") {
            $("#type_mf73_Reason_for_Non_Payment").val("r").attr("selected", true);
            $("#div_mf73r_").show();
            $("#_070_mf73r_Code").attr("disabled", false);
            $("#_071_mf73r_Narrative").attr("disabled", false);
        } else {
            $("#div_mf73r_").hide();
            $("#_070_mf73r_Code").attr("disabled", true);
            $("#_071_mf73r_Narrative").attr("disabled", true);
        }

        //mf73s
        if ($("#_080_mf73s_Code").val() != "" || $("#_081_mf73s_Narrative").val() != "") {
            $("#type_mf73_Disposal_of_Reimbursement_Claim").val("s").attr("selected", true);
            $("#div_mf73s_").show();
            $("#_080_mf73s_Code").attr("disabled", false);
            $("#_081_mf73s_Narrative").attr("disabled", false);
        } else {
            $("#div_mf73s_").hide();
            $("#_080_mf73s_Code").attr("disabled", true);
            $("#_081_mf73s_Narrative").attr("disabled", true);
        }

    });
</script>