$(document).ready(function () {
    //option value 4
    $('#_096_mf50f_number').change(function () {
        $(this).find('option:selected').each(function () {
            var optionVal = $(this).attr('value');
            if (optionVal === '4') {
                $("input[name=_097_mf50f_details]").datepicker({
                    dateFormat: "yymmdd",
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-100:+00"}, new Date());
            } else {
                $("input[name=_097_mf50f_details]").datepicker("destroy");
            }
        });
    }).change();
    $('#_098_mf50f_number').change(function () {
        $(this).find('option:selected').each(function () {
            var optionVal = $(this).attr('value');
            if (optionVal === '4') {
                $("input[name=_099_mf50f_details]").datepicker({
                    dateFormat: "yymmdd",
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-100:+00"}, new Date());
            } else {
                $("input[name=_099_mf50f_details]").datepicker("destroy");
            }
        });
    }).change();
    $('#_100_mf50f_number').change(function () {
        $(this).find('option:selected').each(function () {
            var optionVal = $(this).attr('value');
            if (optionVal === '4') {
                $("input[name=_101_mf50f_details]").datepicker({
                    dateFormat: "yymmdd",
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-100:+00"}, new Date());
            } else {
                $("input[name=_101_mf50f_details]").datepicker("destroy");
            }
        });
    }).change();
    //option value 5, 6, 7
    $('#_096_mf50f_number').change(function () {
        $(this).find('option:selected').each(function () {
            var optionVal = $(this).attr('value');
            if (optionVal === '5') {
                $("input[name=_097_mf50f_details]").removeAttr("pattern");
                $("input[name=_097_mf50f_details]").removeAttr("title");
                $("input[name=_097_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/City');
            } else if (optionVal === '6') {
                $("input[name=_097_mf50f_details]").removeAttr("pattern");
                $("input[name=_097_mf50f_details]").removeAttr("title");
                $("input[name=_097_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/Customer identification number');
            } else if (optionVal === '7') {
                $("input[name=_097_mf50f_details]").removeAttr("pattern");
                $("input[name=_097_mf50f_details]").removeAttr("title");
                $("input[name=_097_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/National identity number');
            } else {
                $("input[name=_097_mf50f_details]").removeAttr("pattern");
                $("input[name=_097_mf50f_details]").removeAttr("title");
            }
        });
    }).change();
    $('#_098_mf50f_number').change(function () {
        $(this).find('option:selected').each(function () {
            var optionVal = $(this).attr('value');
            if (optionVal === '5') {
                $("input[name=_099_mf50f_details]").removeAttr("pattern");
                $("input[name=_099_mf50f_details]").removeAttr("title");
                $("input[name=_099_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/City');
            } else if (optionVal === '6') {
                $("input[name=_099_mf50f_details]").removeAttr("pattern");
                $("input[name=_099_mf50f_details]").removeAttr("title");
                $("input[name=_099_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/Customer identification number');
            } else if (optionVal === '7') {
                $("input[name=_099_mf50f_details]").removeAttr("pattern");
                $("input[name=_099_mf50f_details]").removeAttr("title");
                $("input[name=_099_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/National identity number');
            } else {
                $("input[name=_099_mf50f_details]").removeAttr("pattern");
                $("input[name=_099_mf50f_details]").removeAttr("title");
            }
        });
    }).change();
    $('#_100_mf50f_number').change(function () {
        $(this).find('option:selected').each(function () {
            var optionVal = $(this).attr('value');
            if (optionVal === '5') {
                $("input[name=_101_mf50f_details]").removeAttr("pattern");
                $("input[name=_101_mf50f_details]").removeAttr("title");
                $("input[name=_101_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/City');
            } else if (optionVal === '6') {
                $("input[name=_101_mf50f_details]").removeAttr("pattern");
                $("input[name=_101_mf50f_details]").removeAttr("title");
                $("input[name=_101_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/Customer identification number');
            } else if (optionVal === '7') {
                $("input[name=_101_mf50f_details]").removeAttr("pattern");
                $("input[name=_101_mf50f_details]").removeAttr("title");
                $("input[name=_101_mf50f_details]").attr("pattern", '[A-Z]{2}[\/][A-Za-z0-9 ]{2,}').attr('title', 'Required ISO Country/National identity number');
            } else {
                $("input[name=_101_mf50f_details]").removeAttr("pattern");
                $("input[name=_101_mf50f_details]").removeAttr("title");
            }
        });
    }).change();
});