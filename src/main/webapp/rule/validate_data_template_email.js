/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

$(document).ready(function() {
    $("#form1").validate({
        rules: {
            template_email_code: "required",
            template_email_subject: "required",
            template_email_template: "required"
        },
        messages: {
            template_email_code: {
                required: "Template Email Code harus diisi..!!"
            },
            template_email_template: {
                required: "Template Email harus diisi..!!"
            },
            template_email_subject: {
                required: "Subject Email harus diisi..!!"
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
