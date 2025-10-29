<%-- 
    Document   : mt492
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
                //mf20
                _010_mf20_sender_reference: "required",
                
                //mf21
                _020_mf21_related_reference: "required",

                //mf11s
                _030_mf11s_mt_number: "required",
                _031_mf11s_date: "required",
                _032_mf11s_session_number: "required",
                _033_mf11s_isn: "required"
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf11s_mt_number: {required: "mf11s_mt_number harus diisi..!!"},
                _031_mf11s_date: {required: "mf11s_date harus diisi..!!"},
                _032_mf11s_session_number: {required: "mf11s_session_number harus diisi..!!"},
                _033_mf11s_isn: {required: "mf11s_isn harus diisi..!!"}
                
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
        //MF11S_check
        $("#check_mf11s").hide();
        $("#_032_mf11s_session_number").attr("disabled", true);
        $("#_033_mf11s_isn").attr("disabled", true);
        $("#session_number_isn_checkbox").click(function(){
            if ($("#session_number_isn_checkbox").is(":checked")){
                $("#check_mf11s").show();
                $("#_032_mf11s_session_number").attr("disabled", false);
                $("#_033_mf11s_isn").attr("disabled", false);
            } else {
                $("#check_mf11s").hide();
                $("#_032_mf11s_session_number").attr("disabled", true);
                $("#_033_mf11s_isn").attr("disabled", true);
            }
        });
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        //MF11S_check
        if ($("#_032_mf11s_session_number").val() != "" || $("#_033_mf11s_isn").val() != ""){
            $("#session_number_isn_checkbox").attr("checked", true);
            $("#check_mf11s").show();
            $("#_032_mf11s_session_number").attr("disabled", false);
            $("#_033_mf11s_isn").attr("disabled", false);
        } else {
            $("#check_mf11s").hide();
            $("#_032_mf11s_session_number").attr("disabled", true);
            $("#_033_mf11s_isn").attr("disabled", true);
        }
    });
</script>