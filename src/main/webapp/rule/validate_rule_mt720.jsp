<%-- 
    Document   : validate_rule_mt103
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
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                _020_mf40b_type: "required",
                _021_mf40b_code: "required",
//               
                _030_mf20_Transferring_Banks_Reference: "required",
                _040_mf21_Documentary_Credit_Number: "required",
                _050_mf31c_date_of_issue: "required",
                _060_mf40e_applicable_rules: "required",
                
                _070_mf31d_date: "required",
                _071_mf31d_place: "required",
                _100_mf50_First_Beneficiary:"required",
                _111_mf59_name_address:"required",
                _120_mf32b_currency_code:"required",
                _130_mf32b_amount:"required",
                _360_mf49_confirmation_instruction:"required",
                
                //mf41//
                type_mf41_Available: "required",
                _161_mf41a_party_identifier: "required",
                _162_mf41a_code: "required",
                _163_mf41d_Name_and_address: "required",
                _164_mf41d_code: "required",

                //of42A//
                _182_of42a_identifier_code: "required",
                _184_of42d_name_address: "required",
              
                //of42C
                _170_of42c_drafts_at: {
                    required: function(element) {
                        return ($("#type_of42_drawee").val() != "")
//                          || ($("#type_of42_drawee").val() == "" && $("#_190_of42m_Mixed_Payment_Details").val() == "" && $("#_200_of42p_Negotiation_Deferred_Payment_Details").val() == "")
                          || ($("#type_of42_drawee").val() != "" && $("#_190_of42m_Mixed_Payment_Details").val() != "")
                          || ($("#type_of42_drawee").val() != "" && $("#_200_of42p_Negotiation_Deferred_Payment_Details").val() != "")
                          || ($("#_190_of42m_Mixed_Payment_Details").val() != "" && $("#_200_of42p_Negotiation_Deferred_Payment_Details").val() != "");
                    }
                },
                
                //of42
                type_of42_drawee: {
                    required: function(element) {
                        return ($("#_170_of42c_drafts_at").val() != "")
//                          || ($("#_170_of42c_drafts_at").val() == "" && $("#_190_of42m_Mixed_Payment_Details").val() == "" && $("#_200_of42p_Negotiation_Deferred_Payment_Details").val() == "")
                          || ($("#_170_of42c_drafts_at").val() != "" && $("#_190_of42m_Mixed_Payment_Details").val() != "")
                          || ($("#_170_of42c_drafts_at").val() != "" && $("#_200_of42p_Negotiation_Deferred_Payment_Details").val() != "")
                          || ($("#_190_of42m_Mixed_Payment_Details").val() != "" && $("#_200_of42p_Negotiation_Deferred_Payment_Details").val() != "");
                    }
                },
                
                //of42m
                _190_of42m_Mixed_Payment_Details: {
                    required: function(element) {
                        return ($("#_170_of42c_drafts_at").val() != "" && $("#_200_of42p_Negotiation_Deferred_Payment_Details").val() != "");
                    }
                },
                
                //of42p
                _200_of42p_Negotiation_Deferred_Payment_Details: {
                    required: function(element) {
                        return ($("#_170_of42c_drafts_at").val() != "" && $("#_190_of42m_Mixed_Payment_Details").val() != "");
                    }
                },
                
                //of44c
//                _270_of44c_Latest_Date_of_Shipment: {
//                    required: function(element) {
//                      return ($("#_280_of44d_Shipment_Period").val() == "" && $("#_270_of44c_Latest_Date_of_Shipment").val() == "") 
//                              || ($("#_280_of44d_Shipment_Period").val() != "" && $("#_270_of44c_Latest_Date_of_Shipment").val() != "");
//                    }
//                },
                
                //of44d
