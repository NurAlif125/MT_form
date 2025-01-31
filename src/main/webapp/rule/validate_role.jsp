<%-- 
    Document   : validate_branchcode
    Created on : Jan 31, 2013, 6:45:45 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                role_name: "required"
            },
            messages: {
                role_name: {
                    required: "Role Name harus diisi!"
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
        
        $("#form1").validate({
            rules: {
                batas: "required"
            },
            messages: {
                batas: {
                    required: "Limit harus diisi!"
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
        $('#delete_role').click(function(){
            var answer = confirm('Do you want to delete this role data..!!');
            if(answer){
                $(location).attr('href','SCDataRole?delete_role=yes&role_id='+$('#role_id').val());
                return false;
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />