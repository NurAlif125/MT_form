/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function textonly(e) {
    var code;
    if (!e)
        var e = window.event;
    if (e.keyCode)
        code = e.keyCode;
    else if (e.which)
        code = e.which;
    var character = String.fromCharCode(code);

    var AllowRegex = /^[\ba-zA-Z\s-]$/;
    if (AllowRegex.test(character))
        return true;
    return false;
}
function numbersonly(e, obj) {
    var charCode = (e.which) ? e.which : event.keyCode;
    if (document.getElementById(obj)) {
        if (document.getElementById(obj).value.toUpperCase() == "JPY") {
            if (charCode > 31 && (charCode < 48 || charCode > 57))
            {
                return false;
            }
        } else {
            if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 44)
            {
                return false;
            }
        }
    } else {
        if (charCode > 31 && (charCode < 48 || charCode > 57))
        {
            return false;
        }
    }

    return true;
}



function numbersonly2(e) {
    var charCode = (e.which) ? e.which : event.keyCode;
    
        if (charCode > 31 && (charCode < 48 || charCode > 57))
        {
            return false;
        }
    

    return true;
}

function cek_koma(obj) {
    var obj_name = "";
    var koma = false;
    obj_name = obj.id.substr(5);
    obj_name = obj_name.substr(0, obj_name.indexOf("_"));
//	alert(obj.id.substr(1,2)+ (parseInt(obj.id.substr(3,1))-1)+"_"+obj_name+"_currency");
//	alert(document.getElementById("_"+obj.id.substr(1,2)+ (parseInt(obj.id.substr(3,1))-1)+"_"+obj_name+"_currency").value.toUpperCase());
//    if (document.getElementById("_" + obj.id.substr(1, 2) + (parseInt(obj.id.substr(3, 1)) - 1) + "_" + obj_name + "_currency").value.toUpperCase() != "JPY") {

    var koma = false;
    for (i = 0; i < obj.value.length; i++) {
        if (obj.value.substr(i, 1) == ",") {
            koma = true;
        }
    }
    if (koma == false)
    {
        if (obj.value.length > 0) {
            obj.value = obj.value + ",";
        }
    }
//    }

}

function cek_koma2(obj) {//121908 penambahan cek koma jika 2 angka bedanya
    var obj_name = "";
    var koma = false;
    obj_name = obj.id.substr(5);
    obj_name = obj_name.substr(0, obj_name.indexOf("_"));
//	alert(obj.id.substr(1,2)+ (parseInt(obj.id.substr(3,1))-1)+"_"+obj_name+"_currency");
//	alert(document.getElementById("_"+obj.id.substr(1,2)+ (parseInt(obj.id.substr(3,1))-1)+"_"+obj_name+"_currency").value.toUpperCase());
//    if (document.getElementById("_" + obj.id.substr(1, 2) + (parseInt(obj.id.substr(3, 1)) - 2) + "_" + obj_name + "_currency").value.toUpperCase() != "JPY") {

    var koma = false;
    for (i = 0; i < obj.value.length; i++) {
        if (obj.value.substr(i, 1) == ",") {
            koma = true;
        }
    }
    if (koma == false)
    {
        if (obj.value.length > 1) {
            obj.value = obj.value + ",";
        }
    }
//    }

}

function cek_slash(obj) {//121910 penambahan slash pada account
    var slash = false;

    for (i = 0; i < obj.value.length; i++) {
        if (obj.value.substr(i, 1) == "/") {
            slash = true;
        }
    }
    if (slash == false)
    {
        if (obj.value.length > 1) {
            obj.value = "/" + obj.value;
        }
    }



}
function avoidSplChars(e) {
    e = e || window.event;
//    var bad = /[^\sa-z\d\.\,\'\(\)\-\/]/i,
    var bad = /[^\sa-z\d\.\,\'\(\)\-\/\:]/i,
            key = String.fromCharCode(e.keyCode || e.which);

    if (e.which !== 0 && e.charCode !== 0 && bad.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}
function cek_sender(obj) {//121910 penambahan slash pada account
    var slash = false;

    if (obj.value.startsWith("MEGAIDJA")) {
        obj.value = "MEGAIDJAXXXX";
    } else if (obj.value.startsWith("MEGAIDJ0")) {
        obj.value = "MEGAIDJ0AXXX";
    }

}

var hasShownAlert = false;
function checkZeroAmount(inputID) {
    const amountInput = document.getElementById(inputID);
    const value = amountInput.value.trim().replace(',', '.'); 

    if (value !== "" && parseFloat(value) === 0) {
        if (!hasShownAlert) {
            hasShownAlert = true;
            alert("Amount must not be 0 (zero)");
            setTimeout(() => {
                amountInput.focus(); // tunda supaya tidak langsung trigger blur lagi
                hasShownAlert = false; // reset supaya alert bisa muncul lagi jika validasi gagal lagi
            }, 100);
        }
    }
}