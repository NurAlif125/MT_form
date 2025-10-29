<%-- 
    Document   : validate_recon
    Created on : Jan 07, 2025, 1:49:52 PM
    Author     : rizkiye
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                filter_msg: {
                    required: true,
                    notEqual: ""
                }
            },
            messages: {
                filter_msg: {
                    required: "Pilih salah satu !!",
                    notEqual: "Pilih salah satu dari opsi yang tersedia !!"
                }
            },
            errorPlacement: function(error, element) {
                error.insertAfter(element);
            },
            showErrors: function(errorMap, errorList) {
                this.defaultShowErrors();
            }
        });

        $.validator.addMethod("notEqual", function(value, element, param) {
            return this.optional(element) || value !== param;
        }, "Pilih nilai yang valid.");
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
