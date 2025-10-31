<%-- 
    Document   : validate_rule_mt103
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

                //body
                _010_mf20_sending_bank_trn: "required",
                _020_mf21_related_references: "required",

                //mf32a
                type_mf32_amount_traced: "required",
                _031_mf32a_Date: "required",
                _032_mf32a_Currency: "required",
                _033_mf32a_Amount: "required",
                _034_mf32b_Currency: "required",
                _035_mf32b_Amount: "required",
                _036_mf32k_day_month: "required",
                _037_mf32k_number_of_days_months: "required",
                _038_mf32k_code: "required",
                _039_mf32k_currency:"required",
                _040_mf32k_amount:"required",
                

              
              

                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sending_bank_trn: {required: "mf20 harus diisi..!!"},
                _020_mf21_related_references: {required: "mf21 related references harus diisi..!!"},
                
                type_mf32_amount_traced: {required: " type mf32 amount traced: harus diisi..!!"},
                _031_mf32a_Date: {required: "_031_mf32a_date harus diisi..!!"},
                _032_mf32a_Currency: {required: "_032_mf32a_currency harus diisi..!!"},
                _033_mf32a_Amount: {required: "_033_mf32a_amount harus diisi..!!"},
                _034_mf32b_Currency: {required: "_034_mf32b_currency harus diisi..!!"},
                _035_mf32b_Amount: {required: "_035_mf32b_amount harus diisi..!!"},
                _036_mf32k_day_month: {required: "_036_mf32k_daysmonth harus diisi..!!"},
                _037_mf32k_number_of_days_months: {required: " _037_mf32k_numberofdaysmonth harus diisi..!!"},
                _038_mf32k_code: {required: " _038_mf32k_code harus diisi..!!"},
                _039_mf32k_currency:{required: "_039_mf32k_currency harus diisi..!!"},
                _040_mf32k_amount:{required: "_040_mf32k_amount harus diisi..!!"},
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
      //of59//
       $("#check_of59").hide();
        $("#_060_of59_account").attr("disabled", true);
        $("#_061_of59_name_address").attr("disabled", true);
        $("#drawee_checkbox").click(function(){
            if ($("#drawee_checkbox").is(":checked")){
                $("#check_of59").show();
                $("#_060_of59_account").attr("disabled", false);
                $("#_061_of59_name_address").attr("disabled", false);
            } else {
                $("#check_of59").hide();
                $("#_060_of59_account").attr("disabled", true);
                $("#_061_of59_name_address").attr("disabled", true);
            }
        });
        //mf32//
        $("#div_mf32a_").hide();
        $("#div_mf32b_").hide();
        $("#div_mf32k_").hide();
        $("#_031_mf32a_Date").attr("disabled", true);
        $("#_032_mf32a_Currency").attr("disabled", true);
        $("#_033_mf32a_Amount").attr("disabled", true);
        $("#_034_mf32b_Currency").attr("disabled", true);
        $("#_035_mf32b_Amount").attr("disabled", true);
        $("#_036_mf32k_day_month").attr("disabled", true);
        $("#_037_mf32k_number_of_days_months").attr("disabled", true);
        $("#_038_mf32k_code").attr("disabled", true);
        $("#_039_mf32k_currency").attr("disabled", true);
        $("#_040_mf32k_amount").attr("disabled", true);
        $("#type_mf32_amount_traced").change(function () {
            if ($("#type_mf32_amount_traced").val() == "a") {
                $("#div_mf32a_").show();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").hide();
                $("#_031_mf32a_Date").attr("disabled", false);
                $("#_032_mf32a_Currency").attr("disabled", false);
                $("#_033_mf32a_Amount").attr("disabled", false);
                $("#_034_mf32b_Currency").attr("disabled", true);
                $("#_035_mf32b_Amount").attr("disabled", true);
                $("#_036_mf32k_day_month").attr("disabled", true);
                $("#_037_mf32k_number_of_days_months").attr("disabled", true);
                $("#_038_mf32k_code").attr("disabled", true);
                $("#_039_mf32k_currency").attr("disabled", true);
                $("#_040_mf32k_amount").attr("disabled", true);
            } else if ($("#type_mf32_amount_traced").val() == "b") {
                $("#div_mf32a_").hide();
                $("#div_mf32b_").show();
                $("#div_mf32k_").hide();
                $("#_031_mf32a_Date").attr("disabled", true);
                $("#_032_mf32a_Currency").attr("disabled", true);
                $("#_033_mf32a_Amount").attr("disabled", true);
                $("#_034_mf32b_Currency").attr("disabled", false);
                $("#_035_mf32b_Amount").attr("disabled", false);
                $("#_036_mf32k_day_month").attr("disabled", true);
                $("#_037_mf32k_number_of_days_months").attr("disabled", true);
                $("#_038_mf32k_code").attr("disabled", true);
                $("#_039_mf32k_currency").attr("disabled", true);
                $("#_040_mf32k_amount").attr("disabled", true);
            } else if ($("#type_mf32_amount_traced").val() == "k") {
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").show();
                $("#_031_mf32a_Date").attr("disabled", true);
                $("#_032_mf32a_Currency").attr("disabled", true);
                $("#_033_mf32a_Amount").attr("disabled", true);
                $("#_034_mf32b_Currency").attr("disabled", true);
                $("#_035_mf32b_Amount").attr("disabled", true);
                $("#_036_mf32k_day_month").attr("disabled", false);
                $("#_037_mf32k_number_of_days_months").attr("disabled", false);
                $("#_038_mf32k_code").attr("disabled", false);
                $("#_039_mf32k_currency").attr("disabled", false);
                $("#_040_mf32k_amount").attr("disabled", false);
            } else {
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").hide();
                $("#_031_mf32a_Date").attr("disabled", true);
                $("#_032_mf32a_Currency").attr("disabled", true);
                $("#_033_mf32a_Amount").attr("disabled", true);
                $("#_034_mf32b_Currency").attr("disabled", true);
                $("#_035_mf32b_Amount").attr("disabled", true);
                $("#_036_mf32k_day_month").attr("disabled", true);
                $("#_037_mf32k_number_of_days_months").attr("disabled", true);
                $("#_038_mf32k_code").attr("disabled", true);
                $("#_039_mf32k_currency").attr("disabled", true);
                $("#_040_mf32k_amount").attr("disabled", true);
            }
        });

  
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
       if ($("#_060_of59_account").val() != "" || $("#_061_of59_name_address").val() != ""){
            $("#drawee_checkbox").attr("checked", true);
            $("#check_of59").show();
            $("#_060_of59_account").attr("disabled", false);
            $("#_061_of59_name_address").attr("disabled", false);
        } else {
            $("#check_of59").hide();
            $("#_060_of59_account").attr("disabled", true);
            $("#_061_of59_name_address").attr("disabled", true);
        }
        
        

        //mf32 a b k
         if ($("#_031_mf32a_Date").val() != "" || $("#_032_mf32a_Currency").val() != "" || $("#_033_mf32a_Amount").val() != "") {
            $("#type_mf32_amount_traced").val("a").attr("selected", true);
            $("#div_mf32a_").show();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").hide();
            $("#_031_mf32a_Date").attr("disabled", false);
            $("#_032_mf32a_Currency").attr("disabled", false);
            $("#_033_mf32a_Amount").attr("disabled", false);
            $("#_034_mf32b_Currency").attr("disabled", true);
            $("#_035_mf32b_Amount").attr("disabled", true);
            $("#_036_mf32k_day_month").attr("disabled", true);
            $("#_037_mf32k_number_of_days_months").attr("disabled", true);
            $("#_038_mf32k_code").attr("disabled", true);
            $("#_039_mf32k_currency").attr("disabled", true);
            $("#_040_mf32k_amount").attr("disabled", true);
        } else if ($("#_034_mf32b_Currency").val() != "" || $("#_035_mf32b_Amount").val() != "") {
            $("#type_mf32_amount_traced").val("b").attr("selected", true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").show();
            $("#div_mf32k_").hide();
            $("#_031_mf32a_Date").attr("disabled", true);
            $("#_032_mf32a_Currency").attr("disabled", true);
            $("#_033_mf32a_Amount").attr("disabled", true);
            $("#_034_mf32b_Currency").attr("disabled", false);
            $("#_035_mf32b_Amount").attr("disabled", false);
            $("#_036_mf32k_day_month").attr("disabled", true);
            $("#_037_mf32k_number_of_days_months").attr("disabled", true);
            $("#_038_mf32k_code").attr("disabled", true);
            $("#_039_mf32k_currency").attr("disabled", true);
            $("#_040_mf32k_amount").attr("disabled", true);
        } else if ($("#_036_mf32k_day_month").val() != "" || $("#_037_mf32k_number_of_days_months").val() != "" || $("#_038_mf32k_code").val() != "" || $("#_039_mf32k_currency").val() != "" || $("#_040_mf32k_amount").val() != "") {
            $("#type_mf32_amount_traced").val("k").attr("selected", true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").show();
            $("#_031_mf32a_Date").attr("disabled", true);
            $("#_032_mf32a_Currency").attr("disabled", true);
            $("#_033_mf32a_Amount").attr("disabled", true);
            $("#_034_mf32b_Currency").attr("disabled", true);
            $("#_035_mf32b_Amount").attr("disabled", true);
            $("#_036_mf32k_day_month").attr("disabled", false);
            $("#_037_mf32k_number_of_days_months").attr("disabled", false);
            $("#_038_mf32k_code").attr("disabled", false);
            $("#_039_mf32k_currency").attr("disabled", false);
            $("#_040_mf32k_amount").attr("disabled", false);
        } else {
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").hide();
            $("#_031_mf32a_Date").attr("disabled", true);
            $("#_032_mf32a_Currency").attr("disabled", true);
            $("#_033_mf32a_Amount").attr("disabled", true);
            $("#_034_mf32b_Currency").attr("disabled", true);
            $("#_035_mf32b_Amount").attr("disabled", true);
            $("#_036_mf32k_day_month").attr("disabled", true);
            $("#_037_mf32k_number_of_days_months").attr("disabled", true);
            $("#_038_mf32k_code").attr("disabled", true);
            $("#_039_mf32k_currency").attr("disabled", true);
            $("#_040_mf32k_amount").attr("disabled", true);
        }

    });
</script>