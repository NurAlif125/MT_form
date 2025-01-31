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
                _010_mf20_Claiming_Banks_Reference: "required",

                //mf21
                _020_mf21_Documentary_Credit_Number: "required",

                //mf52a
                _041_mf52a_Identifier_Code: "required",
                _043_mf52d_Name_and_Address: "required",

                //mf32b
                _050_mf32b_Currency: "required",
                _051_mf32b_Amount: "required",
                
                //mf33
                _060_of33b_Currency: "required",
                _061_of33b_Amount: "required",

                //mf34a
                _080_mf34a_Date: "required",
                _081_mf34a_Currency: "required",
                _082_mf34a_Amount: "required",
                _083_mf34b_Currency: "required",
                _084_mf34b_Amount: "required",

                //of57
                _091_of57a_identifier_code: "required",
                _095_of57d_name_and_address: "required",

                //of58
                _101_of58a_identifier_code: "required",
                _103_of58d_name_and_address: "required",

            },
            messages: {
               sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_Claiming_Banks_Reference: {required: "mf20 Number harus diisi..!!"},
                _020_mf21_Documentary_Credit_Number: {required: "mf21 Total harus diisi..!!"},
                 type_mf52_Issuing_Bank: {required: "mf52 Issuing Bank harus diisi..!!"},
                _041_mf52a_Identifier_Code:{required: "mf52 Identifier Code harus diisi..!!"},
                _043_mf52d_Name_and_Address: {required: "mf52 Name and Address harus diisi..!!"},
                type_mf32_Principal_Amount_Claimed: {required: "mf32 Principal Amount Claimed harus diisi..!!"},
                _050_mf32b_Currency: {required: "mf32 Currency harus diisi..!!"},
                _051_mf32b_Amount: {required: "mf32 Amount harus diisi..!!"},
                type_of33_: {required: "of33 harus diisi..!!"},
                _060_of33b_Currency: {required: "of33 Currency harus diisi..!!"},
                _061_of33b_Amount: {required: "of33 Amount harus diisi..!!"},
                type_mf34a_Total_Amount_Claimed: {required: "mf34a Total Amount Claimed harus diisi..!!"},
                _080_mf34a_Date: {required: "mf34 date harus diisi..!!"},
                _081_mf34a_Currency: {required: "mf34 Currency harus diisi..!!"},
                _082_mf34a_Amount: {required: "mf34 Amount harus diisi..!!"},
                _083_mf34b_Currency: {required: "mf34 Currency harus diisi..!!"},
                _084_mf34b_Amount: {required: "mf34 Amount harus diisi..!!"},
                type_of57_Account_With_Bank: {required: "of57 Account With Bank harus diisi..!!"},
                _091_of57a_identifier_code:{required: "of57 Identifier_Code harus diisi..!!"},
                _095_of57d_name_and_address: {required: "of57 Name and Address harus diisi..!!"},
                type_of58_Issuing_Bank: {required: "of58 Issuing Bank harus diisi..!!"},
                _101_of58a_identifier_code:{required: "of58 Identifier Code harus diisi..!!"},
                _103_of58d_name_and_address: {required: "of58 Name and Address harus diisi..!!"},
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
        $("#_040_mf52a_Party_Identifier").attr("disabled", true);
        $("#_041_mf52a_Identifier_Code").attr("disabled", true);
        $("#_042_mf52d_Party_Identifier").attr("disabled", true);
        $("#_043_mf52d_Name_and_Address").attr("disabled", true);
        $("#type_mf52_Issuing_Bank").change(function () {
            if ($("#type_mf52_Issuing_Bank").val() == "a") {
                $("#div_mf52a_").show();
                $("#div_mf52d_").hide();
                $("#_040_mf52a_Party_Identifier").attr("disabled", false);
                $("#_041_mf52a_Identifier_Code").attr("disabled", false);
                $("#_042_mf52d_Party_Identifier").attr("disabled", true);
                $("#_043_mf52d_Name_and_Address").attr("disabled", true);
            } else if ($("#type_mf52_Issuing_Bank").val() == "d") {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").show();
                $("#_040_mf52a_Party_Identifier").attr("disabled", true);
                $("#_041_mf52a_Identifier_Code").attr("disabled", true);
                $("#_042_mf52d_Party_Identifier").attr("disabled", false);
                $("#_043_mf52d_Name_and_Address").attr("disabled", false);
            } else {
                $("#div_mf52a_").hide();
                $("#div_mf52d_").hide();
                $("#_040_mf52a_Party_Identifier").attr("disabled", true);
                $("#_041_mf52a_Identifier_Code").attr("disabled", true);
                $("#_042_mf52d_Party_Identifier").attr("disabled", true);
                $("#_043_mf52d_Name_and_Address").attr("disabled", true);
            }
        });

        //mf32b
        $("#div_mf32b_").hide();
        $("#_050_mf32b_Currency").attr("disabled", true);
        $("#_051_mf32b_Amount").attr("disabled", true);
        $("#type_mf32_Principal_Amount_Claimed").change(function () {
            if ($("#type_mf32_Principal_Amount_Claimed").val() == "b") {
                $("#div_mf32b_").show();
                $("#_050_mf32b_Currency").attr("disabled", false);
                $("#_051_mf32b_Amount").attr("disabled", false);
            } else {
                $("#div_mf32b_").hide();
                $("#_050_mf32b_Currency").attr("disabled", true);
                $("#_051_mf32b_Amount").attr("disabled", true);
            }
        });

        //OF33B_check
        $("#check_of33b").hide();
        $("#_060_of33b_Currency").attr("disabled", true);
        $("#_061_of33b_Amount").attr("disabled", true);
        $("#Additional_Amount_Claimed_Checkbox").click(function(){
            if ($("#Additional_Amount_Claimed_Checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_060_of33b_Currency").attr("disabled", false);
                $("#_061_of33b_Amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_060_of33b_Currency").attr("disabled", true);
                $("#_061_of33b_Amount").attr("disabled", true);
            }
        });

        //mf34a
        $("#div_mf34a_a_").hide();
        $("#div_mf34a_b_").hide();
        $("#_080_mf34a_Date").attr("disabled", true);
        $("#_081_mf34a_Currency").attr("disabled", true);
        $("#_082_mf34a_Amount").attr("disabled", true);
        $("#_083_mf34b_Currency").attr("disabled", true);
        $("#_084_mf34b_Amount").attr("disabled", true);
        $("#type_mf34a_Total_Amount_Claimed").change(function () {
            if ($("#type_mf34a_Total_Amount_Claimed").val() == "a") {
                $("#div_mf34a_a_").show();
                $("#div_mf34a_b_").hide();
                $("#_080_mf34a_Date").attr("disabled", false);
                $("#_081_mf34a_Currency").attr("disabled", false);
                $("#_082_mf34a_Amount").attr("disabled", false);
                $("#_083_mf34b_Currency").attr("disabled", true);
                $("#_084_mf34b_Amount").attr("disabled", true);
            } else if ($("#type_mf34a_Total_Amount_Claimed").val() == "b") {
                $("#div_mf34a_a_").hide();
                $("#div_mf34a_b_").show();
                $("#_080_mf34a_Date").attr("disabled", true);
                $("#_081_mf34a_Currency").attr("disabled", true);
                $("#_082_mf34a_Amount").attr("disabled", true);
                $("#_083_mf34b_Currency").attr("disabled", false);
                $("#_084_mf34b_Amount").attr("disabled", false);
            } else {
                $("#div_mf34a_a_").hide();
                $("#div_mf34a_b_").hide();
                $("#_080_mf34a_Date").attr("disabled", true);
                $("#_081_mf34a_Currency").attr("disabled", true);
                $("#_082_mf34a_Amount").attr("disabled", true);
                $("#_083_mf34b_Currency").attr("disabled", true);
                $("#_084_mf34b_Amount").attr("disabled", true);
            }
        });

        //of57a
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_090_of57a_party_identifier").attr("disabled", true);
        $("#_091_of57a_identifier_code").attr("disabled", true);
        $("#_092_of57b_party_identifier").attr("disabled", true);
        $("#_093_of57b_location").attr("disabled", true);
        $("#_094_of57d_party_identifier").attr("disabled", true);
        $("#_095_of57d_name_and_address").attr("disabled", true);
        $("#type_of57_Account_With_Bank").change(function () {
            if ($("#type_of57_Account_With_Bank").val() == "a") {
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", false);
                $("#_091_of57a_identifier_code").attr("disabled", false);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_and_address").attr("disabled", true);
            } else if ($("#type_of57_Account_With_Bank").val() == "b") {
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", false);
                $("#_093_of57b_location").attr("disabled", false);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_and_address").attr("disabled", true);
            } else if ($("#type_of57_Account_With_Bank").val() == "d") {
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", false);
                $("#_095_of57d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_090_of57a_party_identifier").attr("disabled", true);
                $("#_091_of57a_identifier_code").attr("disabled", true);
                $("#_092_of57b_party_identifier").attr("disabled", true);
                $("#_093_of57b_location").attr("disabled", true);
                $("#_094_of57d_party_identifier").attr("disabled", true);
                $("#_095_of57d_name_and_address").attr("disabled", true);
            }
        });


        //of58a
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_100_of58a_party_identifier").attr("disabled", true);
        $("#_101_of58a_identifier_code").attr("disabled", true);
        $("#_102_of58d_party_identifier").attr("disabled", true);
        $("#_103_of58d_name_and_address").attr("disabled", true);
        $("#type_of58_Issuing_Bank").change(function () {
            if ($("#type_of58_Issuing_Bank").val() == "a") {
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", false);
                $("#_101_of58a_identifier_code").attr("disabled", false);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_and_address").attr("disabled", true);
            } else if ($("#type_of58_Issuing_Bank").val() == "d") {
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", false);
                $("#_103_of58d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_100_of58a_party_identifier").attr("disabled", true);
                $("#_101_of58a_identifier_code").attr("disabled", true);
                $("#_102_of58d_party_identifier").attr("disabled", true);
                $("#_103_of58d_name_and_address").attr("disabled", true);
            }
        });

    });
