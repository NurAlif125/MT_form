(function ($) {

    //        $('#first-container').simplePagination();
    //
    //        $('#second-container').simplePagination({
    //            items_per_page: 5,
    //            number_of_visible_page_numbers: 10
    //        });

    $('#third-container').simplePagination({
        items_per_page: 10
    });

    //        $('#fourth-container').simplePagination({
    //            first_content: '&lt;&lt;',
    //            previous_content: '<',
    //            next_content: '>',
    //            last_content: '>>'
    //        });
    //
    //        $('#fifth-container').simplePagination({
    //            use_page_count: true
    //        });
    //
    //        $('#sixth-container').simplePagination({
    //            items_per_page: 11,
    //            items_per_page_content: {
    //                'Six': 6,
    //                'Eleven': 11,
    //                'Seventeen': 17,
    //                'Thirty-three': 33,
    //                'Sixty-seven': 67
    //            }
    //        });

})(jQuery);

$('#chkAll').click(function () {
    $('input:checkbox').prop('checked', this.checked);
});