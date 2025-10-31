<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                sandi: "required",
            },
            messages: {
                sandi: {
                    required: "BIC harus diisi..!!"
                },
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