//                _280_of44d_Shipment_Period: {
//                    required: function(element) {
//                      return ($("#_270_of44c_Latest_Date_of_Shipment").val() == "" && $("#_280_of44d_Shipment_Period").val() == "") 
//                              || ($("#_270_of44c_Latest_Date_of_Shipment").val() != "" && $("#_280_of44d_Shipment_Period").val() != "");
//                    }
//                },
                
                //of52
                type_of52_issuing_bank: {
                    required: function(element) {
                      return ($("#_090_of50b_non_bank").val() == "" && $("#type_of52_issuing_bank").val() == "")
                             || ($("#_090_of50b_non_bank").val() != "" && $("#type_of52_issuing_bank").val() != "");
                    }
                },
                
                //of50b
                _090_of50b_non_bank: {
                    required: function(element) {
                      return ($("#type_of52_issuing_bank").val() == "" && $("#_090_of50b_non_bank").val() == "")
                             || ($("#type_of52_issuing_bank").val() != "" && $("#_090_of50b_non_bank").val() != "");
                    }
                },
       
               
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number:{required: "mf27 number harus diisi..!!"},
                _011_mf27_total: {required: "mf27 total harus diisi..!!"},
                _020_mf40b_type:{required:"mf40b type harus diisi..!"},
                _021_mf40b_code:{required:"mf40b code harus diisi..! "},
                _030_mf20_Transferring_Banks_Reference:{required:"mf20 trnasfering bank references harus diisi..!"},
                _040_mf21_Documentary_Credit_Number:{required: "mf21 documentary credit number harus diisi...!"},
                _050_mf31c_date_of_issue:{required: "mf31c date and issue harus diisi..!!"},
                _060_mf40e_applicable_rules:{required:"mf40e applicable rules harus diisi..!"},
                _070_mf31d_date: {required:"mf31d date harus diisi..!"},
                _071_mf31d_place: {required:"mf31d place harus diisi..!"},
                _100_mf50_First_Beneficiary:{required:"mf50 first beneficiary harus diisi...!"},
                _111_mf59_name_address:{required:"mf59 name address harus diisi..!"},
                _120_mf32b_currency_code:{required:"mf32b currency code harus diisi..!"},
                _130_mf32b_amount:{required:"mf32b amount harus diisi..!"},
                _360_mf49_confirmation_instruction:{required:"mf49 confirmation instruction harus diisi..!"},
                type_mf41_Available: {required: "mf41a availabe harus diisi..!!"},
                _161_mf41a_party_identifier: {required: "mf41a party identifire harus diisi..!!"},
                _162_mf41a_code: {required: "mf41a code harus identifire..!!"},
                _163_mf41d_Name_and_address: {required: "mf41a name and address harus diisi..!!"},
                _164_mf41d_code: {required: "mf41a code harus diisi..!!"},
                _182_of42a_identifier_code: {required:"of42a identifire code harus diisi..!!"},
                _184_of42d_name_address: {required:"of42d name address harus diisi..!!"},
                _170_of42c_drafts_at: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                type_of42_drawee: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _190_of42m_Mixed_Payment_Details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
                _200_of42p_Negotiation_Deferred_Payment_Details: {required: "isi kedua field of42c dan of42 atau isi field of42m saja atau of42p saja..!!"},
