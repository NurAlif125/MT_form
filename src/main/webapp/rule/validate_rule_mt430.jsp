<%-- 
    Document   : mt430
    Created on : Aug 24, 2018
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
                //mf20
                _010_mf20_sending_bank_TRN: "required",
                
                //mf21
                _020_mf21_related_reference: "required",

                //of59
                _051_of59_name_address: "required"
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sending_bank_TRN: {required: "mf20_sending_bank_TRN harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _051_of59_name_address: {required: "of59_name_address harus diisi..!!"}
                
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
        
        //OF59_check
        $("#check_of59").hide();
        $("#_050_of59_account").attr("disabled", true);
        $("#_051_of59_name_address").attr("disabled", true);
        $("#drawee_checkbox").click(function(){
            if ($("#drawee_checkbox").is(":checked")){
                $("#check_of59").show();
                $("#_050_of59_account").attr("disabled", false);
                $("#_051_of59_name_address").attr("disabled", false);
            } else {
                $("#check_of59").hide();
                $("#_050_of59_account").attr("disabled", true);
                $("#_051_of59_name_address").attr("disabled", true);
            }
        });
        
        
        //OF32_a_k
        $("#div_of32a_").hide();
        $("#div_of32k_").hide();
        $("#_030_of32a_date").attr("disabled", true);
        $("#_031_of32a_currency").attr("disabled", true);
        $("#_032_of32a_amount").attr("disabled", true);
        $("#_033_of32k_day_month").attr("disabled", true);
        $("#_034_of32k_number_of_days_months").attr("disabled", true);
        $("#_035_of32k_code").attr("disabled", true);
        $("#_036_of32k_currency").attr("disabled", true);
        $("#_037_of32k_amount").attr("disabled", true);
        $("#type_of32_existing_maturity").change(function() {
            if ( $("#type_of32_existing_maturity").val() == "a"){
                $("#div_of32a_").show();
                $("#div_of32k_").hide();
                $("#_030_of32a_date").attr("disabled", false);
                $("#_031_of32a_currency").attr("disabled", false);
                $("#_032_of32a_amount").attr("disabled", false);
                $("#_033_of32k_day_month").attr("disabled", true);
                $("#_034_of32k_number_of_days_months").attr("disabled", true);
                $("#_035_of32k_code").attr("disabled", true);
                $("#_036_of32k_currency").attr("disabled", true);
                $("#_037_of32k_amount").attr("disabled", true);
            } else if ( $("#type_of32_existing_maturity").val() == "k"){
                $("#div_of32a_").hide();
                $("#div_of32k_").show();
                $("#_030_of32a_date").attr("disabled", true);
                $("#_031_of32a_currency").attr("disabled", true);
                $("#_032_of32a_amount").attr("disabled", true);
                $("#_033_of32k_day_month").attr("disabled", false);
                $("#_034_of32k_number_of_days_months").attr("disabled", false);
                $("#_035_of32k_code").attr("disabled", false);
                $("#_036_of32k_currency").attr("disabled", false);
                $("#_037_of32k_amount").attr("disabled", false);
            } else{
                $("#div_of32a_").hide();
                $("#div_of32k_").hide();
                $("#_030_of32a_date").attr("disabled", true);
                $("#_031_of32a_currency").attr("disabled", true);
                $("#_032_of32a_amount").attr("disabled", true);
                $("#_033_of32k_day_month").attr("disabled", true);
                $("#_034_of32k_number_of_days_months").attr("disabled", true);
                $("#_035_of32k_code").attr("disabled", true);
                $("#_036_of32k_currency").attr("disabled", true);
                $("#_037_of32k_amount").attr("disabled", true);
            }
        });
        
        //OF33_a_k
        $("#div_of33a_").hide();
        $("#div_of33k_").hide();
        $("#_040_of33a_date").attr("disabled", true);
        $("#_041_of33a_currency").attr("disabled", true);
        $("#_042_of33a_amount").attr("disabled", true);
        $("#_043_of33k_day_month").attr("disabled", true);
        $("#_044_of33k_number_of_days_months").attr("disabled", true);
        $("#_045_of33k_code").attr("disabled", true);
        $("#_046_of33k_currency").attr("disabled", true);
        $("#_047_of33k_amount").attr("disabled", true);
        $("#type_of33_amended_maturity").change(function() {
            if ( $("#type_of33_amended_maturity").val() == "a"){
                $("#div_of33a_").show();
                $("#div_of33k_").hide();
                $("#_040_of33a_date").attr("disabled", false);
                $("#_041_of33a_currency").attr("disabled", false);
                $("#_042_of33a_amount").attr("disabled", false);
                $("#_043_of33k_day_month").attr("disabled", true);
                $("#_044_of33k_number_of_days_months").attr("disabled", true);
                $("#_045_of33k_code").attr("disabled", true);
                $("#_046_of33k_currency").attr("disabled", true);
                $("#_047_of33k_amount").attr("disabled", true);
            } else if ( $("#type_of33_amended_maturity").val() == "k"){
                $("#div_of33a_").hide();
                $("#div_of33k_").show();
                $("#_040_of33a_date").attr("disabled", true);
                $("#_041_of33a_currency").attr("disabled", true);
                $("#_042_of33a_amount").attr("disabled", true);
                $("#_043_of33k_day_month").attr("disabled", false);
                $("#_044_of33k_number_of_days_months").attr("disabled", false);
                $("#_045_of33k_code").attr("disabled", false);
                $("#_046_of33k_currency").attr("disabled", false);
                $("#_047_of33k_amount").attr("disabled", false);
            } else{
                $("#div_of33a_").hide();
                $("#div_of33k_").hide();
                $("#_040_of33a_date").attr("disabled", true);
                $("#_041_of33a_currency").attr("disabled", true);
                $("#_042_of33a_amount").attr("disabled", true);
                $("#_043_of33k_day_month").attr("disabled", true);
                $("#_044_of33k_number_of_days_months").attr("disabled", true);
                $("#_045_of33k_code").attr("disabled", true);
                $("#_046_of33k_currency").attr("disabled", true);
                $("#_047_of33k_amount").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF59_check
        if ($("#_050_of59_account").val() != "" || $("#_051_of59_name_address").val() != ""){
            $("#drawee_checkbox").attr("checked", true);
            $("#check_of59").show();
            $("#_050_of59_account").attr("disabled", false);
            $("#_051_of59_name_address").attr("disabled", false);
        } else {
            $("#check_of59").hide();
            $("#_050_of59_account").attr("disabled", true);
            $("#_051_of59_name_address").attr("disabled", true);
        }
        
        //OF32_a_k
        if ($("#_030_of32a_date").val() != "" || $("#_031_of32a_currency").val() != "" || $("#_032_of32a_amount").val() != ""){
            $("#type_of32_existing_maturity").val("a").attr("selected",true);
            $("#div_of32a_").show();
            $("#div_of32k_").hide();
            $("#_030_of32a_date").attr("disabled", false);
            $("#_031_of32a_currency").attr("disabled", false);
            $("#_032_of32a_amount").attr("disabled", false);
            $("#_033_of32k_day_month").attr("disabled", true);
            $("#_034_of32k_number_of_days_months").attr("disabled", true);
            $("#_035_of32k_code").attr("disabled", true);
            $("#_036_of32k_currency").attr("disabled", true);
            $("#_037_of32k_amount").attr("disabled", true);
        } else if ($("#_033_of32k_day_month").val() != "" || $("#_034_of32k_number_of_days_months").val() != "" || $("#_035_of32k_code").val() != "" || $("#_036_of32k_currency").val() != "" || $("#_037_of32k_amount").val() != ""){
            $("#type_of32_existing_maturity").val("k").attr("selected",true);
            $("#div_of32a_").hide();
            $("#div_of32k_").show();
            $("#_030_of32a_date").attr("disabled", true);
            $("#_031_of32a_currency").attr("disabled", true);
            $("#_032_of32a_amount").attr("disabled", true);
            $("#_033_of32k_day_month").attr("disabled", false);
            $("#_034_of32k_number_of_days_months").attr("disabled", false);
            $("#_035_of32k_code").attr("disabled", false);
            $("#_036_of32k_currency").attr("disabled", false);
            $("#_037_of32k_amount").attr("disabled", false);
        } else{
            $("#div_of32a_").hide();
            $("#div_of32k_").hide();
            $("#_030_of32a_date").attr("disabled", true);
            $("#_031_of32a_currency").attr("disabled", true);
            $("#_032_of32a_amount").attr("disabled", true);
            $("#_033_of32k_day_month").attr("disabled", true);
            $("#_034_of32k_number_of_days_months").attr("disabled", true);
            $("#_035_of32k_code").attr("disabled", true);
            $("#_036_of32k_currency").attr("disabled", true);
            $("#_037_of32k_amount").attr("disabled", true);
        } 
        
        //OF33_a_k
        if ($("#_040_of33a_date").val() != "" || $("#_041_of33a_currency").val() != "" || $("#_042_of33a_amount").val() != ""){
            $("#type_of33_amended_maturity").val("a").attr("selected",true);
            $("#div_of33a_").show();
            $("#div_of33k_").hide();
            $("#_040_of33a_date").attr("disabled", false);
            $("#_041_of33a_currency").attr("disabled", false);
            $("#_042_of33a_amount").attr("disabled", false);
            $("#_043_of33k_day_month").attr("disabled", true);
            $("#_044_of33k_number_of_days_months").attr("disabled", true);
            $("#_045_of33k_code").attr("disabled", true);
            $("#_046_of33k_currency").attr("disabled", true);
            $("#_047_of33k_amount").attr("disabled", true);
        } else if ($("#_043_of33k_day_month").val() != "" || $("#_044_of33k_number_of_days_months").val() != "" || $("#_045_of33k_code").val() != "" || $("#_046_of33k_currency").val() != "" || $("#_047_of33k_amount").val() != ""){
            $("#type_of33_amended_maturity").val("k").attr("selected",true);
            $("#div_of33a_").hide();
            $("#div_of33k_").show();
            $("#_040_of33a_date").attr("disabled", true);
            $("#_041_of33a_currency").attr("disabled", true);
            $("#_042_of33a_amount").attr("disabled", true);
            $("#_043_of33k_day_month").attr("disabled", false);
            $("#_044_of33k_number_of_days_months").attr("disabled", false);
            $("#_045_of33k_code").attr("disabled", false);
            $("#_046_of33k_currency").attr("disabled", false);
            $("#_047_of33k_amount").attr("disabled", false);
        } else{
            $("#div_of33a_").hide();
            $("#div_of33k_").hide();
            $("#_040_of33a_date").attr("disabled", true);
            $("#_041_of33a_currency").attr("disabled", true);
            $("#_042_of33a_amount").attr("disabled", true);
            $("#_043_of33k_day_month").attr("disabled", true);
            $("#_044_of33k_number_of_days_months").attr("disabled", true);
            $("#_045_of33k_code").attr("disabled", true);
            $("#_046_of33k_currency").attr("disabled", true);
            $("#_047_of33k_amount").attr("disabled", true);
        } 
    });
</script>