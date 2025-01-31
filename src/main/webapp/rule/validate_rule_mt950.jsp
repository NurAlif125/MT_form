<%-- 
    Document   : validate_rule_mt950
    Created on : Mei 22, 2019
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
                _010_mf20_transaction_reference_number: "required",
                _020_mf25_account_identification: "required",
                _030_mf28c_statement_sequence_number: "required",

                //mf60_f_m
                type_mf60_opening_balance: "required",
                _040_mf60f_dc_mark: "required",
                _041_mf60f_date: "required",
                _042_mf60f_currency: "required",
                _043_mf60f_amount: "required",

                _044_mf60m_dc_mark: "required",
                _045_mf60m_date: "required",
                _046_mf60m_currency: "required",
                _047_mf60m_amount: "required",

                //mf62_f_m
                type_mf62_closing_balance: "required",
                _061_mf62f_dc_mark: "required",
                _062_mf62f_date: "required",
                _063_mf62f_currency: "required",
                _064_mf62f_amount: "required",

                _065_mf62m_dc_mark: "required",
                _066_mf62m_date: "required",
                _067_mf62m_currency: "required",
                _068_mf62m_amount: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _020_mf25_account_identification: {required: "mf25_account_identification harus diisi..!!"},
                _030_mf28c_statement_sequence_number: {required: "mf28c_statement_sequence_number harus diisi..!!"},
                type_mf60_opening_balance: {required: "mf60 harus diisi..!!"},
                _040_mf60f_dc_mark: {required: "_mf60f_dc_mark harus diisi..!!"},
                _041_mf60f_date: {required: "mf60f_date harus diisi..!!"},
                _042_mf60f_currency: {required: "mf60f_currency harus diisi..!!"},
                _043_mf60f_amount: {required: "mf60f_amount harus diisi..!!"},
                _044_mf60m_dc_mark: {required: "mf60m_dc_mark harus diisi..!!"},
                _045_mf60m_date: {required: "mf60m_date harus diisi..!!"},
                _046_mf60m_currency: {required: "mf60m_currency harus diisi..!!"},
                _047_mf60m_amount: {required: "mf60m_amount harus diisi..!!"},
                type_mf62_closing_balance: {required: "mf62 harus diisi..!!"},
                _061_mf62f_dc_mark: {required: "mf62f_dc_mark harus diisi..!!"},
                _062_mf62f_date: {required: "mf62f_date harus diisi..!!"},
                _063_mf62f_currency: {required: "mf62f_currency harus diisi..!!"},
                _064_mf62f_amount: {required: "mf62f_amount harus diisi..!!"},
                _065_mf62m_dc_mark: {required: "mf62m_dc_mark harus diisi..!!"},
                _066_mf62m_date: {required: "mf62m_date harus diisi..!!"},
                _067_mf62m_currency: {required: "mf62m_currency harus diisi..!!"},
                _068_mf62m_amount: {required: "mf62m_amount harus diisi..!!"},
                
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
        //mf60_f_m
        $("#div_mf60f_first_opening_balance").hide();
        $("#div_mf60m_intermediate_opening_balance").hide();
        $("#_040_mf60f_dc_mark").attr("disabled", true);
        $("#_041_mf60f_date").attr("disabled", true);
        $("#_042_mf60f_currency").attr("disabled", true);
        $("#_043_mf60f_amount").attr("disabled", true);
        $("#_044_mf60m_dc_mark").attr("disabled", true);
        $("#_045_mf60m_date").attr("disabled", true);
        $("#_046_mf60m_currency").attr("disabled", true);
        $("#_047_mf60m_amount").attr("disabled", true);
        $("#type_mf60_opening_balance").change(function() {
            if ( $("#type_mf60_opening_balance").val() == "f"){
                $("#div_mf60f_first_opening_balance").show();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_040_mf60f_dc_mark").attr("disabled", false);
                $("#_041_mf60f_date").attr("disabled", false);
                $("#_042_mf60f_currency").attr("disabled", false);
                $("#_043_mf60f_amount").attr("disabled", false);
                $("#_044_mf60m_dc_mark").attr("disabled", true);
                $("#_045_mf60m_date").attr("disabled", true);
                $("#_046_mf60m_currency").attr("disabled", true);
                $("#_047_mf60m_amount").attr("disabled", true);
            } else if ( $("#type_mf60_opening_balance").val() == "m"){
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").show();
                $("#_040_mf60f_dc_mark").attr("disabled", true);
                $("#_041_mf60f_date").attr("disabled", true);
                $("#_042_mf60f_currency").attr("disabled", true);
                $("#_043_mf60f_amount").attr("disabled", true);
                $("#_044_mf60m_dc_mark").attr("disabled", false);
                $("#_045_mf60m_date").attr("disabled", false);
                $("#_046_mf60m_currency").attr("disabled", false);
                $("#_047_mf60m_amount").attr("disabled", false);
            } else{
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_040_mf60f_dc_mark").attr("disabled", true);
                $("#_041_mf60f_date").attr("disabled", true);
                $("#_042_mf60f_currency").attr("disabled", true);
                $("#_043_mf60f_amount").attr("disabled", true);
                $("#_044_mf60m_dc_mark").attr("disabled", true);
                $("#_045_mf60m_date").attr("disabled", true);
                $("#_046_mf60m_currency").attr("disabled", true);
                $("#_047_mf60m_amount").attr("disabled", true);
            }
        });

        //of61
        $("#div_of61_statement_line").hide();
        $("#_052_of61_statement_line").attr("disabled", true);
        $("#_050_of61_add").click(function() {
            $("#div_of61_statement_line").show();
            $("#_052_of61_statement_line").attr("disabled", false);
        });
        $("#_051_of61_remove").click(function() {
            $("#div_of61_statement_line").hide();
            $("#_052_of61_statement_line").attr("disabled", true);
        });

        //of62_f_m
        $("#div_mf62f_closing_balance").hide();
        $("#div_mf62m_closing_balance").hide();
        $("#_061_mf62f_dc_mark").attr("disabled", true);
        $("#_062_mf62f_date").attr("disabled", true);
        $("#_063_mf62f_currency").attr("disabled", true);
        $("#_064_mf62f_amount").attr("disabled", true);
        $("#_065_mf62m_dc_mark").attr("disabled", true);
        $("#_066_mf62m_date").attr("disabled", true);
        $("#_067_mf62m_currency").attr("disabled", true);
        $("#_068_mf62m_amount").attr("disabled", true);
        $("#type_mf62_closing_balance").change(function() {
            if ( $("#type_mf62_closing_balance").val() == "f"){
                $("#div_mf62f_closing_balance").show();
                $("#div_mf62m_closing_balance").hide();
                $("#_061_mf62f_dc_mark").attr("disabled", false);
                $("#_062_mf62f_date").attr("disabled", false);
                $("#_063_mf62f_currency").attr("disabled", false);
                $("#_064_mf62f_amount").attr("disabled", false);
                $("#_065_mf62m_dc_mark").attr("disabled", true);
                $("#_066_mf62m_date").attr("disabled", true);
                $("#_067_mf62m_currency").attr("disabled", true);
                $("#_068_mf62m_amount").attr("disabled", true);
            } else if ( $("#type_mf62_closing_balance").val() == "m"){
                $("#div_mf62f_closing_balance").hide();
                $("#div_mf62m_closing_balance").show();
                $("#_061_mf62f_dc_mark").attr("disabled", true);
                $("#_062_mf62f_date").attr("disabled", true);
                $("#_063_mf62f_currency").attr("disabled", true);
                $("#_064_mf62f_amount").attr("disabled", true);
                $("#_065_mf62m_dc_mark").attr("disabled", false);
                $("#_066_mf62m_date").attr("disabled", false);
                $("#_067_mf62m_currency").attr("disabled", false);
                $("#_068_mf62m_amount").attr("disabled", false);
            } else{
                $("#div_mf62f_closing_balance").hide();
                $("#div_mf62m_closing_balance").hide();
                $("#_061_mf62f_dc_mark").attr("disabled", true);
                $("#_062_mf62f_date").attr("disabled", true);
                $("#_063_mf62f_currency").attr("disabled", true);
                $("#_064_mf62f_amount").attr("disabled", true);
                $("#_065_mf62m_dc_mark").attr("disabled", true);
                $("#_066_mf62m_date").attr("disabled", true);
                $("#_067_mf62m_currency").attr("disabled", true);
                $("#_068_mf62m_amount").attr("disabled", true);
            }
        });
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        //mf60_f_m
        if ($("#_040_mf60f_dc_mark").val() != "" || $("#_041_mf60f_date").val() != "" || $("#_042_mf60f_currency").val() != "" || $("#_043_mf60f_amount").val() != ""){
            $("#type_mf60_opening_balance").val("f").attr("selected",true);
            $("#div_mf60f_first_opening_balance").show();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_040_mf60f_dc_mark").attr("disabled", false);
            $("#_041_mf60f_date").attr("disabled", false);
            $("#_042_mf60f_currency").attr("disabled", false);
            $("#_043_mf60f_amount").attr("disabled", false);
            $("#_044_mf60m_dc_mark").attr("disabled", true);
            $("#_045_mf60m_date").attr("disabled", true);
            $("#_046_mf60m_currency").attr("disabled", true);
            $("#_047_mf60m_amount").attr("disabled", true);
        } else if ($("#_044_mf60m_dc_mark").val() != "" || $("#_045_mf60m_date").val() != "" || $("#_046_mf60m_currency").val() != "" || $("#_047_mf60m_amount").val() != ""){
            $("#type_mf60_opening_balance").val("m").attr("selected",true);
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").show();
            $("#_040_mf60f_dc_mark").attr("disabled", true);
            $("#_041_mf60f_date").attr("disabled", true);
            $("#_042_mf60f_currency").attr("disabled", true);
            $("#_043_mf60f_amount").attr("disabled", true);
            $("#_044_mf60m_dc_mark").attr("disabled", false);
            $("#_045_mf60m_date").attr("disabled", false);
            $("#_046_mf60m_currency").attr("disabled", false);
            $("#_047_mf60m_amount").attr("disabled", false);
        } else{
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_040_mf60f_dc_mark").attr("disabled", true);
            $("#_041_mf60f_date").attr("disabled", true);
            $("#_042_mf60f_currency").attr("disabled", true);
            $("#_043_mf60f_amount").attr("disabled", true);
            $("#_044_mf60m_dc_mark").attr("disabled", true);
            $("#_045_mf60m_date").attr("disabled", true);
            $("#_046_mf60m_currency").attr("disabled", true);
            $("#_047_mf60m_amount").attr("disabled", true);
        }

        //of61
        if ($("#_052_of61_statement_line").val() != ""){
            $("#div_of61_statement_line").show();
            $("#_052_of61_statement_line").attr("disabled", false);
        } else{
            $("#div_of61_statement_line").hide();
            $("#_052_of61_statement_line").attr("disabled", true);
        }
        
        //mf62_f_m
        if ($("#_061_mf62f_dc_mark").val() != "" || $("#_062_mf62f_date").val() != "" || $("#_063_mf62f_currency").val() != "" || $("#_064_mf62f_amount").val() != ""){
            $("#type_mf62_closing_balance").val("f").attr("selected",true);
            $("#div_mf62f_closing_balance").show();
            $("#div_mf62m_closing_balance").hide();
            $("#_061_mf62f_dc_mark").attr("disabled", false);
            $("#_062_mf62f_date").attr("disabled", false);
            $("#_063_mf62f_currency").attr("disabled", false);
            $("#_064_mf62f_amount").attr("disabled", false);
            $("#_065_mf62m_dc_mark").attr("disabled", true);
            $("#_066_mf62m_date").attr("disabled", true);
            $("#_067_mf62m_currency").attr("disabled", true);
            $("#_068_mf62m_amount").attr("disabled", true);
        } else if ($("#_065_mf62m_dc_mark").val() != "" || $("#_066_mf62m_date").val() != "" || $("#_067_mf62m_currency").val() != "" || $("#_068_mf62m_amount").val() != ""){
            $("#type_mf62_closing_balance").val("m").attr("selected",true);
            $("#div_mf62f_closing_balance").hide();
            $("#div_mf62m_closing_balance").show();
            $("#_061_mf62f_dc_mark").attr("disabled", true);
            $("#_062_mf62f_date").attr("disabled", true);
            $("#_063_mf62f_currency").attr("disabled", true);
            $("#_064_mf62f_amount").attr("disabled", true);
            $("#_065_mf62m_dc_mark").attr("disabled", false);
            $("#_066_mf62m_date").attr("disabled", false);
            $("#_067_mf62m_currency").attr("disabled", false);
            $("#_068_mf62m_amount").attr("disabled", false);
        } else{
            $("#div_mf62f_closing_balance").hide();
            $("#div_mf62m_closing_balance").hide();
            $("#_061_mf62f_dc_mark").attr("disabled", true);
            $("#_062_mf62f_date").attr("disabled", true);
            $("#_063_mf62f_currency").attr("disabled", true);
            $("#_064_mf62f_amount").attr("disabled", true);
            $("#_065_mf62m_dc_mark").attr("disabled", true);
            $("#_066_mf62m_date").attr("disabled", true);
            $("#_067_mf62m_currency").attr("disabled", true);
            $("#_068_mf62m_amount").attr("disabled", true);
        }
        
    });
</script>