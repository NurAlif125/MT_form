//console.log($( "#flag" ))
//
//// ON change
//$( "#flag" ).on( "change", function() {
//    
//    if (($(this).val() === "INC-CRDT") || $(this).val() === "INC-CNF"){
//        $('#label_date_from').html("Date From (<b>Posting Date</b>)")
//        $('#label_date_after').html("Date End (<b>Posting Date</b>)")
//        
//        $('#date_from').prop('disabled',true)
//        $('#date_end').prop('disabled',true)
//    }
//    else {
//        $('#label_date_from').html("Date From (Value Date)")
//        $('#label_date_after').html("Date End (Value Date)")
//        
//        $('#date_from').prop('disabled',false)
//        $('#date_end').prop('disabled',false)
//    }
//});


$('#flag').multiSelect().on("change", function() {
    
    var values = $(this).val()
    
    // jika null maka return ajah
    if (values === null) return;
    
    if ((values.length === 1 && (values[0] === "INC-CRDT" || values[0] === "INC-CNF"))
            || (values.length === 2 && (values.includes("INC-CRDT") && values.includes("INC-CNF")))){
        $('#label_date_from').html("Date From (<b>Posting Date</b>)")
        $('#label_date_after').html("Date End (<b>Posting Date</b>)")
        
        $('#date_from').prop('disabled',true)
        $('#date_end').prop('disabled',true)
    }
    else {
        $('#label_date_from').html("Date From (Value Date)")
        $('#label_date_after').html("Date End (Value Date)")
        
        $('#date_from').prop('disabled',false)
        $('#date_end').prop('disabled',false)      
    }
});