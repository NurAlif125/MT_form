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
                _010_mf20_Sending_Banks_TRN: "required",

                //MF21
                _020_mf21_Related_Reference: "required",

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_Sending_Banks_TRN: {required: "mf27 harus diisi..!!"},
                _020_mf21_Related_Reference: {required: "mf27 harus diisi..!!"},
                
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

        //of32//
        $("#div_of32a_").hide();
        $("#div_of32b_").hide();
        $("#div_of32k_").hide();
        $("#_031_of32a_Date").attr("disabled", true);
        $("#_032_of32a_Currency").attr("disabled", true);
        $("#_033_of32a_Amount").attr("disabled", true);
        $("#_034_of32b_Currency").attr("disabled", true);
        $("#_035_of32b_Amount").attr("disabled", true);
        $("#_036_of32k_day_month").attr("disabled", true);
        $("#_037_of32k_number_of_days_months").attr("disabled", true);
        $("#_038_of32k_code").attr("disabled", true);
        $("#_039_of32k_currency").attr("disabled", true);
        $("#_040_of32k_amount").attr("disabled", true);
        $("#type_of32_amount_collected").change(function () {
            if ($("#type_of32_amount_collected").val() == "a") {
                $("#div_of32a_").show();
                $("#div_of32b_").hide();
                $("#div_of32k_").hide();
                $("#_031_of32a_Date").attr("disabled", false);
                $("#_032_of32a_Currency").attr("disabled", false);
                $("#_033_of32a_Amount").attr("disabled", false);
                $("#_034_of32b_Currency").attr("disabled", true);
                $("#_035_of32b_Amount").attr("disabled", true);
                $("#_036_of32k_day_month").attr("disabled", true);
                $("#_037_of32k_number_of_days_months").attr("disabled", true);
                $("#_038_of32k_code").attr("disabled", true);
                $("#_039_of32k_currency").attr("disabled", true);
                $("#_040_of32k_amount").attr("disabled", true);
            } else if ($("#type_of32_amount_collected").val() == "b") {
                $("#div_of32a_").hide();
                $("#div_of32b_").show();
                $("#div_of32k_").hide();
                $("#_031_of32a_Date").attr("disabled", true);
                $("#_032_of32a_Currency").attr("disabled", true);
                $("#_033_of32a_Amount").attr("disabled", true);
                $("#_034_of32b_Currency").attr("disabled", false);
                $("#_035_of32b_Amount").attr("disabled", false);
                $("#_036_of32k_day_month").attr("disabled", true);
                $("#_037_of32k_number_of_days_months").attr("disabled", true);
                $("#_038_of32k_code").attr("disabled", true);
                $("#_039_of32k_currency").attr("disabled", true);
                $("#_040_of32k_amount").attr("disabled", true);
            } else if ($("#type_of32_amount_collected").val() == "k") {
                $("#div_of32a_").hide();
                $("#div_of32b_").hide();
                $("#div_of32k_").show();
                $("#_031_of32a_Date").attr("disabled", true);
                $("#_032_of32a_Currency").attr("disabled", true);
                $("#_033_of32a_Amount").attr("disabled", true);
                $("#_034_of32b_Currency").attr("disabled", true);
                $("#_035_of32b_Amount").attr("disabled", true);
                $("#_036_of32k_day_month").attr("disabled", false);
                $("#_037_of32k_number_of_days_months").attr("disabled", false);
                $("#_038_of32k_code").attr("disabled", false);
                $("#_039_of32k_currency").attr("disabled", false);
                $("#_040_of32k_amount").attr("disabled", false);
            } else {
                $("#div_of32a_").hide();
                $("#div_of32b_").hide();
                $("#div_of32k_").hide();
                $("#_031_of32a_Date").attr("disabled", true);
                $("#_032_of32a_Currency").attr("disabled", true);
                $("#_033_of32a_Amount").attr("disabled", true);
                $("#_034_of32b_Currency").attr("disabled", true);
                $("#_035_of32b_Amount").attr("disabled", true);
                $("#_036_of32k_day_month").attr("disabled", true);
                $("#_037_of32k_number_of_days_months").attr("disabled", true);
                $("#_038_of32k_code").attr("disabled", true);
                $("#_039_of32k_currency").attr("disabled", true);
                $("#_040_of32k_amount").attr("disabled", true);
            }
        });
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function () {

        //of32_a_b_k
        if ($("#_031_of32a_Date").val() != "" || $("#_032_of32a_Currency").val() != "" || $("#_033_of32a_Amount").val() != "") {
            $("#type_of32_amount_collected").val("a").attr("selected", true);
            $("#div_of32a_").show();
            $("#div_of32b_").hide();
            $("#div_of32k_").hide();
            $("#_031_of32a_Date").attr("disabled", false);
            $("#_032_of32a_Currency").attr("disabled", false);
            $("#_033_of32a_Amount").attr("disabled", false);
            $("#_034_of32b_Currency").attr("disabled", true);
            $("#_035_of32b_Amount").attr("disabled", true);
            $("#_036_of32k_day_month").attr("disabled", true);
            $("#_037_of32k_number_of_days_months").attr("disabled", true);
            $("#_038_of32k_code").attr("disabled", true);
            $("#_039_of32k_currency").attr("disabled", true);
            $("#_040_of32k_amount").attr("disabled", true);
        } else if ($("#_034_of32b_Currency").val() != "" || $("#_035_of32b_Amount").val() != "") {
            $("#type_of32_amount_collected").val("b").attr("selected", true);
            $("#div_of32a_").hide();
            $("#div_of32b_").show();
            $("#div_of32k_").hide();
            $("#_031_of32a_Date").attr("disabled", true);
            $("#_032_of32a_Currency").attr("disabled", true);
            $("#_033_of32a_Amount").attr("disabled", true);
            $("#_034_of32b_Currency").attr("disabled", false);
            $("#_035_of32b_Amount").attr("disabled", false);
            $("#_036_of32k_day_month").attr("disabled", true);
            $("#_037_of32k_number_of_days_months").attr("disabled", true);
            $("#_038_of32k_code").attr("disabled", true);
            $("#_039_of32k_currency").attr("disabled", true);
            $("#_040_of32k_amount").attr("disabled", true);
        } else if ($("#_036_of32k_day_month").val() != "" || $("#_037_of32k_number_of_days_months").val() != "" || $("#_038_of32k_code").val() != "" || $("#_039_of32k_currency").val() != "" || $("#_040_of32k_amount").val() != "") {
            $("#type_of32_amount_collected").val("k").attr("selected", true);
            $("#div_of32a_").hide();
            $("#div_of32b_").hide();
            $("#div_of32k_").show();
            $("#_031_of32a_Date").attr("disabled", true);
            $("#_032_of32a_Currency").attr("disabled", true);
            $("#_033_of32a_Amount").attr("disabled", true);
            $("#_034_of32b_Currency").attr("disabled", true);
            $("#_035_of32b_Amount").attr("disabled", true);
            $("#_036_of32k_day_month").attr("disabled", false);
            $("#_037_of32k_number_of_days_months").attr("disabled", false);
            $("#_038_of32k_code").attr("disabled", false);
            $("#_039_of32k_currency").attr("disabled", false);
            $("#_040_of32k_amount").attr("disabled", false);
        } else {
            $("#div_of32a_").hide();
            $("#div_of32b_").hide();
            $("#div_of32k_").hide();
            $("#_031_of32a_Date").attr("disabled", true);
            $("#_032_of32a_Currency").attr("disabled", true);
            $("#_033_of32a_Amount").attr("disabled", true);
            $("#_034_of32b_Currency").attr("disabled", true);
            $("#_035_of32b_Amount").attr("disabled", true);
            $("#_036_of32k_day_month").attr("disabled", true);
            $("#_037_of32k_number_of_days_months").attr("disabled", true);
            $("#_038_of32k_code").attr("disabled", true);
            $("#_039_of32k_currency").attr("disabled", true);
            $("#_040_of32k_amount").attr("disabled", true);
        }

    });
</script>