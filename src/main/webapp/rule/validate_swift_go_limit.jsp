<%-- 
    Document   : validate_swift_go_limit
    Created on : May 16, 2023, 1:49:52 PM
    Author     : ovasae
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                currency: "required",
//                value_date: "required",
                amount: "required"
            },
            messages: {
                currency: {
                    required: "Account harus diisi..!!"
                },
//                value_date: {
//                    required: "Value Date harus diisi..!!"
//                },
                amount: {
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
