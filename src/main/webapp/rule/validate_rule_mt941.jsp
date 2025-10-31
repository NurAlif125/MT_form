<%-- 
    Document   : validate_rule_mt941
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
                _013_mf28_statement_sequence_number: "required",

                //mf62f
                _060_mf62f_mark: "required",
                _061_mf62f_date: "required",
                _062_mf62f_currency: "required",
                _063_mf62f_amount: "required"
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        //of65
        $("#div_of65_").hide();
        $("#_072_of65_mark").attr("disabled", true);
        $("#_073_of65_date").attr("disabled", true);
        $("#_074_of65_currency").attr("disabled", true);
        $("#_075_of65_amount").attr("disabled", true);
        $("#_070_of65_add").click(function() {
            $("#div_of65_").show();
            $("#_072_of65_mark").attr("disabled", false);
            $("#_073_of65_date").attr("disabled", false);
            $("#_074_of65_currency").attr("disabled", false);
            $("#_075_of65_amount").attr("disabled", false);
        });
        $("#_071_of65_remove").click(function() {
            $("#div_of65_").hide();
            $("#_072_of65_mark").attr("disabled", true);
            $("#_073_of65_date").attr("disabled", true);
            $("#_074_of65_currency").attr("disabled", true);
            $("#_075_of65_amount").attr("disabled", true);
        });
    });
</script>
