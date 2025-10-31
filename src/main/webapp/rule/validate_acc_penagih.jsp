<%-- 
    Document   : validate_charges
    Created on : Jan 31, 2013, 6:45:45 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                currency: "required",
                swift_code: "required",
                account: "required"
            },
            messages: {
                currency: {
                    required: "Currency harus diisi..!!"
                },
                swift_code: {
                    required: "Swift Code harus diisi..!!"
                },
                account: {
                    required: "Account harus diisi..!!"
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