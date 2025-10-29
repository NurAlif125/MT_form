/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

$(document).ready(function() {
    $("#form1").validate({
        rules: {
            department_code: "required",
            department_name: "required"
        },
        messages: {
            currency: {
                department_code: "Department Code harus diisi..!!"
            },
            account: {
                department_name: "Department Name harus diisi..!!"
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
