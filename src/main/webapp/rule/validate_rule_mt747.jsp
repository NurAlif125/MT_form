<%-- 
    Document   : mt747
    Created on : Aug 14, 2018
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
                _010_mf20_documentary_credit_number: "required",

                //mf30
                _030_mf30_date_of_authorisation_to_reimburse: "required",
                
                //of23s
                _040_of31e_new_date_of_expiry: {
                    required: function(element) {
                      return $("#_040_of31e_new_date_of_expiry").val() == "" 
                              && $("#_050_of32b_currency").val() == ""
                              && $("#_051_of32b_amount").val() == ""
                              && $("#_060_of33b_currency").val() == ""
                              && $("#_061_of33b_amount").val() == ""
                              && $("#_070_of34b_currency").val() == ""
                              && $("#_071_of34b_amount").val() == ""
                              && $("#_080_of39a_percentage_credit_amount_tolerance1").val() == ""
                              && $("#_081_of39a_percentage_credit_amount_tolerance2").val() == ""
                              && $("#_090_of39c_additional_amount_covered").val() == ""
                              && $("#_100_of72z_sender_to_receiver").val() == ""
                              && $("#_110_of77_narrative").val() == "";
                    }
                },
                
                //of34b
                new_credit_amount_after_amendment_checkbox: {
                    required: function(element) {
                      return ($("#_060_of33b_currency").val() != "" && $("#_061_of33b_amount").val() != "")
                             || ($("#_050_of32b_currency").val() != "" && $("#_051_of32b_amount").val() != "");
                    }
                },
                
                //of33b
                decrease_documentary_credit_amount_checkbox: {
                    required: function(element) {
                      return ($("#_070_of34b_currency").val() != "" && $("#_071_of34b_amount").val() != "" && $("#_050_of32b_currency").val() == "" && $("#_051_of32b_amount").val() == "");
                    }
                },
                
                //of32b
                increase_documentary_credit_amount_checkbox: {
                    required: function(element) {
                      return ($("#_070_of34b_currency").val() != "" && $("#_071_of34b_amount").val() != "" && $("#_060_of33b_currency").val() == "" && $("#_061_of33b_amount").val() == "");
                    }
                },
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_documentary_credit_number: {required: "mf20_documentary_credit_number harus diisi..!!"},
                _030_mf30_date_of_authorisation_to_reimburse: {required: "mf30_date_of_authorisation_to_reimburse harus diisi..!!"},
                _040_of31e_new_date_of_expiry: {required: "isi setidaknya satu field setelah mf30..!!"},
                new_credit_amount_after_amendment_checkbox: {required: "of34b harus diisi jika of32b atau of33b diisi..!!"},
                decrease_documentary_credit_amount_checkbox: {required: "isi antara of32b atau of33b jika of34b diisi..!!"},
                increase_documentary_credit_amount_checkbox: {required: "isi antara of32b atau of33b jika of34b diisi..!!"},
                
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
        
        //OF32B_check
        $("#check_of32b").hide();
        $("#_050_of32b_currency").attr("disabled", true);
        $("#_051_of32b_amount").attr("disabled", true);
        $("#increase_documentary_credit_amount_checkbox").click(function(){
            if ($("#increase_documentary_credit_amount_checkbox").is(":checked")){
                $("#check_of32b").show();
                $("#_050_of32b_currency").attr("disabled", false);
                $("#_051_of32b_amount").attr("disabled", false);
            } else {
                $("#check_of32b").hide();
                $("#_050_of32b_currency").attr("disabled", true);
                $("#_051_of32b_amount").attr("disabled", true);
            }
        });
        
        //OF33B_check
        $("#check_of33b").hide();
        $("#_060_of33b_currency").attr("disabled", true);
        $("#_061_of33b_amount").attr("disabled", true);
        $("#decrease_documentary_credit_amount_checkbox").click(function(){
            if ($("#decrease_documentary_credit_amount_checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_060_of33b_currency").attr("disabled", false);
                $("#_061_of33b_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_060_of33b_currency").attr("disabled", true);
                $("#_061_of33b_amount").attr("disabled", true);
            }
        });
        
        //OF34B_check
        $("#check_of34b").hide();
        $("#_070_of34b_currency").attr("disabled", true);
        $("#_071_of34b_amount").attr("disabled", true);
        $("#new_credit_amount_after_amendment_checkbox").click(function(){
            if ($("#new_credit_amount_after_amendment_checkbox").is(":checked")){
                $("#check_of34b").show();
                $("#_070_of34b_currency").attr("disabled", false);
                $("#_071_of34b_amount").attr("disabled", false);
            } else {
                $("#check_of34b").hide();
                $("#_070_of34b_currency").attr("disabled", true);
                $("#_071_of34b_amount").attr("disabled", true);
            }
        });
        
        //OF39A_check
        $("#check_of39a").hide();
        $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
        $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function(){
            if ($("#percentage_credit_amount_checkbox").is(":checked")){
                $("#check_of39a").show();
                $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
            }
        });
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF32B_check
        if ($("#_050_of32b_currency").val() != "" || $("#_051_of32b_amount").val() != ""){
            $("#increase_documentary_credit_amount_checkbox").attr("checked", true);
            $("#check_of32b").show();
            $("#_050_of32b_currency").attr("disabled", false);
            $("#_051_of32b_amount").attr("disabled", false);
        } else {
            $("#check_of32b").hide();
            $("#_050_of32b_currency").attr("disabled", true);
            $("#_051_of32b_amount").attr("disabled", true);
        }
        
        //OF33B_check
        if ($("#_060_of33b_currency").val() != "" || $("#_061_of33b_amount").val() != ""){
            $("#decrease_documentary_credit_amount_checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_060_of33b_currency").attr("disabled", false);
            $("#_061_of33b_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_060_of33b_currency").attr("disabled", true);
            $("#_061_of33b_amount").attr("disabled", true);
        }
        
        //OF34B_check
        if ($("#_070_of34b_currency").val() != "" || $("#_071_of34b_amount").val() != ""){
            $("#new_credit_amount_after_amendment_checkbox").attr("checked", true);
            $("#check_of34b").show();
            $("#_070_of34b_currency").attr("disabled", false);
            $("#_071_of34b_amount").attr("disabled", false);
        } else {
            $("#check_of34b").hide();
            $("#_070_of34b_currency").attr("disabled", true);
            $("#_071_of34b_amount").attr("disabled", true);
        }
        
        //OF39A_check
        if ($("#_080_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_081_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_080_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_081_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
    });
</script>