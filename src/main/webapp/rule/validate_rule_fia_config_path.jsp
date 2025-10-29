<%-- 
    Document   : validate_rule_fia_config_path
    Created on : Apr 29, 2025, 5:10:55 PM
    Author     : Administrator
--%>

<script type="text/javascript">
    console.log($("#protocol").val());
    console.log("Call this please");


    $("#divSFTP").hide();
    $("#privateKeyType").attr("disabled", true);
    $("#privateKeyPath").attr("disabled", true);
    $("##privateKeyPassword").attr("disabled", true);
    $("#keyFilePassword").attr("disabled", true);

    $("#protocol").change(function (){


        if ($("#protocol").val() === "FTPS"){

        }
        else if ($("#protocol").val() === "SFTP"){
            $("#divSFTP").show();
            $("#privateKeyType").attr("disabled", false);
            $("#privateKeyPath").attr("disabled", false);
            $("##privateKeyPassword").attr("disabled", false);
            $("#keyFilePassword").attr("disabled", false);

        }
    })
</script>