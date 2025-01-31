<%-- 
    Document   : mt708
    Created on : Aug 15, 2018
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
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                
                //mf20
                _020_mf20_sender_reference: "required",

                //mf23
                _030_mf23_issuing_bank_reference: "required",
                
                //mf26e
                _040_mf26e_number_of_amendment: "required",
                
                //mf30
                _050_mf30_date_of_amendment: "required"
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                _020_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _030_mf23_issuing_bank_reference: {required: "mf23_issuing_bank_reference harus diisi..!!"},
                _040_mf26e_number_of_amendment: {required: "mf26e_number_of_amendment harus diisi..!!"},
                _050_mf30_date_of_amendment: {required: "mf30_date_of_amendment harus diisi..!!"}
                
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