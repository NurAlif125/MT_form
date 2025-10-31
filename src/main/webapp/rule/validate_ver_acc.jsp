<%-- 
    Document   : validate_charges
    Created on : Jan 31, 2013, 6:45:45 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                acc: "required",
                nameFromTrx: "required",
                nameFromCore: "required",
                verified: "required",
                verified_date: "required"
            },
            messages: {
                acc: {
                    required: "Account harus diisi..!!"
                },
                nameFromTrx: {
                    required: "Name From Transaction harus diisi..!!"
                },
                nameFromCore: {
                    required: "Name From Core harus diisi..!!"
                },
                verified: {
                    required: "Verified harus diisi..!!"
                },
                verified_date: {
                    required: "Verified Date harus diisi..!!"
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