</script>

<%--javascript_edit--%>
<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {

        //mf52a
        if ($("#_040_mf52a_Party_Identifier").val() != "" || $("#_041_mf52a_Identifier_Code").val() != "") {
            $("#type_mf52_Issuing_Bank").val("a").attr("selected", true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_040_mf52a_Party_Identifier").attr("disabled", false);
            $("#_041_mf52a_Identifier_Code").attr("disabled", false);
            $("#_042_mf52d_Party_Identifier").attr("disabled", true);
            $("#_043_mf52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_042_mf52d_Party_Identifier").val() != "" || $("#_043_mf52d_Name_and_Address").val() != "") {
            $("#type_mf52_Issuing_Bank").val("d").attr("selected", true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_040_mf52a_Party_Identifier").attr("disabled", true);
            $("#_041_mf52a_Identifier_Code").attr("disabled", true);
            $("#_042_mf52d_Party_Identifier").attr("disabled", false);
            $("#_043_mf52d_Name_and_Address").attr("disabled", false);
        } else {
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_040_mf52a_Party_Identifier").attr("disabled", true);
            $("#_041_mf52a_Identifier_Code").attr("disabled", true);
            $("#_042_mf52d_party_identifier").attr("disabled", true);
            $("#_043_mf52d_name_address").attr("disabled", true);
        }


        //mf32b
        if ($("#_050_mf32b_Currency").val() != "" || $("#_051_mf32b_Amount").val() != "") {
            $("#type_mf32_Principal_Amount_Claimed").val("b").attr("selected", true);
            $("#div_mf32b_").show();
            $("#_050_mf32b_Currency").attr("disabled", false);
            $("#_051_mf32b_Amount").attr("disabled", false);
        } else {
            $("#div_mf32b_").hide();
            $("#_050_mf32b_Currency").attr("disabled", true);
            $("#_051_mf32b_Amount").attr("disabled", true);
        }


         //OF33B_check
        if ($("#_060_of33b_Currency").val() != "" || $("#_061_of33b_Amount").val() != ""){
            $("#Additional_Amount_Claimed_Checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_060_of33b_Currency").attr("disabled", false);
            $("#_061_of33b_Amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_060_of33b_Currency").attr("disabled", true);
            $("#_061_of33b_Amount").attr("disabled", true);
        }


        //mf34a
        if ($("#_080_mf34a_Date").val() != "" || $("#_081_mf34a_Currency").val() != "" || $("#_082_mf34a_Amount").val() != "") {
            $("#type_mf34a_Total_Amount_Claimed").val("a").attr("selected", true);
            $("#div_mf34a_a_").show();
            $("#div_mf34a_b_").hide();
            $("#_080_mf34a_Date").attr("disabled", false);
            $("#_081_mf34a_Currency").attr("disabled", false);
            $("#_082_mf34a_Amount").attr("disabled", false);
            $("#_083_mf34b_Currency").attr("disabled", true);
            $("#_084_mf34b_Amount").attr("disabled", true);
        } else if ($("#_083_mf34b_Currency").val() != "" || $("#_084_mf34b_Amount").val() != "") {
            $("#type_mf34a_Total_Amount_Claimed").val("b").attr("selected", true);
            $("#div_mf34a_a_").hide();
            $("#div_mf34a_b_").show();
            $("#_080_mf34a_Date").attr("disabled", true);
            $("#_081_mf34a_Currency").attr("disabled", true);
            $("#_082_mf34a_Amount").attr("disabled", true);
            $("#_083_mf34b_Currency").attr("disabled", false);
            $("#_084_mf34b_Amount").attr("disabled", false);
        } else {
            $("#div_mf34a_a_").hide();
            $("#div_mf34a_b_").hide();
            $("#_080_mf34a_Date").attr("disabled", true);
            $("#_081_mf34a_Currency").attr("disabled", true);
            $("#_082_mf34a_Amount").attr("disabled", true);
            $("#_083_mf34b_Currency").attr("disabled", true);
            $("#_084_mf34b_Amount").attr("disabled", true);
        }

        //of57a
        if ($("#_090_of57a_party_identifier").val() != "" || $("#_091_of57a_identifier_code").val() != "") {
            $("#type_of57_Account_With_Bank").val("a").attr("selected", true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", false);
            $("#_091_of57a_identifier_code").attr("disabled", false);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_092_of57b_party_identifier").val() != "" || $("#_093_of57b_location").val() != "") {
            $("#type_of57_Account_With_Bank").val("b").attr("selected", true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", false);
            $("#_093_of57b_location").attr("disabled", false);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_094_of57d_party_identifier").val() != "" || $("#_095_of57d_name_and_address").val() != "") {
            $("#type_of57_Account_With_Bank").val("d").attr("selected", true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", false);
            $("#_095_of57d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_090_of57a_party_identifier").attr("disabled", true);
            $("#_091_of57a_identifier_code").attr("disabled", true);
            $("#_092_of57b_party_identifier").attr("disabled", true);
            $("#_093_of57b_location").attr("disabled", true);
            $("#_094_of57d_party_identifier").attr("disabled", true);
            $("#_095_of57d_name_and_address").attr("disabled", true);
        }

        //of58a
        if ($("#_100_of58a_party_identifier").val() != "" || $("#_101_of58a_identifier_code").val() != "") {
            $("#type_of58_Issuing_Bank").val("a").attr("selected", true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", false);
            $("#_101_of58a_identifier_code").attr("disabled", false);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_and_address").attr("disabled", true);
        } else if ($("#_102_of58d_party_identifier").val() != "" || $("#_103_of58d_name_and_address").val() != "") {
            $("#type_of58_Issuing_Bank").val("d").attr("selected", true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", false);
            $("#_103_of58d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_100_of58a_party_identifier").attr("disabled", true);
            $("#_101_of58a_identifier_code").attr("disabled", true);
            $("#_102_of58d_party_identifier").attr("disabled", true);
            $("#_103_of58d_name_and_address").attr("disabled", true);
        }

    });
</script>