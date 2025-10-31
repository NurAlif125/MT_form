<%-- 
    Document   : validate_rule_mt942
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
                _010_mf20_sender_reference: "required",
                _012_mf25_: "required",
                _013_mf28c_statement_sequence_number: "required",

                //mf34f
                _030_mf34f_currency: "required",
                _032_mf34f_amount: "required",

                //mf13d
                _050_mf13d_date_time: "required",
                _051_mf13d_sign_offset: "required"
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        
        
        $("#check_special_rate").hide();
        $("#special_rate").prop("required", false);
        $("#special_rate_checkbox").click(function () {
            if ($("#special_rate_checkbox").is(":checked")) {
                $("#check_special_rate").show();
                $("#special_rate").prop("required", false);
            } else {
                $("#check_special_rate").hide();
                $("#special_rate").prop("required", false);
            }
        });
        
        //of34f
        $("#check_of34f").hide();
        $("#_040_of34f_currency").prop("required", false);
        $("#_041_of34f_mark").prop("required", false);
        $("#_042_of34f_amount").prop("required", false);
        $("#credit_floor_limit_inficator_checkbox").click(function () {
            if ($("#credit_floor_limit_inficator_checkbox").is(":checked")) {
                $("#check_of34f").show();
                $("#_040_of34f_currency").prop("required", true);
                $("#_041_of34f_mark").prop("required", true);
                $("#_042_of34f_amount").prop("required", true);
            } else {
                $("#check_of34f").hide();
                $("#_040_of34f_currency").prop("required", false);
                $("#_041_of34f_mark").prop("required", false);
                $("#_042_of34f_amount").prop("required", false);
            }
        });
        
        
//        //of61
//        $("#div_of61_statement_line").hide();
//        $("#_072_of61_statement_line").attr("disabled", true);
//        $("#_070_of61_add").click(function() {
//            $("#div_of61_statement_line").show();
//            $("#_072_of61_statement_line").attr("disabled", false);
//        });
//        $("#_071_of61_remove").click(function() {
//            $("#div_of61_statement_line").hide();
//            $("#_072_of61_statement_line").attr("disabled", true);
//        });
//        
//        
    });
    
        
        
        
        
        
        
       
</script>
