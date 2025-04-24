<%-- 
    Document   : validate_branchcode
    Created on : Jan 31, 2013, 6:45:45 PM
    Author     : hadi
--%>

<script type="text/javascript">
    $(document).ready(function() {
        $("#form1").validate({
            rules: {
                name: "required",
                username: "required",
                password: "required",
                role: "required"
            },
            messages: {
                name: {
                    required: "Full Name harus diisi..!!"
                },
                username: {
                    required: "User ID harus diisi..!!"
                },
                password: {
                    required: "Password harus diisi..!!"
                },
                role: {
                    required: "Role harus diisi..!!"
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

        if ( $("#password").val() != ""){
            $("#div_password").hide();
            $("#password").attr("disabled", true);
        }
        
        $('#delete_user').click(function(){
            var answer = confirm('Do you want to Disable Permanent this user data..!!');
            if(answer){
                $(location).attr('href','SCDataUser?delete_user=yes&user_id='+$('#user_id').val());
                return false;
            }
        });
    });s
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />