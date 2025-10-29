<%-- 
    Document   : validate_rule_mt202
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : Sri Puji Indrayanti
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
                _010_mf20_sender_trn: "required",
                _020_mf21_presenting_bank_reference: "required",
                _030_mf30_date_of_advice: "required",
                _040_mf32b_currency: "required",
                _041_mf32b_amount: "required",
               
               
               
            },
     messages: {
              
                 priority: {required: "priority harus diisi..!!"},
                 _010_mf20_sender_trn: {required:"mf20 sender trn harus diisi..!!"},
                _020_mf21_presenting_bank_reference: {required:"mfpresenting bank reference harus diisi..!!"},
                _030_mf30_date_of_advice: {required:"mf30 date of advice harus diisi..!!"},
                _040_mf32b_currency: {required:"mf32b currency harus diisi..!!"},
                _041_mf32b_amount: {required:"mf32b amount harus diisi..!!"},
               
                
                
               
             
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

    
</script>

<!-- rule view -->
<script type="text/javascript">

</script>
