//= require active_admin/base

$(document).ready(function () {
    // put all your jQuery goodness in here.

    // run the first time
    updateColumnLayout();
    $(".column_count_slider").change(function () {
        updateColumnLayout();
    });


});

function updateColumnLayout() {
    var total_count = 0;
    $('.column_count_slider').each(function () {
        if (total_count >= 6) {
            $(this).val(0);
        } else {
            total_count = total_count + (1 * $(this).val());
        }
        var new_width = ($(this).val() / 6) * 100;
        var thisID = $(this).attr('id')
        thisID = thisID.replace("page_column_", "");
        thisID = thisID.replace("_count", "");

        $('#column_layout_' + thisID).css('width', new_width + '%');
//            var this_count = $(this).val();
//            total_count += this_count;
//            console.log(thisID);
    });
}