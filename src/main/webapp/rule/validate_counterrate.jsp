<%-- 
    Document   : validate_counterrate
    Created on : Aug 18, 2023, 7:18:35 PM
    Author     : Baim
--%>
<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                id: "required"
            },
            messages: {
                nostro_id: {
                    required: "Country Code harus diisi..!!"
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