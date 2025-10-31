<%-- 
    Document   : validate_rule_mt999
    Created on : Mar 19, 2024, 11:05:53 PM
    Author     : LENOVO
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
                _012_mf79_Narrative: "required"
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
