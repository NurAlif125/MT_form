<%-- 
    Document   : validate_branchcode
    Created on : Jan 31, 2013, 6:45:45 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                kode: "required",
                uraian: "required",
                sandi_kliring: "required"
            },
            messages: {
                kode: {
                    required: "Kode harus diisi..!!"
                },
                uraian: {
                    required: "Uraian harus diisi..!!"
                },
                sandi_kliring: {
                    required: "Sandi Kliring harus diisi..!!"
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