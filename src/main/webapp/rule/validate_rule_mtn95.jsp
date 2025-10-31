<%-- 
    Document   : validate_rule_mtn95
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
                _011_mf21_: "required",
                _012_mf75_: "required",

                //of11
                _014_of11r_mt_number: "required",
                _015_of11r_date: "required",
                _017_of11s_mt_number: "required",
                _018_of11s_date: "required"
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        //of11_r_s
        $("#div_of11r_").hide();
        $("#div_of11s_").hide();
        $("#_014_of11r_mt_number").attr("disabled", true);
        $("#_015_of11r_date").attr("disabled", true);
        $("#_016_of11r_session_number").attr("disabled", true);
        $("#_017_of11s_mt_number").attr("disabled", true);
        $("#_018_of11s_date").attr("disabled", true);
        $("#_019_of11s_session_number").attr("disabled", true);
        $("#type_of11").change(function() {
            if ( $("#type_of11").val() == "r"){
                $("#div_of11r_").show();
                $("#_014_of11r_mt_number").attr("disabled", false);
                $("#_015_of11r_date").attr("disabled", false);
                $("#_016_of11r_session_number").attr("disabled", false);
                $("#div_of11s_").hide();
                $("#_017_of11s_mt_number").attr("disabled", true);
                $("#_018_of11s_date").attr("disabled", true);
                $("#_019_of11s_session_number").attr("disabled", true);
            } else if ( $("#type_of11").val() == "s"){
                $("#div_of11r_").hide();
                $("#_014_of11r_mt_number").attr("disabled", true);
                $("#_015_of11r_date").attr("disabled", true);
                $("#_016_of11r_session_number").attr("disabled", true);
                $("#div_of11s_").show();
                $("#_017_of11s_mt_number").attr("disabled", false);
                $("#_018_of11s_date").attr("disabled", false);
                $("#_019_of11s_session_number").attr("disabled", false);
            } else{
                $("#div_of11r_").hide();
                $("#_014_of11r_mt_number").attr("disabled", true);
                $("#_015_of11r_date").attr("disabled", true);
                $("#_016_of11r_session_number").attr("disabled", true);
                $("#div_of11s_").hide();
                $("#_017_of11s_mt_number").attr("disabled", true);
                $("#_018_of11s_date").attr("disabled", true);
                $("#_019_of11s_session_number").attr("disabled", true);
            }
        });
    });
</script>
