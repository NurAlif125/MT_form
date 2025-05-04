/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

 $(document).ready(function () {
     
     
    $("#divNonLocal").hide();
    $("#host").attr("disabled", true);
    $("#port").attr("disabled", true);
    $("#userName").attr("disabled", true);
    $("#password").attr("disabled", true);

    $("#divSFTP").hide();
    $("#privateKeyType").attr("disabled", true);
    $("#privateKeyPath").attr("disabled", true);
    $("#keyFilePassword").attr("disabled", true);
    $("#clientAuthenticationTypeSFTP").attr("disabled",true);
    
    
    $("#divFTPS").hide();
    $("#keyStoreFile").attr("disabled", true);
    $("#keyStorePassword").attr("disabled", true);
    $("#keyStoreAlias").attr("disabled", true);
    $("#privateKeyPassword").attr("disabled", true);
    $("#clientAuthenticationTypeFTPS").attr("disabled",true);
    
    
    // precondition is put get
    if($("#isPutOrGet").is(":checked") === true){
        // transfer path yg ditampilkan
        $("#divTransferPath").show();
        $("#transferPath").attr("disabled",false);

        $("#divPath").hide();
        $("#path").attr("disabled",true);
    }
    else {
        // path yg ditampilkan
        $("#divTransferPath").hide();
        $("#transferPath").attr("disabled",true);

        $("#divPath").show();
        $("#path").attr("disabled",false);
    }
    
    // preconditino
    if ($("#protocol").val() === "FTPS"){

        $("#divNonLocal").show();
        $("#host").attr("disabled", false);
        $("#port").attr("disabled", false);
        $("#userName").attr("disabled", false);
        $("#password").attr("disabled", false);

        // Disable FTPS
        $("#divFTPS").show();
        $("#keyStoreFile").attr("disabled", false);
        $("#keyStorePassword").attr("disabled", false);
        $("#keyStoreAlias").attr("disabled", false);
        $("#privateKeyPassword").attr("disabled", false);
        $("#clientAuthenticationTypeFTPS").attr("disabled",false);

        // Disable SFTP
        $("#divSFTP").hide();
        $("#privateKeyType").attr("disabled", true);
        $("#privateKeyPath").attr("disabled", true);
        $("#keyFilePassword").attr("disabled", true);
        $("#clientAuthenticationTypeSFTP").attr("disabled",true);

    }
    else if ($("#protocol").val() === "FTP"){

        $("#divNonLocal").show();
        $("#host").attr("disabled", false);
        $("#port").attr("disabled", false);
        $("#userName").attr("disabled", false);
        $("#password").attr("disabled", false);

        // Disable FTPS
        $("#divFTPS").show();
        $("#keyStoreFile").attr("disabled", true);
        $("#keyStorePassword").attr("disabled", true);
        $("#keyStoreAlias").attr("disabled", true);
        $("#privateKeyPassword").attr("disabled", true);
        $("#clientAuthenticationTypeFTPS").attr("disabled",true);

        // Disable SFTP
        $("#divSFTP").hide();
        $("#privateKeyType").attr("disabled", true);
        $("#privateKeyPath").attr("disabled", true);
        $("#keyFilePassword").attr("disabled", true);
        $("#clientAuthenticationTypeSFTP").attr("disabled",true);

    }
    else if ($("#protocol").val() === "SFTP"){

        $("#divNonLocal").show();
        $("#host").attr("disabled", false);
        $("#port").attr("disabled", false);
        $("#userName").attr("disabled", false);
        $("#password").attr("disabled", false);

        // Enable SFTP
        $("#divSFTP").show();
        $("#privateKeyType").attr("disabled", false);
        $("#privateKeyPath").attr("disabled", false);;
        $("#keyFilePassword").attr("disabled", false);
        $("#clientAuthenticationTypeSFTP").attr("disabled",false);

        // Disable FTPS
        $("#divFTPS").hide();
        $("#keyStoreFile").attr("disabled", true);
        $("#keyStorePassword").attr("disabled", true);
        $("#keyStoreAlias").attr("disabled", true);
        $("#privateKeyPassword").attr("disabled", true);
        $("#clientAuthenticationTypeFTPS").attr("disabled",true);
    }
    else if ($("#protocol").val() === ""){

        // disable juga yg lain
        $("#divNonLocal").hide();
        $("#host").attr("disabled", true);
        $("#port").attr("disabled", true);
        $("#userName").attr("disabled", true);
        $("#password").attr("disabled", true);

        // Disable SFTP
        $("#divSFTP").hide();
        $("#privateKeyType").attr("disabled", true);
        $("#privateKeyPath").attr("disabled", true);
        $("#keyFilePassword").attr("disabled", true);
        $("#clientAuthenticationTypeSFTP").attr("disabled",true);

        // Disable FTPS
        $("#divFTPS").hide();
        $("#keyStoreFile").attr("disabled", true);
        $("#keyStorePassword").attr("disabled", true);
        $("#keyStoreAlias").attr("disabled", true);
        $("#privateKeyPassword").attr("disabled", true);
        $("#clientAuthenticationTypeFTPS").attr("disabled",true);
    }

    $("#protocol").change(function (){

        if ($("#protocol").val() === "FTPS"){
            
            $("#divNonLocal").show();
            $("#host").attr("disabled", false);
            $("#port").attr("disabled", false);
            $("#userName").attr("disabled", false);
            $("#password").attr("disabled", false);
            
            // Disable FTPS
            $("#divFTPS").show();
            $("#keyStoreFile").attr("disabled", false);
            $("#keyStorePassword").attr("disabled", false);
            $("#keyStoreAlias").attr("disabled", false);
            $("#privateKeyPassword").attr("disabled", false);
            $("#clientAuthenticationTypeFTPS").attr("disabled",false);
            
            // Disable SFTP
            $("#divSFTP").hide();
            $("#privateKeyType").attr("disabled", true);
            $("#privateKeyPath").attr("disabled", true);
            $("#keyFilePassword").attr("disabled", true);
            $("#clientAuthenticationTypeSFTP").attr("disabled",true);

        }
        else if ($("#protocol").val() === "FTP"){

            $("#divNonLocal").show();
            $("#host").attr("disabled", false);
            $("#port").attr("disabled", false);
            $("#userName").attr("disabled", false);
            $("#password").attr("disabled", false);

            // Disable FTPS
            $("#divFTPS").show();
            $("#keyStoreFile").attr("disabled", true);
            $("#keyStorePassword").attr("disabled", true);
            $("#keyStoreAlias").attr("disabled", true);
            $("#privateKeyPassword").attr("disabled", true);
            $("#clientAuthenticationTypeFTPS").attr("disabled",true);

            // Disable SFTP
            $("#divSFTP").hide();
            $("#privateKeyType").attr("disabled", true);
            $("#privateKeyPath").attr("disabled", true);
            $("#keyFilePassword").attr("disabled", true);
            $("#clientAuthenticationTypeSFTP").attr("disabled",true);

        }
        else if ($("#protocol").val() === "SFTP"){
            
            $("#divNonLocal").show();
            $("#host").attr("disabled", false);
            $("#port").attr("disabled", false);
            $("#userName").attr("disabled", false);
            $("#password").attr("disabled", false);
            
            // Enable SFTP
            $("#divSFTP").show();
            $("#privateKeyType").attr("disabled", false);
            $("#privateKeyPath").attr("disabled", false);;
            $("#keyFilePassword").attr("disabled", false);
            $("#clientAuthenticationTypeSFTP").attr("disabled",false);
            
            // Disable FTPS
            $("#divFTPS").hide();
            $("keyStoreFile").attr("disabled", true);
            $("keyStorePassword").attr("disabled", true);
            $("keyStoreAlias").attr("disabled", true);
            $("#privateKeyPassword").attr("disabled", true);
            $("#clientAuthenticationTypeFTPS").attr("disabled",true);
        }
        else if ($("#protocol").val() === ""){
            
            // disable juga yg lain
            $("#divNonLocal").hide();
            $("#host").attr("disabled", true);
            $("#port").attr("disabled", true);
            $("#userName").attr("disabled", true);
            $("#password").attr("disabled", true);
            
            // Disable SFTP
            $("#divSFTP").hide();
            $("#privateKeyType").attr("disabled", true);
            $("#privateKeyPath").attr("disabled", true);
            $("#keyFilePassword").attr("disabled", true);
            $("#clientAuthenticationTypeSFTP").attr("disabled",true);
            
            // Disable FTPS
            $("#divFTPS").hide();
            $("keyStoreFile").attr("disabled", true);
            $("keyStorePassword").attr("disabled", true);
            $("keyStoreAlias").attr("disabled", true);
            $("#privateKeyPassword").attr("disabled", true);
            $("#clientAuthenticationTypeFTPS").attr("disabled",true);
        }
    });
    
    
    $("#isPutOrGet").change(function (){
       
       // Jika true maka ini PUT
        if($("#isPutOrGet").is(":checked") === true){
            // transfer path yg ditampilkan
            $("#divTransferPath").show();
            $("#transferPath").attr("disabled",false);
            
            $("#divPath").hide();
            $("#path").attr("disabled",true);
        }
        else {
            // path yg ditampilkan
            $("#divTransferPath").hide();
            $("#transferPath").attr("disabled",true);
            
            $("#divPath").show();
            $("#path").attr("disabled",false);
        }
        
    });
 });