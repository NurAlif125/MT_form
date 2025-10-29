/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/javascript.js to edit this template
 */

$(document).ready(function() {
    $("#form1").validate({
        rules: {
            currency: "required",
            account: "required"
        },
        messages: {
            currency: {
                required: "Currency harus diisi..!!"
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
