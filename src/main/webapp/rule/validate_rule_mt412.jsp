<%-- 
    Document   : mt412
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
                //mf27
                _010_mf20_sending_bank_TRN: "required",
                
                //mf21
                _020_mf21_related_reference: "required",

                //mf32a
                _030_mf32a_maturity_date: "required",
                _031_mf32a_currency_code: "required",
                _032_mf32a_amount_accepted: "required"
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sending_bank_TRN: {required: "mf20_sending_bank_TRN harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf32a_maturity_date: {required: "mf32a_maturity_date harus diisi..!!"},
                _031_mf32a_currency_code: {required: "mf32a_currency_code harus diisi..!!"},
                _032_mf32a_amount_accepted: {required: "mf32a_amount_accepted harus diisi..!!"}
                
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
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
    });
</script>