//                _270_of44c_Latest_Date_of_Shipment: {required: "isi antara field of44c atau of44d..!!"},
//                _280_of44d_Shipment_Period: {required: "isi antara field of44c atau of44d..!!"},
                type_of52_issuing_bank: {required: "isi salah satu antara of52 atau of50b..!!"},
                _090_of50b_non_bank: {required: "isi salah satu antara of52 atau of50b..!!"},
                
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
       
                $("#check_of39a").hide();
                $("#_140_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_141_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
                $("#percentage_credit_amount_checkbox").click(function(){
                            if ($("#percentage_credit_amount_checkbox").is(":checked")) {
                                $("#check_of39a").show();
                                $("#_140_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
                                $("#_141_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
                            } else {
                                $("#check_of39a").hide();
                                $("#_140_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                                $("#_141_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
                            }
                        });
                        
                        
                        
                $("#check_of48").hide();
                $("#_350_of48_Period_for_Presentation_in_Days").attr("disabled", true);
                $("#_351_of48_Narrative").attr("disabled", true);
                $("#period_for_presentation_in_days_checkbox").click(function(){
                            if ($("#period_for_presentation_in_days_checkbox").is(":checked")) {
                                $("#check_of48").show();
                                $("#_350_of48_Period_for_Presentation_in_Days").attr("disabled", false);
                                $("#_351_of48_Narrative").attr("disabled", false);
                            } else {
                                $("#check_of48").hide();
                                $("#_350_of48_Period_for_Presentation_in_Days").attr("disabled", true);
                                $("#_351_of48_Narrative").attr("disabled", true);
                            }
                        });
        //of52a//
        $("#div_of52a").hide();
        $("#div_of52d").hide();
        $("#_081_of52a_party_identifier").attr("disabled", true);
        $("#_082_of52a_identifier_code").attr("disabled", true);
        $("#_083_of52d_party_identifier").attr("disabled", true);
        $("#_084_of52d_name_address").attr("disabled", true);
        $("#type_of52_issuing_bank").change(function() {
            if ( $("#type_of52_issuing_bank").val() == "a"){
                $("#div_of52a").show();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", false);
                $("#_082_of52a_identifier_code").attr("disabled", false);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                 $("#_084_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_issuing_bank").val() == "d"){
                $("#div_of52a").hide();
                $("#div_of52d").show();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", false);
                $("#_084_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a").hide();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                $("#_084_of52d_name_address").attr("disabled", true);
            }
        });
        
       


        //mf42a
         $("#div_of42a").hide();
        $("#div_of42d").hide();
        $("#_181_of42a_party_identifier").attr("disabled", true);
        $("#_182_of42a_identifier_code").attr("disabled", true);
        $("#_183_of42d_party_identifier").attr("disabled", true);
        $("#_184_of42d_name_address").attr("disabled", true);
        $("#type_of42_drawee").change(function() {
            if ( $("#type_of42_drawee").val() == "a"){
                $("#div_of42a").show();
                $("#div_of42d").hide();
                $("#_181_of42a_party_identifier").attr("disabled", false);
                $("#_182_of42a_identifier_code").attr("disabled", false);
                $("#_183_of42d_party_identifier").attr("disabled", true);
                $("#_184_of42d_name_address").attr("disabled", true);
            } else if ( $("#type_of42_drawee").val() == "d"){
                $("#div_of42a").hide();
                $("#div_of42d").show();
                $("#_181_of42a_party_identifier").attr("disabled", true);
                $("#_182_of42a_identifier_code").attr("disabled", true);
                $("#_183_of42d_party_identifier").attr("disabled", false);
                $("#_184_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a").hide();
                $("#div_of42d").hide();
                $("#_181_of42a_party_identifier").attr("disabled", true);
                $("#_182_of42a_identifier_code").attr("disabled", true);
                $("#_183_of42d_party_identifier").attr("disabled", true);
                $("#_184_of42d_name_address").attr("disabled", true);
            }
        });

        //mf41a
       $("#div_mf41a").hide();
        $("#div_mf41d").hide();
        $("#_161_mf41a_party_identifier").attr("disabled", true);
        $("#_162_mf41a_code").attr("disabled", true);
        $("#_163_mf41d_Name_and_address").attr("disabled", true);
        $("#_164_mf41d_code").attr("disabled", true);
        $("#type_mf41_Available").change(function() {
            if ( $("#type_mf41_Available").val() == "a"){
                $("#div_mf41a").show();
                $("#div_mf41d").hide();
               $("#_161_mf41a_party_identifier").attr("disabled", false);
                $("#_162_mf41a_code").attr("disabled", false);
                $("#_163_mf41d_Name_and_address").attr("disabled", true);
                $("#_164_mf41d_code").attr("disabled", true);
            } else if ( $("#type_mf41_Available").val() == "d"){
                $("#div_mf41a").hide();
                $("#div_mf41d").show();
                $("#_161_mf41a_party_identifier").attr("disabled", true);
                $("#_162_mf41a_code").attr("disabled", true);
                $("#_163_mf41d_Name_and_address").attr("disabled", false);
                $("#_164_mf41d_code").attr("disabled", false);
            } else{
                $("#div_mf41a").hide();
                $("#div_mf41d").hide();
                $("#_161_mf41a_party_identifier").attr("disabled", true);
                $("#_162_mf41a_code").attr("disabled", true);
                $("#_163_mf41d_Name_and_address").attr("disabled", true);
                $("#_164_mf41d_code").attr("disabled", true);
            }
        });

        $("#div_of58a").hide();
        $("#div_of58d").hide();
        $("#_371_of58a_party_identifire").attr("disabled", true);
        $("#_372_of58a_identifier_code").attr("disabled", true);
        $("#_373_of58d_party_identifire").attr("disabled", true);
        $("#_374_of58d_name_address").attr("disabled", true);
        $("#type_of58_Requested_Confirmation_Party").change(function() {
            if ( $("#type_of58_Requested_Confirmation_Party").val() == "a"){
                $("#div_of58a").show();
                $("#div_of58d").hide();
                $("#_371_of58a_party_identifire").attr("disabled", false);
                $("#_372_of58a_identifier_code").attr("disabled", false);
                $("#_373_of58d_party_identifire").attr("disabled", true);
                $("#_374_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_Requested_Confirmation_Party").val() == "d"){
                $("#div_of58a").hide();
                $("#div_of58d").show();
                $("#_371_of58a_party_identifire").attr("disabled", true);
                $("#_372_of58a_identifier_code").attr("disabled", true);
                $("#_373_of58d_party_identifire").attr("disabled", false);
                $("#_374_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a").hide();
                $("#div_of58d").hide();
                $("#_371_of58a_party_identifire").attr("disabled", true);
                $("#_372_of58a_identifier_code").attr("disabled", true);
                $("#_373_of58d_party_identifire").attr("disabled", true);
                $("#_374_of58d_name_address").attr("disabled", true);
            }
        });
        
        
        
        
        //OF57A//
        $("#div_of57a").hide();
        $("#div_of57b").hide();
        $("#div_of57d").hide();
        $("#_391_of57a_party_identifire").attr("disabled", true);
        $("#_392_of57a_identifier_code").attr("disabled", true);
        $("#_393_of57b_party_identifire").attr("disabled", true);
        $("#_394_of57b_location").attr("disabled", true);
        $("#_395_of57d_party_identifire").attr("disabled", true);
        $("#_396_of57d_name_address").attr("disabled", true);
        $("#type_of57_advise_through_bank").change(function() {
            if ( $("#type_of57_advise_through_bank").val() == "A"){
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", false);
                $("#_392_of57a_identifier_code").attr("disabled", false);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "B"){
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", false);
                $("#_394_of57b_location").attr("disabled", false);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_advise_through_bank").val() == "D"){
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", false);
                $("#_396_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            }
        });

      
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        if ($("#_140_of39a_percentage_credit_amount_tolerance1").val() != "" || $("#_141_of39a_percentage_credit_amount_tolerance2").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_140_of39a_percentage_credit_amount_tolerance1").attr("disabled", false);
            $("#_141_of39a_percentage_credit_amount_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_140_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
            $("#_141_of39a_percentage_credit_amount_tolerance2").attr("disabled", true);
        }
        

        if ($("#_350_of48_Period_for_Presentation_in_Days").val() != "" || $("#_351_of48_Narrative").val() != ""){
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of48").show();
            $("#_350_of48_Period_for_Presentation_in_Days").attr("disabled", false);
            $("#_351_of48_Narrative").attr("disabled", false);
        } else {
            $("#check_of48").hide();
            $("#_350_of48_Period_for_Presentation_in_Days").attr("disabled", true);
            $("#_351_of48_Narrative").attr("disabled", true);
        }
        //mf52a a_b
           if ($("#_081_of52a_party_identifier").val() != "" || $("#_082_of52a_identifier_code").val() != ""){
              $("#type_of52_issuing_bank").val("a").attr("selected",true);
                $("#div_of52a").show();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", false);
                $("#_082_of52a_identifier_code").attr("disabled", false);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                $("#_084_of52d_name_address").attr("disabled", true);
          } else if ($("#_083_of52d_party_identifier").val() != "" || $("#_084_of52d_name_address").val() != ""){
                $("#type_of52_issuing_bank").val("d").attr("selected",true);
                $("#div_of52a").hide();
                $("#div_of52d").show();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", false);
                $("#_084_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a").hide();
                $("#div_of52d").hide();
                $("#_081_of52a_party_identifier").attr("disabled", true);
                $("#_082_of52a_identifier_code").attr("disabled", true);
                $("#_083_of52d_party_identifier").attr("disabled", true);
                $("#_084_of52d_name_address").attr("disabled", true);
            }
            
            
       
            
            if ($("#_181_of42a_party_identifier").val() != "" || $("#_182_of42a_identifier_code").val() != ""){
                $("#type_of42_drawee").val("a").attr("selected",true);
                $("#div_of42a").show();
                $("#div_of42d").hide();
                 $("#_181_of42a_party_identifier").attr("disabled", false);
                $("#_182_of42a_identifier_code").attr("disabled", false);
                $("#_183_of42d_party_identifier").attr("disabled", true);
                $("#_184_of42d_name_address").attr("disabled", true);
           } else if ($("#_183_of42d_party_identifier").val() != "" || $("#_184_of42d_name_address").val() != ""){
                $("#type_of42_drawee").val("b").attr("selected",true);
                $("#div_of42a").hide();
                $("#div_of42d").show();
                $("#_181_of42a_party_identifier").attr("disabled", true);
                $("#_182_of42a_identifier_code").attr("disabled", true);
                $("#_183_of42d_party_identifier").attr("disabled", false);
                $("#_184_of42d_name_address").attr("disabled", false);
            } else{
                $("#div_of42a").hide();
                $("#div_of42d").hide();
                $("#_181_of42a_party_identifier").attr("disabled", true);
                $("#_182_of42a_identifier_code").attr("disabled", true);
                $("#_183_of42d_party_identifier").attr("disabled", true);
                $("#_184_of42d_name_address").attr("disabled", true);
            }
            
            //OF58//
           if ($("#_371_of58a_party_identifire").val() != "" || $("#_372_of58a_identifier_code").val() != ""){
                $("#type_of58_Requested_Confirmation_Party").val("a").attr("selected",true);
                $("#div_of58a").show();
                $("#div_of58d").hide();
                $("#_371_of58a_party_identifire").attr("disabled", false);
                $("#_372_of58a_identifier_code").attr("disabled", false);
                $("#_373_of58d_party_identifire").attr("disabled", true);
                $("#_374_of58d_name_address").attr("disabled", true);
             } else if ($("#_373_of58d_party_identifire").val() != "" || $("#_374_of58d_name_address").val() != ""){
                $("#type_of58_Requested_Confirmation_Party").val("d").attr("selected",true);
                $("#div_of58a").hide();
                $("#div_of58d").show();
                $("#_371_of58a_party_identifire").attr("disabled", true);
                $("#_372_of58a_identifier_code").attr("disabled", true);
                $("#_373_of58d_party_identifire").attr("disabled", false);
                $("#_374_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a").hide();
                $("#div_of58d").hide();
                $("#_371_of58a_party_identifire").attr("disabled", true);
                $("#_372_of58a_identifier_code").attr("disabled", true);
                $("#_373_of58d_party_identifire").attr("disabled", true);
                $("#_374_of58d_name_address").attr("disabled", true);
            }
            
            
            
            //of57 a_b_d
            if ($("#_391_of57a_party_identifire").val() != "" || $("#_392_of57a_identifier_code").val() != ""){
                $("#type_of57_advise_through_bank").val("A").attr("selected",true);
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", false);
                $("#_392_of57a_identifier_code").attr("disabled", false);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
           } else if ($("#_393_of57b_party_identifire").val() != "" || $("#_394_of57b_location").val() != ""){
                $("#type_of57_advise_through_bank").val("B").attr("selected",true);
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", false);
                $("#_394_of57b_location").attr("disabled", false);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
           } else if ($("#_395_of57d_party_identifire").val() != "" || $("#_396_of57d_name_address").val() != ""){
                $("#type_of57_advise_through_bank").val("D").attr("selected",true);
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", false);
                $("#_396_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_391_of57a_party_identifire").attr("disabled", true);
                $("#_392_of57a_identifier_code").attr("disabled", true);
                $("#_393_of57b_party_identifire").attr("disabled", true);
                $("#_394_of57b_location").attr("disabled", true);
                $("#_395_of57d_party_identifire").attr("disabled", true);
                $("#_396_of57d_name_address").attr("disabled", true);
            }
            
            if ($("#_161_mf41a_party_identifier").val() != "" || $("#_162_mf41a_code").val() != ""){
                $("#type_mf41_Available").val("a").attr("selected",true);
                $("#div_mf41a").show();
                $("#div_mf41d").hide();
                $("#_161_mf41a_party_identifier").attr("disabled", false);
                $("#_162_mf41a_code").attr("disabled", false);
                $("#_163_mf41d_Name_and_address").attr("disabled", true);
                $("#_164_mf41d_code").attr("disabled", true);
              } else if ($("#_163_mf41d_Name_and_address").val() != "" || $("#_164_mf41d_code").val() != ""){
                 $("#type_mf41_Available").val("d").attr("selected",true);  
                 $("#div_mf41a").hide();
                 $("#div_mf41d").show();
                 $("#_161_mf41a_party_identifier").attr("disabled", true);
                 $("#_162_mf41a_code").attr("disabled", true);
                 $("#_163_mf41d_Name_and_address").attr("disabled", false);
                 $("#_164_mf41d_code").attr("disabled", false);
            } else{
                $("#div_mf41a").hide();
                $("#div_mf41d").hide();
                $("#_161_mf41a_party_identifier").attr("disabled", true);
                $("#_162_mf41a_code").attr("disabled", true);
                $("#_163_mf41d_Name_and_address").attr("disabled", true);
                $("#_164_mf41d_code").attr("disabled", true);
            }


       

        //of71f
        if ($("#_212_of71f_currency").val() != "" || $("#_213_of71f_amount").val() != ""){
            $("#div_of71f_sender_charges").show();
            $("#_212_of71f_currency").attr("disabled", false);
            $("#_213_of71f_amount").attr("disabled", false);
        }else{
            $("#div_of71f_sender_charges").hide();
            $("#_212_of71f_currency").attr("disabled", true);
            $("#_213_of71f_amount").attr("disabled", true);
        }

    });
</script>