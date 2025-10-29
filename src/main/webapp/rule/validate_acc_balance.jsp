<%-- 
    Document   : validate_charges
    Created on : Jan 31, 2013, 6:45:45 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                account "required",
                value_date: "required",
                balance: "required"
            },
            messages: {
                account: {
                    required: "Account harus diisi..!!"
                },
                value_date: {
                    required: "Value Date harus diisi..!!"
                },
                balance: {
                    required: "Balance harus diisi..!!"
                }
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