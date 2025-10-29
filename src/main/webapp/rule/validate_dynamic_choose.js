// Not on change
//if ($( "#status" ).val() === "INC-CRDT"){
//    $('#label_date_from').html("Date From (<b>Posting Date</b>)")
//    $('#label_date_after').html("Date End (<b>Posting Date</b>)")
//}
//else {
//    $('#label_date_from').html("Date From (Value Date)")
//    $('#label_date_after').html("Date End (Value Date)")
//}
//
//// ON change
//$( "#status" ).on( "change", function() {
//    
//    if ($(this).val() === "INC-CRDT"){
//        $('#label_date_from').html("Date From (<b>Posting Date</b>)")
//        $('#label_date_after').html("Date End (<b>Posting Date</b>)")
//    }
//    else {
//        $('#label_date_from').html("Date From (Value Date)")
//        $('#label_date_after').html("Date End (Value Date)")
//    }
//})


$('#status').multiSelect().on("change", function() {
    
    var values = $(this).val()
    
    // jika null maka return ajah
    if (values === null) return;
    
    if ((values.length === 1 && (values[0] === "INC-CRDT" || values[0] === "INC-CNF"))
            || (values.length === 2 && (values.includes("INC-CRDT") && values.includes("INC-CNF")))){
        $('#label_date_from').html("Date From (<b>Posting Date</b>)")
        $('#label_date_after').html("Date End (<b>Posting Date</b>)")
        
        $('#insert_date_from').prop('disabled',true)
        $('#insert_date_end').prop('disabled',true)  
    }
    else {
        $('#label_date_from').html("Date From (Value Date)")
        $('#label_date_after').html("Date End (Value Date)") 
        
        $('#insert_date_from').prop('disabled',false)
        $('#insert_date_end').prop('disabled',false)
    }
});