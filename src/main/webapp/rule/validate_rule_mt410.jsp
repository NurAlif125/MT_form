<%-- 
    Document   : mt410
    Created on : Aug 16, 2018
    Author     : Andhita Deara
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

                //body
                //mf27
                _010_mf20_sending_bank_TRN: "required",
                
                //mf21
                _020_mf21_related_reference: "required",

                //mf32
                type_mf32_amount_acknowledged: "required",
                _030_mf32a_date: "required",
                _031_mf32a_currency: "required",
                _032_mf32a_amount: "required",
                _033_mf32b_currency: "required",
                _034_mf32b_amount: "required",
                _035_mf32k_day_month: "required",
                _036_mf32k_number_of_days_months: "required",
                _037_mf32k_code: "required",
                _038_mf32k_currency: "required",
                _039_mf32k_amount: "required"
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sending_bank_TRN: {required: "mf20_sending_bank_TRN harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                type_mf32_amount_acknowledged: {required: "mf32_amount_acknowledged harus diisi..!!"},
                _030_mf32a_date: {required: "mf32a_date harus diisi..!!"},
                _031_mf32a_currency: {required: "mf32a_currency harus diisi..!!"},
                _032_mf32a_amount: {required: "mf32a_amount harus diisi..!!"},
                _033_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _034_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _035_mf32k_day_month: {required: "mf32k_day_month harus diisi..!!"},
                _036_mf32k_number_of_days_months: {required: "mf32k_number_of_days_months harus diisi..!!"},
                _037_mf32k_code: {required: "mf32k_code harus diisi..!!"},
                _038_mf32k_currency: {required: "mf32k_currency harus diisi..!!"},
                _039_mf32k_amount: {required: "mf32k_amount harus diisi..!!"}
                
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
    $(document).ready(function(){
        
        //MF32_a_b_k
        $("#div_mf32a_").hide();
        $("#div_mf32b_").hide();
        $("#div_mf32k_").hide();
        $("#_030_mf32a_date").attr("disabled", true);
        $("#_031_mf32a_currency").attr("disabled", true);
        $("#_032_mf32a_amount").attr("disabled", true);
        $("#_033_mf32b_currency").attr("disabled", true);
        $("#_034_mf32b_amount").attr("disabled", true);
        $("#_035_mf32k_day_month").attr("disabled", true);
        $("#_036_mf32k_number_of_days_months").attr("disabled", true);
        $("#_037_mf32k_code").attr("disabled", true);
        $("#_038_mf32k_currency").attr("disabled", true);
        $("#_039_mf32k_amount").attr("disabled", true);
        $("#type_mf32_amount_acknowledged").change(function() {
            if ( $("#type_mf32_amount_acknowledged").val() == "a"){
                $("#div_mf32a_").show();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").hide();
                $("#_030_mf32a_date").attr("disabled", false);
                $("#_031_mf32a_currency").attr("disabled", false);
                $("#_032_mf32a_amount").attr("disabled", false);
                $("#_033_mf32b_currency").attr("disabled", true);
                $("#_034_mf32b_amount").attr("disabled", true);
                $("#_035_mf32k_day_month").attr("disabled", true);
                $("#_036_mf32k_number_of_days_months").attr("disabled", true);
                $("#_037_mf32k_code").attr("disabled", true);
                $("#_038_mf32k_currency").attr("disabled", true);
                $("#_039_mf32k_amount").attr("disabled", true);
            } else if ( $("#type_mf32_amount_acknowledged").val() == "b"){
                $("#div_mf32a_").hide();
                $("#div_mf32b_").show();
                $("#div_mf32k_").hide();
                $("#_030_mf32a_date").attr("disabled", true);
                $("#_031_mf32a_currency").attr("disabled", true);
                $("#_032_mf32a_amount").attr("disabled", true);
                $("#_033_mf32b_currency").attr("disabled", false);
                $("#_034_mf32b_amount").attr("disabled", false);
                $("#_035_mf32k_day_month").attr("disabled", true);
                $("#_036_mf32k_number_of_days_months").attr("disabled", true);
                $("#_037_mf32k_code").attr("disabled", true);
                $("#_038_mf32k_currency").attr("disabled", true);
                $("#_039_mf32k_amount").attr("disabled", true);
            } else if ( $("#type_mf32_amount_acknowledged").val() == "k"){
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").show();
                $("#_030_mf32a_date").attr("disabled", true);
                $("#_031_mf32a_currency").attr("disabled", true);
                $("#_032_mf32a_amount").attr("disabled", true);
                $("#_033_mf32b_currency").attr("disabled", true);
                $("#_034_mf32b_amount").attr("disabled", true);
                $("#_035_mf32k_day_month").attr("disabled", false);
                $("#_036_mf32k_number_of_days_months").attr("disabled", false);
                $("#_037_mf32k_code").attr("disabled", false);
                $("#_038_mf32k_currency").attr("disabled", false);
                $("#_039_mf32k_amount").attr("disabled", false);
            } else{
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").hide();
                $("#_030_mf32a_date").attr("disabled", true);
                $("#_031_mf32a_currency").attr("disabled", true);
                $("#_032_mf32a_amount").attr("disabled", true);
                $("#_033_mf32b_currency").attr("disabled", true);
                $("#_034_mf32b_amount").attr("disabled", true);
                $("#_035_mf32k_day_month").attr("disabled", true);
                $("#_036_mf32k_number_of_days_months").attr("disabled", true);
                $("#_037_mf32k_code").attr("disabled", true);
                $("#_038_mf32k_currency").attr("disabled", true);
                $("#_039_mf32k_amount").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //MF32_a_b_k
        if ($("#_030_mf32a_date").val() != "" || $("#_031_mf32a_currency").val() != "" || $("#_032_mf32a_amount").val() != ""){
            $("#type_mf32_amount_acknowledged").val("a").attr("selected",true);
            $("#div_mf32a_").show();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").hide();
            $("#_030_mf32a_date").attr("disabled", false);
            $("#_031_mf32a_currency").attr("disabled", false);
            $("#_032_mf32a_amount").attr("disabled", false);
            $("#_033_mf32b_currency").attr("disabled", true);
            $("#_034_mf32b_amount").attr("disabled", true);
            $("#_035_mf32k_day_month").attr("disabled", true);
            $("#_036_mf32k_number_of_days_months").attr("disabled", true);
            $("#_037_mf32k_code").attr("disabled", true);
            $("#_038_mf32k_currency").attr("disabled", true);
            $("#_039_mf32k_amount").attr("disabled", true);
        } else if ($("#_033_mf32b_currency").val() != "" || $("#_034_mf32b_amount").val() != ""){
            $("#type_mf32_amount_acknowledged").val("b").attr("selected",true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").show();
            $("#div_mf32k_").hide();
            $("#_030_mf32a_date").attr("disabled", true);
            $("#_031_mf32a_currency").attr("disabled", true);
            $("#_032_mf32a_amount").attr("disabled", true);
            $("#_033_mf32b_currency").attr("disabled", false);
            $("#_034_mf32b_amount").attr("disabled", false);
            $("#_035_mf32k_day_month").attr("disabled", true);
            $("#_036_mf32k_number_of_days_months").attr("disabled", true);
            $("#_037_mf32k_code").attr("disabled", true);
            $("#_038_mf32k_currency").attr("disabled", true);
            $("#_039_mf32k_amount").attr("disabled", true);
        } else if ($("#_035_mf32k_day_month").val() != "" || $("#_036_mf32k_number_of_days_months").val() != "" || $("#_037_mf32k_code").val() != "" || $("#_038_mf32k_currency").val() != "" || $("#_039_mf32k_amount").val() != ""){
            $("#type_mf32_amount_acknowledged").val("k").attr("selected",true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").show();
            $("#_030_mf32a_date").attr("disabled", true);
            $("#_031_mf32a_currency").attr("disabled", true);
            $("#_032_mf32a_amount").attr("disabled", true);
            $("#_033_mf32b_currency").attr("disabled", true);
            $("#_034_mf32b_amount").attr("disabled", true);
            $("#_035_mf32k_day_month").attr("disabled", false);
            $("#_036_mf32k_number_of_days_months").attr("disabled", false);
            $("#_037_mf32k_code").attr("disabled", false);
            $("#_038_mf32k_currency").attr("disabled", false);
            $("#_039_mf32k_amount").attr("disabled", false);
        } else{
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").hide();
            $("#_030_mf32a_date").attr("disabled", true);
            $("#_031_mf32a_currency").attr("disabled", true);
            $("#_032_mf32a_amount").attr("disabled", true);
            $("#_033_mf32b_currency").attr("disabled", true);
            $("#_034_mf32b_amount").attr("disabled", true);
            $("#_035_mf32k_day_month").attr("disabled", true);
            $("#_036_mf32k_number_of_days_months").attr("disabled", true);
            $("#_037_mf32k_code").attr("disabled", true);
            $("#_038_mf32k_currency").attr("disabled", true);
            $("#_039_mf32k_amount").attr("disabled", true);
        } 
    });
</script>