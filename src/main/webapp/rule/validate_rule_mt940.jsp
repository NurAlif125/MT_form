<%-- 
    Document   : validate_rule_mt940
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
                _030_mf25a_account_identification: "required",
                _040_mf28c_statement_sequence_number: "required",

                //mf60_f_m
                type_mf60_opening_balance: "required",
                _050_mf60f_dc_mark: "required",
                _051_mf60f_date: "required",
                _052_mf60f_currency: "required",
                _053_mf60f_amount: "required",

                _054_mf60m_dc_mark: "required",
                _055_mf60m_date: "required",
                _056_mf60m_currency: "required",
                _057_mf60m_amount: "required",

                //mf62_f_m
                type_mf62_closing_balance: "required",
                _080_mf62f_dc_mark: "required",
                _081_mf62f_date: "required",
                _082_mf62f_currency: "required",
                _083_mf62f_amount: "required",

                _084_mf62m_dc_mark: "required",
                _085_mf62m_date: "required",
                _086_mf62m_currency: "required",
                _087_mf62m_amount: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _030_mf25a_account_identification: {required: "mf25a_account_identification harus diisi..!!"},
                _040_mf28c_statement_sequence_number: {required: "mf28c_statement_sequence_number harus diisi..!!"},
                type_mf60_opening_balance: {required: "mf60 harus diisi..!!"},
                _050_mf60f_dc_mark: {required: "_mf60f_dc_mark harus diisi..!!"},
                _051_mf60f_date: {required: "mf60f_date harus diisi..!!"},
                _052_mf60f_currency: {required: "mf60f_currency harus diisi..!!"},
                _053_mf60f_amount: {required: "mf60f_amount harus diisi..!!"},
                _054_mf60m_dc_mark: {required: "mf60m_dc_mark harus diisi..!!"},
                _055_mf60m_date: {required: "mf60m_date harus diisi..!!"},
                _056_mf60m_currency: {required: "mf60m_currency harus diisi..!!"},
                _057_mf60m_amount: {required: "mf60m_amount harus diisi..!!"},
                type_mf62_closing_balance: {required: "mf62 harus diisi..!!"},
                _080_mf62f_dc_mark: {required: "mf62f_dc_mark harus diisi..!!"},
                _081_mf62f_date: {required: "mf62f_date harus diisi..!!"},
                _082_mf62f_currency: {required: "mf62f_currency harus diisi..!!"},
                _083_mf62f_amount: {required: "mf62f_amount harus diisi..!!"},
                _084_mf62m_dc_mark: {required: "mf62m_dc_mark harus diisi..!!"},
                _085_mf62m_date: {required: "mf62m_date harus diisi..!!"},
                _086_mf62m_currency: {required: "mf62m_currency harus diisi..!!"},
                _087_mf62m_amount: {required: "mf62m_amount harus diisi..!!"},
                
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
        $("#_050_mf60f_dc_mark").attr("disabled", true);
        $("#_051_mf60f_date").attr("disabled", true);
        $("#_052_mf60f_currency").attr("disabled", true);
        $("#_053_mf60f_amount").attr("disabled", true);
        $("#_054_mf60m_dc_mark").attr("disabled", true);
        $("#_055_mf60m_date").attr("disabled", true);
        $("#_056_mf60m_currency").attr("disabled", true);
        $("#_057_mf60m_amount").attr("disabled", true);
        $("#type_mf60_opening_balance").change(function() {
            if ( $("#type_mf60_opening_balance").val() == "f"){
                $("#div_mf60f_first_opening_balance").show();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_050_mf60f_dc_mark").attr("disabled", false);
                $("#_051_mf60f_date").attr("disabled", false);
                $("#_052_mf60f_currency").attr("disabled", false);
                $("#_053_mf60f_amount").attr("disabled", false);
                $("#_054_mf60m_dc_mark").attr("disabled", true);
                $("#_055_mf60m_date").attr("disabled", true);
                $("#_056_mf60m_currency").attr("disabled", true);
                $("#_057_mf60m_amount").attr("disabled", true);
            } else if ( $("#type_mf60_opening_balance").val() == "m"){
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").show();
                $("#_050_mf60f_dc_mark").attr("disabled", true);
                $("#_051_mf60f_date").attr("disabled", true);
                $("#_052_mf60f_currency").attr("disabled", true);
                $("#_053_mf60f_amount").attr("disabled", true);
                $("#_054_mf60m_dc_mark").attr("disabled", false);
                $("#_055_mf60m_date").attr("disabled", false);
                $("#_056_mf60m_currency").attr("disabled", false);
                $("#_057_mf60m_amount").attr("disabled", false);
            } else{
                $("#div_mf60f_first_opening_balance").hide();
                $("#div_mf60m_intermediate_opening_balance").hide();
                $("#_050_mf60f_dc_mark").attr("disabled", true);
                $("#_051_mf60f_date").attr("disabled", true);
                $("#_052_mf60f_currency").attr("disabled", true);
                $("#_053_mf60f_amount").attr("disabled", true);
                $("#_054_mf60m_dc_mark").attr("disabled", true);
                $("#_055_mf60m_date").attr("disabled", true);
                $("#_056_mf60m_currency").attr("disabled", true);
                $("#_057_mf60m_amount").attr("disabled", true);
            }
        });

        //of61
        $("#div_of61_statement_line").hide();
        $("#_062_of61_statement_line").attr("disabled", true);
        $("#_060_of61_add").click(function() {
            $("#div_of61_statement_line").show();
            $("#_062_of61_statement_line").attr("disabled", false);
        });
        $("#_061_of61_remove").click(function() {
            $("#div_of61_statement_line").hide();
            $("#_062_of61_statement_line").attr("disabled", true);
        });

        //of62_f_m
        $("#div_of62f_closing_balance").hide();
        $("#div_of62m_closing_balance").hide();
        $("#_080_mf62f_dc_mark").attr("disabled", true);
        $("#_081_mf62f_date").attr("disabled", true);
        $("#_082_mf62f_currency").attr("disabled", true);
        $("#_083_mf62f_amount").attr("disabled", true);
        $("#_084_mf62m_dc_mark").attr("disabled", true);
        $("#_085_mf62m_date").attr("disabled", true);
        $("#_086_mf62m_currency").attr("disabled", true);
        $("#_087_mf62m_amount").attr("disabled", true);
        $("#type_mf62_closing_balance").change(function() {
            if ( $("#type_mf62_closing_balance").val() == "f"){
                $("#div_of62f_closing_balance").show();
                $("#div_of62m_closing_balance").hide();
                $("#_080_mf62f_dc_mark").attr("disabled", false);
                $("#_081_mf62f_date").attr("disabled", false);
                $("#_082_mf62f_currency").attr("disabled", false);
                $("#_083_mf62f_amount").attr("disabled", false);
                $("#_084_mf62m_dc_mark").attr("disabled", true);
                $("#_085_mf62m_date").attr("disabled", true);
                $("#_086_mf62m_currency").attr("disabled", true);
                $("#_087_mf62m_amount").attr("disabled", true);
            } else if ( $("#type_mf62_closing_balance").val() == "m"){
                $("#div_of62f_closing_balance").hide();
                $("#div_of62m_closing_balance").show();
                $("#_080_mf62f_dc_mark").attr("disabled", true);
                $("#_081_mf62f_date").attr("disabled", true);
                $("#_082_mf62f_currency").attr("disabled", true);
                $("#_083_mf62f_amount").attr("disabled", true);
                $("#_084_mf62m_dc_mark").attr("disabled", false);
                $("#_085_mf62m_date").attr("disabled", false);
                $("#_086_mf62m_currency").attr("disabled", false);
                $("#_087_mf62m_amount").attr("disabled", false);
            } else{
                $("#div_of62f_closing_balance").hide();
                $("#div_of62m_closing_balance").hide();
                $("#_080_mf62f_dc_mark").attr("disabled", true);
                $("#_081_mf62f_date").attr("disabled", true);
                $("#_082_mf62f_currency").attr("disabled", true);
                $("#_083_mf62f_amount").attr("disabled", true);
                $("#_084_mf62m_dc_mark").attr("disabled", true);
                $("#_085_mf62m_date").attr("disabled", true);
                $("#_086_mf62m_currency").attr("disabled", true);
                $("#_087_mf62m_amount").attr("disabled", true);
            }
        });

        //of65
        $("#div_of65_forward_available_balance").hide();
        $("#_102_of65_dc_mark").attr("disabled", true);
        $("#_103_of65_date").attr("disabled", true);
        $("#_104_of65_currency").attr("disabled", true);
        $("#_105_of65_amount").attr("disabled", true);
        $("#_100_of65_add").click(function() {
            $("#div_of65_forward_available_balance").show();
            $("#_102_of65_dc_mark").attr("disabled", false);
            $("#_103_of65_date").attr("disabled", false);
            $("#_104_of65_currency").attr("disabled", false);
            $("#_105_of65_amount").attr("disabled", false);
        });
        $("#_101_of65_remove").click(function() {
            $("#div_of65_forward_available_balance").hide();
            $("#_102_of65_dc_mark").attr("disabled", true);
            $("#_103_of65_date").attr("disabled", true);
            $("#_104_of65_currency").attr("disabled", true);
            $("#_105_of65_amount").attr("disabled", true);
        });
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        //mf60_f_m
        if ($("#_050_mf60f_dc_mark").val() != "" || $("#_051_mf60f_date").val() != "" || $("#_052_mf60f_currency").val() != "" || $("#_053_mf60f_amount").val() != ""){
            $("#type_mf60_opening_balance").val("f").attr("selected",true);
            $("#div_mf60f_first_opening_balance").show();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_050_mf60f_dc_mark").attr("disabled", false);
            $("#_051_mf60f_date").attr("disabled", false);
            $("#_052_mf60f_currency").attr("disabled", false);
            $("#_053_mf60f_amount").attr("disabled", false);
            $("#_054_mf60m_dc_mark").attr("disabled", true);
            $("#_055_mf60m_date").attr("disabled", true);
            $("#_056_mf60m_currency").attr("disabled", true);
            $("#_057_mf60m_amount").attr("disabled", true);
        } else if ($("#_054_mf60m_dc_mark").val() != "" || $("#_055_mf60m_date").val() != "" || $("#_056_mf60m_currency").val() != "" || $("#_057_mf60m_amount").val() != ""){
            $("#type_mf60_opening_balance").val("m").attr("selected",true);
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").show();
            $("#_050_mf60f_dc_mark").attr("disabled", true);
            $("#_051_mf60f_date").attr("disabled", true);
            $("#_052_mf60f_currency").attr("disabled", true);
            $("#_053_mf60f_amount").attr("disabled", true);
            $("#_054_mf60m_dc_mark").attr("disabled", false);
            $("#_055_mf60m_date").attr("disabled", false);
            $("#_056_mf60m_currency").attr("disabled", false);
            $("#_057_mf60m_amount").attr("disabled", false);
        } else{
            $("#div_mf60f_first_opening_balance").hide();
            $("#div_mf60m_intermediate_opening_balance").hide();
            $("#_050_mf60f_dc_mark").attr("disabled", true);
            $("#_051_mf60f_date").attr("disabled", true);
            $("#_052_mf60f_currency").attr("disabled", true);
            $("#_053_mf60f_amount").attr("disabled", true);
            $("#_054_mf60m_dc_mark").attr("disabled", true);
            $("#_055_mf60m_date").attr("disabled", true);
            $("#_056_mf60m_currency").attr("disabled", true);
            $("#_057_mf60m_amount").attr("disabled", true);
        }

        //of61
        if ($("#_062_of61_statement_line").val() != ""){
            $("#div_of61_statement_line").show();
            $("#_062_of61_statement_line").attr("disabled", false);
        } else{
            $("#div_of61_statement_line").hide();
            $("#_062_of61_statement_line").attr("disabled", true);
        }
        
        //mf62_f_m
        if ($("#_080_mf62f_dc_mark").val() != "" || $("#_081_mf62f_date").val() != "" || $("#_082_mf62f_currency").val() != "" || $("#_083_mf62f_amount").val() != ""){
            $("#type_mf62_closing_balance").val("f").attr("selected",true);
            $("#div_of62f_closing_balance").show();
            $("#div_of62m_closing_balance").hide();
            $("#_080_mf62f_dc_mark").attr("disabled", false);
            $("#_081_mf62f_date").attr("disabled", false);
            $("#_082_mf62f_currency").attr("disabled", false);
            $("#_083_mf62f_amount").attr("disabled", false);
            $("#_084_mf62m_dc_mark").attr("disabled", true);
            $("#_085_mf62m_date").attr("disabled", true);
            $("#_086_mf62m_currency").attr("disabled", true);
            $("#_087_mf62m_amount").attr("disabled", true);
        } else if ($("#_084_mf62m_dc_mark").val() != "" || $("#_085_mf62m_date").val() != "" || $("#_086_mf62m_currency").val() != "" || $("#_087_mf62m_amount").val() != ""){
            $("#type_mf62_closing_balance").val("m").attr("selected",true);
            $("#div_of62f_closing_balance").hide();
            $("#div_of62m_closing_balance").show();
            $("#_080_mf62f_dc_mark").attr("disabled", true);
            $("#_081_mf62f_date").attr("disabled", true);
            $("#_082_mf62f_currency").attr("disabled", true);
            $("#_083_mf62f_amount").attr("disabled", true);
            $("#_084_mf62m_dc_mark").attr("disabled", false);
            $("#_085_mf62m_date").attr("disabled", false);
            $("#_086_mf62m_currency").attr("disabled", false);
            $("#_087_mf62m_amount").attr("disabled", false);
        } else{
            $("#div_of62f_closing_balance").hide();
            $("#div_of62m_closing_balance").hide();
            $("#_080_mf62f_dc_mark").attr("disabled", true);
            $("#_081_mf62f_date").attr("disabled", true);
            $("#_082_mf62f_currency").attr("disabled", true);
            $("#_083_mf62f_amount").attr("disabled", true);
            $("#_084_mf62m_dc_mark").attr("disabled", true);
            $("#_085_mf62m_date").attr("disabled", true);
            $("#_086_mf62m_currency").attr("disabled", true);
            $("#_087_mf62m_amount").attr("disabled", true);
        }
        
        //of65
        if ($("#_102_of65_dc_mark").val() != "" || $("#_103_of65_date").val() != "" || $("#_104_of65_currency").val() != "" || $("#_105_of65_amount").val() != ""){
            $("#div_of65_forward_available_balance").show();
            $("#_102_of65_dc_mark").attr("disabled", false);
            $("#_103_of65_date").attr("disabled", false);
            $("#_104_of65_currency").attr("disabled", false);
            $("#_105_of65_amount").attr("disabled", false);
        } else{
            $("#div_of65_forward_available_balance").hide();
            $("#_102_of65_dc_mark").attr("disabled", true);
            $("#_103_of65_date").attr("disabled", true);
            $("#_104_of65_currency").attr("disabled", true);
            $("#_105_of65_amount").attr("disabled", true);
        }
    });
</script>